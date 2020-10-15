## General information

TASHY2 is short from Tcl Ada SHell Younger version 2. It is derivate of
[TASHY](https://github.com/thindil/tashy)

**IMPORTANT:** TASHY2 is not compatible with TASHY. At this moment it is at
very early stage of the development, pre-alpha stage. **Event this file
is unfinished.** Also this is now mostly a playground thus don't expect too
much soon :)

TASHY2 is the Ada 2012 binding to Tcl/Tk. It allow to use Tcl code in Ada code
and vice versa.

## Build the library from sources

To build you need:

* compiler - GCC with enabled Ada 2012 support or GNAT GPL version from [AdaCore](https://www.adacore.com/download/).
  You can also use one of the available Docker images from [DockerAda](https://github.com/thindil/dockerada)
  project. This last is the recommended option because it is the best tested.

* Tcl/Tk library. Should be available in every Linux distribution. For
  Windows it is recommended to use the MagicSplat version:

  https://www.magicsplat.com/tcl-installer/index.html

  ActiveState version of Tcl/Tk also works:

  https://www.activestate.com/products/tcl/

  If you plan to use the Docker mingw64 image, you will have to build Tcl/Tk
  by yourself or copy needed libraries there.

* If you want Tklib library binding, you will be need this library too. Should
  be available in every Linux distribution. For Windows it is included in the
  MagicSplat and ActiveState versions. It isn't needed to build TASHY, only to
  use its binding.

If you have all the required packages, navigate to the main directory(where
this file is) to compile and type in the console:

1. `scripts/setup.tcl` to setup all configuration needed for compilation.
   On Windows it will be `wish scripts\setup.tcl`. If you want to use default
   settings (like include all other bindings), you can use auto setup by
   adding parameter `auto`. You need to run this script only the first time
   when you compile the library on the selected platform. If you only
   recompile the configured project, skip this step.
2. `gprbuild -P tashy2.gpr` to compile the library in static mode. If you want
   to build relocatable version of the library, use command
   `gprbuild -P tashy2.gpr -XLIBRARY_TYPE=relocatable`.
3. `gprinstall -P tashy2.gpr -p -XLIBRARY_TYPE=static --build-var=LIBRARY_TYPE --build-name=static`
   to install static version of the library with gprinstall which allow use
   it inside GNAT project files. To install also relocatable version of the
   library use command
   `gprinstall -P tashy2.gpr -p -XLIBRARY_TYPE=relocatable --build-var=LIBRARY_TYPE --build-name=relocatable`.
   On Unix systems this step may require root privileges.

If you have installed [Bob](https://github.com/thindil/bob) you can use it in
that way:

1. `bob setup` to setup all configuration needed for compilation. If you want
    to use default settings (like include all other bindings), you can use
    auto setup by typing `bob autosetup`. You need to run this command only
    the first time when you compile the library on the selected platform. If
    you only recompile the configured project, skip this step.
2. `bob build` to compile the library in static and relocatable versions on
   Unix and static only on Windows.
3. `bob install` to install the library with gprinstall which allow use it
   inside GNAT project files. On Unix systems this step may require root
   privileges.

To remove all generated/compiled files type in the console:
`scripts/clean.tcl` (on Unix) or `tclsh scripts\clean.tcl` (on Windows).
If you have installed [Bob](https://github.com/thindil/bob) you can type:
`bob clean`

## Using the library in your project

If you use a GNAT project file in your project, simply add `with "tashy2"` at
beginning of your project file.

## Versioning

TASHY2 versioning is in X.Y.Z schema where:

* X.Y are Tcl/Tk version with which TASHY2 was created and tested. For example,
  version 8.6.5 means that this TASHY2 was tested with Tcl/Tk 8.6.
* Z is number of release of TASHY2 for selected Tcl version. Release numbers
  starts from 0. For example, version 8.6.2 means third release of TASHY2 for
  Tcl/Tk 8.6

## Documentation

For the latest release, the library code documentation is available online at:

https://thindil.github.io/tashy2/

### Documentation sections

* FUNCTION   - general information what the subprogram is doing
* SOURCE     - declaration of the subprogram
* PARAMETERS - detailed information about the subprogram parameters
* RESULT     - value returned by the function
* OUTPUT     - value returned by the procedure
* HISTORY    - list of main changes to the subprogram
* TODO       - list of things to do, plans for the future of the subprogram
* EXAMPLE    - Simple example how to use the subprogram
* COMMANDS   - Tcl command equivalent for the subprogram. Notation is similar
  to this used in Tcl manual `?parameter?` means that parameter is optional,
  `...` means "repeat previous parameters/values/pairs". **NOTE:** if COMMANDS
  value differs from this what is in Tcl manual, it means that Ada subprogram
  uses exactly that variant of the Tcl command.
* SEE ALSO   - Points to the similar Ada subprogram

### Generating the code documentation

To generate (or regenerate) code documentation, you need [ROBODoc](https://rfsber.home.xs4all.nl/Robo/)
To generate the code documentation with default dark style, in the main project
directory (where this file is) enter terminal command: `scripts/generatedocs.tcl`.
To generate the code documentation with light style, in main project directory
enter terminal command: `scripts/generatedocs.tcl scripts/robodocada.rc docs scripts/robodoclight.css`
If you have [Bob](https://github.com/thindil/bob) installed, you can type
`bob docs` for generate the documentation with the dark theme or `bob docslight`
to generate the documentation with the light theme.

## Contributing to the project

For detailed informations about contributing to the project (bugs reporting,
ideas propositions, code conduct, etc), see [CONTRIBUTING.md](CONTRIBUTING.md)

## Licenses

TASHY2 is available under [Apache 2.0](LICENSE-2.0.txt) license

## TODO

The whole TODO list you can find [here](https://github.com/thindil/tashy2/projects/1)

----

That's all for now, as usual, probably I forgot about something important ;)

Bartek thindil Jasicki
