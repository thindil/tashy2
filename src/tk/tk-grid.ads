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

with Tcl.Strings; use Tcl.Strings;
with Tk.Widget; use Tk.Widget;

-- ****h* Tk/Grid
-- FUNCTION
-- Provide bindings for manipulate Tk geometry manager grid
-- SOURCE
package Tk.Grid is
-- ****

   -- ****s* Grid/Grid.Grid_Options
   -- FUNCTION
   -- Data structure for all available grid slaves options
   -- OPTIONS
   -- Column     - Index of column in which the widget is placed. Index
   --              starts from zero
   -- ColumnSpan - Amount of columns which the widget occupy
   -- In_Master  - Tk_Widget which is the master for the selected widget
   -- IPadX      - Amount of internal horizontal padding for the widget
   -- IPadY      - Amount of internal vertical padding for the widget
   -- PadX       - Amount of external horizontal padding for the widget. The
   --              first value is left padding, second right padding
   -- PadY       - Amount of external vertical padding for the widget. The
   --              first value is top padding, the second is bottom padding
   -- Row        - Index of row in which the widget is placed. Index starts
   --              from zero.
   -- RowSpan    - Amount of rows which the widget occupy
   -- Sticky     - Position (or stretch) the widget in the selected directions.
   --              Possible values are combinations of 'n', 's', 'w' and 'e'
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Grid_Options is record
      Column: Extended_Natural;
      ColumnSpan: Extended_Natural;
      In_Master: Tk_Widget;
      IPadX: Pixel_Data;
      IPadY: Pixel_Data;
      PadX: Pad_Array := (others => <>);
      PadY: Pad_Array := (others => <>);
      Row: Extended_Natural;
      RowSpan: Extended_Natural;
      Sticky: Tcl_String;
   end record;
   -- ****

   -- ****s* Grid/Grid.Column_Options
   -- FUNCTION
   -- Data structure for all available grid rows and columns options
   -- OPTIONS
   -- MinSize - Minimum size of the selected rows or columns
   -- Weight  - Weigth of the selected rows or columns. 0 means no resize,
   --           2 means that selected rows or columns will grow twice the rate
   --           as rows or columns with weight 1.
   -- Uniform - Name of the uniform group to which rows or columns belong
   -- Pad     - Padding added to the largest widget in rows or columns
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Column_Options is record
      MinSize: Pixel_Data;
      Weight: Extended_Natural;
      Uniform: Tcl_String;
      Pad: Pixel_Data;
   end record;
   -- ****

   -- ****t* Grid/Grid.Result_Array
   -- FUNCTION
   -- Array used mostly as a return value for some functions
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Result_Array is array(1 .. 2) of Extended_Natural;
   -- ****

   -- ****f* Grid/Grid.Add_(single_widget)
   -- FUNCTION
   -- Add the selected Tk_Widget to the grid geometry manager
   -- PARAMETERS
   -- Widget  - Tk_Widget which will be added to the grid
   -- Options - Grid_Options for the selected widget. Can be empty. Default
   --           value is empty
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Add My_Label widget to the grid which will be occupy two rows
   -- Add(My_Label, (RowSpan => 2, others => <>));
   -- SEE ALSO
   -- Grid.Add_(many_widgets)
   -- SOURCE
   procedure Add
     (Widget: Tk_Widget;
      Options: Grid_Options := Grid_Options'(others => <>)) with
      Pre => Widget /= Null_Widget;
      -- ****

      -- ****f* Grid/Grid.Add_(many_widget)
      -- FUNCTION
      -- Add the selected Tk_Widgets to the grid geometry manager
      -- PARAMETERS
      -- Widgets - The array of Tk_Widgets which will be added to the grid
      -- Options - Grid_Options for the selected widgets. Can be empty. Default
      --           value is empty
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Add My_Label and My_Button widgets to the grid
      -- Add((My_Label, My_Button));
      -- SEE ALSO
      -- Grid.Add_(single_widgets)
      -- SOURCE
   procedure Add
     (Widgets: Widgets_Array;
      Options: Grid_Options := Grid_Options'(others => <>)) with
      Pre => Widgets'Length > 0;
      -- ****

   procedure Anchor(Master: Tk_Widget; New_Direction: Directions_Type) with
      Pre => Master /= Null_Widget and New_Direction /= NONE;

   function Anchor(Master: Tk_Widget) return Directions_Type with
      Pre => Master /= Null_Widget;

   function BBox
     (Master: Tk_Widget; Column, Row, Column2, Row2: Extended_Natural := -1)
      return BBox_Array with
      Pre => Master /= Null_Widget;

   procedure Column_Configure
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) with
      Pre => Master /= Null_Widget and Length(Child_Name) > 0 and
      Options /= Column_Options'(others => <>);

   procedure Column_Configure
     (Master, Child: Tk_Widget; Options: Column_Options) with
      Pre => Master /= Null_Widget and Child /= Null_Widget and
      Options /= Column_Options'(others => <>);

   procedure Column_Configure
     (Master: Tk_Widget; Column: Natural; Options: Column_Options) with
      Pre => Master /= Null_Widget and
      Options /= Column_Options'(others => <>);

   function Get_Column_Options
     (Master: Tk_Widget; Index: Tcl_String) return Column_Options with
      Pre => Master /= Null_Widget and Length(Index) > 0;

   function Get_Column_Options
     (Master, Child: Tk_Widget) return Column_Options with
      Pre => Master /= Null_Widget and Child /= Null_Widget;

   function Get_Column_Options
     (Master: Tk_Widget; Column: Natural) return Column_Options with
      Pre => Master /= Null_Widget;

   procedure Configure(Widget: Tk_Widget; Options: Grid_Options) with
      Pre => Widget /= Null_Widget and Options /= Grid_Options'(others => <>);

   procedure Configure(Widgets: Widgets_Array; Options: Grid_Options) with
      Pre => Widgets'Length > 0 and Options /= Grid_Options'(others => <>);

   procedure Forget(Widget: Tk_Widget) with
      Pre => Widget /= Null_Widget;

   procedure Forget(Widgets: Widgets_Array) with
      Pre => Widgets'Length > 0;

   function Info(Widget: Tk_Widget) return Grid_Options with
      Pre => Widget /= Null_Widget;

   function Location
     (Master: Tk_Widget; X, Y: Pixel_Data) return Result_Array with
      Pre => Master /= Null_Widget and X.Value > -1.0 and Y.Value > -1.0;

   procedure Propagate(Master: Tk_Widget; Enable: Boolean := True) with
      Pre => Master /= Null_Widget;

   function Propagate(Master: Tk_Widget) return Boolean with
      Pre => Master /= Null_Widget;

   procedure Row_Configure
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) with
      Pre => Master /= Null_Widget and Length(Child_Name) > 0 and
      Options /= Column_Options'(others => <>);

   procedure Row_Configure
     (Master, Child: Tk_Widget; Options: Column_Options) with
      Pre => Master /= Null_Widget and Child /= Null_Widget and
      Options /= Column_Options'(others => <>);

   procedure Row_Configure
     (Master: Tk_Widget; Row: Natural; Options: Column_Options) with
      Pre => Master /= Null_Widget and
      Options /= Column_Options'(others => <>);

   function Get_Row_Options
     (Master: Tk_Widget; Index: Tcl_String) return Column_Options with
      Pre => Master /= Null_Widget and Length(Index) > 0;

   function Get_Row_Options
     (Master, Child: Tk_Widget) return Column_Options with
      Pre => Master /= Null_Widget and Child /= Null_Widget;

   function Get_Row_Options
     (Master: Tk_Widget; Row: Natural) return Column_Options with
      Pre => Master /= Null_Widget;

   procedure Remove(Widget: Tk_Widget) with
      Pre => Widget /= Null_Widget;

   procedure Remove(Widgets: Widgets_Array) with
      Pre => Widgets'Length > 0;

   function Size(Master: Tk_Widget) return Result_Array with
      Pre => Master /= Null_Widget;

   function Slaves
     (Master: Tk_Widget; Row, Column: Extended_Natural := -1)
      return Widgets_Array with
      Pre => Master /= Null_Widget;

end Tk.Grid;
