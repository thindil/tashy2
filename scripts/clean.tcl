#!/bin/sh
# the next line restarts using tclsh \
exec tclsh "$0" ${1+"$@"}

exec gprclean -P tashy2.gpr -XLIBRARY_TYPE=static
exec gprclean -P tashy2.gpr -XLIBRARY_TYPE=relocatable
file delete tashy2_options.gpr
