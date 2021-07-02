with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Tcl; use Tcl;
with Tcl.Strings; use Tcl.Strings;
with Tk; use Tk;
with Tk.Grid; use Tk.Grid;
with Tk.MainWindow; use Tk.MainWindow;
with Tk.Menu; use Tk.Menu;
with Tk.TopLevel; use Tk.TopLevel;
with Tk.TtkButton; use Tk.TtkButton;
with Tk.TtkFrame; use Tk.TtkFrame;
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
      New_Title => To_Tcl_String(Source => "Tashy2 demo - calculator"));

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
           (Item_Type => COMMAND, Label => To_Tcl_String(Source => "Quit"),
            Command => To_Tcl_String(Source => "exit"), others => <>));
      -- Add File menu to the main menu bar
      Add
        (Menu_Widget => Main_Menu,
         Options =>
           (Item_Type => CASCADE, Menu => File_Menu,
            Label => To_Tcl_String(Source => "File"), others => <>));
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
        (Sticky => E,
         Pad_Y => (Top => (Value => 5.0, Value_Unit => <>), Bottom => <>),
         Pad_X => (Left => (Value => 10.0, Value_Unit => <>), Right => <>),
         Column_Span => 2, others => <>));
   -- Resize the display to the width of the main window
   Column_Configure(Main_Window, Display_Label, (Weight => 1, others => <>));

   -- Add numbers buttons to the program
   declare
      -- Create frame for the buttons
      Numbers_Frame: constant Ttk_Frame :=
        Create(Path_Name => ".numbers", Options => Default_Ttk_Frame_Options);
      Button: Ttk_Button;
      Button_Text: String(1 .. 1);
      Column: Extended_Natural := 2;
      Row: Extended_Natural := 1;
   begin
      -- Create buttons for numbers from 1 to 9 and add them to their parents
      -- frame
      Add_Numbers_Buttons_Loop :
      for I in reverse 1 .. 9 loop
         Button_Text := Trim(Source => Natural'Image(I), Side => Left);
         Button :=
           Create
             (Path_Name =>
                Tk_Path_Name(Widgt => Numbers_Frame) & "." & Button_Text,
              Options =>
                Ttk_Button_Options'
                  (Text => To_Tcl_String(Source => Button_Text),
                   others => <>));
         Add
           (Child => Button,
            Options => (Column => Column, Row => Row, others => <>));
         Column := Column - 1;
         if Column = -1 then
            Column := 2;
            Row := Row + 1;
         end if;
      end loop Add_Numbers_Buttons_Loop;
      -- Create button for number 0 and add it to the parent frame
      Button :=
        Create
          (Path_Name => Tk_Path_Name(Widgt => Numbers_Frame) & ".0",
           Options =>
             Ttk_Button_Options'
               (Text => To_Tcl_String(Source => "0"), others => <>));
      Add
        (Child => Button,
         Options =>
           (Row => Row, Sticky => WIDTH, Column_Span => 3, others => <>));
      -- Add all numbers buttons to the main window
      Add(Child => Numbers_Frame);
   end;

   declare
      -- Create frame for the buttons
      Operators_Frame: constant Ttk_Frame :=
        Create
          (Path_Name => ".operators", Options => Default_Ttk_Frame_Options);
      Button: Ttk_Button;
      Column: Extended_Natural := 1;
      Row: Extended_Natural := 1;
      Operators: constant array(1 .. 4) of String(1 .. 1) :=
        ("+", "-", "*", "/");
   begin
      Add_Operators_Buttons_Loop :
      for I in Operators'Range loop
         Button :=
           Create
             (Path_Name =>
                Tk_Path_Name(Widgt => Operators_Frame) & "." &
                Trim(Source => Positive'Image(I), Side => Left),
              Options =>
                Ttk_Button_Options'
                  (Text => To_Tcl_String(Source => Operators(I)),
                   others => <>));
         Add
           (Child => Button,
            Options => (Column => Column, Row => Row, others => <>));
         Column := Column - 1;
         if Column = -1 then
            Column := 1;
            Row := Row + 1;
         end if;
      end loop Add_Operators_Buttons_Loop;
      -- Create button for equal operator and add it to the parent frame
      Button :=
        Create
          (Path_Name => Tk_Path_Name(Widgt => Operators_Frame) & ".equal",
           Options =>
             Ttk_Button_Options'
               (Text => To_Tcl_String(Source => "="), others => <>));
      Add
        (Child => Button,
         Options =>
           (Row => Row, Sticky => WIDTH, Column_Span => 2, others => <>));
      -- Add all operations buttons to the main window
      Add
        (Child => Operators_Frame,
         Options => (Row => 1, Column => 1, Sticky => N, others => <>));
   end;

   -- Start the main Tk event loop
   Tk_Main_Loop;

end Calculator;
