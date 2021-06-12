
circuitikz
==========

This package provides a set of macros for naturally typesetting electrical and electronic networks.

It was born mainly for writing Massimo Redaelli's exercise book and exams sheets for the Elettrotecnica courses at Politecnico di Milano, Italy. He wanted a tool that was easy to use, with a lean syntax, native to LaTeX, and supporting directly PDF output format.

So it was based on the very impressive TikZ package.

--------------

## Requirements
* Tikz/PGF graphics library, version 3
* xstrings not older than 2009/03/13

## Installation
The stable version is available on [CTAN](https://ctan.org/pkg/circuitikz?lang=en) and is included within the major latex distributions(Texlive, Miktex). If you want to test the latest version, have a look at http://circuitikz.github.io/circuitikz/. There you can find the latest git-version as a single file, just copy it to your project or to your local tex tree.

## Usage
### Stable version
Just place
```latex
  \usepackage[siunitx, RPvoltages]{circuitikz}
```
or other opions; for ConTeXt,
```latex
  \usemodule[circuitikz]
```
in the preamble and compile away, both with PS and PDF target output.

### Development version

If you want to use the git version, go to the [GitHub page for the project](https://circuitikz.github.io/circuitikz/), download the lasted version (or the one you want to use)  — it's the links called "download the latest version in a single file". You will have a file called `circuitikzgit.sty` that you should put somewhere in your LaTeX input path; the best place is in the same directory where your main file live. Then, just use it instead of the normal one:

```latex
  \usepackage[siunitx, RPvoltages]{circuitikzgit}
```
or, for ConTeXt,
```latex
  \usemodule[circuitikzgit]
```

### Older versions (v0.9.1 onwards)

If you want to use older versions of `circuitikz` in LaTeX, just append the version number to the package name, as in `circuitikz-$version`:
```latex
  \usepackage{circuitikz-0.8.3}
```
The available versions are  specified in the manual.

In ConTeXt, you can use older version with
```latex
  \usemodule[circuitikz-0.8.3]
```

Be aware that options can (and do) change between versions, so you have to check them manually.

## More Information and documentation
More Information can be found in the manual; you can find a compiled version for the "bleeding edge" version
[in the github page](http://circuitikz.github.io/circuitikz/circuitikzmanualgit.pdf) and for the various releases in the [GitHub releases](https://github.com/circuitikz/circuitikz/releases), where you can find the manual in the assets of each release (since 0.8.3, anyways).

## Contact the authors

For bug reports and enhacement suggestions, the preferred way is to use [the issue page on the project](https://github.com/circuitikz/circuitikz/issues). Please be ready to provide an example code showing the bug, if any.

Please do not use the issue page for generic help on how to use the package.
The manual has a (growing) set of examples;
also the questions tagged `circuitikz` on  https://tex.stackexchange.com/ are often answered promptly.

* git: https://github.com/circuitikz/circuitikz
* Massimo Redaelli (m.redaelli@gmail.com)
* Stefan Lindner (stefan.lindner@fau.de)
* Stefan Erhardt (stefan.erhardt@fau.de)
* Romano Giannetti (romano.giannetti@gmail.com)

-------------
Copyright 2018-2021 by Romano Giannetti

Copyright 2015-2021 by Stefan Lindner

Copyright 2013-2021 by Stefan Erhardt

Copyright 2007-2021 by Massimo Redaelli

This file may be distributed and/or modified

1. under the LaTeX Project Public License and/or
2. under the GNU Public License.

