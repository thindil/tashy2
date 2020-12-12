TASHY2 is short from Tcl Ada SHell Younger version 2. It is derivate of
[TASHY](https://github.com/thindil/tashy)

**IMPORTANT:** TASHY2 is not compatible with TASHY. At this moment it is at
very early stage of the development, pre-alpha stage. Also, this is now
mostly a playground thus don't expect too much soon :) If you read this
file on Github: **please don't send pull requests here**. All will be
automatically closed. Any code propositions should go to the [Fossil](https://www.laeran.pl/repositories/tashy2)
repository.

TASHY2 is the Ada 2012 binding to Tcl/Tk. It allows using Tcl code in Ada code
and vice versa. Included bindings:

* Tcl - It is the base binding. Allow use Tcl scripts in the Ada code.
  If you need any binding here, please [open a ticket](https://www.laeran.pl/repositories/tashy2/ticket) with it.
* Tk - Requires Tcl binding. Allows use Tk GUI in the Ada code. If you need
  any binding here, please [open a ticket](https://www.laeran.pl/repositories/tashy2/ticket) with it.
* Tklib - Requires Tcl and Tk bindings. Allows use additional packages for
  Tk GUI in the Ada code. Not started yet.
* Msgcat - Requires Tcl binding. Allows creating multi-language text messages.
  Not started yet.

