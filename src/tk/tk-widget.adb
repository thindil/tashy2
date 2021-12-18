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

with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System.Address_Image;
with Tashy2; use Tashy2;
with Tk.MainWindow;
with Tk.Winfo;

package body Tk.Widget is

   function Widgets_Array_Image(Widgets: Widgets_Array) return String is
      Widgets_Names: Unbounded_String := Null_Unbounded_String;
   begin
      if Widgets = Empty_Widgets_Array or Widgets'Length = 0 then
         return "";
      end if;
      if (for all Widgt of Widgets => Widgt = Null_Widget) then
         return "";
      end if;
      Set_Widgets_Array_Loop :
      for Widgt of Widgets loop
         if Widgt /= Null_Widget then
            exit Set_Widgets_Array_Loop when Long_Long_Integer
                (Length(Source => Widgets_Names)) +
              Long_Long_Integer(Tk_Path_Name(Widgt => Widgt)'Length) + 1 >
              Long_Long_Integer(Natural'Last);
            Append
              (Source => Widgets_Names,
               New_Item => Tk_Path_Name(Widgt => Widgt) & " ");
         end if;
      end loop Set_Widgets_Array_Loop;
      return Trim(Source => To_String(Source => Widgets_Names), Side => Right);
   end Widgets_Array_Image;

   function Pixel_Data_Value(Value: String) return Pixel_Data is
      Result: Pixel_Data := Empty_Pixel_Data;
   begin
      if Value'Length = 0 then
         return Result;
      end if;
      if (for all Char of Value => Is_Digit(Item => Char)) then
         if Float'Value(Value) >= -1.0 then
            Result.Value := Positive_Float'Value(Value);
         else
            Result.Value := -1.0;
         end if;
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
         return
           Trim(Source => Value_String, Side => Both) &
           To_Lower(Item => Pixel_Unit'Image(Value.Value_Unit));
      end if;
      return Trim(Source => Value_String, Side => Both);
   end Pixel_Data_Image;

   function Get_Widget
     (Path_Name: Tk_Path_String;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Widget is
      use Tk.MainWindow;

      function Tk_Name_To_Window
        (Interp: Tcl_Interpreter; Path_Name_C: chars_ptr; Tk_Win: Tk_Widget)
         return Tk_Widget with
         Global => null,
         Import,
         Convention => C,
         External_Name => "Tk_NameToWindow";
   begin
      return
        Tk_Name_To_Window
          (Interp => Interpreter, Path_Name_C => To_C_String(Str => Path_Name),
           Tk_Win => Get_Main_Window(Interpreter => Interpreter));
   end Get_Widget;

   function Tk_Path_Name(Widgt: Tk_Widget) return Tk_Path_String is
      function Get_Path_Name(Tk_Win: Tk_Widget) return chars_ptr with
         Global => null,
         Import,
         Convention => C,
         External_Name => "Get_PathName";
      Result: constant String :=
        From_C_String(Item => Get_Path_Name(Tk_Win => Widgt));
   begin
      if Result'Length > Max_Length_Type'Last then
         return Result(Result'First .. Max_Length_Type'Last);
      end if;
      return Result;
   end Tk_Path_Name;

   procedure Option_Image
     (Name: Variable_Name; Value: Tcl_String;
      Options_String: in out Unbounded_String) is
   begin
      if not Name_Is_Valid(Name => Name) then
         return;
      end if;
      if Long_Long_Integer(Length(Source => Options_String)) +
        Long_Long_Integer(Length(Source => Value)) +
        Long_Long_Integer(Name'Length) + 3 >
        Long_Long_Integer(Positive'Last) then
         return;
      end if;
      if Length(Source => Value) > 0 then
         Append
           (Source => Options_String,
            New_Item => " -" & Name & " " & To_String(Source => Value));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Extended_Natural;
      Options_String: in out Unbounded_String) is
   begin
      if not Name_Is_Valid(Name => Name) then
         return;
      end if;
      if Long_Long_Integer(Length(Source => Options_String)) +
        Long_Long_Integer(Extended_Natural'Image(Value)'Length) +
        Long_Long_Integer(Name'Length) + 2 >
        Long_Long_Integer(Positive'Last) then
         return;
      end if;
      if Value > -1 then
         Append
           (Source => Options_String,
            New_Item => " -" & Name & Extended_Natural'Image(Value));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Pixel_Data;
      Options_String: in out Unbounded_String) is
   begin
      if not Name_Is_Valid(Name => Name) then
         return;
      end if;
      if Long_Long_Integer(Length(Source => Options_String)) +
        Long_Long_Integer(Pixel_Data_Image(Value)'Length) +
        Long_Long_Integer(Name'Length) + 3 >
        Long_Long_Integer(Positive'Last) then
         return;
      end if;
      if Value.Value > -1.0 then
         Append
           (Source => Options_String,
            New_Item => " -" & Name & " " & Pixel_Data_Image(Value => Value));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Relief_Type;
      Options_String: in out Unbounded_String) is
   begin
      if not Name_Is_Valid(Name => Name) then
         return;
      end if;
      if Long_Long_Integer(Length(Source => Options_String)) +
        Long_Long_Integer(To_Lower(Item => Relief_Type'Image(Value))'Length) +
        Long_Long_Integer(Name'Length) + 3 >
        Long_Long_Integer(Positive'Last) then
         return;
      end if;
      if Value /= NONE then
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & " " & To_Lower(Item => Relief_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: State_Type;
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
     (Name: Variable_Name; Value: Directions_Type;
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
     (Name: Variable_Name; Value: Place_Type;
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
     (Name: Variable_Name; Value: Justify_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= NONE then
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & " " & To_Lower(Item => Justify_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Horizontal_Pad_Data;
      Options_String: in out Unbounded_String) is
   begin
      if Value.Left.Value > -1.0 then
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & " {" & Pixel_Data_Image(Value => Value.Left));
         if Value.Right.Value > -1.0 then
            Append
              (Source => Options_String,
               New_Item => " " & Pixel_Data_Image(Value => Value.Right));
         end if;
         Append(Source => Options_String, New_Item => "}");
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Vertical_Pad_Data;
      Options_String: in out Unbounded_String) is
   begin
      if Value.Top.Value > -1.0 then
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & " {" & Pixel_Data_Image(Value => Value.Top));
         if Value.Bottom.Value > -1.0 then
            Append
              (Source => Options_String,
               New_Item => " " & Pixel_Data_Image(Value => Value.Bottom));
         end if;
         Append(Source => Options_String, New_Item => "}");
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Tk_Widget;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= Null_Widget then
         Append
           (Source => Options_String,
            New_Item => " -" & Name & " " & Tk_Path_Name(Widgt => Value));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Extended_Boolean;
      Options_String: in out Unbounded_String) is
   begin
      case Value is
         when FALSE =>
            Append(Source => Options_String, New_Item => " -" & Name & " 0");
         when TRUE =>
            Append(Source => Options_String, New_Item => " -" & Name & " 1");
         when NONE =>
            null;
      end case;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Tk_Window;
      Options_String: in out Unbounded_String) is
      use Ada.Strings.Maps;

      New_Value: constant String :=
        System.Address_Image(A => System.Address(Value));
   begin
      if Value /= Null_Window then
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & " 0x" &
              Trim
                (Source => To_Lower(Item => New_Value),
                 Left => To_Set(Singleton => '0'), Right => Null_Set));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Integer;
      Options_String: in out Unbounded_String; Base: Positive := 10) is
      use Ada.Integer_Text_IO;

      Hex_Value: String(1 .. 32) := (others => ' ');
      New_Value: Unbounded_String := Null_Unbounded_String;
   begin
      if Value /= 0 then
         Append(Source => Options_String, New_Item => " -" & Name);
         if Value < 0 then
            Append(Source => Options_String, New_Item => " ");
         end if;
         case Base is
            when 10 =>
               Append
                 (Source => Options_String, New_Item => Integer'Image(Value));
            when 16 =>
               Put(To => Hex_Value, Item => Value, Base => 16);
               New_Value :=
                 To_Unbounded_String
                   (Source => Trim(Source => Hex_Value, Side => Both));
               Append
                 (Source => Options_String,
                  New_Item =>
                    " 0x" &
                    Slice
                      (Source => New_Value, Low => 4,
                       High => Length(Source => New_Value) - 1));
            when others =>
               null;
         end case;
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Anchor_Directions;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= NONE then
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & " " &
              To_Lower(Item => Anchor_Directions'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Positive_Float;
      Options_String: in out Unbounded_String) is
      Value_String: String(1 .. 255) := (others => ' ');
   begin
      if Value >= 0.0 then
         Put
           (To => Value_String, Item => Float(Value),
            Aft => Positive_Float'Digits, Exp => 0);
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & " " & Trim(Source => Value_String, Side => Both));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Point_Position;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= Empty_Point_Position then
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & Extended_Natural'Image(Value.X) &
              Extended_Natural'Image(Value.Y));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Boolean;
      Options_String: in out Unbounded_String) is
   begin
      if Value then
         Append(Source => Options_String, New_Item => " -" & Name);
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Color_Type;
      Options_String: in out Unbounded_String) is
      function Color_To_String(Color: Color_Range) return String is
         Color_Value: constant Color_Range := Color / 256;
      begin
         case Color_Value is
            when 0 .. 9 =>
               return
                 "00" &
                 Trim(Source => Color_Range'Image(Color_Value), Side => Left);
            when 10 .. 99 =>
               return
                 "0" &
                 Trim(Source => Color_Range'Image(Color_Value), Side => Left);
            when others =>
               return
                 Trim(Source => Color_Range'Image(Color_Value), Side => Left);
         end case;
      end Color_To_String;
   begin
      if Value /= Empty_Color then
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & " #" & Color_To_String(Value.Red) &
              Color_To_String(Value.Green) & Color_To_String(Value.Blue));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: Variable_Name; Value: Unbounded_Variable_Name;
      Options_String: in out Unbounded_String) is
   begin
      if Length(Source => Value) > 0 then
         Append
           (Source => Options_String,
            New_Item => " -" & Name & " " & To_String(Source => Value));
      end if;
   end Option_Image;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Tcl_String is
   begin
      return
        To_Tcl_String
          (Source =>
             Execute_Widget_Command
               (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name)
               .Result);
   end Option_Value;

   function Option_Value
     (Widgt: Tk_Widget; Name: String) return Directions_Type is
      Result: constant String :=
        Execute_Widget_Command
          (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name)
          .Result;
   begin
      if Result'Length = 0 then
         return NONE;
      end if;
      return Directions_Type'Value(Result);
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Pixel_Data is
   begin
      return
        Pixel_Data_Value
          (Value =>
             Execute_Widget_Command
               (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name)
               .Result);
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Place_Type is
   begin
      return
        Place_Type'Value
          (Execute_Widget_Command
             (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name)
             .Result);
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return State_Type is
   begin
      return
        State_Type'Value
          (Execute_Widget_Command
             (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name)
             .Result);
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Justify_Type is
      Result: constant String :=
        Execute_Widget_Command
          (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name)
          .Result;
   begin
      if Result'Length = 0 then
         return NONE;
      end if;
      return Justify_Type'Value(Result);
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Relief_Type is
      Result: constant String :=
        Execute_Widget_Command
          (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name)
          .Result;
   begin
      if Result'Length > 0 then
         return Relief_Type'Value(Result);
      end if;
      return NONE;
   end Option_Value;

   function Option_Value
     (Widgt: Tk_Widget; Name: String) return Extended_Natural is
      Result: constant String :=
        Execute_Widget_Command
          (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name)
          .Result;
   begin
      if Result'Length > 0 then
         return Extended_Natural'Value(Result);
      end if;
      return -1;
   end Option_Value;

   function Option_Value
     (Widgt: Tk_Widget; Name: String) return Extended_Boolean is
   begin
      Execute_Widget_Command
        (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name);
      if Tcl_Get_Result(Interpreter => Tk_Interp(Widgt => Widgt)) = "1" then
         return TRUE;
      else
         return FALSE;
      end if;
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Tk_Widget is
      Result: constant String :=
        Execute_Widget_Command
          (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name)
          .Result;
   begin
      if Result'Length = 0 then
         return Null_Widget;
      end if;
      return
        Get_Widget
          (Path_Name => Result, Interpreter => Tk_Interp(Widgt => Widgt));
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Tk_Window is
      Result: constant String :=
        Execute_Widget_Command
          (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name)
          .Result;
   begin
      if Result'Length > 0 then
         return
           Tk_Window
             (System'To_Address
                (Integer'Value("16#" & Result(3 .. Result'Last) & "#")));
      end if;
      return Null_Window;
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Integer is
      Result: constant String :=
        Execute_Widget_Command
          (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name)
          .Result;
   begin
      if Result'Length = 0 then
         return 0;
      end if;
      return Integer'Value(Result);
   end Option_Value;

   function Option_Value
     (Widgt: Tk_Widget; Name: String) return Anchor_Directions is
   begin
      return
        Anchor_Directions'Value
          (Execute_Widget_Command
             (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name)
             .Result);
   end Option_Value;

   function Option_Value(Widgt: Tk_Widget; Name: String) return Color_Type is
      use Tk.Winfo;

      Result: constant Tcl_String_Result :=
        Execute_Widget_Command
          (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name);
   begin
      if Result.Return_Code = TCL_ERROR or Result.Result_Length = 0 then
         return Empty_Color;
      end if;
      if Result.Result(Result.Result'First) /= '#' then
         return
           Rgb
             (Color_Name => Colors_Names_Value(Image => Result.Result),
              Window => Widgt);
      end if;
      if Result.Result_Length = 10 then
         return Color: Color_Type := Empty_Color do
            Color.Red := Color_Range'Value(Result.Result(2 .. 4)) * 257;
            Color.Green := Color_Range'Value(Result.Result(5 .. 7)) * 257;
            Color.Blue := Color_Range'Value(Result.Result(8 .. 10)) * 257;
         end return;
      end if;
      return Empty_Color;
   end Option_Value;

   function Option_Value
     (Widgt: Tk_Widget; Name: Variable_Name) return Unbounded_Variable_Name is
      Result: Unbounded_String;
   begin
      if Widgt = Null_Widget then
         return Empty_Unbounded_Variable_Name;
      end if;
      if not Name_Is_Valid(Name => Name) then
         return Empty_Unbounded_Variable_Name;
      end if;
      Result :=
        To_Unbounded_String
          (Source =>
             Execute_Widget_Command
               (Widgt => Widgt, Command_Name => "cget", Options => "-" & Name)
               .Result);
      if Unbounded_Name_Is_Valid(Name => Result) then
         return Result;
      end if;
      return Empty_Unbounded_Variable_Name;
   end Option_Value;

   procedure Destroy(Widgt: in out Tk_Widget) is
      procedure Tk_Destroy_Window(Tk_Win: Tk_Widget) with
         Global => null,
         Import,
         Convention => C,
         External_Name => "Tk_DestroyWindow";
   begin
      Tk_Destroy_Window(Tk_Win => Widgt);
      Widgt := Null_Widget;
   end Destroy;

   procedure Execute_Widget_Command
     (Widgt: Tk_Widget; Command_Name: Variable_Name; Options: String := "") is
   begin
      if Widgt = Null_Widget then
         return;
      end if;
      if Command_Name'Length = 0 then
         return;
      end if;
      if Long_Long_Integer(Tk_Path_Name(Widgt => Widgt)'Length) +
        Long_Long_Integer(Command_Name'Length) +
        Long_Long_Integer(Options'Length) + 2 >
        Long_Long_Integer(Natural'Last) then
         return;
      end if;
      Tcl_Eval
        (Tcl_Script =>
           Tk_Path_Name(Widgt => Widgt) & " " & Command_Name & " " & Options,
         Interpreter => Tk_Interp(Widgt => Widgt));
   end Execute_Widget_Command;

   function Execute_Widget_Command
     (Widgt: Tk_Widget; Command_Name: Variable_Name; Options: String := "")
      return Tcl_String_Result is
   begin
      if Widgt = Null_Widget then
         return
           (Message_Length => 35, Result_Length => 0, Return_Code => TCL_ERROR,
            Message => "The selected widget is Null_Widget.", Result => "");
      end if;
      if Command_Name'Length = 0 then
         return
           (Message_Length => 23, Result_Length => 0, Return_Code => TCL_ERROR,
            Message => "Empty the command name.", Result => "");
      end if;
      if not Name_Is_Valid(Command_Name) then
         return
           (Message_Length => 25, Result_Length => 0, Return_Code => TCL_ERROR,
            Message => "Invalid the command name.", Result => "");
      end if;
      if Long_Long_Integer(Tk_Path_Name(Widgt => Widgt)'Length) +
        Long_Long_Integer(Command_Name'Length) +
        Long_Long_Integer(Options'Length) + 2 >
        Long_Long_Integer(Natural'Last) then
         return
           (Message_Length => 17, Result_Length => 0, Return_Code => TCL_ERROR,
            Message => "Command too long.", Result => "");
      end if;
      return
        Tcl_Eval
          (Tcl_Script =>
             Tk_Path_Name(Widgt => Widgt) & " " & Command_Name & " " & Options,
           Interpreter => Tk_Interp(Widgt => Widgt));
   end Execute_Widget_Command;

   function Execute_Widget_Command
     (Widgt: Tk_Widget; Command_Name: Variable_Name; Options: String := "")
      return Tcl_Boolean_Result is
   begin
      if Widgt = Null_Widget then
         return
           (Message_Length => 35, Return_Code => TCL_ERROR,
            Message => "The selected widget is Null_Widget.", Result => False);
      end if;
      if Command_Name'Length = 0 then
         return
           (Message_Length => 23, Return_Code => TCL_ERROR,
            Message => "Empty the command name.", Result => False);
      end if;
      if not Name_Is_Valid(Command_Name) then
         return
           (Message_Length => 25, Return_Code => TCL_ERROR,
            Message => "Invalid the command name.", Result => False);
      end if;
      if Long_Long_Integer(Tk_Path_Name(Widgt => Widgt)'Length) +
        Long_Long_Integer(Command_Name'Length) +
        Long_Long_Integer(Options'Length) + 2 >
        Long_Long_Integer(Natural'Last) then
         return
           (Message_Length => 17, Return_Code => TCL_ERROR,
            Message => "Command too long.", Result => False);
      end if;
      return
        Tcl_Eval
          (Tcl_Script =>
             Tk_Path_Name(Widgt => Widgt) & " " & Command_Name & " " & Options,
           Interpreter => Tk_Interp(Widgt => Widgt));
   end Execute_Widget_Command;

   function Generic_Scalar_Execute_Widget_Command
     (Widgt: Tk_Widget; Command_Name: String; Options: String := "")
      return Result_Type is
   begin
      return
        Result_Type'Value
          (Execute_Widget_Command
             (Widgt => Widgt, Command_Name => Command_Name, Options => Options)
             .Result);
   end Generic_Scalar_Execute_Widget_Command;

   function Generic_Float_Execute_Widget_Command
     (Widgt: Tk_Widget; Command_Name: String; Options: String := "")
      return Result_Type is
   begin
      return
        Result_Type'Value
          (Execute_Widget_Command
             (Widgt => Widgt, Command_Name => Command_Name, Options => Options)
             .Result);
   end Generic_Float_Execute_Widget_Command;

end Tk.Widget;
