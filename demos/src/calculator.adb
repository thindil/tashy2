with Tcl; use Tcl;
with Tcl.Strings; use Tcl.Strings;
with Tk; use Tk;
with Tk.Grid; use Tk.Grid;
with Tk.MainWindow; use Tk.MainWindow;
with Tk.Menu; use Tk.Menu;
with Tk.TopLevel; use Tk.TopLevel;
with Tk.TtkLabel; use Tk.TtkLabel;
with Tk.Widget; use Tk.Widget;
with Tk.Wm; use Tk.Wm;

procedure Calculator is
   Main_Window: Tk_Toplevel;
   Display_Label: Ttk_Label;
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
           Options => Menu_Options'(Tear_Off => FALSE, others => <>));
   begin
      -- Add menu entry to quit from the program
      Add
        (Menu_Widget => File_Menu,
         Options =>
           (Item_Type => COMMAND, Label => To_Tcl_String("Quit"),
            Command => To_Tcl_String("exit"), others => <>));
      -- Add File menu to the main menu bar
      Add
        (Menu_Widget => Main_Menu,
         Options =>
           (Item_Type => CASCADE, Menu => File_Menu,
            Label => To_Tcl_String("File"), others => <>));
      -- Add the main menu to the program
      Configure
        (Toplevel_Widget => Main_Window,
         Options => (Menu => Main_Menu, others => <>));
   end;

   -- Set the calculator display label, to show operations and their results
   Display_Label :=
     Create
       (Path_Name => ".display",
        Options =>
          Ttk_Label_Options'(Text => To_Tcl_String("0"), others => <>));
   -- Add the display label to the program
   Add
     (Child => Display_Label,
      Options =>
        (Sticky => To_Tcl_String("e"),
         Pad_Y =>
           (Left => (Value => 5.0, Value_Unit => PIXEL),
            Right => (Value => 5.0, Value_Unit => PIXEL)),
         Pad_X =>
           (Left => (Value => 10.0, Value_Unit => PIXEL),
            Right => (Value => 10.0, Value_Unit => PIXEL)),
         others => <>));
   Column_Configure(Main_Window, Display_Label, (Weight => 1, others => <>));

   -- Start the main Tk event loop
   Tk_Main_Loop;

end Calculator;
