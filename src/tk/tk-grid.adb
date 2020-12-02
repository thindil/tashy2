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
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with GNAT.String_Split; use GNAT.String_Split;

package body Tk.Grid is

   -- ****if* Grid/Grid.Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options - Ada Grid_Options to convert
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Options_To_String(Options: Grid_Options) return String is
      -- ****
      Options_String: Unbounded_String;
   begin
      Option_Image("column", Options.Column, Options_String);
      Option_Image("columnspan", Options.ColumnSpan, Options_String);
      Option_Image("in", Options.In_Master, Options_String);
      Option_Image("ipadx", Options.IPadX, Options_String);
      Option_Image("ipady", Options.IPadY, Options_String);
      Option_Image("padx", Options.PadX, Options_String);
      Option_Image("pady", Options.PadY, Options_String);
      Option_Image("row", Options.Row, Options_String);
      Option_Image("rowspan", Options.RowSpan, Options_String);
      Option_Image("sticky", Options.Sticky, Options_String);
      return To_String(Options_String);
   end Options_To_String;

   procedure Add
     (Widget: Tk_Widget;
      Options: Grid_Options := Grid_Options'(others => <>)) is
   begin
      Tcl_Eval
        ("grid " & Tk_PathName(Widget) & " " & Options_To_String(Options),
         Tk_Interp(Widget));
   end Add;

   procedure Add
     (Widgets: Widgets_Array;
      Options: Grid_Options := Grid_Options'(others => <>)) is
      Widgets_Names: Unbounded_String;
   begin
      for Widget of Widgets loop
         Append(Widgets_Names, " " & Tk_PathName(Widget));
      end loop;
      Tcl_Eval
        ("grid" & To_String(Widgets_Names) & " " & Options_To_String(Options),
         Tk_Interp(Widgets(1)));
   end Add;

   procedure Anchor(Master: Tk_Widget; New_Direction: Directions_Type) is
   begin
      Tcl_Eval
        ("grid anchor " & Tk_PathName(Master) & " " &
         To_Lower(Directions_Type'Image(New_Direction)));
   end Anchor;

   function Anchor(Master: Tk_Widget) return Directions_Type is
   begin
      Tcl_Eval("grid anchor " & Tk_PathName(Master));
      return Directions_Type'Value(Tcl_GetResult);
   end Anchor;

   function BBox
     (Master: Tk_Widget; Column, Row, Column2, Row2: Extended_Natural := -1)
      return BBox_Array is
      Options: Unbounded_String;
      Tokens: Slice_Set;
   begin
      if Column > -1 then
         Append(Options, Extended_Natural'Image(Column));
      end if;
      if Row > -1 then
         if Column = -1 then
            raise Tcl_Exception with "Column value not specified";
         end if;
         Append(Options, Extended_Natural'Image(Row));
      end if;
      if Column2 > -1 then
         if Column = -1 then
            raise Tcl_Exception with "Column value not specified";
         end if;
         if Row = -1 then
            raise Tcl_Exception with "Row value not specified";
         end if;
         Append(Options, Extended_Natural'Image(Column2));
      end if;
      if Row2 > -1 then
         if Column = -1 then
            raise Tcl_Exception with "Column value not specified";
         end if;
         if Row = -1 then
            raise Tcl_Exception with "Row value not specified";
         end if;
         if Column2 = -1 then
            raise Tcl_Exception with "Column2 value not specified";
         end if;
         Append(Options, Extended_Natural'Image(Row2));
      end if;
      Tcl_Eval("grid bbox " & Tk_PathName(Master) & To_String(Options));
      Create(Tokens, Tcl_GetResult, " ");
      return Coords: BBox_Array do
         for I in 1 .. 4 loop
            Coords(I) := Natural'Value(Slice(Tokens, Slice_Number(I)));
         end loop;
      end return;
   end BBox;

   -- ****if* Grid/Grid.Column_Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options - Ada Column_Options to convert
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Column_Options_To_String(Options: Column_Options) return String is
      -- ****
      Options_String: Unbounded_String;
   begin
      Option_Image("minsize", Options.MinSize, Options_String);
      Option_Image("columnspan", Options.Weight, Options_String);
      Option_Image("uniform", Options.Uniform, Options_String);
      Option_Image("pad", Options.Pad, Options_String);
      return To_String(Options_String);
   end Column_Options_To_String;

   procedure Column_Configure
     (Master: Tk_Widget; Index: Tcl_String; Options: Column_Options) is
   begin
      Tcl_Eval
        ("grid columnconfigure " & Tk_PathName(Master) & " " &
         To_String(Index) & Column_Options_To_String(Options));
   end Column_Configure;

   function Get_Column_Options
     (Master: Tk_Widget; Index: Tcl_String) return Column_Options is
      function Get_Value(Name: String) return Pixel_Data is
         Result: Pixel_Data;
      begin
         Tcl_Eval
           ("grid columnconfigure " & Tk_PathName(Master) & " " &
            To_String(Index) & " " & Name);
         declare
            Value: constant String := Tcl_GetResult(Tk_Interp(Master));
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
      end Get_Value;
      function Get_Value(Name: String) return Tcl_String is
      begin
         Tcl_Eval
           ("grid columnconfigure " & Tk_PathName(Master) & " " &
            To_String(Index) & " " & Name);
         return To_Tcl_String(Tcl_GetResult(Tk_Interp(Master)));
      end Get_Value;
      function Get_Value(Name: String) return Extended_Natural is
      begin
         Tcl_Eval
           ("grid columnconfigure " & Tk_PathName(Master) & " " &
            To_String(Index) & " " & Name);
         return Extended_Natural'Value(Tcl_GetResult(Tk_Interp(Master)));
      end Get_Value;
   begin
      return Options: Column_Options do
         Options.MinSize := Get_Value("minsize");
         Options.Weight := Get_Value("weight");
         Options.Uniform := Get_Value("uniform");
         Options.Pad := Get_Value("pad");
      end return;
   end Get_Column_Options;

   procedure Configure(Widget: Tk_Widget; Options: Grid_Options) is
   begin
      Tcl_Eval
        ("grid configure " & Tk_PathName(Widget) & Options_To_String(Options));
   end Configure;

   procedure Configure(Widgets: Widgets_Array; Options: Grid_Options) is
      Widgets_Names: Unbounded_String;
   begin
      for Widget of Widgets loop
         Append(Widgets_Names, " " & Tk_PathName(Widget));
      end loop;
      Tcl_Eval
        ("grid configure " & To_String(Widgets_Names) &
         Options_To_String(Options),
         Tk_Interp(Widgets(1)));
   end Configure;

   procedure Forget(Widget: Tk_Widget) is
   begin
      Tcl_Eval("grid forget " & Tk_PathName(Widget));
   end Forget;

   function Info(Widget: Tk_Widget) return Grid_Options is
      Options_Names: constant array(1 .. 10) of Unbounded_String :=
        (To_Unbounded_String("-in"), To_Unbounded_String("-column"),
         To_Unbounded_String("-row"), To_Unbounded_String("-columnspan"),
         To_Unbounded_String("-rowspan"), To_Unbounded_String("-ipadx"),
         To_Unbounded_String("-ipady"), To_Unbounded_String("-padx"),
         To_Unbounded_String("-pady"), To_Unbounded_String("-sticky"));
      Options: Grid_Options := Grid_Options'(others => <>);
      StartIndex, EndIndex: Positive;
      function Pixel_Data_Value(Value: String) return Pixel_Data is
         Result: Pixel_Data;
      begin
         if not Is_Digit(Value(Value'Last)) then
            Result.Value :=
              Positive_Float'Value(Value(Value'First .. (Value'Last - 1)));
            Result.Value_Unit := Pixel_Unit'Value("" & Value(Value'Last));
         else
            Result.Value := Positive_Float'Value(Value);
            Result.Value_Unit := PIXEL;
         end if;
         return Result;
      end Pixel_Data_Value;
      function Pad_Array_Value(Value: String) return Pad_Array is
         Result: Pad_Array := (others => Pixel_Data'(others => <>));
         Tokens: Slice_Set;
      begin
         if Value(Value'First) /= '{' then
            Create(Tokens, Value, " ");
         else
            Create(Tokens, Value(Value'First + 1 .. Value'Last - 1), " ");
         end if;
         for I in 1 .. Slice_Count(Tokens) loop
            Result(Positive(I)) := Pixel_Data_Value(Slice(Tokens, 1));
         end loop;
         return Result;
      end Pad_Array_Value;
   begin
      Tcl_Eval("grid info " & Tk_PathName(Widget), Tk_Interp(Widget));
      declare
         Result: constant String := Tcl_GetResult(Tk_Interp(Widget));
      begin
         for I in Options_Names'Range loop
            StartIndex :=
              Index(Result, To_String(Options_Names(I))) +
              Length(Options_Names(I)) + 1;
            if I < Options_Names'Last then
               EndIndex := Index(Result, To_String(Options_Names(I + 1))) - 2;
            else
               EndIndex := Result'Last;
            end if;
            case I is
               when 1 =>
                  Options.In_Master :=
                    To_Tcl_String(Result(StartIndex .. EndIndex));
               when 2 =>
                  Options.Column :=
                    Extended_Natural'Value(Result(StartIndex .. EndIndex));
               when 3 =>
                  Options.Row :=
                    Extended_Natural'Value(Result(StartIndex .. EndIndex));
               when 4 =>
                  Options.ColumnSpan :=
                    Extended_Natural'Value(Result(StartIndex .. EndIndex));
               when 5 =>
                  Options.RowSpan :=
                    Extended_Natural'Value(Result(StartIndex .. EndIndex));
               when 6 =>
                  Options.IPadX :=
                    Pixel_Data_Value(Result(StartIndex .. EndIndex));
               when 7 =>
                  Options.IPadY :=
                    Pixel_Data_Value(Result(StartIndex .. EndIndex));
               when 8 =>
                  Options.PadX :=
                    Pad_Array_Value(Result(StartIndex .. EndIndex));
               when 9 =>
                  Options.PadY :=
                    Pad_Array_Value(Result(StartIndex .. EndIndex));
               when 10 =>
                  Options.Sticky :=
                    To_Tcl_String(Result(StartIndex .. EndIndex));
            end case;
         end loop;
      end;
      return Options;
   end Info;

end Tk.Grid;
