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
   -- Used to get Natural result from the selected Tcl command
   -- PARAMETERS
   -- Tcl_Script  - Tcl comamnd to evaluate
   -- Interpreter - Tcl interpreter from which result will be get
   -- RESULT
   -- Natural value for the last Tcl command
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Eval_Script is new Generic_Scalar_Tcl_Eval(Result_Type => Natural);
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

end Tk.Winfo;
