# xetex-pandoc

Docker image for pandoc with xetex support. Mount your directoy in Docker
and call pandoc via a Makefile.

Includes three filters from [Thomas Duck](https://github.com/tomduck):

- [pandoc-fignos](https://github.com/tomduck/pandoc-fignos)
- [pandoc-tablenos](https://github.com/tomduck/pandoc-tablenos)
- [pandoc-eqnos](https://github.com/tomduck/pandoc-eqnos)

Currently contains enough latex binaries make useful PDF and DOCX files
from (multi)markdown.
