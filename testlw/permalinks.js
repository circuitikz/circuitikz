document.addEventListener("DOMContentLoaded", () => {
  const headings = document.querySelectorAll("h1,h2,h3,h4,h5,h6");

  headings.forEach(h => {
    // Look for explicit label anchor right after heading
    let next = h.nextElementSibling;
    if (!next) return;

    // lwarp usually emits several <a id="..."></a> blocks
    let explicitId = null;

    while (next && next.tagName === "A") {
      const id = next.getAttribute("id");
      if (
        id &&
        !id.startsWith("autosec-") &&
        !id.includes("autopage")
      ) {
        explicitId = id;
        break;
      }
      next = next.nextElementSibling;
    }

    if (!explicitId) return;

    // Create visible permalink icon
    const link = document.createElement("a");
    link.href = "#" + explicitId;
    link.className = "explicit-permalink";
    link.innerHTML = "🔗";   // or "#" if you prefer
    link.style.marginLeft = "0.4em";
    link.style.textDecoration = "none";

    h.appendChild(link);
  });
});

document.addEventListener("DOMContentLoaded", () => {
  const homeGrid = document.querySelector(".homepagegrid");
  if (!homeGrid) return; // not the homepage

  // If the homepage already has a sidetoccontainer, do nothing.
  if (homeGrid.querySelector(".sidetoccontainer")) return;

  // Grab the main TOC from the homepage content
  const mainTOC = homeGrid.querySelector("nav.toc");
  if (!mainTOC) return;

  // Turn homepagegrid into pagegrid so your CSS/layout rules apply
  homeGrid.classList.remove("homepagegrid");
  homeGrid.classList.add("pagegrid");

  // Create the same sidebar container structure used on other pages
  const side = document.createElement("div");
  side.className = "sidetoccontainer";

  const nav = document.createElement("nav");
  nav.className = "sidetoc";

  // Optional: title block similar-ish to other pages
  const title = document.createElement("div");
  title.className = "sidetoctitle";
  title.innerHTML = `<p><span class="sidetocthetitle">Contents</span></p>`;

  const contents = document.createElement("div");
  contents.className = "sidetoccontents";

  // Clone the homepage TOC into the sidebar
  contents.appendChild(mainTOC.cloneNode(true));

  nav.appendChild(title);
  nav.appendChild(contents);
  side.appendChild(nav);

  // Insert sidebar before <main>
  const main = homeGrid.querySelector("main.bodycontainer");
  if (main) homeGrid.insertBefore(side, main);

  // Optional: hide the big inline TOC in the main flow (since it’s now in the sidebar)
 //  mainTOC.style.display = "none";
});

document.addEventListener("DOMContentLoaded", () => {
  // 1) SET THIS to whatever wraps your left TOC (inspect HTML to confirm)
  // Examples that often work: ".sidetoccontainer", "#sidetoc", "nav.sidetoc"
  const TOC_CONTAINER_SELECTOR = ".sidetoccontainer";

  const toc = document.querySelector(TOC_CONTAINER_SELECTOR);
  if (!toc) return;

  // Collect TOC links that point to anchors on THIS page
  const links = Array.from(toc.querySelectorAll('a[href*="#"]'));
  if (!links.length) return;

  // Map: headingId -> link
  const idToLink = new Map();
  for (const a of links) {
    const href = a.getAttribute("href") || "";
    const hashIndex = href.indexOf("#");
    if (hashIndex < 0) continue;

    const frag = href.slice(hashIndex + 1);
    if (!frag) continue;

    // Only match headings that actually exist on this page
    // lwarp often uses <hN id="autosec-..."> plus separate <a id="sec:...">
    if (document.getElementById(frag)) idToLink.set(frag, a);
  }

  const ids = Array.from(idToLink.keys());
  if (!ids.length) return;

  // Helper: clear/set active class
  const ACTIVE_CLASS = "toc-active";
  function setActive(id) {
    for (const a of idToLink.values()) a.classList.remove(ACTIVE_CLASS);
    const link = idToLink.get(id);
    if (link) link.classList.add(ACTIVE_CLASS);
  }

  // If URL already has a hash, highlight that immediately
  if (location.hash) {
    const id = decodeURIComponent(location.hash.slice(1));
    if (idToLink.has(id)) setActive(id);
  }

  // Observe headings/anchors entering the viewport
  // Prefer heading elements with these ids if possible
  const targets = ids
    .map(id => document.getElementById(id))
    .filter(Boolean);

  // IntersectionObserver: pick the heading closest to the top
  let lastActive = null;
  const observer = new IntersectionObserver((entries) => {
    // Consider only visible entries
    const visible = entries.filter(e => e.isIntersecting);
    if (!visible.length) return;

    // Choose the one nearest the top of viewport
    visible.sort((a, b) => a.boundingClientRect.top - b.boundingClientRect.top);
    const chosen = visible[0].target.id;

    if (chosen && chosen !== lastActive) {
      lastActive = chosen;
      setActive(chosen);
    }
  }, {
    // This makes “active” switch when heading crosses a line near top
    root: null,
    rootMargin: "-15% 0px -75% 0px",
    threshold: [0, 1.0],
  });

  targets.forEach(t => observer.observe(t));

  // Also update highlight when clicking TOC links / manual hash changes
  window.addEventListener("hashchange", () => {
    const id = decodeURIComponent(location.hash.slice(1));
    if (idToLink.has(id)) setActive(id);
  });
});

