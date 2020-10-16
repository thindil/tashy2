#!/bin/sh
# the next line restarts using wish \
exec wish "$0" ${1+"$@"}

# Copyright (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Which parts of binding should be build. By default all
set buildoption all
# If 0 don't build tklib binding. Default is 0
set installtklib 0
# If 0 don't build msgcat binding. Default is 0
set installmsgcat 0
# Version of Tashy2
set tashy2_version 8.6.0

# Used for mostly for Docker, normally Tk should set this variable
# by itself
if {[info exists tk_version] == 0} {
   set tk_version 8.6
}

set gprfile [file join [pwd] tashy2_options.gpr]

# ****f* setup/CreateGprFile
# FUNCTION
# Create GNAT Project file with user selected flags and options
# SOURCE
proc CreateGprFile {} {
   global library_switches gprfile tashvar installtk
   if [catch {open $gprfile w} gprfid] {
      puts stderr $gprfid
      exit
   }
   set library_switch [string range $library_switches 0 [string first "-ltcl" $library_switches]-1]
   puts $gprfid "--  $gprfile
   ----------------------------------------------------------
   --
   --  This file, tashy2_options.gpr, contains global options
   --  used for building and using Tashy2.
   --
   --  It is automatically generated by the scripts/setup.tcl
   --  script.
   --
   ----------------------------------------------------------

   project Tashy2_Options is

   for Source_Dirs use ();

   -- The source files used to compile Tashy2
   Source_Files := ($tashvar(SOURCES));

   --  These are the Ada compiler options used to build Tashy2.
   Compiler_Options :=
   (
   \"[join $tashvar(AARGS) "\",\n      \""]\"
   );

   --  These options determine the location of the system's Tcl, Tk
   --  libraries.
   Linker_Options :=
   (
   \"[string range $library_switches 0 [string first "-ltcl" $library_switches]-2]\",
      \"[join [string range $library_switches [string first "-ltcl" $library_switches] [string length $library_switches]] "\",\n      \""]\"
   );

   end Tashy2_Options;"
   catch {close $gprfid}
}

# ****f* setup/Save
# FUNCTION
# Set all variables and create tashy2_options.gpr file
# SOURCE
proc Save {} {
   global tashvar buildoption library_switches installtklib installmsgcat
   if {$buildoption == "tcl"} {
      set tashvar(TK_VERSION) ""
      set tashvar(TK_LIBRARY) ""
      if {$installmsgcat == 1} {
         set tashvar(SOURCES) "\"src\", \"src/msgcat\""
      } else {
         set tashvar(SOURCES) "\"src\""
      }
      set library_switches [string range $library_switches 0 [string first "-ltk" $library_switches]-1]
   } elseif {$buildoption != "all"} {
      set sources "\"src\", \"src/tk\""
      if {$installtklib == 1} {
         append sources ", \"src/tklib\""
      }
      if {$installmsgcat == 1} {
         append sources ", \"src/msgcat\""
      }
      set tashvar(SOURCES) $sources
   } else {
      set tashvar(SOURCES) "\"src/**\""
   }
   CreateGprFile
}

# Try to find all paths for Tcl/Tk libraries
set exec_suffix ""
set tclhome [file dirname [file dirname [info nameofexecutable]]]
set tcl_include [file join $tclhome include]
if {![file exists [file join $tcl_include tcl.h]]} {
   set tcl_include [file join $tcl_include [file tail $tcl_library]]
}
set library_switches ""
switch $tcl_platform(platform) {
   "windows" {
      regsub {\.} $tcl_version {} tcl_short_version
      regsub {\.} $tk_version  {} tk_short_version
      set tclsh "tclsh${tcl_short_version}"
      set libtcl ""
      set tcldll "tcl${tcl_short_version}.dll"
      set libtk ""
      set tkdll  "tk${tk_short_version}.dll"
      append library_switches "-L$tclhome/lib "
      set tail " "
      if {![file exists [file join $tclhome lib tcl$tk_short_version.lib]]} {
         set tail "t "
      }
      append library_switches "-ltcl$tcl_short_version$tail"
      append library_switches "-ltk$tk_short_version$tail"
      set exec_suffix ".exe"
   }
   "unix" {
      set tclsh "tclsh"
      set dynlib [info sharedlibextension]
      set libtcl "$tclhome/lib/libtcl${tcl_version}$dynlib"
      set libtk  "$tclhome/lib/libtk${tk_version}$dynlib"
      append library_switches " -ltcl$tcl_version -ltk$tk_version"
   }
}
set tashvar(PLATFORM) $tcl_platform(platform)
set tashvar(OS) $tcl_platform(os)
set tashvar(TCLSH) "$tclsh"
set tashvar(TCLHOME) "$tclhome"
set tashvar(TCL_INCLUDE) "-I$tcl_include"
set tashvar(TCL_VERSION) "$tcl_version"
set tashvar(TCL_LIBRARY) "$libtcl"
set tashvar(TK_VERSION) "$tk_version"
set tashvar(TK_LIBRARY) "$libtk"
set tashvar(AARGS) "-O2 -gnatafoE -gnatwaL"
set tashvar(EXE) "$exec_suffix"

# Auto configure the library options
if {[lindex $argv 0] == "auto"} {
   Save
   exit
}

# Create GUI
proc SaveGUI {} {
   Save
}
wm title    . "TASHY2 $tashy2_version Setup"
wm iconname . "TASHY2 Setup"
pack [ttk::label .information -text "This program, setup.tcl, customizes the TASHY2 $tashy2_version installation by\
   creating the file $gprfile. Setup.tcl guesses \"reasonable\"\
   values for the macros, but you may have to edit them.  After you're\
   happy with the macro values, press \"Save\" to save the files." -wraplength 500]
ttk::labelframe .modules -text "Select modules"
pack [ttk::radiobutton .modules.all -text "Everything" -value "all" -variable buildoption] -fill x
pack [ttk::radiobutton .modules.tcl -text "Tcl and one from the list below" -value "tcl" -variable buildoption] -fill x
pack [ttk::checkbutton .modules.msgcat -text "msgcat" -variable installmsgcat] -anchor w -padx 20
pack [ttk::radiobutton .modules.select -text "Tcl, Tk and one from the list below" -value "tcltk" -variable buildoption]
pack [ttk::checkbutton .modules.tklib -text "Tklib" -variable installtklib] -anchor w -padx 20
pack [ttk::checkbutton .modules.msgcat2 -text "msgcat" -variable installmsgcat] -anchor w -padx 20
pack .modules


pack [ttk::button .save -text Save -command {SaveGUI;exit}] -side left
pack [ttk::button .cancel -text Cancel -command exit] -side right
