with Tcl; use Tcl;
with Tcl.Strings; use Tcl.Strings;
with Tk; use Tk;
with Tk.Button; use Tk.Button;
with Tk.Grid; use Tk.Grid;
with Tk.MainWindow; use Tk.MainWindow;
with Tk.Menu; use Tk.Menu;
with Tk.TopLevel; use Tk.TopLevel;
with Tk.Widget; use Tk.Widget;
with Tk.Wm; use Tk.Wm;

procedure Calculator is
   Button: Tk_Button;
   Main_Window: Tk_Toplevel;
begin
   -- Initialize Tcl interpreter
   Tcl_Init(Interpreter => Create_Interpreter);

   -- Initialize the Tk library
   Tk_Init;

   -- Get the main window of the program
   Main_Window := Get_Main_Window;

   -- Set the size of the main window
   Set_Geometry
     (Window => Main_Window, Width => 600, Height => 400, X => 0, Y => 0);

   -- Set the title for the main window
   Set_Title
     (Window => Main_Window,
      New_Title => To_Tcl_String("Tashy2 demo - calculator"));

   -- Set the program's simple menu File with one entry Quit to quit from the
   -- program
   declare
      Main_Menu: constant Tk_Menu :=
        Create(Path_Name => ".mainmenu", Options => Default_Menu_Options);
      File_Menu: constant Tk_Menu :=
        Create
          (Path_Name => Tk_Path_Name(Main_Menu) & ".file",
           Options => Default_Menu_Options);
   begin
      Add
        (Menu_Widget => Main_Menu,
         Options =>
           (Item_Type => CASCADE, Menu => File_Menu,
            Label => To_Tcl_String("File"), others => <>));
      Configure
        (Toplevel_Widget => Main_Window,
         Options => (Menu => Main_Menu, others => <>));
   end;

   -- Create the button with text Quit which will be closing the application
   Create
     (Button, ".button",
      Button_Options'
        (Text => To_Tcl_String("Quit"), Command => To_Tcl_String("exit"),
         others => <>));
   -- Add the button to the main window
   Add(Button);

   -- Start the main Tk event loop
   Tk_Main_Loop;

end Calculator;
