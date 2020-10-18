with Tcl; use Tcl;

procedure HelloWorld is
begin
   -- Initialize the Tcl binding
   Tcl_Init(Create_Interpreter);

   -- Execute Tcl command on default Tcl interpreter
   Tcl_Eval("puts {hello world from Ada}");

end HelloWorld;
