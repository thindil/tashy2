-- Copyright (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
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

with Ada.Characters.Handling; use Ada.Characters.Handling;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Tk.MainWindow; use Tk.MainWindow;

package body Tk.Widget is

   function Get_Widget
     (Path_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Widget is
      function Tk_NameToWindow
        (interp: Tcl_Interpreter; pathName: chars_ptr; tkwin: int)
         return int with
         Import => True,
         Convention => C,
         External_Name => "Tk_NameToWindow";
   begin
      return Tk_Widget
          (Tk_NameToWindow
             (Interpreter, New_String(Path_Name),
              int(Get_Main_Window(Interpreter))));
   end Get_Widget;

   function Tk_PathName(Widget: Tk_Widget) return String is
      function Get_PathName(tkwin: int) return chars_ptr with
         Import => True,
         Convention => C,
         External_Name => "Get_PathName";
   begin
      return Value(Get_PathName(int(Widget)));
   end Tk_PathName;

   function Tk_Interp(Widget: Tk_Widget) return Tcl_Interpreter is
      function TkInterp(tkwin: int) return Tcl_Interpreter with
         Import => True,
         Convention => C,
         External_Name => "Tk_Interp";
   begin
      return TkInterp(int(Widget));
   end Tk_Interp;

   procedure Option_Image
     (Name: String; Value: Tcl_String;
      Options_String: in out Unbounded_String) is
   begin
      if Length(Value) > 0 then
         Append(Options_String, " -" & Name & " " & To_String(Value));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Extended_Natural;
      Options_String: in out Unbounded_String) is
   begin
      if Value > -1 then
         Append
           (Options_String, " -" & Name & " " & Extended_Natural'Image(Value));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Pixel_Data;
      Options_String: in out Unbounded_String) is
   begin
      if Value.Value > -1.0 then
         Append
           (Options_String,
            "-" & Name & Positive_Float'Image(Value.Value) &
            To_Lower(Pixel_Unit'Image(Value.Value_Unit)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Relief_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= NONE then
         Append
           (Options_String,
            " -" & Name & " " & To_Lower(Relief_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: State_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= NONE then
         Append
           (Options_String,
            " -" & Name & " " & To_Lower(State_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Directions_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= NONE then
         Append
           (Options_String,
            " -" & Name & " " & To_Lower(Directions_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Place_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= EMPTY then
         Append
           (Options_String,
            " -" & Name & " " & To_Lower(Place_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Justify_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= NONE then
         Append
           (Options_String,
            " -" & Name & " " & To_Lower(Justify_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Pad_Array;
      Options_String: in out Unbounded_String) is
   begin
      if Value(1).Value > -1.0 then
         if Value(2).Value > -1.0 then
            Append
              (Options_String,
               "-" & Name & " {" &
               Trim(Positive_Float'Image(Value(1).Value), Left) &
               To_Lower(Pixel_Unit'Image(Value(1).Value_Unit)) &
               Positive_Float'Image(Value(2).Value) &
               To_Lower(Pixel_Unit'Image(Value(2).Value_Unit)) & "}");
         else
            Append
              (Options_String,
               "-" & Name & Positive_Float'Image(Value(1).Value) &
               To_Lower(Pixel_Unit'Image(Value(1).Value_Unit)));
         end if;
      end if;
   end Option_Image;

   function Option_Value(Widget: Tk_Widget; Name: String) return Tcl_String is
   begin
      Execute_Widget_Command(Widget, "cget", "-" & Name);
      return To_Tcl_String(Tcl_GetResult(Tk_Interp(Widget)));
   end Option_Value;

   function Option_Value
     (Widget: Tk_Widget; Name: String) return Directions_Type is
   begin
      Execute_Widget_Command(Widget, "cget", "-" & Name);
      return Directions_Type'Value(Tcl_GetResult(Tk_Interp(Widget)));
   end Option_Value;

   function Option_Value(Widget: Tk_Widget; Name: String) return Pixel_Data is
      Result: Pixel_Data;
   begin
      Execute_Widget_Command(Widget, "cget", "-" & Name);
      declare
         Value: constant String := Tcl_GetResult(Tk_Interp(Widget));
      begin
         if not Is_Digit(Value(Value'Last)) then
            Result.Value :=
              Positive_Float'Value(Value(Value'First .. (Value'Last - 1)));
            Result.Value_Unit := Pixel_Unit'Value("" & Value(Value'Last));
         else
            Result.Value := Positive_Float'Value(Value);
            Result.Value_Unit := PIXEL;
         end if;
      end;
      return Result;
   end Option_Value;

   function Option_Value(Widget: Tk_Widget; Name: String) return Place_Type is
   begin
      Execute_Widget_Command(Widget, "cget", "-" & Name);
      return Place_Type'Value(Tcl_GetResult(Tk_Interp(Widget)));
   end Option_Value;

   function Option_Value(Widget: Tk_Widget; Name: String) return State_Type is
   begin
      Execute_Widget_Command(Widget, "cget", "-" & Name);
      return State_Type'Value(Tcl_GetResult(Tk_Interp(Widget)));
   end Option_Value;

   function Option_Value
     (Widget: Tk_Widget; Name: String) return Justify_Type is
   begin
      Execute_Widget_Command(Widget, "cget", "-" & Name);
      return Justify_Type'Value(Tcl_GetResult(Tk_Interp(Widget)));
   end Option_Value;

   function Option_Value(Widget: Tk_Widget; Name: String) return Relief_Type is
   begin
      Execute_Widget_Command(Widget, "cget", "-" & Name);
      return Relief_Type'Value(Tcl_GetResult(Tk_Interp(Widget)));
   end Option_Value;

   function Option_Value
     (Widget: Tk_Widget; Name: String) return Extended_Natural is
   begin
      Execute_Widget_Command(Widget, "cget", "-" & Name);
      return Extended_Natural'Value(Tcl_GetResult(Tk_Interp(Widget)));
   end Option_Value;

   procedure Destroy(Widget: in out Tk_Widget) is
      procedure Tk_DestroyWindow(tkwin: int) with
         Import => True,
         Convention => C,
         External_Name => "Tk_DestroyWindow";
   begin
      Tk_DestroyWindow(int(Widget));
      Widget := 0;
   end Destroy;

   procedure Execute_Widget_Command
     (Widget: Tk_Widget; Command_Name: String; Options: String := "") is
   begin
      Tcl_Eval
        (Tk_PathName(Widget) & " " & Command_Name & " " & Options,
         Tk_Interp(Widget));
   end Execute_Widget_Command;

end Tk.Widget;
