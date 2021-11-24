-- Copyright (c) 2021 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- Licensed under the Apache License, Version 2.0 (the "License"); you may not
-- use this file except in compliance with the License. You may obtain a copy
-- of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
-- WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
-- License for the specific language governing permissions and limitations
-- under the License.

--## rule off REDUCEABLE_SCOPE
with Tk.Colors; use Tk.Colors;
with Tk.MainWindow; use Tk.MainWindow;
--## rule on REDUCEABLE_SCOPE
with Tk.Widget; use Tk.Widget;
with Tcl.Lists; use Tcl.Lists;

-- ****h* Tk/Winfo
-- FUNCTION
-- Provide bindings for Tk command winfo (information about the selected
-- widget)
-- SOURCE
package Tk.Winfo is
-- ****

   --## rule off REDUCEABLE_SCOPE

   -- ****t* Winfo/Winfo.Screen_Visual_Type
   -- FUNCTION
   -- Type of available screen visuals colors
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Screen_Visual_Type is
     (DIRECTCOLOR, GRAYSCALE, PSEUDOCOLOR, STATICCOLOR, STATICGRAY,
      TRUECOLOR) with
      Default_Value => TRUECOLOR;
      -- ****

      -- ****d* Winfo/Winfo.Default_Screen_Visual
      -- FUNCTION
      -- Default type of screen visuals colors
      -- SOURCE
   Default_Screen_Visual: constant Screen_Visual_Type := TRUECOLOR;
   -- ****

   -- ****s* Winfo/Winfo.Visual_Record
   -- FUNCTION
   -- Data structure for information about screen visual
   -- OPTIONS
   -- Visual_Type - The type of the selected visual
   -- Depth       - The color depth in the selected visual
   -- Id          - The Id of the selected visual
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Visual_Record(Include_Id: Boolean := False) is record
      Visual_Type: Screen_Visual_Type;
      Depth: Positive;
      case Include_Id is
         when True =>
            Id: Positive;
         when False =>
            null;
      end case;
   end record;
   -- ****

   -- ****d* Winfo/Winfo.Default_Visual
   -- FUNCTION
   -- Default screen visual data
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Visual: constant Visual_Record :=
     (Visual_Type => TRUECOLOR, Depth => 24, Include_Id => False);
   -- ****

   -- ****t* Winfo/Winfo.Visuals_List
   -- FUNCTION
   -- Used to get the list of available visuals for the selected
   -- widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Visuals_List is array(Positive range <>) of Visual_Record;
   -- ****

   -- ****d* Winfo/Winfo.Empty_Visual_List
   -- FUNCTION
   -- Empty list of available screen visuals
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Visual_List: constant Visuals_List(1 .. 0) :=
     (others => Default_Visual);
   -- ****

   -- ****f* Winfo/Winfo.Atom
   -- FUNCTION
   -- Get the identifier of the atom with the selected name. If no atom exists
   -- with that name, create a new.
   -- PARAMETERS
   -- A_Name      - The name of the atom which Id will be get
   -- Interpreter - The Tcl interpreter on which the atom name will be get.
   --               Can be empty. Default value is the current interpreter.
   -- Window      - If set, the atom will be looked up at the display of the
   --               selected Tk widget. Can be empty. Default value is empty.
   -- RESULT
   -- The Id of the selected atom or the id of newly created atom
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get or create atom with name myatom on the default Tcl interpreter
   -- Atom_Id: constant Positive := Atom("myatom");
   -- SEE ALSO
   -- Winfo.Atom_Name
   -- COMMANDS
   -- winfo atom ?-displayof Window? A_Name
   -- SOURCE
   function Atom
     (A_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return Positive with
      Pre => A_Name'Length > 0,
      Test_Case => (Name => "Test_Winfo_Atom", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Atom_Name
      -- FUNCTION
      -- Get the name of the selected atom.
      -- PARAMETERS
      -- Atom_Id     - The id of the atom which name will be get
      -- Interpreter - The Tcl interpreter on which the atom name will be get.
      --               Can be empty. Default value is the current interpreter.
      -- Window      - If set, the atom name will be looked up at the display
      --               of the selected widget. Can be empty. Default value is
      --               empty.
      -- RESULT
      -- The name of the selected atom or TCL_EXCEPTION if the atom doesn't
      -- exists
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the name of the atom with Id 605 on the default Tcl interpreter
      -- Name: constant String := Atom_Name(605);
      -- SEE ALSO
      -- Winfo.Atom
      -- COMMANDS
      -- winfo atomname ?-displayof Window? Atom_Id
      -- SOURCE
   function Atom_Name
     (Atom_Id: Positive; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return String with
      Test_Case => (Name => "Test_Winfo_Atom_Name", Mode => Robustness);
      -- ****

      -- ****f* Winfo/Winfo.Cells
      -- FUNCTION
      -- Get the amount of cells in the color map of the selected widget
      -- PARAMETERS
      -- Window - Tk widget which amount of cell will be get
      -- RESULT
      -- The amount of cells in the color map of the selected widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the amount of cells of Tk widget My_Button
      -- Cell_Amount: constant Natural := Cells(My_Button);
      -- SEE ALSO
      -- Winfo.Screen_Cells
      -- COMMANDS
      -- winfo cells Window
      -- SOURCE
   function Cells(Window: Tk_Widget) return Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Cells", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Children
      -- FUNCTION
      -- Get the children of the selected widget.
      -- PARAMETERS
      -- Window -  Tk widget which children will be get
      -- RESULT
      -- The Widgets_Array with all children of the selected widget in
      -- stacking order, the lowest window first
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the children of the main Tk window
      -- Widgets: constant Widgets_Array := Children(Get_Main_Window);
      -- COMMANDS
      -- winfo children Window
      -- SOURCE
   function Children(Window: Tk_Widget) return Widgets_Array with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Children", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Class
      -- FUNCTION
      -- Get the class name of the selected Tk widget
      -- PARAMETERS
      -- Window - Tk widget which name will be get
      -- RESULT
      -- The String with the name of the class of the selected Tk widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the class name of My_Label widget
      -- Class_Name: constant String := Class(My_Label);
      -- COMMANDS
      -- winfo class Window
      -- SOURCE
   function Class(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "winfo class " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))
        .Result) with
      Pre => Window /= Null_Widget
      and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 12,
      Test_Case => (Name => "Test_Winfo_Class", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Color_Map_Full
      -- FUNCTION
      -- Check if the color map of the selected widget is full or not
      -- PARAMETERS
      -- Window - Tk widget which the color map will be check
      -- RESULT
      -- True if color map of the Window is full, otherwise False
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Check color map of the My_Button widget
      -- Is_Full: constant Tcl_Boolean_Result := Color_Map_Full(My_Button);
      -- COMMANDS
      -- winfo colormapfull Window
      -- SOURCE
   function Color_Map_Full(Window: Tk_Widget) return Tcl_Boolean_Result is
     (Tcl_Eval
        (Tcl_Script => "winfo colormapfull " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget
      and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 19,
      Test_Case => (Name => "Test_Winfo_Color_Map_Full", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Containing
      -- FUNCTION
      -- Get the Tk widget which contains the selected point on the screen
      -- PARAMETERS
      -- Root_Window_X - The X coordinate of the point in the root window to check
      -- Root_Window_Y - The Y coordinate of the point in the root window to check
      -- Window        - If set, the widget will be looked up at the display of
      --                 the selected window. Can be empty. Default value is
      --                 empty.
      -- Interpreter   - The Tcl interpreter on which the selected point will
      --                 be checked. Can be empty. Default value is the current
      --                 interpreter.
      -- RESULT
      -- Tk_Widget which contains the selected point
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the Tk widget at point (0, 0) on the default Tcl interpreter
      -- My_Widget: Tk_Widget := Containing((0.0, PIXEL), (0.0, PIXEL));
      -- COMMANDS
      -- winfo containing ?-displayof Window? Root_Window_X Root_Window_Y
      -- SOURCE
   function Containing
     (Root_Window_X, Root_Window_Y: Pixel_Data;
      Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Widget with
      Pre => Root_Window_X /= Empty_Pixel_Data and
      Root_Window_Y /= Empty_Pixel_Data,
      Test_Case => (Name => "Test_Winfo_Containing", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Colors_Depth
      -- FUNCTION
      -- Get the color depth of the selecte Tk widget
      -- PARAMETERS
      -- Window -  Tk Widget which color depth will be get
      -- RESULT
      -- The amount of bits per pixel used to store the color data
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the color depth of the widget My_Label
      -- Depth: constant Positive := Colors_Depth(My_Label);
      -- SEE ALSO
      -- Winfo.Screen_Depth
      -- COMMANDS
      -- winfo depth Window
      -- SOURCE
   function Colors_Depth(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Depth", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Exists
      -- FUNCTION
      -- Check if the selected widget exists
      -- PARAMETERS
      -- Name        - The name of the widget to check
      -- Interpreter - Tcl interpreter on which the check will be done. Can be
      --               empty. Default value is the current Tcl interpreter.
      -- RESULT
      -- True if Tk widget with the selected path name exists. Otherwise False
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Check if widget .mybutton exists in the default Tcl interpreter
      -- Is_Existing: constant Tcl_Boolean_Result := Exists(".mybutton");
      -- COMMANDS
      -- winfo exists Window
      -- SOURCE
   function Exists
     (Name: Tk_Path_String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tcl_Boolean_Result is
     (Tcl_Eval
        (Tcl_Script => "winfo exists " & Name,
         Interpreter => Interpreter)) with
      Pre => Name'Length > 0 and Name'Length < Integer'Last - 13 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Winfo_Exists", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Floating_Point_Pixels
      -- FUNCTION
      -- Get the numbers of pixels for the selected distance in the selected
      -- Tk Widget
      -- PARAMETERS
      -- Window - The Tk widget in which the distance will be counted
      -- Number - The end value for the distance to count
      -- RESULT
      -- The Float value of pixels in the selected distance
      -- EXAMPLE
      -- -- Get the distance to point 2 inch in the Tk widget My_Button
      -- Distance: constant Float := Floating_Point_Pixels(My_Button, (2, I));
      -- SEE ALSO
      -- Winfo.Point_Pixels
      -- COMMANDS
      -- winfo fpixels Window Number
      -- SOURCE
   function Floating_Point_Pixels
     (Window: Tk_Widget; Number: Pixel_Data) return Float with
      Pre => Window /= Null_Widget and Number /= Empty_Pixel_Data,
      Test_Case => (Name => "Test_Winfo_Floating_Point_Pixels",
       Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Geometry
      -- FUNCTION
      -- Get the current geometry of the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which geometry will be get
      -- RESULT
      -- Window_Geometry record with the current geometry of the Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the geometry of the Tk widget My_Label
      -- Widget_Geometry: constant Window_Geometry := Geometry(My_Label);
      -- COMMANDS
      -- winfo geometry Window
      -- SOURCE
   function Geometry(Window: Tk_Widget) return Window_Geometry with
      Pre => Window /= Null_Widget,
      Post => Geometry'Result /= Empty_Window_Geometry,
      Test_Case => (Name => "Test_Winfo_Geometry", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Height
      -- FUNCTION
      -- Get the current height of the selected Tk_Widget
      -- PARAMETERS
      -- Window -  Tk_Widget which height will be get
      -- RESULT
      -- Height of the selected Window in pixels
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the height of the Tk widget My_Button
      -- Widget_Height: constant Positive := Height(My_Button);
      -- SEE ALSO
      -- Winfo.Width
      -- COMMANDS
      -- winfo height Window
      -- SOURCE
   function Height(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Height", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Id
      -- FUNCTION
      -- Get the low level platform-specific identifier for the selected
      -- Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which identifier will be get
      -- RESULT
      -- The identifer of the selected Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the identifier of the Tk widget My_Frame
      -- Widget_Id: constant Positive := Id(My_Frame);
      -- COMMANDS
      -- winfo id Window
      -- SOURCE
   function Id(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Id", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Interpreters
      -- FUNCTION
      -- Get the names of the Tcl interpreters currently registered for the
      -- selected display.
      -- PARAMETERS
      -- Window      - If specified, the interpreters will be get for the
      --               display on which the selected Tk_Widget is. Can be
      --               empty. Default value is empty.
      -- Interpreter - The Tcl interpreter on which the selected display is.
      --               Can be empty. Default value is the current Tcl
      --               intepreter
      -- RESULT
      -- The Array_List with names of all registered Tcl interpreters for the
      -- selected display
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get Tcl interpreters for the Tk main window
      -- Interpreters_Names: constant Array_List := Interpreters(Get_Main_Window);
      -- COMMANDS
      -- winfo interpreters ?-displayof Window?
      -- SOURCE
   function Interpreters
     (Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List with
      Test_Case => (Name => "Test_Winfo_Interpreters", Mode => Robustness);
      -- ****

      -- ****f* Winfo/Winfo.Is_Mapped
      -- FUNCTION
      -- Check if the selected Tk_Widget is mapped (visible) or not
      -- PARAMETERS
      -- Window - Tk_Widget to check its visibility
      -- RESULT
      -- True if the Window is visible, otherwise False.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Check if Tk_Widget My_Label is visible
      -- Is_Visible: constant Tcl_Boolean_Result := Is_Mapped(My_Label);
      -- COMMANDS
      -- winfo ismapped Window
      -- SOURCE
   function Is_Mapped(Window: Tk_Widget) return Tcl_Boolean_Result is
     (Tcl_Eval
        (Tcl_Script => "winfo ismapped " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget
      and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 15,
      Test_Case => (Name => "Test_Winfo_Is_Mapped", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Manager
      -- FUNCTION
      -- Get the name of the geometry manager which is responsible for the
      -- Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which geometry manager will be get
      -- RESULT
      -- The name of the Tcl command like "pack" or "grid" or the name of
      -- Tcl widget if managed by like "canvas" or "text".
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the geometry manager for the Tk widget My_Label
      -- Geometry_Manager: constant String := Manager(My_Label);
      -- COMMANDS
      -- winfo manager Window
      -- SOURCE
   function Manager(Window: Tk_Widget) return String with
      Pre => Window /= Null_Widget,
      Post => Manager'Result'Length > 0,
      Test_Case => (Name => "Test_Winfo_Manager", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Name
      -- FUNCTION
      -- Get the name, inside the Tk_Widget full path name
      -- PARAMETERS
      -- Window - Tk_Widget which name will be get
      -- RESULT
      -- The name of the selected Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the name of the Tk widget My_Button
      -- Widget_Name: constant String := Name(My_Button);
      -- COMMANDS
      -- winfo name Window
      -- SOURCE
   function Name(Window: Tk_Widget) return String with
      Pre => Window /= Null_Widget,
      Post => Name'Result'Length > 0,
      Test_Case => (Name => "Test_Winfo_Name", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Parent
      -- FUNCTION
      -- Get the full path name for the parent of the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which the parent's path name will be get
      -- RESULT
      -- The full path name of the parent of the selected Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the parent path name of the Tk widget My_Frame
      -- Parent_Path: constant String := Parent(My_Frame);
      -- COMMANDS
      -- winfo parent Window
      -- SOURCE
   function Parent(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "winfo parent " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))
        .Result) with
      Pre => Window /= Null_Widget
      and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 13,
      Test_Case => (Name => "Test_Winfo_Parent", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Path_Name
      -- FUNCTION
      -- Get the full path name of the selected Tk_Widget
      -- PARAMETERS
      -- Window_Id   - The low level id of the Tk widget which the path name
      --               will be get
      -- Window      - The Tk_Widget on which display the path name will be
      --               looked for. Can be empty. Default value is empty.
      -- Interpreter - The Tcl interpreter on which the path name will be get.
      --               Can be empty. Default value is the current Tcl
      --               interpreter.
      -- RESULT
      -- The full path name of the selected Tk_Widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the path name of the Tk_Widget with id 2321 on the default Tcl interpreter
      -- Widget_Path_Name: constant String := Path_Name(2321);
      -- COMMANDS
      -- winfo pathname ?-displayof Window? Id
      -- SOURCE
   function Path_Name
     (Window_Id: Positive; Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return String with
      Test_Case => (Name => "Test_Winfo_Path_Name", Mode => Robustness);
      -- ****

      -- ****f* Winfo/Winfo.Pixels
      -- FUNCTION
      -- Get the numbers of pixels for the selected distance in the selected
      -- Tk Widget
      -- PARAMETERS
      -- Window - The Tk widget in which the distance will be counted
      -- Number - The end value for the distance to count
      -- RESULT
      -- The Integer value of pixels in the selected distance
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the distance to point 2 inch in the Tk widget My_Button
      -- Distance: constant Integer := Pixels(My_Button, (2, I));
      -- SEE ALSO
      -- Winfo.Floating_Point_Pixels
      -- COMMANDS
      -- winfo pixels Window Number
      -- SOURCE
   function Pixels(Window: Tk_Widget; Number: Pixel_Data) return Integer with
      Pre => Window /= Null_Widget and Number /= Empty_Pixel_Data,
      Test_Case => (Name => "Test_Winfo_Pixels", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Pointer_X
      -- FUNCTION
      -- Get the X coordinate of the mouse in the Tk_Widget
      -- PARAMETERS
      -- Window - The Tk widget in which the mouse position will be check
      -- RESULT
      -- The mouse X coordinate in the selected Window or -1 if the mouse is
      -- outside the window or on different display
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the X coordinate for the mouse in My_Label widget
      -- X_Position: constant Extended_Natural := Pointer_X(My_Label);
      -- SEE ALSO
      -- Winfo.Pointer_Y, Winfo.Pointer_X_Y
      -- COMMANDS
      -- winfo pointerx Window
      -- SOURCE
   function Pointer_X(Window: Tk_Widget) return Extended_Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Pointer_X", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Pointer_X_Y
      -- FUNCTION
      -- Get the X and Y coordinates of the mouse in the Tk_Widget
      -- PARAMETERS
      -- Window - The Tk widget in which the mouse position will be check
      -- RESULT
      -- The mouse X and Y coordinates in the selected Window or
      -- Empty_Point_Position if the mouse is outside the window or on
      -- different display
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the X and Y coordinates for the mouse in My_Label widget
      -- Mouse_Position: constant Point_Position := Pointer_X_Y(My_Label);
      -- SEE ALSO
      -- Winfo.Pointer_Y, Winfo.Pointer_X
      -- COMMANDS
      -- winfo pointerxy Window
      -- SOURCE
   function Pointer_X_Y(Window: Tk_Widget) return Point_Position with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Pointer_X_Y", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Pointer_Y
      -- FUNCTION
      -- Get the Y coordinate of the mouse in the Tk_Widget
      -- PARAMETERS
      -- Window - The Tk widget in which the mouse position will be check
      -- RESULT
      -- The mouse Y coordinate in the selected Window or -1 if the mouse is
      -- outside the window or on different display
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the Y coordinate for the mouse in My_Label widget
      -- Y_Position: constant Extended_Natural := Pointer_Y(My_Label);
      -- SEE ALSO
      -- Winfo.Pointer_X, Winfo.Pointer_X_Y
      -- COMMANDS
      -- winfo pointery Window
      -- SOURCE
   function Pointer_Y(Window: Tk_Widget) return Extended_Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Pointer_Y", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Requested_Height
      -- FUNCTION
      -- Get the requested height of the Tk_Widget in pixels.
      -- PARAMETERS
      -- Window - The Tk widget which requested height will be get
      -- RESULT
      -- The requested height of the selected Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the requested height of the widget My_Button
      -- Req_Height: constant Natural := Requested_Height(My_Button);
      -- SEE ALSO
      -- Winfo.Requested_Width
      -- COMMANDS
      -- winfo reqheight Window
      -- SOURCE
   function Requested_Height(Window: Tk_Widget) return Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Requested_Height", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Requested_Width
      -- FUNCTION
      -- Get the requested width of the Tk_Widget in pixels.
      -- PARAMETERS
      -- Window - The Tk widget which requested width will be get
      -- RESULT
      -- The requested width of the selected Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the requested width of the widget My_Button
      -- Req_Width: constant Natural := Requested_Width(My_Button);
      -- SEE ALSO
      -- Winfo.Requested_Height
      -- COMMANDS
      -- winfo reqwidth Window
      -- SOURCE
   function Requested_Width(Window: Tk_Widget) return Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Requested_Width", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Rgb
      -- FUNCTION
      -- Get the RGB values of the selected color in the selected Tk_Widget
      -- PARAMETERS
      -- Color_Name - The name of the color to check
      -- Window     - The Tk widget in which the color will be checked. Can
      --              be empty. Default value is the main window of the
      --              application.
      -- RESULT
      -- Color_Type record with RGB values for the selected color
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the RGB values for color red in Tk widget My_Frame
      -- Red_Rgb: constant Color_Type := Rgb(RED, My_Frame);
      -- COMMANDS
      -- winfo rgb Window Name
      -- SOURCE
   function Rgb
     (Color_Name: Colors_Names; Window: Tk_Widget := Get_Main_Window)
      return Color_Type with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Rgb", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Root_X
      -- FUNCTION
      -- Get the X coordinate of the top-left corner of the Tk_Widget on the
      -- screen
      -- PARAMETERS
      -- Window - The Tk widget which X position will be get
      -- RESULT
      -- The X coordinate of the top-left corner of Window on the screen
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the X position of the Tk main window on the screen
      -- X_Position: constant Extended_Natural := Root_X(Get_Main_Window);
      -- SEE ALSO
      -- Winfo.Root_Y;
      -- COMMANDS
      -- winfo rootx Window
      -- SOURCE
   function Root_X(Window: Tk_Widget) return Extended_Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Root_X", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Root_Y
      -- FUNCTION
      -- Get the Y coordinate of the top-left corner of the Tk_Widget on the
      -- screen
      -- PARAMETERS
      -- Window - The Tk widget which Y position will be get
      -- RESULT
      -- The Y coordinate of the top-left corner of Window on the screen
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the Y position of the Tk main window on the screen
      -- Y_Position: constant Extended_Natural := Root_Y(Get_Main_Window);
      -- SEE ALSO
      -- Winfo.Root_X;
      -- COMMANDS
      -- winfo rooty Window
      -- SOURCE
   function Root_Y(Window: Tk_Widget) return Extended_Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Root_Y", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Screen
      -- FUNCTION
      -- Get the name of the screen associated with the selected Tk_Widget
      -- PARAMETERS
      -- Window - The Tk widget which screen name will be get
      -- RESULT
      -- The name of the screen associated with the Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the name of the screen associated with Tk widget My_Button
      -- Screen_Name: constant String := Screen(My_Button);
      -- COMMANDS
      -- winfo screen Window
      -- SOURCE
   function Screen(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "winfo screen " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))
        .Result) with
      Pre => Window /= Null_Widget
      and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 13,
      Test_Case => (Name => "Test_Winfo_Screen", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Screen_Cells
      -- FUNCTION
      -- Get the amount of cells in the color map of the screen for the
      -- selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk widget which screen's amount of cell will be get
      -- RESULT
      -- The amount of cells in the color map of the screen for the selected
      -- Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the amount of cells of the screen for Tk widget My_Button
      -- Cell_Amount: constant Positive := Screen_Cells(My_Button);
      -- SEE ALSO
      -- Winfo.Cells
      -- COMMANDS
      -- winfo screencells Window
      -- SOURCE
   function Screen_Cells(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Screen_Cells", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Screen_Depth
      -- FUNCTION
      -- Get the color depth of the root window of the selected Tk_Widget
      -- PARAMETERS
      -- Window -  Tk Widget which root window color depth will be get
      -- RESULT
      -- The amount of bits per pixel used to store the color data in the
      -- root window of the selected Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the color depth of the root window of widget My_Label
      -- Depth: constant Positive := Screen_Depth(My_Label);
      -- SEE ALSO
      -- Winfo.Colors_Depth
      -- COMMANDS
      -- winfo screendepth Window
      -- SOURCE
   function Screen_Depth(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Screen_Depth", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Screen_Height
      -- FUNCTION
      -- Get the screen height in pixels for the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which screen height will be get
      -- RESULT
      -- The height of the screen as amount of pixels
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the screen height of the widget My_Button
      -- Height: constant Positive := Screen_Height(My_Button);
      -- SEE ALSO
      -- Winfo.Screen_Width, Winfo.Screen_Milimeters_Height,
      -- Winfo.Screen_Milimeters_Width
      -- COMMANDS
      -- winfo screenheight Window
      -- SOURCE
   function Screen_Height(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Screen_Height", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Screen_Milimeters_Height
      -- FUNCTION
      -- Get the screen height in milimeters for the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which screen height will be get
      -- RESULT
      -- The height of the screen as amount of milimeters
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the screen height of the widget My_Button
      -- Height: constant Positive := Screen_Milimeters_Height(My_Button);
      -- SEE ALSO
      -- Winfo.Screen_Width, Winfo.Screen_Height,
      -- Winfo.Screen_Milimeters_Width
      -- COMMANDS
      -- winfo screenmmheight Window
      -- SOURCE
   function Screen_Milimeters_Height(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Screen_Milimeters_Height",
       Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Screen_Milimeters_Width
      -- FUNCTION
      -- Get the screen width in milimeters for the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which screen width will be get
      -- RESULT
      -- The width of the screen as amount of milimeters
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the screen width of the widget My_Button
      -- Width: constant Positive := Screen_Milimeters_Width(My_Button);
      -- SEE ALSO
      -- Winfo.Screen_Width, Winfo.Screen_Milimeters_Height,
      -- Winfo.Screen_Height
      -- COMMANDS
      -- winfo screenmmwidth Window
      -- SOURCE
   function Screen_Milimeters_Width(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Screen_Milimeters_Width",
       Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Screen_Visual
      -- FUNCTION
      -- Get the default visual class for the selected Tk_Widget screen
      -- PARAMETERS
      -- Window - The Tk_Widget which screen's visual class will be get
      -- RESULT
      -- The screen's visual class for the selected Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the visual class of the screen for the Tk main window
      -- Visual_Name: constant Screen_Visual_Type := Screen_Visual(Get_Main_Window);
      -- Visual_Name: constant Screen_Visual_Type := Visual(Get_Main_Window);
      -- SEE ALSO
      -- Winfo.Visual_Id, Winfo.Visuals_Available
      -- COMMANDS
      -- winfo screenvisual Window
      -- winfo visual Window
      -- SOURCE
   function Screen_Visual(Window: Tk_Widget) return Screen_Visual_Type with
      Pre =>
      (Window /= Null_Widget
       and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 19) and
      Get_Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Winfo_Screen_Visual", Mode => Nominal);
   function Visual(Window: Tk_Widget) return Screen_Visual_Type renames
     Screen_Visual;
     -- ****

      -- ****f* Winfo/Winfo.Screen_Width
      -- FUNCTION
      -- Get the screen width in pixels for the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which screen width will be get
      -- RESULT
      -- The width of the screen as amount of pixels
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the screen width of the widget My_Button
      -- Width: constant Positive := Screen_Width(My_Button);
      -- SEE ALSO
      -- Winfo.Screen_Height, Winfo.Screen_Milimeters_Height,
      -- Winfo.Screen_Milimeters_Width
      -- COMMANDS
      -- winfo screenwidth Window
      -- SOURCE
   function Screen_Width(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Screen_Width", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Server
      -- FUNCTION
      -- Get the information about the server for Tk_Widget's display
      -- PARAMETERS
      -- Window - Tk_Widget which server info will be get
      -- RESULT
      -- The information about the Window's display server
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the information about Tk widget My_Frame display
      -- Server_Info: constant String := Server(My_Frame);
      -- COMMANDS
      -- winfo server Window
      -- SOURCE
   function Server(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "winfo server " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))
        .Result) with
      Pre => Window /= Null_Widget
      and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 13,
      Test_Case => (Name => "Test_Winfo_Server", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Toplevel
      -- FUNCTION
      -- Get the path name of the toplevel widget of the selected Tk widget
      -- PARAMETERS
      -- Window - Tk_Widget which toplevel window will be get
      -- RESULT
      -- The path name of the toplevel Tk widget for the selected Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the toplevel path name for Tk widget My_Button
      -- TopLevel_Name: constant String := Toplevel(My_Button);
      -- COMMANDS
      -- winfo toplevel Window
      -- SOURCE
   function Toplevel(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "winfo toplevel " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))
        .Result) with
      Pre => Window /= Null_Widget
      and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 15,
      Test_Case => (Name => "Test_Winfo_Toplevel", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Viewable
      -- FUNCTION
      -- Check if the Tk widget and its ancestors are mapped or not
      -- PARAMETERS
      -- Window - Tk_Widget which mapped state will be check
      -- RESULT
      -- True if the Window is mapped, otherwise False
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the mapped state of the Tk widget My_Label
      -- Is_Mapped: constant Tcl_Boolean_Result := Viewable(My_Label);
      -- COMMANDS
      -- winfo viewable Window
      -- SOURCE
   function Viewable(Window: Tk_Widget) return Tcl_Boolean_Result is
     (Tcl_Eval
        (Tcl_Script => "winfo viewable " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget
      and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 15,
      Test_Case => (Name => "Test_Winfo_Viewable", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Visual_Id
      -- FUNCTION
      -- Get the identifier of visual for the selected Tk widget
      -- PARAMETERS
      -- Window - Tk_Widget which visual identifier will be get
      -- RESULT
      -- Numerical identifier of visual of the selected Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the visual identifier of the Tk widget My_Button
      -- Id: constant Positive := Visual_Id(My_Button);
      -- COMMANDS
      -- winfo visualid Window
      -- SOURCE
   function Visual_Id(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Visual_Id", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Visuals_Available
      -- FUNCTION
      -- Get the all available visuals modes for the selected Tk widget's
      -- screen
      -- PARAMETERS
      -- Window      - Tk_Widget which screen visuals modes will be get
      -- Include_Ids - If True, append the visuals' ids to the result. Can
      --               be empty. Default value is False
      -- RESULT
      -- The Visuals_List with information about the available visual modes
      -- on the selected Window's screen
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the visuals without ids for the Tk main window screen
      -- Visuals: constant Visuals_List := Visuals_Available(Get_Main_Window);
      -- COMMANDS
      -- winfo visualsavailable Window ?Include_Ids?
      -- SOURCE
   function Visuals_Available
     (Window: Tk_Widget; Include_Ids: Boolean := False)
      return Visuals_List with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Visuals_Available", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Virtual_Root_Height
      -- FUNCTION
      -- Get the height of virtual root window associated with the selected Tk
      -- widget
      -- PARAMETERS
      -- Window - Tk_Widget which virtual root window height will be get
      -- RESULT
      -- The virtual root window height of the selected Window or screen height
      -- if there is no virtual root window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the virtual root window height for Tk widget My_Label
      -- Virtual_Height: constant Positive := Virtual_Root_Height(My_Label);
      -- SEE ALSO
      -- Winfo.Virtual_Root_Width, Winfo.Virtual_Root_X, Winfo.Virtual_Root_Y
      -- COMMANDS
      -- winfo vrootheight Window
      -- SOURCE
   function Virtual_Root_Height(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Virtual_Root_Height", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Virtual_Root_Width
      -- FUNCTION
      -- Get the width of virtual root window associated with the selected Tk
      -- widget
      -- PARAMETERS
      -- Window - Tk_Widget which virtual root window width will be get
      -- RESULT
      -- The virtual root window width of the selected Window or screen width
      -- if there is no virtual root window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the virtual root window width for Tk widget My_Label
      -- Virtual_Width: constant Positive := Virtual_Root_Width(My_Label);
      -- SEE ALSO
      -- Winfo.Virtual_Root_Height, Winfo.Virtual_Root_X, Winfo.Virtual_Root_Y
      -- COMMANDS
      -- winfo vrootwidth Window
      -- SOURCE
   function Virtual_Root_Width(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Virtual_Root_Width", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Virtual_Root_X
      -- FUNCTION
      -- Get the X-offset of the virtual root window associated with the Tk
      -- widget.
      -- PARAMETERS
      -- Window - Tk_Widget which X-offset will be get
      -- RESULT
      -- Usually 0 or negative value. If there is no virtual root window then
      -- 0.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the X-offset of virtual root window for Tk widget My_Label
      -- Virtual_X: constant Integer := Virtual_Root_X(My_Label);
      -- SEE ALSO
      -- Winfo.Virtual_Root_Height, Winfo.Virtual_Root_Y,
      -- Winfo.Virtual_Root_Width
      -- COMMANDS
      -- winfo vrootx Window
      -- SOURCE
   function Virtual_Root_X(Window: Tk_Widget) return Integer with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Virtual_Root_X", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Virtual_Root_Y
      -- FUNCTION
      -- Get the Y-offset of the virtual root window associated with the Tk
      -- widget.
      -- PARAMETERS
      -- Window - Tk_Widget which Y-offset will be get
      -- RESULT
      -- Usually 0 or negative value. If there is no virtual root window then
      -- 0.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the Y-offset of virtual root window for Tk widget My_Label
      -- Virtual_Y: constant Integer := Virtual_Root_Y(My_Label);
      -- SEE ALSO
      -- Winfo.Virtual_Root_Height, Winfo.Virtual_Root_X,
      -- Winfo.Virtual_Root_Width
      -- COMMANDS
      -- winfo vrooty Window
      -- SOURCE
   function Virtual_Root_Y(Window: Tk_Widget) return Integer with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Virtual_Root_Y", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Width
      -- FUNCTION
      -- Get the current width of the selected Tk_Widget
      -- PARAMETERS
      -- Window -  Tk_Widget which width will be get
      -- RESULT
      -- Width of the selected Window in pixels
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the width of the Tk widget My_Button
      -- Widget_Width: constant Positive := Width(My_Button);
      -- SEE ALSO
      -- Winfo.Height
      -- COMMANDS
      -- winfo width Window
      -- SOURCE
   function Width(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Width", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.X
      -- FUNCTION
      -- Get the X coordinate of the top left corner of the selected Tk widget
      -- PARAMETERS
      -- Window - Tk_Widget which X coordinate of top left corner will be get
      -- RESULT
      -- The X coordinate of top left corner of the selected Window in the
      -- parent widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the X coordinate of Tk widget My_Label
      -- X_Position: constant Natural := X(My_Label);
      -- SEE ALSO
      -- Winfo.Y
      -- COMMANDS
      -- winfo x Window
      -- SOURCE
   function X(Window: Tk_Widget) return Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_X", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Y
      -- FUNCTION
      -- Get the Y coordinate of the top left corner of the selected Tk widget
      -- PARAMETERS
      -- Window - Tk_Widget which Y coordinate of top left corner will be get
      -- RESULT
      -- The Y coordinate of top left corner of the selected Window in the
      -- parent widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the Y coordinate of Tk widget My_Label
      -- Y_Position: constant Natural := Y(My_Label);
      -- SEE ALSO
      -- Winfo.X
      -- COMMANDS
      -- winfo y Window
      -- SOURCE
   function Y(Window: Tk_Widget) return Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Y", Mode => Nominal);
      -- ****
      --## rule on REDUCEABLE_SCOPE

end Tk.Winfo;
