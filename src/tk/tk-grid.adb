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
      Options_String: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "column", Value => Options.Column,
         Options_String => Options_String);
      Option_Image
        (Name => "columnspan", Value => Options.Column_Span,
         Options_String => Options_String);
      Option_Image
        (Name => "in", Value => Options.In_Master,
         Options_String => Options_String);
      Option_Image
        (Name => "ipadx", Value => Options.Internal_Pad_X,
         Options_String => Options_String);
      Option_Image
        (Name => "ipady", Value => Options.Internal_Pad_Y,
         Options_String => Options_String);
      Option_Image
        (Name => "padx", Value => Options.Pad_X,
         Options_String => Options_String);
      Option_Image
        (Name => "pady", Value => Options.Pad_Y,
         Options_String => Options_String);
      Option_Image
        (Name => "row", Value => Options.Row,
         Options_String => Options_String);
      Option_Image
        (Name => "rowspan", Value => Options.Row_Span,
         Options_String => Options_String);
      Option_Image
        (Name => "sticky", Value => Options.Sticky,
         Options_String => Options_String);
      return To_String(Source => Options_String);
   end Options_To_String;

   procedure Add
     (Child: Tk_Widget;
      Options: Grid_Options := Grid_Options'(others => <>)) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid " & Tk_PathName(Widget => Child) & " " &
           Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widget => Child));
   end Add;

   procedure Add
     (Widgets: Widgets_Array;
      Options: Grid_Options := Grid_Options'(others => <>)) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid " & Widgets_Array_Image(Widgets => Widgets) & " " &
           Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widget => Widgets(1)));
   end Add;

   procedure Anchor(Master: Tk_Widget; New_Direction: Directions_Type) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid anchor " & Tk_PathName(Widget => Master) & " " &
           To_Lower(Item => Directions_Type'Image(New_Direction)),
         Interpreter => Tk_Interp(Widget => Master));
   end Anchor;

   function Anchor(Master: Tk_Widget) return Directions_Type is
   begin
      Tcl_Eval
        (Tcl_Script => "grid anchor " & Tk_PathName(Widget => Master),
         Interpreter => Tk_Interp(Widget => Master));
      return Directions_Type'Value(Tcl_Get_Result);
   end Anchor;

   function Bounding_Box
     (Master: Tk_Widget; Column, Row, Column2, Row2: Extended_Natural := -1)
      return BBox_Array is
      Options: Unbounded_String := Null_Unbounded_String;
      Tokens: Slice_Set;
   begin
      if Column > -1 then
         Append(Source => Options, New_Item => Extended_Natural'Image(Column));
      end if;
      if Row > -1 then
         if Column = -1 then
            raise Tcl_Exception with "Column value not specified";
         end if;
         Append(Source => Options, New_Item => Extended_Natural'Image(Row));
      end if;
      if Column2 > -1 then
         if Column = -1 then
            raise Tcl_Exception with "Column value not specified";
         end if;
         if Row = -1 then
            raise Tcl_Exception with "Row value not specified";
         end if;
         Append
           (Source => Options, New_Item => Extended_Natural'Image(Column2));
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
         Append(Source => Options, New_Item => Extended_Natural'Image(Row2));
      end if;
      Tcl_Eval
        (Tcl_Script =>
           "grid bbox " & Tk_PathName(Widget => Master) &
           To_String(Source => Options),
         Interpreter => Tk_Interp(Widget => Master));
      Create(S => Tokens, From => Tcl_Get_Result, Separators => " ");
      return Coords: BBox_Array := (others => 0) do
         Fill_BBox_Array_Loop :
         for I in 1 .. 4 loop
            Coords(I) :=
              Natural'Value(Slice(S => Tokens, Index => Slice_Number(I)));
         end loop Fill_BBox_Array_Loop;
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
      Options_String: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "minsize", Value => Options.Min_Size,
         Options_String => Options_String);
      Option_Image
        (Name => "weight", Value => Options.Weight,
         Options_String => Options_String);
      Option_Image
        (Name => "uniform", Value => Options.Uniform,
         Options_String => Options_String);
      Option_Image
        (Name => "pad", Value => Options.Pad,
         Options_String => Options_String);
      return To_String(Source => Options_String);
   end Column_Options_To_String;

   procedure Column_Configure
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid columnconfigure " & Tk_PathName(Widget => Master) & " " &
           To_String(Source => Child_Name) & " " &
           Column_Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widget => Master));
   end Column_Configure;

   procedure Column_Configure
     (Master, Child: Tk_Widget; Options: Column_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid columnconfigure " & Tk_PathName(Widget => Master) & " " &
           Tk_PathName(Widget => Child) & " " &
           Column_Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widget => Master));
   end Column_Configure;

   procedure Column_Configure
     (Master: Tk_Widget; Column: Natural; Options: Column_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid columnconfigure " & Tk_PathName(Widget => Master) &
           Natural'Image(Column) & " " &
           Column_Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widget => Master));
   end Column_Configure;

   -- ****if* Grid/Grid.Get_Value_(Pixel_Data)
   -- FUNCTION
   -- Get the value of the selected column or row configuration
   -- PARAMETERS
   -- Master      - Tk_Widget which is master of the selected grid geometry
   --               manager
   -- Name        - Name of the option to get
   -- Config_Type - Type of config. Can be column or row
   -- Index       - Index of the column or row which option will be get
   -- RESULT
   -- Pixel_Data structure with value of the selected option
   -- HISTORY
   -- 8.6.0 - Added
   -- SEE ALSO
   -- Grid.Get_Value_(Tcl_String), Grid.Get_Value_(Extended_Natural)
   -- SOURCE
   function Get_Value
     (Master: Tk_Widget; Name, Config_Type: String; Index: Natural)
      return Pixel_Data is
   -- ****
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid " & Config_Type & "configure " &
           Tk_PathName(Widget => Master) & Natural'Image(Index) & " -" & Name,
         Interpreter => Tk_Interp(Widget => Master));
      return Pixel_Data_Value
          (Value =>
             Tcl_Get_Result(Interpreter => Tk_Interp(Widget => Master)));
   end Get_Value;

   -- ****if* Grid/Grid.Get_Value_(Tcl_String)
   -- FUNCTION
   -- Get the value of the selected column or row configuration
   -- PARAMETERS
   -- Master      - Tk_Widget which is master of the selected grid geometry
   --               manager
   -- Name        - Name of the option to get
   -- Config_Type - Type of config. Can be column or row
   -- Index       - Index of the column or row which option will be get
   -- RESULT
   -- Tcl_String with value of the selected option
   -- HISTORY
   -- 8.6.0 - Added
   -- SEE ALSO
   -- Grid.Get_Value_(Pixel_Data), Grid.Get_Value_(Extended_Natural)
   -- SOURCE
   function Get_Value
     (Master: Tk_Widget; Name, Config_Type: String; Index: Natural)
      return Tcl_String is
   -- ****
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid " & Config_Type & "configure " &
           Tk_PathName(Widget => Master) & Natural'Image(Index) & " -" & Name,
         Interpreter => Tk_Interp(Widget => Master));
      return To_Tcl_String
          (Source =>
             Tcl_Get_Result(Interpreter => Tk_Interp(Widget => Master)));
   end Get_Value;

   -- ****if* Grid/Grid.Get_Value_(Extended_Natural)
   -- FUNCTION
   -- Get the value of the selected column or row configuration
   -- PARAMETERS
   -- Master      - Tk_Widget which is master of the selected grid geometry
   --               manager
   -- Name        - Name of the option to get
   -- Config_Type - Type of config. Can be column or row
   -- Index       - Index of the column or row which option will be get
   -- RESULT
   -- Extended_Natural with value of the selected option
   -- HISTORY
   -- 8.6.0 - Added
   -- SEE ALSO
   -- Grid.Get_Value_(Pixel_Data), Grid.Get_Value_(Tcl_String)
   -- SOURCE
   function Get_Value
     (Master: Tk_Widget; Name, Config_Type: String; Index: Natural)
      return Extended_Natural is
   -- ****
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid " & Config_Type & "configure " &
           Tk_PathName(Widget => Master) & Natural'Image(Index) & " -" & Name,
         Interpreter => Tk_Interp(Widget => Master));
      return Extended_Natural'Value
          (Tcl_Get_Result(Interpreter => Tk_Interp(Widget => Master)));
   end Get_Value;

   function Get_Column_Options
     (Master: Tk_Widget; Column: Natural) return Column_Options is
   begin
      return Options: Column_Options := Default_Column_Options do
         Options.Min_Size :=
           Get_Value
             (Master => Master, Name => "minsize", Config_Type => "column",
              Index => Column);
         Options.Weight :=
           Get_Value
             (Master => Master, Name => "weight", Config_Type => "column",
              Index => Column);
         Options.Uniform :=
           Get_Value
             (Master => Master, Name => "uniform", Config_Type => "column",
              Index => Column);
         Options.Pad :=
           Get_Value
             (Master => Master, Name => "pad", Config_Type => "column",
              Index => Column);
      end return;
   end Get_Column_Options;

   procedure Configure(Child: Tk_Widget; Options: Grid_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid configure " & Tk_PathName(Widget => Child) &
           Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widget => Child));
   end Configure;

   procedure Configure(Widgets: Widgets_Array; Options: Grid_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid configure " & Widgets_Array_Image(Widgets => Widgets) &
           Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widget => Widgets(1)));
   end Configure;

   procedure Forget(Child: Tk_Widget) is
   begin
      Tcl_Eval
        (Tcl_Script => "grid forget " & Tk_PathName(Widget => Child),
         Interpreter => Tk_Interp(Widget => Child));
   end Forget;

   procedure Forget(Widgets: Widgets_Array) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid forget " & Widgets_Array_Image(Widgets => Widgets),
         Interpreter => Tk_Interp(Widget => Widgets(1)));
   end Forget;

   function Info(Child: Tk_Widget) return Grid_Options is
      Options_Names: constant array(1 .. 10) of Unbounded_String :=
        (1 => To_Unbounded_String(Source => "-in"),
         2 => To_Unbounded_String(Source => "-column"),
         3 => To_Unbounded_String(Source => "-row"),
         4 => To_Unbounded_String(Source => "-columnspan"),
         5 => To_Unbounded_String(Source => "-rowspan"),
         6 => To_Unbounded_String(Source => "-ipadx"),
         7 => To_Unbounded_String(Source => "-ipady"),
         8 => To_Unbounded_String(Source => "-padx"),
         9 => To_Unbounded_String(Source => "-pady"),
         10 => To_Unbounded_String(Source => "-sticky"));
      Options: Grid_Options := Grid_Options'(others => <>);
      Start_Index, End_Index: Positive := 1;
   begin
      Tcl_Eval
        (Tcl_Script => "grid info " & Tk_PathName(Widget => Child),
         Interpreter => Tk_Interp(Widget => Child));
      Parse_Result_Block :
      declare
         Result: constant String :=
           Tcl_Get_Result(Interpreter => Tk_Interp(Widget => Child));
         function Pad_Array_Value(Value: String) return Pad_Array is
            Tokens: Slice_Set;
         begin
            if Value(Value'First) = '{' then
               Create
                 (S => Tokens,
                  From => Value(Value'First + 1 .. Value'Last - 1),
                  Separators => " ");
            else
               Create(S => Tokens, From => Value, Separators => " ");
            end if;
            return
              Result_Pad: Pad_Array := (others => Pixel_Data'(others => <>)) do
               Set_Pad_Array_Loop :
               for I in 1 .. Slice_Count(S => Tokens) loop
                  Result_Pad(Positive(I)) :=
                    Pixel_Data_Value(Value => Slice(S => Tokens, Index => 1));
               end loop Set_Pad_Array_Loop;
            end return;
         end Pad_Array_Value;
      begin
         Set_Options_Loop :
         for I in Options_Names'Range loop
            Start_Index :=
              Index
                (Source => Result,
                 Pattern => To_String(Source => Options_Names(I))) +
              Length(Source => Options_Names(I)) + 1;
            if I < Options_Names'Last then
               End_Index :=
                 Index
                   (Source => Result,
                    Pattern => To_String(Source => Options_Names(I + 1))) -
                 2;
            else
               End_Index := Result'Last;
            end if;
            case I is
               when 1 =>
                  Options.In_Master :=
                    Get_Widget
                      (Path_Name => Result(Start_Index .. End_Index),
                       Interpreter => Tk_Interp(Widget => Child));
               when 2 =>
                  Options.Column :=
                    Extended_Natural'Value(Result(Start_Index .. End_Index));
               when 3 =>
                  Options.Row :=
                    Extended_Natural'Value(Result(Start_Index .. End_Index));
               when 4 =>
                  Options.Column_Span :=
                    Extended_Natural'Value(Result(Start_Index .. End_Index));
               when 5 =>
                  Options.Row_Span :=
                    Extended_Natural'Value(Result(Start_Index .. End_Index));
               when 6 =>
                  Options.Internal_Pad_X :=
                    Pixel_Data_Value
                      (Value => Result(Start_Index .. End_Index));
               when 7 =>
                  Options.Internal_Pad_Y :=
                    Pixel_Data_Value
                      (Value => Result(Start_Index .. End_Index));
               when 8 =>
                  Options.Pad_X :=
                    Pad_Array_Value(Value => Result(Start_Index .. End_Index));
               when 9 =>
                  Options.Pad_Y :=
                    Pad_Array_Value(Value => Result(Start_Index .. End_Index));
               when 10 =>
                  Options.Sticky :=
                    To_Tcl_String(Source => Result(Start_Index .. End_Index));
            end case;
         end loop Set_Options_Loop;
      end Parse_Result_Block;
      return Options;
   end Info;

   function Location
     (Master: Tk_Widget; X, Y: Pixel_Data) return Result_Array is
      Tokens: Slice_Set;
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid location " & Tk_PathName(Widget => Master) &
           Positive_Float'Image(X.Value) &
           To_Lower(Item => Pixel_Unit'Image(X.Value_Unit)) &
           Positive_Float'Image(Y.Value) &
           To_Lower(Item => Pixel_Unit'Image(Y.Value_Unit)),
         Interpreter => Tk_Interp(Widget => Master));
      Create
        (S => Tokens,
         From => Tcl_Get_Result(Interpreter => Tk_Interp(Widget => Master)),
         Separators => " ");
      return (1 => Extended_Natural'Value(Slice(S => Tokens, Index => 1)),
         2 => Extended_Natural'Value(Slice(S => Tokens, Index => 2)));
   end Location;

   procedure Propagate(Master: Tk_Widget; Enable: Boolean := True) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid propagate " & Tk_PathName(Widget => Master) & " " &
           To_Lower(Item => Boolean'Image(Enable)),
         Interpreter => Tk_Interp(Widget => Master));
   end Propagate;

   function Propagate(Master: Tk_Widget) return Boolean is
   begin
      Tcl_Eval
        (Tcl_Script => "grid propagate " & Tk_PathName(Widget => Master),
         Interpreter => Tk_Interp(Widget => Master));
      if Tcl_Get_Result(Interpreter => Tk_Interp(Widget => Master)) = 1 then
         return True;
      end if;
      return False;
   end Propagate;

   procedure Row_Configure
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid rowconfigure " & Tk_PathName(Widget => Master) & " " &
           To_String(Source => Child_Name) & " " &
           Column_Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widget => Master));
   end Row_Configure;

   procedure Row_Configure
     (Master, Child: Tk_Widget; Options: Column_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid rowconfigure " & Tk_PathName(Widget => Master) & " " &
           Tk_PathName(Widget => Child) & " " &
           Column_Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widget => Master));
   end Row_Configure;

   procedure Row_Configure
     (Master: Tk_Widget; Row: Natural; Options: Column_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid rowconfigure " & Tk_PathName(Widget => Master) &
           Natural'Image(Row) & " " &
           Column_Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widget => Master));
   end Row_Configure;

   function Get_Row_Options
     (Master: Tk_Widget; Row: Natural) return Column_Options is
   begin
      return Options: Column_Options := Default_Column_Options do
         Options.Min_Size :=
           Get_Value
             (Master => Master, Name => "minsize", Config_Type => "row",
              Index => Row);
         Options.Weight :=
           Get_Value
             (Master => Master, Name => "weight", Config_Type => "row",
              Index => Row);
         Options.Uniform :=
           Get_Value
             (Master => Master, Name => "uniform", Config_Type => "row",
              Index => Row);
         Options.Pad :=
           Get_Value
             (Master => Master, Name => "pad", Config_Type => "row",
              Index => Row);
      end return;
   end Get_Row_Options;

   procedure Remove(Child: Tk_Widget) is
   begin
      Tcl_Eval
        (Tcl_Script => "grid remove " & Tk_PathName(Widget => Child),
         Interpreter => Tk_Interp(Widget => Child));
   end Remove;

   procedure Remove(Widgets: Widgets_Array) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid remove " & Widgets_Array_Image(Widgets => Widgets),
         Interpreter => Tk_Interp(Widget => Widgets(1)));
   end Remove;

   function Size(Master: Tk_Widget) return Result_Array is
      Tokens: Slice_Set;
   begin
      Tcl_Eval
        (Tcl_Script => "grid size " & Tk_PathName(Widget => Master),
         Interpreter => Tk_Interp(Widget => Master));
      Create
        (S => Tokens,
         From => Tcl_Get_Result(Interpreter => Tk_Interp(Widget => Master)),
         Separators => " ");
      return (Extended_Natural'Value(Slice(S => Tokens, Index => 1)),
         Extended_Natural'Value(Slice(S => Tokens, Index => 2)));
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
      Tcl_Eval
        ("grid slaves " & Tk_PathName(Widget => Master) & To_String(Options));
      Create(Tokens, Tcl_Get_Result(Tk_Interp(Widget => Master)), " ");
      return Widgets: Widgets_Array(1 .. Natural(Slice_Count(Tokens))) do
         for I in 1 .. Slice_Count(Tokens) loop
            Widgets(Positive(I)) :=
              Get_Widget(Slice(Tokens, I), Tk_Interp(Widget => Master));
         end loop;
      end return;
   end Slaves;

end Tk.Grid;
