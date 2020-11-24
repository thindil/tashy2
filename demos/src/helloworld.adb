with Tcl; use Tcl;
with Tcl.Strings; use Tcl.Strings;
with Tk; use Tk;
with Tk.Button; use Tk.Button;
with Tk.Grid; use Tk.Grid;

procedure HelloWorld is
   Button: Tk_Button;
begin
   -- Initialize Tcl interpreter
   Tcl_Init(Create_Interpreter);

   -- Initialize the Tk library
   Tk_Init;

   -- Create the button with text Quit which will be closing the application
   Create
     (Button, ".button",
      (Text => To_Tcl_String("Quit"), Command => To_Tcl_String("exit"),
       others => <>));
   -- Add the button to the main window
   Add(Button);

   -- Start the main Tk event loop
   Tk_MainLoop;

end HelloWorld;
