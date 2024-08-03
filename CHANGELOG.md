<!--- CircuiTikz - Changelog --->
The major changes among the different CircuiTikZ versions are listed here. See <https://github.com/circuitikz/circuitikz/commits> for a full list of changes.

* Version 1.7.0 (2024-08-03)

    There are no big changes here, but the change to the resistor code (maybe one of the most used by the package) well deserves a minor version bump. A couple of new components, and several minor fixes.

    - New component: new kind of current tap (suggested by [EEpchi and Dr4UX on GitHub](https://github.com/circuitikz/circuitikz/issues/807))
    - New arrow tip `Jack Tap` to help drawing jack connectors (suggested by [Anisio Rogerio Braga](https://github.com/circuitikz/circuitikz/issues/806))
    - Change the drawing of the thermocouple (suggested by [Dr4UX on GitHub](https://github.com/circuitikz/circuitikz/issues/811))
    - Change and enhancement to the drawing of the American resistors (triggered by [Dr4UX on GitHub](https://github.com/circuitikz/circuitikz/issues/814)), fixing a long-standing small asymmetry that nobody noticed
    - Minor adjustment for joins in `viscoe` component
    - Minor additions (`rectjoinfill`) and fixes in documentation

* Version 1.6.9 (2024-05-25)

    Several new components and a bug fix for a nasty long-standing bug about switching diode types.

    - Added a Relais-Shape (contributed by [Jakob "DraUX" on GitHub](https://github.com/circuitikz/circuitikz/pull/795)
    - Added a center tap anchor for tube filament (suggested by [user bogger33 on GitHub](https://github.com/circuitikz/circuitikz/issues/792))
    - Added neon lamps (two versions, suggested by [user bogger33 on GitHub](https://github.com/circuitikz/circuitikz/issues/793))
    - Added a configurable spark gap (suggested by [user bogger33 on GitHub](https://github.com/circuitikz/circuitikz/issues/800))
    - Fix a long-standing problem when [(locally) switching diode type](https://github.com/circuitikz/circuitikz/issues/794)

* Version 1.6.8 (2024-05-05)

    Several new components, more anchors, a bit of documentation enhancement; maybe the biggest change is the new "flexible" tube.

    - Added `mid` anchor to all traditional switches
    - Added a slashed generic European-style resistor (thanks to [Jana](https://tex.stackexchange.com/q/711702/38080))
    - Added a multi-anode tube for implementing nixies and vfd (thanks to [GitHub user nogger33](https://github.com/circuitikz/circuitikz/issues/785))
    - Switch the default compiler to pdflatex (see https://tex.stackexchange.com/q/709273/38080)
    - Added a warning about color and engine in the documentation
    - Enhanced the documentation for instruments (thanks to [Github user mxxmxm](https://github.com/circuitikz/circuitikz/issues/787))

* Version 1.6.7 (2024-02-09)

    Several new blocks, more flexible generic anchors for blocks, and a new option to align the signs on american-style voltage sources.

    - Added `saturation` block (contributed by [P. Sacco <paul.sacco@estaca.eu>](https://github.com/circuitikz/circuitikz/issues/758))
    - Added `iamp`, `sigmoid`, and `allornothing` blocks
    - Added optical fiber `fiber` (contributed by [Christopher Beck](https://github.com/circuitikz/circuitikz/pull/771))
    - Now the position of the lateral anchors (`left up` and similar) of blocks is configurable (suggested by [user "sputeanus" on GitHub](https://github.com/circuitikz/circuitikz/issues/769))
    - Now you can choose how the signs on american-style sources rotate when the source is not vertical (suggested by [jotagah on GitHub](https://github.com/circuitikz/circuitikz/issues/773))
    - New section in the manual about related packages

* Version 1.6.6 (2023-12-09)

    Several new components.

    - Added the symbol for metal-oxide varistor `mov`
    - Added another symbol for fuse (wiggly fuse `wfuse`)

* Version 1.6.5 (2023-10-29)

   This version features an important overhaul of the `muxdemux` configurable component/shape, making it much more flexible and powerful, by adding configurable labels and negation and clock symbols to the pins.
   Also, a couple of minor fixes/workarounds.

    - Added optional and configurable inner, outer and border labels to the `muxdemux` shapes
    - Added optional clock wedge and negation signs to the pins of `muxdemux` shapes
    - Added the possibility to add a background drawing to `muxdemux` shapes
    - Fixed a [bug](https://github.com/circuitikz/circuitikz/issues/748) with `straightvoltages` and `open`
    - Added an (ugly) workaround for a [voltage shift mismatch](https://github.com/circuitikz/circuitikz/issues/747) for sources

* Version 1.6.4 (2023-10-10)

    A bit of enhancement and fixes for the European-style logic ports, more switches (and a bit more configurabilityi for them), more option for some sources.

    - The symbol in European logic ports is now rotation-invariant, and its font can be customized (suggested by [user `@sputeanus` on GitHub](https://github.com/circuitikz/circuitikz/issues/730))
    - Added a couple of "blank" (no symbol) European logic ports
    - Added new "traditional" switches (contributed by [Jakob "DraUX" on GitHub](https://github.com/circuitikz/circuitikz/issues/734))
    - Added configurability (color, thickness, dash) to switch arrows
    - Added "eyw"-symbol (reverse star) for "oo"-type sources (contributed by [Jakob "DraUX" on GitHub](https://github.com/circuitikz/circuitikz/pull/742))
    - Added configurable open shape to the sinusoidal current source (contributed by [Maximilian Martin](https://github.com/circuitikz/circuitikz/pull/737))
    - Documentation fixes

* Version 1.6.3 (2023-06-23)

    The main change is that the definition of the "plus" and "minus" symbols used in several parts of the library has changed in order to achieve better alignment of voltages and amplifier symbols when using fonts different from Computer Modern.
    Additionally, internal connection dots in transistors are configurable and have a new default, and documentation has got several fixes and enhancements.

    - Change the definition of the "minus" symbol (see [this issue](https://github.com/circuitikz/circuitikz/issues/721)) for details
    - Add documentation on how to contact the border of the source symbols (suggested by [user `@Tipounk` on GitHub](https://github.com/circuitikz/circuitikz/issues/722))
    - in transistors, solder dots and connection dots for body diodes [are now configurable](https://github.com/circuitikz/circuitikz/issues/720)
    - Add anchors for the symbols on the `oo`-type sources, suggested by [user `@lapreindl` on GitHub](https://github.com/circuitikz/circuitikz/issues/725); the symbols have been slightly changed and repositioned in the process
    - several documentation fixes

* Version 1.6.2 (2023-05-13)

    Several more styling options for elements (body diodes, transformers, crossing), a clock wedge shape for logical circuits, and documentation updates for ConTeXt, mainly noticing the (upstream) elimination of the thin `siunitx` layer compatibility macros.

    - There is no `siunitx` support for ConTeXt, point to the `units` package
    - `context` compatibility can have glitches: please see [this issue](https://github.com/circuitikz/circuitikz/issues/706)
    - Add styling of `transform core` lines (suggested by [user `@myzinsky` on GitHub](https://github.com/circuitikz/circuitikz/issues/702))
    - Add `scale` to the bodydiode options (suggested by [user `@sputeanus` on GitHub](https://github.com/circuitikz/circuitikz/issues/703))
    - Add styling of crossing vertical line (suggested by [user `@lkjell` on GitHub](https://github.com/circuitikz/circuitikz/issues/704))
    - Add `clockwedge` shape (suggested by [user `@Mario1159` on GitHub](https://github.com/circuitikz/circuitikz/issues/705))

* Version 1.6.1 (2023-02-11)

    New components: solder jumpers; a couple of small but very useful inversion markers for logical circuits, especially targeted at the mux-demux family; a new inline microphone; a much more versatile hemt; a better legacy `tline`. More tweaks to converters blocks, and a lot of typo/grammar fixes in the manual.

    - Add configurable dashes to the dc symbols in converter blocks (suggested by [user `@dbstf` on GitHub](https://github.com/circuitikz/circuitikz/issues/680))
    - Add solder jumpers (by Romano)
    - Add a shape to mark european-style inversion (suggested by [user `yashpalgoyal1304` on GitHub](https://github.com/circuitikz/circuitikz/issues/679)), adjust European-style logic port triangle inversion symbols to match
    - Add a tail-less mic (suggested by [Dr. Mathhias Jung](https://github.com/circuitikz/circuitikz/issues/689)) and an option to change the thickness of the microphone's bar
    - Enhance the `hemt` shape with a GaN-hemt as example (suggested by [user `@epsilon-phi` on GitHub](https://github.com/circuitikz/circuitikz/issues/691))
    - Add anchors and a "bare" option to `tline` (suggested by [Dr. Mathhias Jung](https://github.com/circuitikz/circuitikz/issues/694))
    - subcircuits are no more experimental
    - Correction of several typo/grammar errors in the documentation by [quark67](https://github.com/circuitikz/circuitikz/pull/686)

* Version 1.6.0 (2022-12-10)

    The big change is the refactoring (and enhancement) of the block's code. In addition, double gate MOSes, several fixes all over the map, and quite a lot of anchors were added into the mix.

    - Big change (mostly backward compatible, minus a couple of bug fixes) to the block's code.
        - Now `vco` can be `box`ed
        - enabled more short-name geographical anchors
        - generic blocks can be made rectangular
        - mid-way lateral anchors for all blocks, as well as up/down
        - renamed converters anchors (old ones retained for backward compatibility)
        - new ac/ac blocks, both single- and three-phase
    - Added double gate MOS transistors (by Romano Giannetti)
    - Fix deformed shape for legacy `TL` component ([issue on GitHub](https://github.com/circuitikz/circuitikz/issues/664))
    - Added several anchors on variable components, suggested by [Dr Matthias Jung](https://github.com/circuitikz/circuitikz/issues/663)
    - Added `genericsplitter` component (by [frankplow](github.com/frankplow))
    - Fix - reshape `splitter` using `/tripoles/splitter/width` and `/tripoles/splitter/height` rather than `/tripoles/wilkinson/width` and `/tripoles/wilkinson/height`.

* Version 1.5.5 (2022-11-12)

    New features for optoelectronic devices: a new component, arrow styling,
    and anchors.

    - Added styling of arrows on opto devices, thanks to a suggestion by [Dr Matthias Jung](https://github.com/circuitikz/circuitikz/issues/655)
    - Added Light-Dependent resistor shape (by Romano)
    - Added `arrows` anchors to the opto-components
    - Documentation updates (rotating and flipping for path components)

* Version 1.5.4 (2022-09-09)

    New components and enhancement for old ones in this version.

    - Added jumpers, inspired by a question [on TeX.stackexchange](https://tex.stackexchange.com/questions/652494/drawing-jumper-pinhead-bridge-with-circuitikz)
    - Added generic double bipoles, inspired by user `@erwinderboer` [on GitHub](https://github.com/circuitikz/circuitikz/issues/641)
    - Added styling for the transistor bodydiode, suggested by user [Alex Ghilas on TeX.stackexchange](https://tex.stackexchange.com/questions/653348/drawing-mosfet-bodydiode-dashed)
    - Additions to the manual (how to remove pins on amplifiers)

* Version 1.5.3 (2022-07-02)

    Minor release: fixes to the manual, and a new component (Shockley diodes).

    - Merging changes to fix the language in the manual (thanks to Charles B. Cameron, user `@cameroncb1` on GitHub)
    - Added Shockley diode (suggested by [@dauph](https://tex.stackexchange.com/questions/646039/creating-a-shockley-diode-in-circuitikz))

* Version 1.5.2 (2022-05-08)

    Adding a couple of new component and a nice feature to transistors and tubes.

    - Added TVS diodes (transorb), suggested by [Anisio Rogerio Braga](https://tex.stackexchange.com/q/642219/38080)
    - Added proximity switches, suggested by [Anisio Rogerio Braga](https://github.com/circuitikz/circuitikz/issues/631)
    - Added partially drawn tube and transistor borders, suggested by [Jether Fernandes Reis](https://github.com/circuitikz/circuitikz/issues/602)

* Version 1.5.1 (2022-04-26)

    Bug fix release.

    - Do not load package `regexpatch` by default, thanks to [GitHub user alceu-git](https://github.com/circuitikz/circuitikz/issues/628)

* Version 1.5.0 (2022-04-22)

    In this version, several internal changes have been included in order to streamline and organize better the components and to change the management of color. The changes are pretty deep and subtle, so a bug or unexpected behaviour is always possible. You can use the 1.4.6 rollback point in case of trouble, but be sure to report any bug.

    - Added connectors shapes, and included the BNC into that class; thanks to [Alexander Sauter for suggesting them and helping in the design](https://github.com/circuitikz/circuitikz/issues/611)
    - Added nullator and norator shapes, suggested by [user atticus-sullivan on GitHub](https://github.com/circuitikz/circuitikz/issues/615)
    - Added buzzer and reversed buzzer bipoles, suggested by [user Michael.H](https://tex.stackexchange.com/q/640501/38080)
    - Added "dot" anchors to inductances
    - Added "boxed only" option for some circular blocks, suggested by [user myzinsky](https://github.com/circuitikz/circuitikz/issues/621)
    - Added DIN antenna shape, suggested by [user myzinsky](https://github.com/circuitikz/circuitikz/issues/620)
    - Fixed block/input arrow connection, thanks to [Laurenz Preindl for reporting](https://github.com/circuitikz/circuitikz/issues/613)
    - Fixed a problem with generic tunable arrows, noticed thanks to [this question on TeX.SX](https://tex.stackexchange.com/q/637182/38080)

    Internal changes:

    - Added a generic drawing function for shapes, which are now drawn always in background
    - Added a hook system to be able to change component drawing settings per-shape, per-class or globally
    - All the 250+ shapes are now "protected" by possible external arrow and arced corners parameters
    - Completely changed the management of the shapes' color, thanks to [GitHub user muzimuzhi](https://github.com/circuitikz/circuitikz/issues/605)

* Version 1.4.6 (2022-02-04)

    A nasty bug fix and some hack to avoid that some global Ti*k*Z option spill into the shapes. To better solve that problem, some risky changes are due, so this release will be also a rollback point for compatibility reasons.

    - Fix bug with legacy transmission lines in `overlay`s ([noticed by Benedikt Wilde](https://github.com/circuitikz/circuitikz/issues/604))
    - Robustify some shapes: do not let arrows option pass to the inner drawing (see [here](https://tex.stackexchange.com/a/632084/38080) and [here](https://matrix.to/#/!NuxCISwYQJuyWwNsEI:matrix.org/$vQO6luq1F66LJ79dERmaqKI46qMBcjStqYCPi725uZE?via=matrix.org&via=2krueger.de&via=im.f3l.de))
    - Add warning about global draw options in the manual
    - Fixes in documentation: hyperlink the index again, cite new recovery point, remove some legacy construct
    - Added 1.4.6 rollback point

* Version 1.4.5 (2021-12-06)

    Important fix for ConTeXt users, thanks to @TeXnician for reporting.

    - Fixed an incompatibility introduced with subcircuits that made compilation in ConTeXt fail
    - Added `\ctikzflip[x][y]` utility macros for ConTeXt too
    - Fixed stray characters in some Ti*k*Z environment

* Version 1.4.4 (2021-10-31)

    Normal maintenance release; minor bugs fixed, a new component and a new option. No Halloween component, sorry...

    - Added a laser diode component ([contributed by André Alves](https://github.com/circuitikz/circuitikz/issues/591))
    - Add the `override source vif` option and better describe source's voltage positioning in the manual
    - fix `nobase` option with IGBT family (noticed by [user hinata exc on Stack Eschange](https://tex.stackexchange.com/q/619334/38080))
    - fix  a problem with [legacy open voltage label position](https://github.com/circuitikz/circuitikz/issues/584)

* Version 1.4.3 (2021-09-06)

    Minor release, mainly a single bugfix.

    - added hidden anchors of `ooosource` to the manual
    - fix a bug in anchors of `ooosource` (they did not respect class scaling)
    - faster `use fpu reciprocal` (thanks to Henri Menke)

* Version 1.4.2 (2021-07-26)

    This is a minor release, containing just a new component and a
    small set of fixes (mainly in the documentation).

    - add the `cpe` (constant phase element)
    - correct minor errors in the manual (capacitor's fill, spaces)
      and the code.

* Version 1.4.1 (2021-07-14)

    This version has an important bug fix for label positioning when once-relative style coordinates are used (the ones with a single `+`, like `+(1,1)`.
    Moreover, the possibility to have voltage, current and flow labels *without* the symbols (arrows, etc) has been added, which greatly simplify some kind of personalization of these elements.

    - Added the generic tunable macro
    - Added `no v symbols` (and also for `i` and `f`), thanks to a [head-up by user judober on GitHub](https://github.com/circuitikz/circuitikz/issues/567), see also [issue 448](https://github.com/circuitikz/circuitikz/issues/448)
    - Fixed [label position for +() style coordinates](https://github.com/circuitikz/circuitikz/issues/569)

* Version 1.4.0 (2021-07-06)

    The main news is that *package rollback* for `circuitikz` has been implemented (LaTeX-only, of course).
    Additionally, a small but important change in the path (`to`) construction that should fix some warning from Ti*k*Z
    and give better line joins in wire corners.

    - bump version to 1.4.0
    - implement the version rollback: time travel to 0.4!
    - remove a wrong movement in the path construction (potentially dangerous)

* Version 1.3.9 (2021-06-27)

    Bugfix release: `open poles opacity` was not working in most of the cases.

    - minor fixes to the manual
    - fix bug with `open poles opacity`; see [this question by Florian H.](https://tex.stackexchange.com/questions/602251/circuitikz-redefine-open-nodes-fill-key-to-fill-none-so-that-open-circuit) for details.

* Version 1.3.8 (2021-06-15)

    The big news of this release is the ability to selectively draw the pins of the integrated circuit and mux-demuxes symbols.

    - Add `draw only pins` feature to `dipchip` and `qfpchip`, thanks to [Jonathan P. Spratte](https://github.com/circuitikz/circuitikz/pull/550), and a similar option to control the pins of `muxdemux`
    - Make `dipchip` and `qfpchip` respect `no input leads` option
    - Several corrections to the manual

* version 1.3.7 (2021-06-01)

    Minor release, mainly documentation upgrades.

    - New options for the line thickness, rotation and size of symbols drawn in sources
    - New tutorial:  drawing a circuit around an operational amplifier
    - Documentation fixes and small enhancements

* version 1.3.6 (2021-05-09)

    Mainly a bugfix release; fixing a bug in the `l2` stacked labels means that old constructs that were failing silently can give an error now. Sorry.
    To compensate, I added stacked annotation (for symmetry).

    - Added stacked annotations for symmetry with stacked labels.
    - Fixed a bug in the plotting of `inst amp ra` terminals.
    - Fixed a bug in managing stacked labels (`l2=...`); possibly it will be mildly backward-incompatible (please see the manual about incompatible changes)

* Version 1.3.5 (2021-05-02)

    Power electronics devices are the main characters in this release: PUT, GTOs, a new style for thyristors, and a photovoltaic module.
    Additionally, an **experimental** support for subcircuits has been added;
    it could change in the future.
    Fixed a nasty bug in rotary switches "in" anchor positioning in some cases.

    - Added support for creating and using sub-circuits
    - Added UJT transistors and GTO devices ([suggested by JetherReis](https://github.com/circuitikz/circuitikz/issues/522))
    - Added (as an option) a different, more compact style for thyristor-type devices.
    - Added a photovoltaic module ([suggested by André Alves](https://github.com/circuitikz/circuitikz/issues/524))
    - Added a DC/DC converter block for symmetry ([suggested by Pratched](https://github.com/circuitikz/circuitikz/issues/529))
    - Added the possibility to change the waveforms shown in the oscilloscope ([suggested by Mario Tafur](https://tex.stackexchange.com/q/595062/38080))
    - In the manual, separate the component usage chapter from the big component list
    - Fix wrong rotary switch "in" anchors for switches with more than 180 degrees coverage ([see bug](https://github.com/circuitikz/circuitikz/issues/532))

* Version 1.3.4 (2021-04-20)

    New things, like configurable modifier thickness, ferroelectric devices, and several transistor tweaks.
    Importantly, a bug that hindered compatibility with the internal Ti*k*Z `circuits` library (introduced in 1.3.3) has been fixed.

    - Added separate configuration for the line thickness of resistors, capacitors, and inductors modifiers
    - Added ferroelectric capacitors and ferroelectric gate MOS/FETs ([suggested by Mayeul Cantan](https://github.com/circuitikz/circuitikz/issues/515))
    - Added an option to fill the gate gap in MOSes, FETs and IGBTs with a color
    - Added a "centergap" anchor for transistors
    - Added the option "nogate" to the `hemt` symbol
    - Fixed a bug in thermistors not respecting their class line thickness
    - Fixes in the manual (copy and paste of snippets without numbers, correct old usage of `siunitx`, factor out repetitions in the preamble; [thanks to Ulrike Fischer](https://tex.stackexchange.com/a/57160/38080).
    - Fixed a bug introduced in 1.3.3 that would reduce compatibility with the `circuits` internal library; [reported by JetherReis]( https://github.com/circuitikz/circuitikz/issues/519))

* Version 1.3.3 (2021-04-04)

    Several usability additions in this version, and one small fix that could
    change the look of your circuit (without affecting correctness). Some of the
    arrow shapes are now configurable.

    Do not use this version, there is a bug with the new "label distance" key.

    - Added options to fine-tune the position of labels and annotations
    - Added options to change arrow tips on variable resistors, inductors and
      capacitors as well as in potentiometers
    - Added options to change arrow tips on switches
    - Added anchors to inductance to add core lines
    - Fixed the default direction of tunable arrows (with an option to go back to
      the old ones)

* Version 1.3.2 (2021-03-14)

    - Added the simplified (2-waves) highpass and lowpass blocks
    - Added graphene FETs (suggested by Cees Keyer)
    - Added left/right anchors to transistors
    - Fixed a [bug in flip-flops](https://tex.stackexchange.com/q/587213/38080)

* Version 1.3.1 (2021-02-20)

    - Fixed a bug in "fuse" and "afuse" fill
    - Remove the voltage direction warning. Nobody really ever cared
    - Minor fixes and enhancements to the manual

* Version 1.3.0 (2021-01-19)

    - Fixed a long-standing problem with labels and similar decoration with equal signs and commas
    - Fixed a typo in the manual (thanks to @muzimuzhi on GitHub)
    - The Mother of All Code Refactoring: no real changes (modulo errors)
    - Added a rollback point to 1.2.7

* Version 1.2.7 (2020-12-27)

    Bugfix release.

    - The recent temporary changes to TikZ to v3.1.8a revealed a problem in corner cases with `circuitikz` that should be fixed (thanks to Henri Menke)

* Version 1.2.6 (2020-12-16)

    The highlight of this release is the option to draw circles around transistors; moreover, a handful of new component and several bug fixes.

    - added option to have transistors with circles, suggested by user `@myzinsky`
    - added closed position for normally open button and the other way around (suggested by user `@septatrix`)
    - added a `tip` anchor for push buttons
    - added text anchor for legacy `linestub` component
    - added an option for a different style of european logic xnor port (suggested by user `@Schlepptop`)
    - added dynode tubes electrodes (suggested by user `@ferdymercury`)
    - fixed a bug in style-files (thanks to user `@Alex` on `tex.stackexchange.com`)
    - added a comment about relative coords (thanks to user `@septatrix`)
    - several fixes to the manual

* Version 1.2.5 (2020-10-14)

    Mainly a bugfix release for `raised` voltage style.

    - added macro to access labels and annotations anchors and direction
    - fixed a bug in "raised" voltages' positions with `invert` and/or `mirror`

* Version 1.2.4 (2020-10-04)

    - several documentation enhancment
    - added a couple of block elements: allpass filter, generic two-sides block (suggested by user `@myzinsky`)
    - added transmission gate (only IEEE style version) suggested by several users (`@SJulianS` on github, Philipp Birkl on `TeX.SX`)
    - added a resistive splitter block symbol by `@matthuszagh`
    - added depletion-type `nmosd` and `pmosd` MOSFET simplified symbols
    - added depletion-type `nfetd` and `pfetd` for plain full-symbol MOSFET

* Version 1.2.3 (2020-08-07)

    Several fixes and small enhancement all over the map, changes in the documentation to better explain the reasons and effect of the path-building changes of 1.2.0 and 1.2.1.

    - added a Mach-Zehnder-Modulator block symbol as node `mzm` by user `@dl1chb`
    - add an `open poles fill` option to simplify circuits where the background is different from white
    - restyled the FAQ and added the explanation of "gaps with `nodes`" that happens again after 1.2.1
    - Fixed size of "not circle" in flip-flops to match european style `not circle` when used without the IEEE style
    - Block anchors: add border anchors for round elements and deprecate old 1, 2, 3, 4 anchors
    - Fixed some bipole border size to avoid overlapping labels; document it

* Version 1.2.2 (2020-07-15)

    Bug-fix release: coordinate name leakage. The node and coordinate names are global; the internal coordinate names have been made stronger.

* Version 1.2.1 (2020-07-06)

    Several changes, both internal and user-visible. These are quite risky, although they *should* be backward-compatible (if the circuit code is correct).

    From the user point of view:
    - there is now a new style of voltages ("raised American")
    - a powerful mechanism for customize voltages, current and flows has been added.

    The internal changes are basically the re-implementation of the macros that draw the path elements (`to[...]`), which have been completely rewritten. Please be sure to read the possible incompatibilities in the manual (section 1.9).

    - Added access to voltages, currents and flows anchors
    - Added "raised american" voltage style
    - Rewrite of the path generation macros
    - Several small bugs fixed (no one ever used some "f^>" options...)

* Version 1.2.0 (2020-06-21)

    In this release, the big change is the rewriting of the voltages output routine. Now all voltage options (american, european, and straight) take into account the shape (square border) of the component. The adjusting parameters are now (at least for passive elements) acting in similar way for all the options, too.

    - Bumped version number to 1.2 (potentially incompatible changes!)
    - Added 1.1.2 checkpoint
    - New path-style not, buffer, and Schmitt logic ports
    - New tutorial (using the "inline not" component)
    - Voltage output routine rewrite; now it takes into account the shape of the component also for "american" and "straight" voltages
    - Several fixes in the logic ports: fixed IEEE `invschmitt` name, added symmetry to the three-style shorthands for the ports, and so on
    - Fixed a gross bug in square poles anchor borders
    - Fixed size of not circles in flip-flops (based on logic ports style)
    - Fixed the order of initial options, to avoid "european" overwriting single options

* Version 1.1.2 (2020-05-17)

    - Blocks and component for three-phase networks (3-lines wire, AC/DC and DC/AC converters blocks and grid node block) added by user `@olfline` on GitHub
    - added transformer sources with optional vector groups for three-phase networks by `@olfline` on Github
    - added subsections to the examples
    - fixed position of american voltages on open circuits (suggested by user `@rhandley` on GitHub)

* Version 1.1.1 (2020-04-24)

    One-line bugfix release for the IEEE ports "not" circle thickness

* Version 1.1.0 (2020-04-19)

    Version bumped to 1.1 because the new logic ports are quite a big addition: now there is a new style for logic ports, conforming to IEEE recommendations.

    Several minor additions all over the map too.

    - added IEEE standard logic ports suggested by user Jason-s on GitHub
    - added configurability to european logic port "not" output symbol, suggested by j-hap on GitHub
    - added `inerter` component by user Tadashi on GitHub
    - added variable outer base height for IGBT, suggested by user RA-EE on GitHub
    - added configurable "+" and "-" signs on american-style voltage generators
    - text on amplifiers can be positioned to the left or centered

* Version 1.0.2 (2020-03-22)

    - added Schottky transistors (thanks to a suggestion by Jérôme Monclard on GitHub)
    - fixed formatting of `CHANGELOG.md`

* Version 1.0.1 (2020-02-22)

    Minor fixes and addition to 1.0, in time to catch the freeze for TL2020.

    - add v1.0 version snapshots
    - added crossed generic impedance (suggested by Radványi Patrik Tamás)
    - added open barrier bipole (suggested by Radványi Patrik Tamás)
    - added two flags to flip the direction of light's arrows on LED and photodiode (suggested by karlkappe on GitHub)
    - added a special key to help with precision loss in case of fractional scaling (thanks to AndreaDiPietro92 on GitHub for noticing and reporting, and to Schrödinger's cat for finding a fix)
    - fixed a nasty bug for the flat file generation for ConTeXt

* Version 1.0 (2020-02-04)

    And finally... version 1.0 (2020-02-04) of `circuitikz` is released.

    The main updates since version 0.8.3, which was the last release before Romano started co-maintaining the project, are the following --- part coded by Romano, part by several collaborators around the internet:

    - The manual has been reorganized and extended, with the addition of a tutorial part; tens of examples have been added all over the map.
    - Around 74 new shapes where added. Notably, now there are chips, mux-demuxes, multi-terminal transistors, several types of switches, flip-flops, vacuum tubes, 7-segment displays, more amplifiers, and so on.
    - Several existing shapes have been enhanced; for example, logic gates have a variable number of inputs, transistors are more configurable, resistors can be shaped more, and more.
    - You can style your circuit, changing relative sizes, default thickness and fill color, and more details of how you like your circuit to look; the same you can do with labels (voltages, currents, names of components and so on).
    - A lot of bugs have been squashed; especially the (very complex) voltage direction conundrum has been clarified and you can choose your preferred style here too.

A detailed list of changes can be seen below.

* Version 1.0.0-pre3 (not released)

    - Added a Reed switch
    - Put the copyright and license notices on all files and update them
    - Fixed the loading of style; we should not guard against reload

* Version 1.0.0-pre2 (2020-01-23)

    **Really** last additions toward the 1.0.0 version. The most important change is the addition of multiplexer and de-multiplexers; also added the multi-wires (bus) markers.

    - Added mux-demux shapes
    - Added the possibility to suppress the input leads in logic gates
    - Added multiple wires markers
    - Added a style to switch off the automatic rotation of instruments
    - Changed the shape of the or-type american logic ports (reversible with a flag)

* Version 1.0.0-pre1 (2019-12-22)

    Last additions before the long promised 1.0! In this pre-release we feature a flip-flop library, a revamped configurability of amplifiers (and a new amplifier as a bonus) and some bug fix around the clock.

    - Added a flip-flop library
    - Added a single-input generic amplifier with the same dimension as "plain amp"
    - Added border anchors to amplifiers
    - Added the possibility (expert only!) to add transparency to poles (after a suggestion from user @matthuszagh on GitHub)
    - Make plus and minus symbol on amplifiers configurable
    - Adjusted the position of text in triangular amplifiers
    - Fixed "plain amp" not respecting "noinv input up"
    - Fixed minor incompatibility with ConTeXt and Plain TeX

* Version 0.9.7 (2019-12-01)

    The important thing in this release is the new position of transistor's labels; see the manual for details.

    - Fix the position of transistor's text. There is an option to revert to the old behavior.
    - Added anchors for adding circuits (like snubbers) to the flyback diodes in transistors (after a suggestion from @EdAlvesSilva on GitHub).

* Version 0.9.6 (2019-11-09)

    The highlights of this release are the new multiple terminals BJTs and several stylistic addition and fixes; if you like to pixel-peep, you will like the fixed transistors arrows. Additionally, the transformers are much more configurable now, the "pmos" and "nmos" elements have grown an optional bulk connection, and you can use the "flow" arrows outside of a path.

    Several small and less small bugs have been fixed.

    - Added multi-collectors and multi-emitter bipolar transistors
    - Added the possibility to style each one of the two coils in a transformer independently
    - Added bulk connection to normal MOSFETs and the respective anchors
    - Added "text" anchor to the flow arrows, to use them alone in a consistent way
    - Fixed flow, voltage, and current arrow positioning when "auto" is active on the path
    - Fixed transistors arrows overshooting the connection point, added a couple of anchors
    - Fixed a spelling error on op-amp key "noinv input down"
    - Fixed a problem with "quadpoles style=inner" and "transformer core" having the core lines running too near

* Version 0.9.5 (2019-10-12)

    This release basically add features to better control labels, voltages and similar text "ornaments" on bipoles, plus some other minor things.

    On the bug fixes side, a big incompatibility with ConTeXt has been fixed, thanks to help from `@TheTeXnician` and `@hmenke` on `github.com`.

    - Added a "midtap" anchor for coils and exposed the inner coils shapes in the transformers
    - Added a "curved capacitor" with polarity coherent with "ecapacitor"
    - Added the possibility to apply style and access the nodes of bipole's text ornaments (labels, annotations, voltages, currents and flows)
    - Added the possibility to move the wiper in resistive potentiometers
    - Added a command to load and set a style in one go
    - Fixed internal font changing commands for compatibility with ConTeXt
    - Fixed hardcoded black color in "elko" and "elmech"

* Version 0.9.4 (2019-08-30)

    This release introduces two changes: a big one, which is the styling of the components (please look at the manual for details) and a change to how voltage labels and arrows are positioned. This one should be backward compatible *unless* you used `voltage shift` introduced in 0.9.0, which was broken when using the global `scale` parameter.

    The styling additions are quite big, and, although in principle they are backward compatible, you can find corner cases where they are not, especially if you used to change parameters for `pgfcirc.defines.tex`; so a snapshot for the 0.9.3 version is available.

    - Fixed a bug with "inline" gyrators, now the circle will not overlap
    - Fixed a bug in input anchors of european not ports
    - Fixed "tlinestub" so that it has the same default size than "tline" (TL)
    - Fixed the "transistor arrows at end" feature, added to styling
    - Changed the behavior of "voltage shift" and voltage label positioning to be more robust
    - Added several new anchors for "elmech" element
    - Several minor fixes in some component drawings to allow fill and thickness styles
    - Add 0.9.3 version snapshots.
    - Added styling of relative size of components (at a global or local level)
    - Added styling for fill color and thickeness
    - Added style files

* Version 0.9.3 (2019-07-13)
    - Added the option to have "dotless" P-MOS (to use with arrowmos option)
    - Fixed a (puzzling) problem with coupler2
    - Fixed a compatibility problem with newer PGF (>3.0.1a)

* Version 0.9.2 (2019-06-21)
    - (hopefully) fixed ConTeXt compatibility. Most new functionality is not tested; testers and developers for the ConTeXt side are needed.
    - Added old ConTeXt version for 0.8.3
    - Added tailless ground

* Version 0.9.1 (2019-06-16)
    - Added old LaTeX versions for 0.8.3, 0.7, 0.6 and 0.4
    - Added the option to have inline transformers and gyrators
    - Added rotary switches
    - Added more configurable bipole nodes (connectors) and more shapes
    - Added 7-segment displays
    - Added vacuum tubes by J. op den Brouw
    - Made the open shape of dcisources configurable
    - Made the arrows on vcc and vee configurable
    - Fixed anchors of diamondpole nodes
    - Fixed a bug (#205) about unstable anchors in the chip components
    - Fixed a regression in label placement for some values of scaling
    - Fixed problems with cute switches anchors

* Version 0.9.0 (2019-05-10)
    - Added Romano Giannetti as contributor
    - Added a CONTRIBUTING file
    - Added options for solving the voltage direction problems.
	- Adjusted ground symbols to better match ISO standard, added new symbols
    - Added new sources (cute european versions, noise sources)
    - Added new types of amplifiers, and option to flip inputs and outputs
    - Added bidirectional diodes (diac) thanks to Andre Lucas Chinazzo
    - Added L,R,C sensors (with european, american and cute variants)
    - Added stacked labels (thanks to the original work by Claudio Fiandrino)
    - Make the position of voltage symbols adjustable
    - Make the position of arrows in FETs and  BJTs adjustable
    - Added chips (DIP, QFP) with a generic number of pins
    - Added special anchors for transformers (and fixed the wrong center anchor)
    - Changed the logical port implementation to multiple inputs (thanks to John Kormylo) with border anchors.
    - Added several symbols: bulb, new switches, new antennas, loudspeaker, microphone, coaxial connector, viscoelastic element
    - Make most components fillable
    - Added the oscilloscope component and several new instruments
    - Added viscoelastic element
    - Added a manual section on how to define new components
    - Fixed american voltage symbols and allow to customize them
	- Fixed placement of straightlabels in several cases
    - Fixed a bug about straightlabels (thanks to @fotesan)
    - Fixed labels spacing so that they are independent on scale factor
    - Fixed the position of text labels in amplifiers

* Version 0.8.3 (2017-05-28)
	- Removed unwanted lines at to-paths if the starting point is a node without a explicit anchor.
	- Fixed scaling option, now all parts are scaled by bipoles/length
	- Surge arrester appears no more if a to path is used without []-options
	- Fixed current placement now possible with paths at an angle of around 280°
	- Fixed voltage placement now possible with paths at an angle of around 280°
	- Fixed label and annotation placement (at some angles position not changable)
	- Adjustable default distance for straight-voltages: 'bipoles/voltage/straight label distance'
	- Added Symbol for bandstop filter
	- New annotation type to show flows using f=... like currents, can be used for thermal, power or current flows

* Version 0.8.2 (2017-05-01)
	- Fixes pgfkeys error using alternatively specified mixed colors(see pgfplots manual section "4.7.5 Colors")
	- Added new switches "ncs" and "nos"
	- Reworked arrows at spst-switches
	- Fixed direction of controlled american voltage source
	- "v<=" and "i<=" do not rotate the sources anymore(see them as "counting direction indication", this can be different then the shape orientation); Use the option "invert" to change the direction of the source/apperance of the shape.
	- current label "i=" can now be used independent of the regular label "l=" at current sources
	- rewrite of current arrow placement. Current arrows can now also be rotated on zero-length paths
	- New DIN/EN compliant operational amplifier symbol "en amp"

* Version 0.8.1 (2017-03-25)
	- Fixed unwanted line through components if target coordinate is a name of a node
	- Fixed position of labels with subscript letters.
	- Absolute distance calculation in terms of ex at rotated labels
	- Fixed label for transistor paths (no label drawn)

* Version 0.8 (2017-03-08)
	- Allow use of voltage label at a [short]
	- Correct line joins between path components (to[...])
	- New Pole-shape .-. to fill perpendicular joins
	- Fixed direction of controlled american current source
	- Fixed incorrect scaling of magnetron
	- Fixed: Number of american inductor coils not adjustable
	- Fixed Battery Symbols and added new battery2 symbol
	- Added non-inverting Schmitttrigger

* Version 0.7 (2016-09-08)
	- Added second annotation label, showing, e.g., the value of an component
	- Added new symbol: magnetron
	- Fixed name conflict of diamond shape with tikz.shapes package
	- Fixed varcap symbol at small scalings
	- New packet-option "straightvoltages, to draw straight(no curved) voltage arrows
	- New option "invert" to revert the node direction at paths
	- Fixed american voltage label at special sources and battery
	- Fixed/rotated battery symbol(longer lines by default positive voltage)
	- New symbol Schmitttrigger

* Version 0.6 (2016-06-06)
	- Added Mechanical Symbols (damper,mass,spring)
	- Added new connection style diamond, use (d-d)
	- Added new sources voosource and ioosource (double zero-style)
	- All diode can now drawn in a stroked way, just use globel option "strokediode" or stroke instead of full/empty, or D-. Use this option for compliance with DIN standard EN-60617
	- Improved Shape of Diodes:tunnel diode, Zener diode, schottky diode (bit longer lines at cathode)
	- Reworked igbt: New anchors G,gate and new L-shaped form Lnigbt, Lpigbt
	- Improved shape of all fet-transistors and mirrored p-chan fets as default, as pnp, pmos, pfet are already. This means a backward-incompatibility, but smaller code, because p-channels mosfet are by default in the correct direction(source at top). Just remove the 'yscale=-1' from your p-chan fets at old pictures.

* Version 0.5 (2016-04-24)
	- new option boxed and dashed for hf-symbols
	- new option solderdot to enable/disable solderdot at source port of some fets
	- new parts: photovoltaic source, piezo crystal, electrolytic capacitor, electromechanical device(motor, generator)
	- corrected voltage and current direction(option to use old behaviour)
	- option to show body diode at fet transistors

* Version 0.4
    - minor improvements to documentation
    - comply with TDS
    - merge high frequency symbols by Stefan Erhardt
    - added switch (not opening nor closing)
    - added solder dot in some transistors
    - improved ConTeXt compatibility

* Version 0.3.1
    - different management of color...
    - fixed typo in documentation
    - fixed an error in the angle computation in voltage and current routines
    - fixed problem with label size when scaling a tikz picture
    - added gas filled surge arrester
    - added compatibility option to work with Tikz's own circuit library
    - fixed infinite in arctan computation

* Version 0.3.0
	- fixed gate node for a few transistors
    - added mixer
    - added fully differential op amp (by Kristofer M. Monisit)
    - now general settings for the drawing of voltage can be overridden for specific components
    - made arrows more homogeneous (either the current one, or latex' bt pgf)
    - added the single battery cell
    - added fuse and asymmetric fuse
    - added toggle switch
    - added varistor, photoresistor, thermocouple, push button
    - added thermistor, thermistor ptc, thermistor ptc
    - fixed misalignment of voltage label in vertical bipoles with names
    - added isfet
    - added noiseless, protective, chassis, signal and reference grounds (Luigi «Liverpool»)

* Version 0.2.4
	- added square voltage source (contributed by Alistair Kwan)
	- added buffer and plain amplifier (contributed by Danilo Piazzalunga)
	- added squid and barrier (contributed by  Cor Molenaar)
	- added antenna and transmission line symbols contributed by Leonardo Azzinnari
	- added the changeover switch spdt (suggestion of Fabio Maria Antoniali)
	- rename of context.tex and context.pdf (thanks to Karl Berry)
	- updated the email address
    - in documentation, fixed wrong (non-standard) labelling of the axis in an example (thanks to prof. Claudio Beccaria)
    - fixed scaling inconsistencies in quadrupoles
    - fixed division by zero error on certain vertical paths
    - introduced options straighlabels, rotatelabels, smartlabels

* Version 0.2.3
	- fixed compatibility problem with label option from tikz
	- Fixed resizing problem for shape ground
	- Variable capacitor
	- polarized capacitor
	- ConTeXt support (read the manual!)
	- nfet, nigfete, nigfetd, pfet, pigfete, pigfetd (contribution of Clemens Helfmeier and Theodor
Borsche)
	- njfet, pjfet (contribution of Danilo Piazzalunga)
	- pigbt, nigbt
	- *backward incompatibility* potentiometer is now the standard resistor-with-arrow-in-the-middle; the old potentiometer is now known as variable resistor (or vR), similarly to variable inductor and variable capacitor
	- triac, thyristor, memristor
	- new property "name" for bipoles
	- fixed voltage problem for batteries in american voltage mode
	- european logic gates
	- *backward incompatibility* new american standard inductor. Old american inductor now called "cute inductor"
	- *backward incompatibility* transformer now linked with the chosen type of inductor, and version with core, too. Similarly for variable inductor
	- *backward incompatibility* styles for selecting shape variants now end are in the plural to avoid conflict with paths
	- new placing option for some tripoles (mostly transistors)
	- mirror path style


* Version 0.2.2 - 20090520
    - Added the shape for lamps.
	- Added options \texttt{europeanresistor}, \texttt{europeaninductor}, \texttt{americanresistor} and \texttt{americaninductor}, with corresponding styles.
	- FIXED: error in transistor arrow positioning and direction under negative \texttt{xscale} and \texttt{yscale}.

* Version 0.2.1 - 20090503
	- Op-amps added
	- added options arrowmos and noarrowmos, to add arrows to pmos and nmos

* Version 0.2 - 20090417
First public release on CTAN
   	- *Backward incompatibility*: labels ending with \texttt{:}\textit{angle} are not parsed for positioning anymore.
	- Full use of \TikZ\ keyval features.
	- White background is not filled anymore: now the network can be drawn on a background picture as well.
	- Several new components added (logical ports, transistors, double bipoles, \ldots).
	- Color support.
	- Integration with {\ttfamily siunitx}.
	- Voltage, american style.
	- Better code, perhaps. General cleanup at the very least.

* Version 0.1 - 2007-10-29
First public release