// footnotes

(function () {
    function pageKey() {
        // makes ids stable per-page (works for multi-page output)
        return location.pathname.replace(/[^a-z0-9]+/gi, "-").replace(/^-|-$/g, "") || "page";
    }

    function linkifyFootnotes(root) {
        root = root || document;

        // Find all footnote containers. lwarp commonly uses div.footnotes with role="note".
        const footnoteDivs = Array.from(
            root.querySelectorAll('div.footnotes[role="note"], div.footnotes')
        );

        if (!footnoteDivs.length) return; // no footnotes on this page

        const pk = pageKey();
        const numToIds = new Map(); // "9" -> { noteId, refId }
        const noteEls = [];         // cache actual note paragraph elements

        // 1) Collect real footnote paragraphs ONLY from inside the footnote containers.
        for (const div of footnoteDivs) {
            const ps = Array.from(div.querySelectorAll("p"));
            for (const p of ps) {
                // A real footnote paragraph begins with <sup>n</sup> as first element child.
                const sup = p.firstElementChild;
                if (!sup || sup.tagName !== "SUP") continue;
                const n = sup.textContent.trim();
                if (!/^\d+$/.test(n)) continue;

                // If the paragraph already has an id (as in your example), keep it.
                // Otherwise assign a stable id.
                if (!p.id) p.id = `fn-${pk}-${n}`;

                const noteId = p.id;
                const refId = `fnref-${pk}-${n}`;

                numToIds.set(n, { noteId, refId });
                noteEls.push(p);

                // Ensure there's a backlink (optional, but nice).
                if (!p.querySelector("a.footnote-backref")) {
                    const back = document.createElement("a");
                    back.href = `#${refId}`;
                    back.className = "footnote-backref";
                    back.setAttribute("aria-label", `Back to footnote reference ${n}`);
                    back.textContent = " ↩︎";
                    p.appendChild(back);
                }
            }
        }

        if (!numToIds.size) return;

        // 2) Linkify inline <sup>n</sup> OUTSIDE footnote containers only.
        const allSups = Array.from(root.querySelectorAll("sup"));
        for (const sup of allSups) {
            if (!/^\d+$/.test(sup.textContent.trim())) continue;
            if (sup.closest("a")) continue; // already linked

            // Never touch superscripts inside the footnote block itself.
            if (sup.closest('div.footnotes[role="note"], div.footnotes')) continue;

            const n = sup.textContent.trim();
            const ids = numToIds.get(n);
            if (!ids) continue; // only linkify numbers that exist as footnotes

            const a = document.createElement("a");
            a.href = `#${ids.noteId}`;
            a.id = ids.refId;
            a.className = "footnote-ref";
            a.setAttribute("aria-label", `Footnote ${n}`);

            sup.replaceWith(a);
            a.appendChild(sup);
        }
    }

    // Run once now
    linkifyFootnotes(document);

    // Run again on SPA-style navigation or content replacement
    let scheduled = false;
    function schedule() {
        if (scheduled) return;
        scheduled = true;
        requestAnimationFrame(() => {
            scheduled = false;
            linkifyFootnotes(document);
        });
    }

    window.addEventListener("popstate", schedule);
    window.addEventListener("hashchange", schedule);

    // MutationObserver catches your sidebar/page loader if it swaps content in-place
    const mo = new MutationObserver(schedule);
    mo.observe(document.documentElement, { childList: true, subtree: true });

})();

