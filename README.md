# Equivariant Stable Homotopy Theory Notes

This repository holds lecture notes for [Andrew Blumberg's](https://www.ma.utexas.edu/users/blumberg/)
class on [equivariant homotopy theory](https://ncatlab.org/nlab/show/equivariant+homotopy+theory) at UT
Austin in Spring 2017. This repo holds the source code, in `.tex`, `.bib`, and `.cls` files; the compiled
PDF [is available here](https://www.ma.utexas.edu/users/a.debray/lecture_notes/m392c_EHT_notes.pdf).

I live-TeX these notes each day in class, and then go back afterwards to correct typos, add references,
etc. If you find typos or errors, you can email me to let me know, or just submit a pull request directly.

## Organization

- The main file, `m392c_EHT_notes.tex`, is a skeleton: it lists the lecture names and `\input`s the
  other files.  
- The `style_EHT.cls` file contains some stylistic changes as well as a bunch of useful macros.  
- The `macros.tex` file contains additional macros.  
- The references are stored in BibTeX format in `references.bib`.  
- Each lecture is placed in its own `.tex` file. Consult `m392c_EHT_notes.tex` to see which lecture
  corresponds to which file.

If you want to add a macro, add it to `macros.tex`, rather than the `.cls` file. If it's a common macro,
it might already be defined there. If you want to add a reference, just append it to `references.bib`.
