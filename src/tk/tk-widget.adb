-- Copyright (c) 2020-2021 Bartek thindil Jasicki <thindil@laeran.pl>
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
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System.Address_Image;
with Tk.MainWindow; use Tk.MainWindow;

package body Tk.Widget is

   function Widgets_Array_Image(Widgets: Widgets_Array) return String is
      Widgets_Names: Unbounded_String := Null_Unbounded_String;
   begin
      Set_Widgets_Array_Loop :
      for Widgt of Widgets loop
         Append
           (Source => Widgets_Names,
            New_Item => Tk_Path_Name(Widgt => Widgt) & " ");
      end loop Set_Widgets_Array_Loop;
      return Trim(Source => To_String(Source => Widgets_Names), Side => Right);
   end Widgets_Array_Image;

   function Pixel_Data_Value(Value: String) return Pixel_Data is
      Result: Pixel_Data := Empty_Pixel_Data;
   begin
      if Value'Length = 0 then
         return Result;
      end if;
      if Is_Digit(Item => Value(Value'Last)) then
         Result.Value := Positive_Float'Value(Value);
         Result.Value_Unit := PIXEL;
      else
         Result.Value :=
           Positive_Float'Value(Value(Value'First .. Value'Last - 1));
         Result.Value_Unit := Pixel_Unit'Value("" & Value(Value'Last));
      end if;
      return Result;
   end Pixel_Data_Value;

   function Pixel_Data_Image(Value: Pixel_Data) return String is
      Value_String: String(1 .. 255);
   begin
      Put
        (To => Value_String, Item => Float(Value.Value),
         Aft => Positive_Float'Digits, Exp => 0);
      if Value.Value_Unit /= PIXEL then
         return Trim(Source => Value_String, Side => Both) &
           To_Lower(Item => Pixel_Unit'Image(Value.Value_Unit));
      end if;
      return Trim(Source => Value_String, Side => Both);
   end Pixel_Data_Image;

   function Get_Widget
     (Path_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Widget is
      function Tk_Name_To_Window
        (Interp: Tcl_Interpreter; Path_Name_C: chars_ptr; Tk_Win: Tk_Widget)
         return Tk_Widget with
         Import => True,
         Convention => C,
         External_Name => "Tk_NameToWindow";
   begin
      return Tk_Name_To_Window
          (Interp => Interpreter, Path_Name_C => New_String(Str => Path_Name),
           Tk_Win => Get_Main_Window(Interpreter => Interpreter));
   end Get_Widget;

   function Tk_Path_Name(Widgt: Tk_Widget) return String is
      function Get_Path_Name(Tk_Win: Tk_Widget) return chars_ptr with
         Import => True,
         Convention => C,
         External_Name => "Get_PathName";
   begin
      return Value(Item => Get_Path_Name(Tk_Win => Widgt));
   end Tk_Path_Name;

   function Tk_Interp(Widgt: Tk_Widget) return Tcl_Interpreter is
      function Tk_Interpreter(Tk_Win: Tk_Widget) return Tcl_Interpreter with
         Import => True,
         Convention => C,
         External_Name => "Tk_Interp";
   begin
      return Tk_Interpreter(Tk_Win => Widgt);
   end Tk_Interp;

   function Tk_Window_Id(Widgt: Tk_Widget) return Tk_Window is
      function Tk_Window_Id_C(Tk_Win: Tk_Widget) return Tk_Window with
         Import => True,
         Convention => C,
         External_Name => "Get_Window_Id";
   begin
      return Tk_Window_Id_C(Tk_Win => Widgt);
   end Tk_Window_Id;

   procedure Option_Image
     (Name: String; Value: Tcl_String;
      Options_String: in out Unbounded_String) is
   begin
      if Length(Source => Value) > 0 then
         Append
           (Source => Options_String,
            New_Item => " -" & Name & " " & To_String(Source => Value));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Extended_Natural;
      Options_String: in out Unbounded_String) is
   begin
      if Value > -1 then
         Append
           (Source => Options_String,
            New_Item => " -" & Name & Extended_Natural'Image(Value));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Pixel_Data;
      Options_String: in out Unbounded_String) is
   begin
      if Value.Value > -1.0 then
         Append
           (Source => Options_String,
            New_Item => " -" & Name & " " & Pixel_Data_Image(Value => Value));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Relief_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= NONE then
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & " " & To_Lower(Item => Relief_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: State_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= NONE then
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & " " & To_Lower(Item => State_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Directions_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= NONE then
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & " " &
              To_Lower(Item => Directions_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Place_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= EMPTY then
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & " " & To_Lower(Item => Place_Type'Image(Value)));
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
         Append
           (Options_String, " -" & Name & " {" & Pixel_Data_Image(Value(1)));
         if Value(2).Value > -1.0 then
            Append(Options_String, " " & Pixel_Data_Image(Value(2)));
         end if;
         Append(Options_String, "}");
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Tk_Widget;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= Null_Widget then
         Append(Options_String, " -" & Name & " " & Tk_Path_Name(Value));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Extended_Boolean;
      Options_String: in out Unbounded_String) is
   begin
      if Value = FALSE then
         Append(Options_String, " -" & Name & " 0");
      elsif Value = TRUE then
         Append(Options_String, " -" & Name & " 1");
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Tk_Window;
      Options_String: in out Unbounded_String) is
      New_Value: constant String :=
        System.Address_Image(System.Address(Value));
   begin
      if Value /= Null_Window then
         Append
           (Options_String,
            " -" & Name & " 0x" &
            Trim(To_Lower(New_Value), To_Set('0'), Null_Set));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Integer; Options_String: in out Unbounded_String;
      Base: Positive := 10) is
      Hex_Value: String(1 .. 32);
      New_Value: Unbounded_String;
   begin
      if Value /= 0 then
         Append(Options_String, " -" & Name);
         if Value < 0 then
            Append(Options_String, " ");
         end if;
         case Base is
            when 10 =>
               Append(Options_String, Integer'Image(Value));
            when 16 =>
               Put(Hex_Value, Value, 16);
               New_Value := To_Unbounded_String(Trim(Hex_Value, Both));
               Append
                 (Options_String,
                  " 0x" & Slice(New_Value, 4, Length(New_Value) - 1));
            when others =>
               null;
         end case;
      end if;
   end Option_Image;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Tcl_String is
   begin
      Execute_Widget_Command(Widgt, "cget", "-" & Name);
      return To_Tcl_String(Tcl_Get_Result(Tk_Interp(Widgt)));
   end Option_Value;

   function Option_Value
     (Widgt: Tk_Widget; Name: String) return Directions_Type is
   begin
      Execute_Widget_Command(Widgt, "cget", "-" & Name);
      declare
         Result: constant String := Tcl_Get_Result(Tk_Interp(Widgt));
      begin
         if Result'Length = 0 then
            return NONE;
         else
            return Directions_Type'Value(Result);
         end if;
      end;
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Pixel_Data is
   begin
      Execute_Widget_Command(Widgt, "cget", "-" & Name);
      return Pixel_Data_Value(Tcl_Get_Result(Tk_Interp(Widgt)));
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Place_Type is
   begin
      Execute_Widget_Command(Widgt, "cget", "-" & Name);
      return Place_Type'Value(Tcl_Get_Result(Tk_Interp(Widgt)));
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return State_Type is
   begin
      Execute_Widget_Command(Widgt, "cget", "-" & Name);
      return State_Type'Value(Tcl_Get_Result(Tk_Interp(Widgt)));
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Justify_Type is
   begin
      Execute_Widget_Command(Widgt, "cget", "-" & Name);
      declare
         Result: constant String := Tcl_Get_Result(Tk_Interp(Widgt));
      begin
         if Result'Length = 0 then
            return NONE;
         else
            return Justify_Type'Value(Result);
         end if;
      end;
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Relief_Type is
   begin
      Execute_Widget_Command(Widgt, "cget", "-" & Name);
      declare
         Result: constant String := Tcl_Get_Result(Tk_Interp(Widgt));
      begin
         if Result'Length > 0 then
            return Relief_Type'Value(Result);
         else
            return NONE;
         end if;
      end;
   end Option_Value;

   function Option_Value
     (Widgt: Tk_Widget; Name: String) return Extended_Natural is
   begin
      Execute_Widget_Command(Widgt, "cget", "-" & Name);
      declare
         Result: constant String := Tcl_Get_Result(Tk_Interp(Widgt));
      begin
         if Result'Length > 0 then
            return Extended_Natural'Value(Result);
         end if;
      end;
      return -1;
   end Option_Value;

   function Option_Value
     (Widgt: Tk_Widget; Name: String) return Extended_Boolean is
   begin
      Execute_Widget_Command(Widgt, "cget", "-" & Name);
      if Tcl_Get_Result = 1 then
         return TRUE;
      else
         return FALSE;
      end if;
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Tk_Widget is
   begin
      Execute_Widget_Command(Widgt, "cget", "-" & Name);
      return Get_Widget(Tcl_Get_Result(Tk_Interp(Widgt)), Tk_Interp(Widgt));
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Tk_Window is
   begin
      Execute_Widget_Command(Widgt, "cget", "-" & Name);
      declare
         Result: constant String := Tcl_Get_Result(Tk_Interp(Widgt));
      begin
         if Result'Length > 0 then
            return Tk_Window
                (System'To_Address
                   (Integer'Value("16#" & Result(3 .. Result'Last) & "#")));
         else
            return Null_Window;
         end if;
      end;
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Integer is
   begin
      Execute_Widget_Command(Widgt, "cget", "-" & Name);
      return Tcl_Get_Result(Tk_Interp(Widgt));
   end Option_Value;

   procedure Destroy(Widgt: in out Tk_Widget) is
      procedure Tk_DestroyWindow(tkwin: Tk_Widget) with
         Import => True,
         Convention => C,
         External_Name => "Tk_DestroyWindow";
   begin
      Tk_DestroyWindow(Widgt);
      Widgt := Null_Widget;
   end Destroy;

   procedure Execute_Widget_Command
     (Widgt: Tk_Widget; Command_Name: String; Options: String := "") is
   begin
      Tcl_Eval
        (Tk_Path_Name(Widgt) & " " & Command_Name & " " & Options,
         Tk_Interp(Widgt));
   end Execute_Widget_Command;

end Tk.Widget;
