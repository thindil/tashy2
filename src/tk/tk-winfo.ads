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
   -- ****t* Winfo/Winfo.Color_Range
   -- FUNCTION
   -- Type used to get the colors values
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Color_Range is new Integer range -1 .. 65_535 with
      Default_Value => 0;
   -- ****

      -- ****d* Winfo/Winfo.Default_Color_Value
      -- FUNCTION
      -- Default value for the amount of the selected color
      -- SOURCE
   Default_Color_Value: constant Color_Range := 0;
   -- ****

   -- ****s* Winfo/Color_Type
   -- FUNCTION
   -- Data structure for setting the colors values
   -- OPTIONS
   -- Red   - The amount of red color
   -- Green - The amount of green color
   -- Blue  - The amount of blue color
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Color_Type is record
      Red: Color_Range;
      Green: Color_Range;
      Blue: Color_Range;
   end record;
   -- ****

   -- ****d* Winfo/Winfo.Empty_Color
   -- FUNCTION
   -- Empty color value
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Color: constant Color_Type := (Red => -1, Green => -1, Blue => -1);
   -- ****

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
   Empty_Visual_List: constant Visuals_List(1 .. 0) := (others => <>);
   -- ****

   -- ****f* Winfo/Winfo.Atom
   -- FUNCTION
   -- Get the identifier of the atom with the selected name. If no atom exists
   -- with that name, create a new.
   -- PARAMETERS
   -- Name        - The name of the atom which Id will be get
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
   -- winfo atom ?-displayof Window? Name
   -- SOURCE
   function Atom
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return Positive with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Winfo_Atom", Mode => Nominal);
      -- ****

      -- ****f* Winfo/Winfo.Atom_Name
      -- FUNCTION
      -- Get the name of the selected atom.
      -- PARAMETERS
      -- Id          - The id of the atom which name will be get
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
      -- winfo atomname ?-displayof Window? Id
      -- SOURCE
   function Atom_Name
     (Id: Positive; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return String with
      Test_Case => (Name => "Test_Winfo_Atom_Name", Mode => Robustness);
      -- ****

   function Cells(Window: Tk_Widget) return Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Cells", Mode => Nominal);

   function Children(Window: Tk_Widget) return Widgets_Array with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Children", Mode => Nominal);

   function Class(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "winfo class " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Class", Mode => Nominal);

   function Color_Map_Full(Window: Tk_Widget) return Boolean is
     (Tcl_Eval
        (Tcl_Script => "winfo colormapfull " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Color_Map_Full", Mode => Nominal);

   function Containing
     (Root_X, Root_Y: Natural; Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Widget with
      Test_Case => (Name => "Test_Winfo_Containing", Mode => Robustness);

   function Colors_Depth(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Depth", Mode => Nominal);

   function Exists
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean is
     (Tcl_Eval
        (Tcl_Script => "winfo exists " & Name,
         Interpreter => Interpreter)) with
      Pre => Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Winfo_Exists", Mode => Nominal);

   function Floating_Point_Pixels
     (Window: Tk_Widget; Number: Pixel_Data) return Float with
      Pre => Window /= Null_Widget and Number /= Empty_Pixel_Data,
      Test_Case => (Name => "Test_Winfo_Floating_Point_Pixels",
       Mode => Nominal);

   function Geometry(Window: Tk_Widget) return Window_Geometry with
      Pre => Window /= Null_Widget,
      Post => Geometry'Result /= Empty_Window_Geometry,
      Test_Case => (Name => "Test_Winfo_Geometry", Mode => Nominal);

   function Height(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Height", Mode => Nominal);

   function Id(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Id", Mode => Nominal);

   function Interpreters
     (Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List with
      Test_Case => (Name => "Test_Winfo_Interpreters", Mode => Robustness);

   function Is_Mapped(Window: Tk_Widget) return Boolean is
     (Tcl_Eval
        (Tcl_Script => "winfo ismapped " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Is_Mapped", Mode => Nominal);

   function Manager(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "winfo manager " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Post => Manager'Result'Length > 0,
      Test_Case => (Name => "Test_Winfo_Manager", Mode => Nominal);

   function Name(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "winfo name " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Post => Name'Result'Length > 0,
      Test_Case => (Name => "Test_Winfo_Name", Mode => Nominal);

   function Parent(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "winfo parent " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Parent", Mode => Nominal);

   function Path_Name
     (Id: Positive; Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return String with
      Test_Case => (Name => "Test_Winfo_Path_Name", Mode => Robustness);

   function Pixels(Window: Tk_Widget; Number: Pixel_Data) return Integer with
      Pre => Window /= Null_Widget and Number /= Empty_Pixel_Data,
      Test_Case => (Name => "Test_Winfo_Pixels", Mode => Nominal);

   function Pointer_X(Window: Tk_Widget) return Extended_Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Pointer_X", Mode => Nominal);

   function Pointer_X_Y(Window: Tk_Widget) return Point_Position with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Pointer_X_Y", Mode => Nominal);

   function Pointer_Y(Window: Tk_Widget) return Extended_Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Pointer_Y", Mode => Nominal);

   function Requested_Height(Window: Tk_Widget) return Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Requested_Height", Mode => Nominal);

   function Requested_Width(Window: Tk_Widget) return Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Requested_Width", Mode => Nominal);

   function Rgb(Window: Tk_Widget; Name: String) return Color_Type with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Winfo_Rgb", Mode => Nominal);

   function Root_X(Window: Tk_Widget) return Extended_Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Root_X", Mode => Nominal);

   function Root_Y(Window: Tk_Widget) return Extended_Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Root_Y", Mode => Nominal);

   function Screen(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "winfo screen " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Screen", Mode => Nominal);

   function Screen_Cells(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Screen_Cells", Mode => Nominal);

   function Screen_Depth(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Screen_Depth", Mode => Nominal);

   function Screen_Height(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Screen_Height", Mode => Nominal);

   function Screen_Milimeters_Height(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Screen_Milimeters_Height",
       Mode => Nominal);

   function Screen_Milimeters_Width(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Screen_Milimeters_Width",
       Mode => Nominal);

   function Screen_Visual(Window: Tk_Widget) return Screen_Visual_Type is
     (Screen_Visual_Type'Value
        (Tcl_Eval
           (Tcl_Script =>
              "winfo screenvisual " & Tk_Path_Name(Widgt => Window),
            Interpreter => Tk_Interp(Widgt => Window)))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Screen_Visual", Mode => Nominal);
   function Visual(Window: Tk_Widget) return Screen_Visual_Type renames
     Screen_Visual;

   function Screen_Width(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Screen_Width", Mode => Nominal);

   function Server(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "winfo server " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Server", Mode => Nominal);

   function Toplevel(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "winfo toplevel " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Toplevel", Mode => Nominal);

   function Viewable(Window: Tk_Widget) return Boolean is
     (Tcl_Eval
        (Tcl_Script => "winfo viewable " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Viewable", Mode => Nominal);

   function Visual_Id(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Visual_Id", Mode => Nominal);

   function Visuals_Available
     (Window: Tk_Widget; Include_Ids: Boolean := False)
      return Visuals_List with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Visuals_Available", Mode => Nominal);

   function Virtual_Root_Height(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Virtual_Root_Height", Mode => Nominal);

   function Virtual_Root_Width(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Virtual_Root_Width", Mode => Nominal);

   function Virtual_Root_X(Window: Tk_Widget) return Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Virtual_Root_X", Mode => Nominal);

   function Virtual_Root_Y(Window: Tk_Widget) return Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Virtual_Root_Y", Mode => Nominal);

   function Width(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Width", Mode => Nominal);

   function X(Window: Tk_Widget) return Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_X", Mode => Nominal);

   function Y(Window: Tk_Widget) return Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Y", Mode => Nominal);
   --## rule on REDUCEABLE_SCOPE
end Tk.Winfo;
