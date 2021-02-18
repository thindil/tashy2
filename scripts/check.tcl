#!/bin/sh
# the next line restarts using tclsh \
exec tclsh "$0" ${1+"$@"}

if {![file exists tashy2.gpr]} {
   puts {This script must be run in the directory where tashy2.gpr file is}
   return
}

set rootdir [pwd]

proc checkcode {dir} {
   global rootdir

   exec adactl -f [file join $rootdir scripts rules.aru] {*}[glob -directory $dir *.adb] >@stdout
   set subdirs [glob -type d -directory $dir -nocomplain *]
   foreach dirname $subdirs {
      checkcode $dirname
   }
}

exec gprclean -P tashy2.gpr -XLIBRARY_TYPE=static >@stdout
cd [file join obj static]
checkcode [file join $rootdir src]
