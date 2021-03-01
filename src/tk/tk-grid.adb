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
with Ada.Strings; use Ada.Strings;
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
      Option_Image("columnspan", Options.Column_Span, Options_String);
      Option_Image("in", Options.In_Master, Options_String);
      Option_Image("ipadx", Options.Internal_Pad_X, Options_String);
      Option_Image("ipady", Options.Internal_Pad_Y, Options_String);
      Option_Image("padx", Options.Pad_X, Options_String);
      Option_Image("pady", Options.Pad_Y, Options_String);
      Option_Image("row", Options.Row, Options_String);
      Option_Image("rowspan", Options.Row_Span, Options_String);
      Option_Image("sticky", Options.Sticky, Options_String);
      return To_String(Options_String);
   end Options_To_String;

   procedure Add
     (Child: Tk_Widget;
      Options: Grid_Options := Grid_Options'(others => <>)) is
   begin
      Tcl_Eval
        ("grid " & Tk_PathName(Child) & " " & Options_To_String(Options),
         Tk_Interp(Child));
   end Add;

   procedure Add
     (Widgets: Widgets_Array;
      Options: Grid_Options := Grid_Options'(others => <>)) is
   begin
      Tcl_Eval
        ("grid " & Widgets_Array_Image(Widgets) & " " &
         Options_To_String(Options),
         Tk_Interp(Widgets(1)));
   end Add;

   procedure Anchor(Master: Tk_Widget; New_Direction: Directions_Type) is
   begin
      Tcl_Eval
        ("grid anchor " & Tk_PathName(Master) & " " &
         To_Lower(Directions_Type'Image(New_Direction)),
         Tk_Interp(Master));
   end Anchor;

   function Anchor(Master: Tk_Widget) return Directions_Type is
   begin
      Tcl_Eval("grid anchor " & Tk_PathName(Master), Tk_Interp(Master));
      return Directions_Type'Value(Tcl_Get_Result);
   end Anchor;

   function Bounding_Box
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
      Tcl_Eval
        ("grid bbox " & Tk_PathName(Master) & To_String(Options),
         Tk_Interp(Master));
      Create(Tokens, Tcl_Get_Result, " ");
      return Coords: BBox_Array do
         for I in 1 .. 4 loop
            Coords(I) := Natural'Value(Slice(Tokens, Slice_Number(I)));
         end loop;
      end return;
   end Bounding_Box;

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
      Option_Image("minsize", Options.Min_Size, Options_String);
      Option_Image("weight", Options.Weight, Options_String);
      Option_Image("uniform", Options.Uniform, Options_String);
      Option_Image("pad", Options.Pad, Options_String);
      return To_String(Options_String);
   end Column_Options_To_String;

   procedure Column_Configure
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) is
   begin
      Tcl_Eval
        ("grid columnconfigure " & Tk_PathName(Master) & " " &
         To_String(Child_Name) & " " & Column_Options_To_String(Options),
         Tk_Interp(Master));
   end Column_Configure;

   procedure Column_Configure
     (Master, Child: Tk_Widget; Options: Column_Options) is
   begin
      Tcl_Eval
        ("grid columnconfigure " & Tk_PathName(Master) & " " &
         Tk_PathName(Child) & " " & Column_Options_To_String(Options),
         Tk_Interp(Master));
   end Column_Configure;

   procedure Column_Configure
     (Master: Tk_Widget; Column: Natural; Options: Column_Options) is
   begin
      Tcl_Eval
        ("grid columnconfigure " & Tk_PathName(Master) &
         Natural'Image(Column) & " " & Column_Options_To_String(Options),
         Tk_Interp(Master));
   end Column_Configure;

   -- ****if* Grid/Grid.Get_Value_(Pixel_Data)
   -- FUNCTION
   -- Get the value of the selected column or row configuration
   -- PARAMETERS
   -- Master     - Tk_Widget which is master of the selected grid geometry
   --              manager
   -- Name       - Name of the option to get
   -- ConfigType - Type of config. Can be column or row
   -- Index      - Index of the column or row which option will be get
   -- RESULT
   -- Pixel_Data structure with value of the selected option
   -- HISTORY
   -- 8.6.0 - Added
   -- SEE ALSO
   -- Grid.Get_Value_(Tcl_String), Grid.Get_Value_(Extended_Natural)
   -- SOURCE
   function Get_Value
     (Master: Tk_Widget; Name, ConfigType: String; Index: Natural)
      return Pixel_Data is
   -- ****
   begin
      Tcl_Eval
        ("grid " & ConfigType & "configure " & Tk_PathName(Master) &
         Natural'Image(Index) & " -" & Name,
         Tk_Interp(Master));
      return Pixel_Data_Value(Tcl_Get_Result(Tk_Interp(Master)));
   end Get_Value;

   -- ****if* Grid/Grid.Get_Value_(Tcl_String)
   -- FUNCTION
   -- Get the value of the selected column or row configuration
   -- PARAMETERS
   -- Master     - Tk_Widget which is master of the selected grid geometry
   --              manager
   -- Name       - Name of the option to get
   -- ConfigType - Type of config. Can be column or row
   -- Index      - Index of the column or row which option will be get
   -- RESULT
   -- Tcl_String with value of the selected option
   -- HISTORY
   -- 8.6.0 - Added
   -- SEE ALSO
   -- Grid.Get_Value_(Pixel_Data), Grid.Get_Value_(Extended_Natural)
   -- SOURCE
   function Get_Value
     (Master: Tk_Widget; Name, ConfigType: String; Index: Natural)
      return Tcl_String is
   -- ****
   begin
      Tcl_Eval
        ("grid " & ConfigType & "configure " & Tk_PathName(Master) &
         Natural'Image(Index) & " -" & Name,
         Tk_Interp(Master));
      return To_Tcl_String(Tcl_Get_Result(Tk_Interp(Master)));
   end Get_Value;

   -- ****if* Grid/Grid.Get_Value_(Extended_Natural)
   -- FUNCTION
   -- Get the value of the selected column or row configuration
   -- PARAMETERS
   -- Master     - Tk_Widget which is master of the selected grid geometry
   --              manager
   -- Name       - Name of the option to get
   -- ConfigType - Type of config. Can be column or row
   -- Index      - Index of the column or row which option will be get
   -- RESULT
   -- Extended_Natural with value of the selected option
   -- HISTORY
   -- 8.6.0 - Added
   -- SEE ALSO
   -- Grid.Get_Value_(Pixel_Data), Grid.Get_Value_(Tcl_String)
   -- SOURCE
   function Get_Value
     (Master: Tk_Widget; Name, ConfigType: String; Index: Natural)
      return Extended_Natural is
   -- ****
   begin
      Tcl_Eval
        ("grid " & ConfigType & "configure " & Tk_PathName(Master) &
         Natural'Image(Index) & " -" & Name,
         Tk_Interp(Master));
      return Extended_Natural'Value(Tcl_Get_Result(Tk_Interp(Master)));
   end Get_Value;

   function Get_Column_Options
     (Master: Tk_Widget; Column: Natural) return Column_Options is
   begin
      return Options: Column_Options do
         Options.Min_Size := Get_Value(Master, "minsize", "column", Column);
         Options.Weight := Get_Value(Master, "weight", "column", Column);
         Options.Uniform := Get_Value(Master, "uniform", "column", Column);
         Options.Pad := Get_Value(Master, "pad", "column", Column);
      end return;
   end Get_Column_Options;

   procedure Configure(Child: Tk_Widget; Options: Grid_Options) is
   begin
      Tcl_Eval
        ("grid configure " & Tk_PathName(Child) & Options_To_String(Options),
         Tk_Interp(Child));
   end Configure;

   procedure Configure(Widgets: Widgets_Array; Options: Grid_Options) is
   begin
      Tcl_Eval
        ("grid configure " & Widgets_Array_Image(Widgets) &
         Options_To_String(Options),
         Tk_Interp(Widgets(1)));
   end Configure;

   procedure Forget(Child: Tk_Widget) is
   begin
      Tcl_Eval("grid forget " & Tk_PathName(Child), Tk_Interp(Child));
   end Forget;

   procedure Forget(Widgets: Widgets_Array) is
   begin
      Tcl_Eval
        ("grid forget " & Widgets_Array_Image(Widgets), Tk_Interp(Widgets(1)));
   end Forget;

   function Info(Child: Tk_Widget) return Grid_Options is
      Options_Names: constant array(1 .. 10) of Unbounded_String :=
        (To_Unbounded_String("-in"), To_Unbounded_String("-column"),
         To_Unbounded_String("-row"), To_Unbounded_String("-columnspan"),
         To_Unbounded_String("-rowspan"), To_Unbounded_String("-ipadx"),
         To_Unbounded_String("-ipady"), To_Unbounded_String("-padx"),
         To_Unbounded_String("-pady"), To_Unbounded_String("-sticky"));
      Options: Grid_Options := Grid_Options'(others => <>);
      StartIndex, EndIndex: Positive;
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
      Tcl_Eval("grid info " & Tk_PathName(Child), Tk_Interp(Child));
      declare
         Result: constant String := Tcl_Get_Result(Tk_Interp(Child));
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
                    Get_Widget
                      (Result(StartIndex .. EndIndex), Tk_Interp(Child));
               when 2 =>
                  Options.Column :=
                    Extended_Natural'Value(Result(StartIndex .. EndIndex));
               when 3 =>
                  Options.Row :=
                    Extended_Natural'Value(Result(StartIndex .. EndIndex));
               when 4 =>
                  Options.Column_Span :=
                    Extended_Natural'Value(Result(StartIndex .. EndIndex));
               when 5 =>
                  Options.Row_Span :=
                    Extended_Natural'Value(Result(StartIndex .. EndIndex));
               when 6 =>
                  Options.Internal_Pad_X :=
                    Pixel_Data_Value(Result(StartIndex .. EndIndex));
               when 7 =>
                  Options.Internal_Pad_Y :=
                    Pixel_Data_Value(Result(StartIndex .. EndIndex));
               when 8 =>
                  Options.Pad_X :=
                    Pad_Array_Value(Result(StartIndex .. EndIndex));
               when 9 =>
                  Options.Pad_Y :=
                    Pad_Array_Value(Result(StartIndex .. EndIndex));
               when 10 =>
                  Options.Sticky :=
                    To_Tcl_String(Result(StartIndex .. EndIndex));
            end case;
         end loop;
      end;
      return Options;
   end Info;

   function Location
     (Master: Tk_Widget; X, Y: Pixel_Data) return Result_Array is
      Tokens: Slice_Set;
   begin
      Tcl_Eval
        ("grid location " & Tk_PathName(Master) &
         Positive_Float'Image(X.Value) &
         To_Lower(Pixel_Unit'Image(X.Value_Unit)) &
         Positive_Float'Image(Y.Value) &
         To_Lower(Pixel_Unit'Image(Y.Value_Unit)),
         Tk_Interp(Master));
      Create(Tokens, Tcl_Get_Result(Tk_Interp(Master)), " ");
      return (Extended_Natural'Value(Slice(Tokens, 1)),
         Extended_Natural'Value(Slice(Tokens, 2)));
   end Location;

   procedure Propagate(Master: Tk_Widget; Enable: Boolean := True) is
   begin
      Tcl_Eval
        ("grid propagate " & Tk_PathName(Master) & " " &
         To_Lower(Boolean'Image(Enable)),
         Tk_Interp(Master));
   end Propagate;

   function Propagate(Master: Tk_Widget) return Boolean is
   begin
      Tcl_Eval("grid propagate " & Tk_PathName(Master), Tk_Interp(Master));
      if Tcl_Get_Result(Tk_Interp(Master)) = 1 then
         return True;
      else
         return False;
      end if;
   end Propagate;

   procedure Row_Configure
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) is
   begin
      Tcl_Eval
        ("grid rowconfigure " & Tk_PathName(Master) & " " &
         To_String(Child_Name) & " " & Column_Options_To_String(Options),
         Tk_Interp(Master));
   end Row_Configure;

   procedure Row_Configure
     (Master, Child: Tk_Widget; Options: Column_Options) is
   begin
      Tcl_Eval
        ("grid rowconfigure " & Tk_PathName(Master) & " " &
         Tk_PathName(Child) & " " & Column_Options_To_String(Options),
         Tk_Interp(Master));
   end Row_Configure;

   procedure Row_Configure
     (Master: Tk_Widget; Row: Natural; Options: Column_Options) is
   begin
      Tcl_Eval
        ("grid rowconfigure " & Tk_PathName(Master) & Natural'Image(Row) &
         " " & Column_Options_To_String(Options),
         Tk_Interp(Master));
   end Row_Configure;

   function Get_Row_Options
     (Master: Tk_Widget; Row: Natural) return Column_Options is
   begin
      return Options: Column_Options do
         Options.Min_Size := Get_Value(Master, "minsize", "row", Row);
         Options.Weight := Get_Value(Master, "weight", "row", Row);
         Options.Uniform := Get_Value(Master, "uniform", "row", Row);
         Options.Pad := Get_Value(Master, "pad", "row", Row);
      end return;
   end Get_Row_Options;

   procedure Remove(Child: Tk_Widget) is
   begin
      Tcl_Eval("grid remove " & Tk_PathName(Child), Tk_Interp(Child));
   end Remove;

   procedure Remove(Widgets: Widgets_Array) is
   begin
      Tcl_Eval
        ("grid remove " & Widgets_Array_Image(Widgets), Tk_Interp(Widgets(1)));
   end Remove;

   function Size(Master: Tk_Widget) return Result_Array is
      Tokens: Slice_Set;
   begin
      Tcl_Eval("grid size " & Tk_PathName(Master), Tk_Interp(Master));
      Create(Tokens, Tcl_Get_Result(Tk_Interp(Master)), " ");
      return (Extended_Natural'Value(Slice(Tokens, 1)),
         Extended_Natural'Value(Slice(Tokens, 2)));
   end Size;

   function Slaves
     (Master: Tk_Widget; Row, Column: Extended_Natural := -1)
      return Widgets_Array is
      Tokens: Slice_Set;
      Options: Unbounded_String := Null_Unbounded_String;
   begin
      if Row > -1 then
         Append(Options, " -row" & Extended_Natural'Image(Row));
      end if;
      if Column > -1 then
         Append(Options, " -column" & Extended_Natural'Image(Column));
      end if;
      Tcl_Eval("grid slaves " & Tk_PathName(Master) & To_String(Options));
      Create(Tokens, Tcl_Get_Result(Tk_Interp(Master)), " ");
      return Widgets: Widgets_Array(1 .. Natural(Slice_Count(Tokens))) do
         for I in 1 .. Slice_Count(Tokens) loop
            Widgets(Positive(I)) :=
              Get_Widget(Slice(Tokens, I), Tk_Interp(Master));
         end loop;
      end return;
   end Slaves;

end Tk.Grid;
