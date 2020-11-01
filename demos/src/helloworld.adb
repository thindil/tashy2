with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;
with Tcl; use Tcl;
with Tk; use Tk;
with Tk.Button; use Tk.Button;

procedure HelloWorld is
   Button: Tk_Button;
   ButtonConfig: constant Button_Options := (Ttk => False, Text => To_Unbounded_String("Click me"), others => <>);
begin
   -- Initialize Tcl interpreter
   Tcl_Init(Create_Interpreter);
   -- Initialize the Tk library
   Tk_Init;

   -- Create button
   Button := Create(".button", ButtonConfig);

   Ada.Text_IO.Put_Line(Integer'Image(Button.Tk_Window));

end HelloWorld;