// popups
//

(function () {
  // --- config ---
  const MAX_CHARS = 600; // keep tooltips sane
  const OFFSET = 12;

  function getNoteElementFromRef(a) {
    const href = a.getAttribute("href") || "";
    if (!href.startsWith("#")) return null;
    const id = href.slice(1);
    return document.getElementById(id);
  }

  function extractNoteHTML(noteEl) {
    // clone so we can surgically remove the leading <sup>n</sup> and the backref
    const clone = noteEl.cloneNode(true);

    // remove leading sup number
    const firstSup = clone.querySelector(":scope > sup");
    if (firstSup) firstSup.remove();

    // remove backref link
    const back = clone.querySelector("a.footnote-backref");
    if (back) back.remove();

    // trim excessive whitespace
    let html = clone.innerHTML.trim();

    // safety / sanity: avoid monstrous tooltips
    const text = clone.textContent.trim();
    if (text.length > MAX_CHARS) {
      // keep some structure but truncate by text length
      html = text.slice(0, MAX_CHARS).replace(/\s+\S*$/, "") + "…";
      html = html.replace(/</g, "&lt;").replace(/>/g, "&gt;"); // plain text fallback
    }
    return html;
  }

  function ensureTooltip() {
    let tip = document.getElementById("fn-tooltip");
    if (tip) return tip;

    tip = document.createElement("div");
    tip.id = "fn-tooltip";
    tip.className = "fn-tooltip";
    tip.setAttribute("role", "tooltip");
    tip.style.display = "none";
    document.body.appendChild(tip);
    return tip;
  }

  function positionTooltip(tip, anchor) {
    const r = anchor.getBoundingClientRect();
    const tipRect = tip.getBoundingClientRect();

    let x = r.left + window.scrollX;
    let y = r.bottom + window.scrollY + OFFSET;

    // keep within viewport horizontally
    const maxX = window.scrollX + document.documentElement.clientWidth - tipRect.width - 8;
    if (x > maxX) x = Math.max(window.scrollX + 8, maxX);

    // if it would fall off bottom, place above
    const maxY = window.scrollY + document.documentElement.clientHeight - tipRect.height - 8;
    if (y > maxY) {
      y = r.top + window.scrollY - tipRect.height - OFFSET;
    }

    tip.style.left = x + "px";
    tip.style.top = y + "px";
  }

  function showTooltip(anchor) {
    const noteEl = getNoteElementFromRef(anchor);
    if (!noteEl) return;

    const tip = ensureTooltip();
    tip.innerHTML = extractNoteHTML(noteEl);
    tip.style.display = "block";

    // must be visible before measuring
    positionTooltip(tip, anchor);
    tip.dataset.anchorId = anchor.id || "";
  }

  function hideTooltip() {
    const tip = document.getElementById("fn-tooltip");
    if (!tip) return;
    tip.style.display = "none";
    tip.innerHTML = "";
    tip.dataset.anchorId = "";
  }

  // Event delegation: works even when content is swapped dynamically
  document.addEventListener("mouseover", (e) => {
    const a = e.target.closest && e.target.closest("a.footnote-ref");
    if (!a) return;
    showTooltip(a);
  });

  document.addEventListener("mouseout", (e) => {
    const a = e.target.closest && e.target.closest("a.footnote-ref");
    if (!a) return;

    // If moving into the tooltip itself, don't hide
    const tip = document.getElementById("fn-tooltip");
    if (tip && e.relatedTarget && tip.contains(e.relatedTarget)) return;

    hideTooltip();
  });

  // Allow hovering tooltip without it vanishing immediately
  document.addEventListener("mouseover", (e) => {
    const tip = e.target.closest && e.target.closest("#fn-tooltip");
    if (!tip) return;
    tip.style.display = "block";
  });
  document.addEventListener("mouseout", (e) => {
    const tip = e.target.closest && e.target.closest("#fn-tooltip");
    if (!tip) return;
    hideTooltip();
  });

  // Hide on scroll/resize (prevents “orphan tooltip drifting”)
  window.addEventListener("scroll", hideTooltip, { passive: true });
  window.addEventListener("resize", hideTooltip);

})();
