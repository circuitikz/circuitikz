## Rollback management for `circuitikz`.


To generate a set of files, checkout the commit you need and run `make flat`.
That will give you a couple of files:

- `t-circuitikzgit.tex` for ConTeXt
- `circuitikzgit.sty` for LaTeX

### old manual rollback

This is what `circuitikz` did for both ConTeXt and LaTeX before v1.4.0, and still do for ConTeXt.

- edit the `...git.{tex|sty}` files to set both names and version of the package.
- for LaTeX:

```
\def\pgfcircversion{1.0}
\def\pgfcircversiondate{2020/02/04}

\ProvidesPackage{circuitikz-1.0}
[\pgfcircversiondate{} The CircuiTikz circuit drawing package version \pgfcircversion]
```

- for ConTeXt:

```
\def\pgfcircversion{1.0}
\def\pgfcircversiondate{2020/02/04}
\writestatus{loading}{\pgfcircversiondate{} The CircuiTikz circuit drawing package version \pgfcircversion}

\usemodule[tikz]

\startmodule[circuitikz-1.0]

```

And it's all.

## To enable the release in the new rollback system for LaTeX

First of all, you need to read [Frank Mittelbach's paper](https://www.latex-project.org/publications/2018-FMi-TUB-tb122mitt-version-rollback.pdf)

Then, you generate the snapshots as above for the classical method. Then you do the following (example for 1.2.7):

- create the common body for the release:

         git mv circuitikz-1.2.7.sty circuitikz-1.2.7-body.tex

- open the new file, and copy the head of the file up to the package definition to a new file `circuitikz-1.2.7.sty`, and then load the common body:

```
\NeedsTeXFormat{LaTeX2e}

\def\pgfcircversion{1.2.7}
\def\pgfcircversiondate{2020/12/27}

\ProvidesPackage{circuitikz-1.2.7}
[\pgfcircversiondate{} The CircuiTikz circuit drawing package version \pgfcircversion]

\input{circuitikz-1.2.7-body.tex}
```

- open the common body, and *remove* the package declaration (but keep the version redefinitions)

```
\NeedsTeXFormat{LaTeX2e}

\def\pgfcircversion{1.2.7}
\def\pgfcircversiondate{2020/12/27}

%% Version 3.0 of pgf/TikZ is required
\RequirePackage{tikz}
...
```

- add the relevant line in `circuitikz.sty`:

```
% set up the rollback system
\providecommand\DeclareRelease[3]{}
\providecommand\DeclareCurrentRelease[2]{}

\def\pgfcircversion{1.4.0-unreleased}
\def\pgfcircversiondate{2021/07/03}

\DeclareRelease{1.2.7}{2020/12/27}{circuitikz-1.2.7-body.tex}
\DeclareRelease{v1.2.7}{2020/12/27}{circuitikz-1.2.7-body.tex}
\DeclareCurrentRelease{\pgfcircversion}{\pgfcircversiondate}

\ProvidesPackage{circuitikz}%
[\pgfcircversiondate{} The CircuiTikz circuit drawing package version \pgfcircversion]
```


