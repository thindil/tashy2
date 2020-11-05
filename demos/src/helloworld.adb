with Ada.Text_IO;
with Tcl; use Tcl;
with Tcl.Strings; use Tcl.Strings;
with Tk; use Tk;
with Tk.Button; use Tk.Button;

procedure HelloWorld is
   Button: Tk_Button;
begin
   -- Initialize Tcl interpreter
   Tcl_Init(Create_Interpreter);
   -- Initialize the Tk library
   Tk_Init;

   -- Create button
   Button := Button_New(".button", (Text => To_Tcl_String("Click me"), others => <>));

   Ada.Text_IO.Put_Line(Get_Option(Button, "-text"));

end HelloWorld;
