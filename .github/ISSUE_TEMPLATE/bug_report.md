---
name: Bug report
about: Create a report to help us improve
title: "[Bug]"
labels: bug
assignees: ''

---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Please add a complete example that shows the problem. You can use the following template (that also
prints the relevant version information); fill the `tikzpicture` environment with your circuit. Please keep it minimal.

```latex
\documentclass{article}
\usepackage{circuitikz}
\begin{document}

Circuitikz: \pgfcircversion{} (\pgfcircversiondate)\par
Ti\emph{k}Z: \pgfversion{} (\pgfversiondate)\par\bigskip

\begin{tikzpicture}[]
    \draw (0,0) to[R] ++(2,0);
\end{tikzpicture}
\end{document}
```
**Screenshots**
If applicable, add a screenshot of the result to help explain your problem.

**Operating system, LaTeX distribution**

Please state the operating system on which you tried the example. If possible, open a terminal window and copy the output of `pdflatex --version` (or `lualatex`, or whatever engine you use to compile your laTeX document.


**Expected behavior**
A clear and concise description of what you expected to happen.
