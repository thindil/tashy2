-- Copyright (c) 2021 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Tcl.Strings; use Tcl.Strings;

package body Tk.Winfo is

   -- ****if* Winfo/Winfo.Eval_Script
   -- FUNCTION
   -- Used to get Integer result from the selected Tcl command
   -- PARAMETERS
   -- Tcl_Script  - Tcl comamnd to evaluate
   -- Interpreter - Tcl interpreter from which result will be get
   -- RESULT
   -- Integer value for the last Tcl command
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Eval_Script is new Generic_Scalar_Tcl_Eval(Result_Type => Integer);
   -- ****

   -- ****if* Winfo/Winfo.Float_Eval_Script
   -- FUNCTION
   -- Used to get Float result from the selected Tcl command
   -- PARAMETERS
   -- Tcl_Script  - Tcl comamnd to evaluate
   -- Interpreter - Tcl interpreter from which result will be get
   -- RESULT
   -- Float value for the last Tcl command
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Float_Eval_Script is new Generic_Float_Tcl_Eval
     (Result_Type => Float);
   -- ****

   function Atom
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return Positive is
   begin
      if Window /= Null_Widget then
         return
           Eval_Script
             (Tcl_Script =>
                "winfo atom -displayof " & Tk_Path_Name(Widgt => Window) &
                " " & Name,
              Interpreter => Tk_Interp(Widgt => Window));
      end if;
      return
        Eval_Script
          (Tcl_Script => "winfo atom " & Name, Interpreter => Interpreter);
   end Atom;

   function Atom_Name
     (Id: Positive; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return String is
   begin
      if Window /= Null_Widget then
         return
           Tcl_Eval
             (Tcl_Script =>
                "winfo atomname -displayof " & Tk_Path_Name(Widgt => Window) &
                Positive'Image(Id),
              Interpreter => Tk_Interp(Widgt => Window));
      end if;
      return
        Tcl_Eval
          (Tcl_Script => "winfo atomname" & Positive'Image(Id),
           Interpreter => Interpreter);
   end Atom_Name;

   function Cells(Window: Tk_Widget) return Natural is
   begin
      return
        Eval_Script
          (Tcl_Script => "winfo cells " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Cells;

   function Children(Window: Tk_Widget) return Widgets_Array is
      Result_List: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script =>
                  "winfo children " & Tk_Path_Name(Widgt => Window),
                Interpreter => Tk_Interp(Widgt => Window)),
           Interpreter => Tk_Interp(Widgt => Window));
   begin
      return
        Widgets: Widgets_Array(1 .. Result_List'Last) :=
          (others => Null_Widget) do
         Fill_Result_Array_Loop :
         for I in 1 .. Result_List'Last loop
            Widgets(I) :=
              Get_Widget
                (Path_Name => To_Ada_String(Source => Result_List(I)),
                 Interpreter => Tk_Interp(Widgt => Window));
         end loop Fill_Result_Array_Loop;
      end return;
   end Children;

   function Class(Window: Tk_Widget) return String is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo class " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Class;

   function Color_Map_Full(Window: Tk_Widget) return Boolean is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo colormapfull " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Color_Map_Full;

   function Containing
     (Root_X, Root_Y: Natural; Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Widget is
   begin
      return
        Get_Widget
          (Path_Name =>
             Tcl_Eval
               (Tcl_Script =>
                  "winfo containing" &
                  (if Window = Null_Widget then ""
                   else " -displayof " & Tk_Path_Name(Widgt => Window) & "") &
                  Natural'Image(Root_X) & Natural'Image(Root_Y),
                Interpreter =>
                  (if Window = Null_Widget then Interpreter
                   else Tk_Interp(Widgt => Window))),
           Interpreter =>
             (if Window = Null_Widget then Interpreter
              else Tk_Interp(Widgt => Window)));
   end Containing;

   function Colors_Depth(Window: Tk_Widget) return Positive is
   begin
      return
        Eval_Script
          (Tcl_Script => "winfo depth " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Colors_Depth;

   function Exists
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo exists " & Name, Interpreter => Interpreter);
   end Exists;

   function Floating_Point_Pixels
     (Window: Tk_Widget; Number: Pixel_Data) return Float is
   begin
      return
        Float_Eval_Script
          (Tcl_Script =>
             "winfo fpixels " & Tk_Path_Name(Widgt => Window) & " " &
             Pixel_Data_Image(Value => Number));
   end Floating_Point_Pixels;

   function Geometry(Window: Tk_Widget) return Window_Geometry is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "winfo geometry " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
      Start_Index, End_Index: Positive := 1;
   begin
      return Win_Geometry: Window_Geometry := Empty_Window_Geometry do
         End_Index := Index(Source => Result, Pattern => "x");
         Win_Geometry.Width := Natural'Value(Result(1 .. End_Index - 1));
         Start_Index := End_Index + 1;
         --## rule off ASSIGNMENTS
         End_Index :=
           Index(Source => Result, Pattern => "+", From => Start_Index);
         Win_Geometry.Height :=
           Natural'Value(Result(Start_Index .. End_Index - 1));
         Start_Index := End_Index + 1;
         End_Index :=
           Index(Source => Result, Pattern => "+", From => Start_Index);
         Win_Geometry.X := Natural'Value(Result(Start_Index .. End_Index - 1));
         Start_Index := End_Index + 1;
         --## rule on ASSIGNMENTS
         Win_Geometry.Y := Natural'Value(Result(Start_Index .. Result'Last));
      end return;
   end Geometry;

   function Height(Window: Tk_Widget) return Positive is
   begin
      return
        Eval_Script
          (Tcl_Script => "winfo height " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Height;

   function Id(Window: Tk_Widget) return Positive is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "winfo id " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   begin
      return Positive'Value("16#" & Result(3 .. Result'Last) & "#");
   end Id;

   function Interpreters
     (Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List is
   begin
      return
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script =>
                  "winfo interps " &
                  (if Window = Null_Widget then ""
                   else " -displayof " & Tk_Path_Name(Widgt => Window)),
                Interpreter =>
                  (if Window = Null_Widget then Interpreter
                   else Tk_Interp(Widgt => Window))),
           Interpreter =>
             (if Window = Null_Widget then Interpreter
              else Tk_Interp(Widgt => Window)));
   end Interpreters;

   function Is_Mapped(Window: Tk_Widget) return Boolean is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo ismapped " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Is_Mapped;

   function Manager(Window: Tk_Widget) return String is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo manager " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Manager;

   function Name(Window: Tk_Widget) return String is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo name " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Name;

   function Parent(Window: Tk_Widget) return String is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo parent " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Parent;

   function Path_Name
     (Id: Positive; Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      if Window /= Null_Widget then
         return
           Tcl_Eval
             (Tcl_Script =>
                "winfo pathname -displayof " & Tk_Path_Name(Widgt => Window) &
                Positive'Image(Id),
              Interpreter => Tk_Interp(Widgt => Window));
      end if;
      return
        Tcl_Eval
          (Tcl_Script => "winfo pathname" & Positive'Image(Id),
           Interpreter => Interpreter);
   end Path_Name;

   function Pixels(Window: Tk_Widget; Number: Pixel_Data) return Integer is
   begin
      return
        Eval_Script
          (Tcl_Script =>
             "winfo pixels " & Tk_Path_Name(Widgt => Window) & " " &
             Pixel_Data_Image(Value => Number));
   end Pixels;

   function Pointer_X(Window: Tk_Widget) return Extended_Natural is
   begin
      return
        Extended_Natural
          (Eval_Script
             (Tcl_Script =>
                "winfo pointerx " & Tk_Path_Name(Widgt => Window)));
   end Pointer_X;

   function Pointer_X_Y(Window: Tk_Widget) return Point_Position is
      Result_List: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script =>
                  "winfo pointerxy " & Tk_Path_Name(Widgt => Window),
                Interpreter => Tk_Interp(Widgt => Window)),
           Interpreter => Tk_Interp(Widgt => Window));
   begin
      return Pointer_Location: Point_Position := Empty_Point_Position do
         Pointer_Location.X :=
           Extended_Natural'Value(To_Ada_String(Result_List(1)));
         Pointer_Location.Y :=
           Extended_Natural'Value(To_Ada_String(Result_List(2)));
      end return;
   end Pointer_X_Y;

   function Pointer_Y(Window: Tk_Widget) return Extended_Natural is
   begin
      return
        Extended_Natural
          (Eval_Script
             (Tcl_Script =>
                "winfo pointery " & Tk_Path_Name(Widgt => Window)));
   end Pointer_Y;

   function Requested_Height(Window: Tk_Widget) return Natural is
   begin
      return
        Eval_Script
          (Tcl_Script => "winfo reqheight " & Tk_Path_Name(Widgt => Window));
   end Requested_Height;

   function Requested_Width(Window: Tk_Widget) return Natural is
   begin
      return
        Eval_Script
          (Tcl_Script => "winfo reqheight " & Tk_Path_Name(Widgt => Window));
   end Requested_Width;

   function Rgb(Window: Tk_Widget; Name: String) return Color_Type is
      Result_List: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script =>
                  "winfo rgb " & Tk_Path_Name(Widgt => Window) & " " & Name,
                Interpreter => Tk_Interp(Widgt => Window)),
           Interpreter => Tk_Interp(Widgt => Window));
   begin
      return Colors: Color_Type := Empty_Color do
         Colors.Red := Color_Range'Value(To_Ada_String(Result_List(1)));
         Colors.Blue := Color_Range'Value(To_Ada_String(Result_List(2)));
         Colors.Green := Color_Range'Value(To_Ada_String(Result_List(3)));
      end return;
   end Rgb;

   function Root_X(Window: Tk_Widget) return Extended_Natural is
   begin
      return
        Extended_Natural
          (Eval_Script
             (Tcl_Script => "winfo rootx " & Tk_Path_Name(Widgt => Window),
              Interpreter => Tk_Interp(Widgt => Window)));
   end Root_X;

   function Root_Y(Window: Tk_Widget) return Extended_Natural is
   begin
      return
        Extended_Natural
          (Eval_Script
             (Tcl_Script => "winfo rooty " & Tk_Path_Name(Widgt => Window),
              Interpreter => Tk_Interp(Widgt => Window)));
   end Root_Y;

   function Screen(Window: Tk_Widget) return String is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo screen " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Screen;

   function Screen_Cells(Window: Tk_Widget) return Positive is
   begin
      return
        Eval_Script
          (Tcl_Script => "winfo screencells " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Screen_Cells;

   function Screen_Depth(Window: Tk_Widget) return Positive is
   begin
      return
        Eval_Script
          (Tcl_Script => "winfo screendepth " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Screen_Depth;

   function Screen_Height(Window: Tk_Widget) return Positive is
   begin
      return
        Eval_Script
          (Tcl_Script => "winfo screenheight " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Screen_Height;

   function Screen_Milimeters_Height(Window: Tk_Widget) return Positive is
   begin
      return
        Eval_Script
          (Tcl_Script =>
             "winfo screenmmheight " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Screen_Milimeters_Height;

   function Screen_Milimeters_Width(Window: Tk_Widget) return Positive is
   begin
      return
        Eval_Script
          (Tcl_Script =>
             "winfo screenmmwidth " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Screen_Milimeters_Width;

   function Screen_Visual(Window: Tk_Widget) return Screen_Visual_Type is
   begin
      return
        Screen_Visual_Type'Value
          (Tcl_Eval
             (Tcl_Script =>
                "winfo screenvisual " & Tk_Path_Name(Widgt => Window),
              Interpreter => Tk_Interp(Widgt => Window)));
   end Screen_Visual;

   function Screen_Width(Window: Tk_Widget) return Positive is
   begin
      return
        Eval_Script
          (Tcl_Script => "winfo screenwidth " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Screen_Width;

   function Server(Window: Tk_Widget) return String is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo server " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Server;

   function Toplevel(Window: Tk_Widget) return String is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo toplevel " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Toplevel;

   function Viewable(Window: Tk_Widget) return Boolean is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo viewable " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Viewable;

   function Visual_Id(Window: Tk_Widget) return Positive is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "winfo visualid " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   begin
      return Positive'Value("16#" & Result(3 .. Result'Last) & "#");
   end Visual_Id;

end Tk.Winfo;
