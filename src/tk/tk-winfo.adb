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

with Ada.Strings.Fixed;
with Tcl.Strings; use Tcl.Strings;

package body Tk.Winfo is

   function Atom
     (A_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return Positive is
   begin
      if Window /= Null_Widget then
         return
           Tcl_Eval
             (Tcl_Script =>
                "winfo atom -displayof " & Tk_Path_Name(Widgt => Window) &
                " " & A_Name,
              Interpreter => Tk_Interp(Widgt => Window))
             .Result;
      end if;
      return
        Tcl_Eval
          (Tcl_Script => "winfo atom " & A_Name, Interpreter => Interpreter)
          .Result;
   end Atom;

   function Atom_Name
     (Atom_Id: Positive; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return String is
   begin
      if Window /= Null_Widget then
         return
           Tcl_Eval
             (Tcl_Script =>
                "winfo atomname -displayof " & Tk_Path_Name(Widgt => Window) &
                Positive'Image(Atom_Id),
              Interpreter => Tk_Interp(Widgt => Window))
             .Result;
      end if;
      return
        Tcl_Eval
          (Tcl_Script => "winfo atomname" & Positive'Image(Atom_Id),
           Interpreter => Interpreter)
          .Result;
   end Atom_Name;

   function Cells(Window: Tk_Widget) return Natural is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo cells " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Cells;

   function Children(Window: Tk_Widget) return Widgets_Array is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result_List: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script =>
                  "winfo children " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   begin
      return
        Widgets: Widgets_Array(1 .. Result_List'Last) :=
          (others => Null_Widget) do
         Fill_Result_Array_Loop :
         for I in 1 .. Result_List'Last loop
            Widgets(I) :=
              Get_Widget
                (Path_Name => To_Ada_String(Source => Result_List(I)),
                 Interpreter => Interpreter);
         end loop Fill_Result_Array_Loop;
      end return;
   end Children;

   function Containing
     (Root_Window_X, Root_Window_Y: Pixel_Data;
      Window: Tk_Widget := Null_Widget;
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
                  " " & Pixel_Data_Image(Value => Root_Window_X) & " " &
                  Pixel_Data_Image(Value => Root_Window_Y),
                Interpreter =>
                  (if Window = Null_Widget then Interpreter
                   else Tk_Interp(Widgt => Window)))
               .Result,
           Interpreter =>
             (if Window = Null_Widget then Interpreter
              else Tk_Interp(Widgt => Window)));
   end Containing;

   function Colors_Depth(Window: Tk_Widget) return Positive is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo depth " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Colors_Depth;

   function Floating_Point_Pixels
     (Window: Tk_Widget; Number: Pixel_Data) return Float is
   begin
      return
        Tcl_Eval
          (Tcl_Script =>
             "winfo fpixels " & Tk_Path_Name(Widgt => Window) & " " &
             Pixel_Data_Image(Value => Number))
          .Result;
   end Floating_Point_Pixels;

   function Geometry(Window: Tk_Widget) return Window_Geometry is
      use Ada.Strings.Fixed;

      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "winfo geometry " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
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
        Tcl_Eval
          (Tcl_Script => "winfo height " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Height;

   function Id(Window: Tk_Widget) return Positive is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "winfo id " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
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
                   else Tk_Interp(Widgt => Window)))
               .Result,
           Interpreter =>
             (if Window = Null_Widget then Interpreter
              else Tk_Interp(Widgt => Window)));
   end Interpreters;

   function Manager(Window: Tk_Widget) return String is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "winfo manager " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   begin
      if Result'Length = 0 then
         return "unknown";
      end if;
      return Result;
   end Manager;

   function Name(Window: Tk_Widget) return String is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "winfo name " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   begin
      if Result'Length = 0 then
         return "unknown";
      end if;
      return Result;
   end Name;

   function Path_Name
     (Window_Id: Positive; Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      if Window /= Null_Widget then
         return
           Tcl_Eval
             (Tcl_Script =>
                "winfo pathname -displayof " & Tk_Path_Name(Widgt => Window) &
                Positive'Image(Window_Id),
              Interpreter => Tk_Interp(Widgt => Window))
             .Result;
      end if;
      return
        Tcl_Eval
          (Tcl_Script => "winfo pathname" & Positive'Image(Window_Id),
           Interpreter => Interpreter)
          .Result;
   end Path_Name;

   function Pixels(Window: Tk_Widget; Number: Pixel_Data) return Integer is
   begin
      return
        Tcl_Eval
          (Tcl_Script =>
             "winfo pixels " & Tk_Path_Name(Widgt => Window) & " " &
             Pixel_Data_Image(Value => Number))
          .Result;
   end Pixels;

   function Pointer_X(Window: Tk_Widget) return Extended_Natural is
   begin
      return
        Extended_Natural'Value
          (Tcl_Eval
             (Tcl_Script => "winfo pointerx " & Tk_Path_Name(Widgt => Window))
             .Result);
   end Pointer_X;

   function Pointer_X_Y(Window: Tk_Widget) return Point_Position is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result_List: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script =>
                  "winfo pointerxy " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   begin
      return Pointer_Location: Point_Position := Empty_Point_Position do
         Pointer_Location.X :=
           Extended_Natural'Value(To_Ada_String(Source => Result_List(1)));
         Pointer_Location.Y :=
           Extended_Natural'Value(To_Ada_String(Source => Result_List(2)));
      end return;
   end Pointer_X_Y;

   function Pointer_Y(Window: Tk_Widget) return Extended_Natural is
   begin
      return
        Extended_Natural'Value
          (Tcl_Eval
             (Tcl_Script => "winfo pointery " & Tk_Path_Name(Widgt => Window))
             .Result);
   end Pointer_Y;

   function Requested_Height(Window: Tk_Widget) return Natural is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo reqheight " & Tk_Path_Name(Widgt => Window))
          .Result;
   end Requested_Height;

   function Requested_Width(Window: Tk_Widget) return Natural is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo reqheight " & Tk_Path_Name(Widgt => Window))
          .Result;
   end Requested_Width;

   function Rgb(Window: Tk_Widget; Color_Name: String) return Color_Type is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result_List: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script =>
                  "winfo rgb " & Tk_Path_Name(Widgt => Window) & " " &
                  Color_Name,
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   begin
      return Colors: Color_Type := Empty_Color do
         Colors.Red :=
           Color_Range'Value(To_Ada_String(Source => Result_List(1)));
         Colors.Blue :=
           Color_Range'Value(To_Ada_String(Source => Result_List(2)));
         Colors.Green :=
           Color_Range'Value(To_Ada_String(Source => Result_List(3)));
      end return;
   end Rgb;

   function Root_X(Window: Tk_Widget) return Extended_Natural is
   begin
      return
        Extended_Natural'Value
          (Tcl_Eval
             (Tcl_Script => "winfo rootx " & Tk_Path_Name(Widgt => Window),
              Interpreter => Tk_Interp(Widgt => Window))
             .Result);
   end Root_X;

   function Root_Y(Window: Tk_Widget) return Extended_Natural is
   begin
      return
        Extended_Natural'Value
          (Tcl_Eval
             (Tcl_Script => "winfo rooty " & Tk_Path_Name(Widgt => Window),
              Interpreter => Tk_Interp(Widgt => Window))
             .Result);
   end Root_Y;

   function Screen_Cells(Window: Tk_Widget) return Positive is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo screencells " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Screen_Cells;

   function Screen_Depth(Window: Tk_Widget) return Positive is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo screendepth " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Screen_Depth;

   function Screen_Height(Window: Tk_Widget) return Positive is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo screenheight " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Screen_Height;

   function Screen_Milimeters_Height(Window: Tk_Widget) return Positive is
   begin
      return
        Tcl_Eval
          (Tcl_Script =>
             "winfo screenmmheight " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Screen_Milimeters_Height;

   function Screen_Milimeters_Width(Window: Tk_Widget) return Positive is
   begin
      return
        Tcl_Eval
          (Tcl_Script =>
             "winfo screenmmwidth " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Screen_Milimeters_Width;

   function Screen_Visual(Window: Tk_Widget) return Screen_Visual_Type is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "winfo screenvisual " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   begin
      if Result'Length = 0 then
         return TRUECOLOR;
      end if;
      return Screen_Visual_Type'Value(Result);
   end Screen_Visual;

   function Screen_Width(Window: Tk_Widget) return Positive is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo screenwidth " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Screen_Width;

   function Visual_Id(Window: Tk_Widget) return Positive is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "winfo visualid " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   begin
      return Positive'Value("16#" & Result(3 .. Result'Last) & "#");
   end Visual_Id;

   function Visuals_Available
     (Window: Tk_Widget; Include_Ids: Boolean := False) return Visuals_List is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result_List: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script =>
                  "winfo visualsavailable " & Tk_Path_Name(Widgt => Window) &
                  (if Include_Ids then " includeids" else ""),
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
      Result_Values: Array_List(1 .. (if Include_Ids then 3 else 2)) :=
        (others => Null_Tcl_String);
   begin
      return
        Visuals: Visuals_List (Result_List'Range) := (others => Default_Visual)
      do
         Set_Visuals_List_Loop :
         for I in Result_List'Range loop
            Result_Values :=
              Split_List
                (List => To_Ada_String(Source => Result_List(I)),
                 Interpreter => Interpreter);
            Visuals(I).Visual_Type :=
              Screen_Visual_Type'Value
                (To_Ada_String(Source => Result_Values(1)));
            Visuals(I).Depth :=
              Positive'Value(To_Ada_String(Source => Result_Values(2)));
            if Include_Ids then
               Visuals(I).Id :=
                 Positive'Value
                   ("16#" &
                    To_Ada_String(Source => Result_Values(3))
                      (3 .. To_Ada_String(Source => Result_Values(3))'Last) &
                    "#");
            end if;
         end loop Set_Visuals_List_Loop;
      end return;
   end Visuals_Available;

   function Virtual_Root_Height(Window: Tk_Widget) return Positive is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo vrootheight " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Virtual_Root_Height;

   function Virtual_Root_Width(Window: Tk_Widget) return Positive is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo vrootwidth " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Virtual_Root_Width;

   function Virtual_Root_X(Window: Tk_Widget) return Integer is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo vrootx " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Virtual_Root_X;

   function Virtual_Root_Y(Window: Tk_Widget) return Integer is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo vrooty " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Virtual_Root_Y;

   function Width(Window: Tk_Widget) return Positive is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo width " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Width;

   function X(Window: Tk_Widget) return Natural is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo x " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end X;

   function Y(Window: Tk_Widget) return Natural is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "winfo y " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   end Y;

end Tk.Winfo;
