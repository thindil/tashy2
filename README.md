## General information

TASHY2 is short from Tcl Ada SHell Younger version 2. It is derivate of
[TASHY](https://github.com/thindil/tashy)

**IMPORTANT:** TASHY2 is not compatible with TASHY. At this moment it is at
very early stage of the development, pre-alpha stage. **Event this file
is unfinished.**

TASHY2 is the Ada 2012 binding to Tcl/Tk. It allow to use Tcl code in Ada code
and vice versa.

## Build the library from sources

TODO

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
