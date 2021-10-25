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

   set files [list {*}[glob -directory $dir *.adb]]
   set subdirs [glob -type d -directory $dir -nocomplain *]
   foreach dirname $subdirs {
      set files [list {*}$files {*}[glob -directory $dirname *.adb]]
   }
   if {[catch {exec adactl -f [file join $rootdir scripts rules.aru] {*}$files -o [file join $rootdir adacontrol.log] -w} results options]} {
      if {[file size [file join $rootdir adacontrol.log]] > 1} {
         return -options $options -level 0 $results
      } else {
         file delete [file join $rootdir adacontrol.log]
      }
   }
}

exec gprclean -P tashy2.gpr -XLIBRARY_TYPE=static >@stdout
file delete [file join $rootdir adacontrol.log]
cd [file join obj static]
checkcode [file join $rootdir src]
cd $rootdir
exec gprclean -P tashy2.gpr -XLIBRARY_TYPE=static >@stdout
