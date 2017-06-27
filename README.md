# Equivariant Stable Homotopy Theory Notes

This repository holds lecture notes for [Andrew Blumberg's](https://www.ma.utexas.edu/users/blumberg/)
class on [equivariant homotopy theory](https://ncatlab.org/nlab/show/equivariant+homotopy+theory) at UT
Austin in Spring 2017. This repo holds the source code, in `.tex`, `.bib`, and `.cls` files; the compiled
PDF [is available here](https://www.ma.utexas.edu/users/a.debray/lecture_notes/m392c_EHT_notes.pdf).

These notes were live-TeXed each day in class, then edited afterwards to correct typos, add references,
etc. If you find typos or errors, you can email me to let me know, or just submit a pull request directly.

Now that the semester is over, the notes have been cleaned up a bit. If you'd like to see what we covered
in a given lecture, [here's a version of the PDF indexed by
lecture](https://www.ma.utexas.edu/users/a.debray/lecture_notes/m392c_EHT_notes_old.pdf).

## Organization

- The main file, `m392c_EHT_notes.tex`, is a skeleton: it lists the lecture names and `\input`s the
  other files.  
- The `style_EHT.cls` file contains some stylistic changes as well as a bunch of useful macros.  
- The `macros.tex` file contains additional macros.  
- The references are stored in BibTeX format in `references.bib`.  
- Each section is placed in its own `.tex` file. Consult `m392c_EHT_notes.tex` to see which section
  corresponds to which file.

If you want to add a macro, add it to `macros.tex`, rather than the `.cls` file. If it's a common macro,
it might already be defined there. If you want to add a reference, just append it to `references.bib`.

**Note**: though indexing has been set up, the custom macros are currently somewhat fragile across line
breaks or in footnotes. In those cases, `\index` always works.

## Git hooks

Using the Git hooks provided by the [`gitinfo2`](https://www.ctan.org/pkg/gitinfo2?lang=en) package, it's
possible for the PDF to show which commit it was compiled from. This is optional: if you want to set it up,
run the command `bash install_hooks.sh`. Then, the title page will show the hash and time of the last commit
and whether there have been any uncommited changes. This could be useful for comparing different versions of
the notes. If at any point you want to disable this feature, run `bash uninstall_hooks.sh`. Of course email
me if you have any questions.
