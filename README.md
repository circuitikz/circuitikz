circuitikz
==========

This is CircuiTikz, version 0.5 (2016-04-24).

This package provides a set of macros for naturally typesetting electrical and (somewhat less naturally, perhaps) electronical networks.

It was born mainly for writing my own exercise book and exams sheets for the Elettrotecnica courses at Politecnico di Milano, Italy. I wanted a tool that was easy to use, with a lean syntax, native to LaTeX, and supporting directly PDF output format.

So I based everything with the very impressive (if somewhat verbose at times) TikZ package.

--------------

## Requirements
* Tikz graphics library, version 2
* xstrings not older than 2009/03/13

## Installation
Unpack everything in a directory in the TeX search path and refresh the TeX db.

## Usage
Just place
````latex
  \usepackage{circuitikz}
````
or, for ConTeXt, 
````latex
  \usemodule[circuitikz]
````
in the preamble and compile away, both with PS and PDF target output.

## Contact the authors
* git: https://github.com/mredaelli/circuitikz
* Massimo Redaelli (m.redaelli@gmail.com)
* Stefan Lindner (stefan.lindner@fau.de)
* Stefan Erhardt (stefan.erhardt@fau.de)


-------------
Copyright 2007-16 by Massimo Redaelli

This file may be distributed and/or modified

1. under the LaTeX Project Public License and/or
2. under the GNU Public License.
