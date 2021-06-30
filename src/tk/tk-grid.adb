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
with Ada.Strings;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Tcl.Lists; use Tcl.Lists;

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
      if Options.Sticky /= NONE then
         Append(Options_String, " -sticky ");
         case Options.Sticky is
            when CENTER =>
               Append(Options_String, "{}");
            when HEIGHT =>
               Append(Options_String, "ns");
            when WIDTH =>
               Append(Options_String, "we");
            when WHOLE =>
               Append(Options_String, "nwes");
            when N =>
               Append(Options_String, "n");
            when W =>
               Append(Options_String, "w");
            when E =>
               Append(Options_String, "e");
            when S =>
               Append(Options_String, "s");
            when NW =>
               Append(Options_String, "nw");
            when NE =>
               Append(Options_String, "ne");
            when SW =>
               Append(Options_String, "sw");
            when SE =>
               Append(Options_String, "se");
            when NONE =>
               null;
         end case;
      end if;
      return To_String(Source => Options_String);
   end Options_To_String;

   procedure Add
     (Child: Tk_Widget; Options: Grid_Options := Default_Grid_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid " & Tk_Path_Name(Widgt => Child) &
           Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widgt => Child));
   end Add;

   procedure Add
     (Widgets: Widgets_Array; Options: Grid_Options := Default_Grid_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid " & Widgets_Array_Image(Widgets => Widgets) &
           Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widgt => Widgets(1)));
   end Add;

   procedure Set_Anchor(Master: Tk_Widget; New_Direction: Directions_Type) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid anchor " & Tk_Path_Name(Widgt => Master) & " " &
           To_Lower(Item => Directions_Type'Image(New_Direction)),
         Interpreter => Tk_Interp(Widgt => Master));
   end Set_Anchor;

   function Get_Bounding_Box
     (Master: Tk_Widget; Column, Row, Column2, Row2: Extended_Natural := -1)
      return Bbox_Data is
      Options: Unbounded_String := Null_Unbounded_String;
      Result_List: Array_List(1 .. 4);
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Master);
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
      Result_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script =>
                  "grid bbox " & Tk_Path_Name(Widgt => Master) &
                  To_String(Source => Options),
                Interpreter => Interpreter),
           Interpreter => Interpreter);
      return Coords: Bbox_Data := Empty_Bbox_Data do
         Coords.Start_X :=
           Natural'Value(To_Ada_String(Source => Result_List(1)));
         Coords.Start_Y :=
           Natural'Value(To_Ada_String(Source => Result_List(2)));
         Coords.Width :=
           Natural'Value(To_Ada_String(Source => Result_List(3)));
         Coords.Height :=
           Natural'Value(To_Ada_String(Source => Result_List(4)));
      end return;
   end Get_Bounding_Box;

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
           "grid columnconfigure " & Tk_Path_Name(Widgt => Master) & " " &
           To_String(Source => Child_Name) & " " &
           Column_Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widgt => Master));
   end Column_Configure;

   procedure Column_Configure
     (Master, Child: Tk_Widget; Options: Column_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid columnconfigure " & Tk_Path_Name(Widgt => Master) & " " &
           Tk_Path_Name(Widgt => Child) & " " &
           Column_Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widgt => Master));
   end Column_Configure;

   procedure Column_Configure
     (Master: Tk_Widget; Column: Natural; Options: Column_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid columnconfigure " & Tk_Path_Name(Widgt => Master) &
           Natural'Image(Column) & " " &
           Column_Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widgt => Master));
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
      return
        Pixel_Data_Value
          (Value =>
             Tcl_Eval
               (Tcl_Script =>
                  "grid " & Config_Type & "configure " &
                  Tk_Path_Name(Widgt => Master) & Natural'Image(Index) & " -" &
                  Name,
                Interpreter => Tk_Interp(Widgt => Master)));
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
      return
        To_Tcl_String
          (Source =>
             Tcl_Eval
               (Tcl_Script =>
                  "grid " & Config_Type & "configure " &
                  Tk_Path_Name(Widgt => Master) & Natural'Image(Index) & " -" &
                  Name,
                Interpreter => Tk_Interp(Widgt => Master)));
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
      return
        Extended_Natural'Value
          (Tcl_Eval
             (Tcl_Script =>
                "grid " & Config_Type & "configure " &
                Tk_Path_Name(Widgt => Master) & Natural'Image(Index) & " -" &
                Name,
              Interpreter => Tk_Interp(Widgt => Master)));
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
           "grid configure " & Tk_Path_Name(Widgt => Child) &
           Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widgt => Child));
   end Configure;

   procedure Configure(Widgets: Widgets_Array; Options: Grid_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid configure " & Widgets_Array_Image(Widgets => Widgets) &
           Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widgt => Widgets(1)));
   end Configure;

   procedure Forget(Child: Tk_Widget) is
   begin
      Tcl_Eval
        (Tcl_Script => "grid forget " & Tk_Path_Name(Widgt => Child),
         Interpreter => Tk_Interp(Widgt => Child));
   end Forget;

   procedure Forget(Widgets: Widgets_Array) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid forget " & Widgets_Array_Image(Widgets => Widgets),
         Interpreter => Tk_Interp(Widgt => Widgets(1)));
   end Forget;

   function Get_Info(Child: Tk_Widget) return Grid_Options is
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
      Options: Grid_Options := Default_Grid_Options;
      Start_Index, End_Index: Positive := 1;
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Child);
   begin
      Tcl_Eval
        (Tcl_Script => "grid info " & Tk_Path_Name(Widgt => Child),
         Interpreter => Interpreter);
      Parse_Result_Block :
      declare
         use Ada.Strings.Fixed;

         Result: constant String := Tcl_Get_Result(Interpreter => Interpreter);
         function Horizontal_Pad_Data_Value
           (Value: String) return Horizontal_Pad_Data is
            Result_List: constant Array_List :=
              Split_List(List => Value, Interpreter => Interpreter);
         begin
            return
              Result_Pad: Horizontal_Pad_Data := Default_Horizontal_Pad_Data do
               Result_Pad.Left :=
                 Pixel_Data_Value
                   (Value => To_Ada_String(Source => Result_List(1)));
               Result_Pad.Right :=
                 Pixel_Data_Value
                   (Value => To_Ada_String(Source => Result_List(1)));
            end return;
         end Horizontal_Pad_Data_Value;
         function Vertical_Pad_Data_Value
           (Value: String) return Vertical_Pad_Data is
            Result_List: constant Array_List :=
              Split_List(List => Value, Interpreter => Interpreter);
         begin
            return
              Result_Pad: Vertical_Pad_Data := Default_Vertical_Pad_Data do
               Result_Pad.Top :=
                 Pixel_Data_Value
                   (Value => To_Ada_String(Source => Result_List(1)));
               Result_Pad.Bottom :=
                 Pixel_Data_Value
                   (Value => To_Ada_String(Source => Result_List(1)));
            end return;
         end Vertical_Pad_Data_Value;
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
                       Interpreter => Interpreter);
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
                    Horizontal_Pad_Data_Value
                      (Value => Result(Start_Index .. End_Index));
               when 9 =>
                  Options.Pad_Y :=
                    Vertical_Pad_Data_Value
                      (Value => Result(Start_Index .. End_Index));
               when 10 =>
                  if Result(Start_Index .. End_Index) = "n" then
                     Options.Sticky := N;
                  elsif Result(Start_Index .. End_Index) = "s" then
                     Options.Sticky := S;
                  elsif Result(Start_Index .. End_Index) = "w" then
                     Options.Sticky := W;
                  elsif Result(Start_Index .. End_Index) = "e" then
                     Options.Sticky := E;
                  elsif Result(Start_Index .. End_Index) = "{}" then
                     Options.Sticky := CENTER;
                  elsif Result(Start_Index .. End_Index) in "nw" | "wn" then
                     Options.Sticky := NW;
                  elsif Result(Start_Index .. End_Index) in "ne" | "en" then
                     Options.Sticky := NE;
                  elsif Result(Start_Index .. End_Index) in "sw" | "ws" then
                     Options.Sticky := SW;
                  elsif Result(Start_Index .. End_Index) in "se" | "es" then
                     Options.Sticky := SE;
                  elsif Result(Start_Index .. End_Index) in "ns" | "sn" then
                     Options.Sticky := HEIGHT;
                  elsif Result(Start_Index .. End_Index) in "we" | "ew" then
                     Options.Sticky := WIDTH;
                  else
                     Options.Sticky := WHOLE;
                  end if;
            end case;
         end loop Set_Options_Loop;
      end Parse_Result_Block;
      return Options;
   end Get_Info;

   function Get_Location
     (Master: Tk_Widget; X, Y: Pixel_Data) return Location_Position is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Master);
      Result_List: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script =>
                  "grid location " & Tk_Path_Name(Widgt => Master) &
                  Positive_Float'Image(X.Value) &
                  To_Lower(Item => Pixel_Unit'Image(X.Value_Unit)) &
                  Positive_Float'Image(Y.Value) &
                  To_Lower(Item => Pixel_Unit'Image(Y.Value_Unit)),
                Interpreter => Interpreter),
           Interpreter => Interpreter);
   begin
      return
        (Column =>
           Extended_Natural'Value(To_Ada_String(Source => Result_List(1))),
         Row =>
           Extended_Natural'Value(To_Ada_String(Source => Result_List(2))));
   end Get_Location;

   procedure Set_Propagate(Master: Tk_Widget; Enable: Boolean := True) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid propagate " & Tk_Path_Name(Widgt => Master) & " " &
           To_Lower(Item => Boolean'Image(Enable)),
         Interpreter => Tk_Interp(Widgt => Master));
   end Set_Propagate;

   procedure Row_Configure
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid rowconfigure " & Tk_Path_Name(Widgt => Master) & " " &
           To_String(Source => Child_Name) & " " &
           Column_Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widgt => Master));
   end Row_Configure;

   procedure Row_Configure
     (Master, Child: Tk_Widget; Options: Column_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid rowconfigure " & Tk_Path_Name(Widgt => Master) & " " &
           Tk_Path_Name(Widgt => Child) & " " &
           Column_Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widgt => Master));
   end Row_Configure;

   procedure Row_Configure
     (Master: Tk_Widget; Row: Natural; Options: Column_Options) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid rowconfigure " & Tk_Path_Name(Widgt => Master) &
           Natural'Image(Row) & " " &
           Column_Options_To_String(Options => Options),
         Interpreter => Tk_Interp(Widgt => Master));
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
        (Tcl_Script => "grid remove " & Tk_Path_Name(Widgt => Child),
         Interpreter => Tk_Interp(Widgt => Child));
   end Remove;

   procedure Remove(Widgets: Widgets_Array) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "grid remove " & Widgets_Array_Image(Widgets => Widgets),
         Interpreter => Tk_Interp(Widgt => Widgets(1)));
   end Remove;

   function Get_Size(Master: Tk_Widget) return Location_Position is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Master);
      Result_List: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "grid size " & Tk_Path_Name(Widgt => Master),
                Interpreter => Interpreter),
           Interpreter => Interpreter);
   begin
      return
        (Column =>
           Extended_Natural'Value(To_Ada_String(Source => Result_List(1))),
         Row =>
           Extended_Natural'Value(To_Ada_String(Source => Result_List(2))));
   end Get_Size;

   function Get_Slaves
     (Master: Tk_Widget; Row, Column: Extended_Natural := -1)
      return Widgets_Array is
      Options: Unbounded_String := Null_Unbounded_String;
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Master);
   begin
      if Row > -1 then
         Append
           (Source => Options,
            New_Item => " -row" & Extended_Natural'Image(Row));
      end if;
      if Column > -1 then
         Append
           (Source => Options,
            New_Item => " -column" & Extended_Natural'Image(Column));
      end if;
      Return_Block :
      declare
         Result_List: constant Array_List :=
           Split_List
             (List =>
                Tcl_Eval
                  (Tcl_Script =>
                     "grid slaves " & Tk_Path_Name(Widgt => Master) &
                     To_String(Source => Options),
                   Interpreter => Interpreter),
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
      end Return_Block;
   end Get_Slaves;

end Tk.Grid;
