with Tcl; use Tcl;
with Tcl.Strings; use Tcl.Strings;
with Tk; use Tk;
with Tk.Button; use Tk.Button;
with Tk.Grid; use Tk.Grid;
with Tk.MainWindow; use Tk.MainWindow;
with Tk.Wm; use Tk.Wm;

procedure Calculator is
   Button: Tk_Button;
begin
   -- Initialize Tcl interpreter
   Tcl_Init(Interpreter => Create_Interpreter);

   -- Initialize the Tk library
   Tk_Init;

   -- Set the size of the main window
   Set_Geometry(Window => Get_Main_Window, Width => 600, Height => 400);

   -- Create the button with text Quit which will be closing the application
   Create
     (Button, ".button",
      (Text => To_Tcl_String("Quit"), Command => To_Tcl_String("exit"),
       others => <>));
   -- Add the button to the main window
   Add(Button);

   -- Start the main Tk event loop
   Tk_Main_Loop;

end Calculator;
