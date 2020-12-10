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
   -- Widget  - Tk_Widget which will be added to the grid. Must be existing
   --           widget.
   -- Options - Grid_Options for the selected widget. Can be empty. Default
   --           value is empty
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Add My_Label widget to the grid which will be occupy two rows
   -- Add(My_Label, (RowSpan => 2, others => <>));
   -- SEE ALSO
   -- Grid.Add_(many_widgets)
   -- COMMANDS
   -- grid widget ?options?
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
      -- COMMANDS
      -- grid widget ?widget ...? ?options?
      -- SOURCE
   procedure Add
     (Widgets: Widgets_Array;
      Options: Grid_Options := Grid_Options'(others => <>)) with
      Pre => Widgets'Length > 0;
      -- ****

      -- ****f* Grid/Grid.Anchor_(procedure)
      -- FUNCTION
      -- Set how to place the grid withing the master when no row or column
      -- has any weight.
      -- PARAMETERS
      -- Master        - Tk_Widget which is master widget for the grid. Must
      --                 be existing widget
      -- New_Direction - New direction for the anchor. Cannot be set to NONE.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set anchor of grid in My_Frame widget to west
      -- Anchor(My_Frame, W);
      -- SEE ALSO
      -- Grid.Anchor_(function)
      -- COMMANDS
      -- grid anchor master new_direction
      -- SOURCE
   procedure Anchor(Master: Tk_Widget; New_Direction: Directions_Type) with
      Pre => Master /= Null_Widget and New_Direction /= NONE;
      -- ****

      -- ****f* Grid/Grid.Anchor_(function)
      -- FUNCTION
      -- Get the current anchor value for the selected grid geometry manager
      -- PARAMETERS
      -- Master - Tk_Widget in which the grid is. Must be existing widget
      -- RESULT
      -- Direction_Type with value of current the grid anchor
      -- EXAMPLE
      -- -- Get anchor of grid in My_Frame widget to west
      -- Anchor(My_Frame);
      -- SEE ALSO
      -- Grid.Anchor_(procedure)
      -- COMMANDS
      -- grid anchor master
      -- SOURCE
   function Anchor(Master: Tk_Widget) return Directions_Type with
      Pre => Master /= Null_Widget;
      -- ****

      -- ****f* Tk.Grid/BBox
      -- FUNCTION
      -- Get the bounding box of the selected grid
      -- PARAMETERS
      -- Master  - Tk_Widget in which the grid is. Must be existing widget
      -- Column  - The starting column for the bounding box of the grid.
      --           Default value is -1 (as empty). If Column has other than
      --           default value, Row must be specified too
      -- Row     - The starting row for the bounding box of the grid. Default
      --           value is -1 (as empty). If Row has other than default
      --           value, Column must be specified too
      -- Column2 - The ending column for the bounding box of the grid. Default
      --           value is -1 (as empty). If Column2 has other than default
      --           value, Column, Row and Row2 must be specified too
      -- Row2    - The ending column for the bounding box of the grid. Default
      --           value is -1 (as empty). If Row2 has other than default
      --           value, Column, Row and Column2 must be specified too
      -- RESULT
      -- BBox_Array with 4 values. The first two are staring point (x, y) of
      -- the bounding box, the third is width and the fourth is height of the
      -- bounding box. If Column and Row are specified, then return the
      -- bouding box of the selected cell. If Column, Row, Column2 and Row2
      -- are specified then return the bouding box of the selected columns and
      -- rows.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the bounding box of grid in My_Frame widget
      -- Bounding_Box: constant BBox_Array := BBox(My_Frame);
      -- COMMANDS
      -- grid bbox master ?column row? ?column2 row2?
      -- SOURCE
   function BBox
     (Master: Tk_Widget; Column, Row, Column2, Row2: Extended_Natural := -1)
      return BBox_Array with
      Pre => Master /= Null_Widget;
      -- ****

      -- ****f* Grid/Grid.Column_Configure_(child_name)
      -- FUNCTION
      -- Configure the selected column in the selected grid
      -- PARAMETERS
      -- Master     - Tk_Widget in which the grid is. Must be existing widget
      -- Child_Name - The name of the child widget which column will be
      --              configured. Cannot be empty
      -- Options    - Column_Options to set. Cannot be empty
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the weight of grid in My_Frame where .myframe.mybutton is to 1
      -- Column_Configure(My_Frame, To_Tcl_String(".myframe.mybutton"), (Weight => 1, others => <>));
      -- COMMANDS
      -- grid columnconfigure master child_name options
      -- SEE ALSO
      -- Grid.Column_Configure_(child), Grid.Column_Configure_(column_number)
      -- SOURCE
   procedure Column_Configure
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) with
      Pre => Master /= Null_Widget and Length(Child_Name) > 0 and
      Options /= Column_Options'(others => <>);
      -- ****

      -- ****f* Grid/Grid.Column_Configure_(child)
      -- FUNCTION
      -- Configure the selected column in the selected grid
      -- PARAMETERS
      -- Master  - Tk_Widget in which the grid is. Must be existing widget
      -- Child   - The child widget which column will be configured. Must be
      --           existing widget.
      -- Options - Column_Options to set. Cannot be empty
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the weight of grid in My_Frame where My_Button2 is to 2
      -- Column_Configure(My_Frame, My_Button2, (Weight => 2, others => <>));
      -- COMMANDS
      -- grid columnconfigure master child options
      -- SEE ALSO
      -- Grid.Column_Configure_(child_name), Grid.Column_Configure_(column_number)
      -- SOURCE
   procedure Column_Configure
     (Master, Child: Tk_Widget; Options: Column_Options) with
      Pre => Master /= Null_Widget and Child /= Null_Widget and
      Options /= Column_Options'(others => <>);
      -- ****

      -- ****f* Grid/Grid.Column_Configure_(column_number)
      -- FUNCTION
      -- Configure the selected column in the selected grid
      -- PARAMETERS
      -- Master  - Tk_Widget in which the grid is. Must be existing widget
      -- Column  - The number of column which will be configured. Columns
      --           indexes starts from 0
      -- Options - Column_Options to set. Cannot be empty
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the weight of the third column in grid in My_Frame to 3
      -- Column_Configure(My_Frame, 2, (Weight => 3, others => <>));
      -- COMMANDS
      -- grid columnconfigure master column options
      -- SEE ALSO
      -- Grid.Column_Configure_(child_name), Grid.Column_Configure_(child)
      -- SOURCE
   procedure Column_Configure
     (Master: Tk_Widget; Column: Natural; Options: Column_Options) with
      Pre => Master /= Null_Widget and
      Options /= Column_Options'(others => <>);
      -- ****

      -- ****f* Grid/Grid.Get_Column_Options_(child_name)
      -- FUNCTION
      -- Get the configuration options of the selected column in the selected grid
      -- PARAMETERS
      -- Master     - Tk_Widget in which the grid is. Must be existing widget
      -- Child_Name - The name of the child widget which column configuration
      --              will be get. If set to "all", get configuration for all
      --              columns. Cannot be empty
      -- RESULT
      -- Column_Options record with all configuration options values
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the configuration options of .myframe.mybutton in My_Frame grid
      -- Options: constant Column_Options := Get_Column_Options(My_Frame, To_Tcl_String(".myframe.mybutton"));
      -- COMMANDS
      -- grid columnconfigure master child_name
      -- SEE ALSO
      -- Grid.Get_Column_Options_(child), Grid.Get_Column_Options_(column_number)
      -- SOURCE
   function Get_Column_Options
     (Master: Tk_Widget; Child_Name: Tcl_String) return Column_Options with
      Pre => Master /= Null_Widget and Length(Child_Name) > 0;
      -- ****

      -- ****f* Grid/Grid.Get_Column_Options_(child)
      -- FUNCTION
      -- Get the configuration options of the selected column in the selected grid
      -- PARAMETERS
      -- Master  - Tk_Widget in which the grid is. Must be existing widget
      -- Child   - The child widget which column options will be get. Must be
      --           existing widget.
      -- RESULT
      -- Column_Options record with all configuration options values
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the configuration options of My_Button in My_Frame grid
      -- Options: constant Column_Options := Get_Column_Options(My_Frame, My_Button);
      -- COMMANDS
      -- grid columnconfigure master child
      -- SEE ALSO
      -- Grid.Get_Column_Options_(child_name), Grid.Get_Column_Options_(column_number)
      -- SOURCE
   function Get_Column_Options
     (Master, Child: Tk_Widget) return Column_Options with
      Pre => Master /= Null_Widget and Child /= Null_Widget;
      -- ****

      -- ****f* Grid/Grid.Get_Column_Options_(column_number)
      -- FUNCTION
      -- Get the configuration options of the selected column in the selected grid
      -- PARAMETERS
      -- Master  - Tk_Widget in which the grid is. Must be existing widget
      -- Column  - The number of column which options will be get. Columns
      --           indexes starts from 0
      -- RESULT
      -- Column_Options record with all configuration options values
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the configuration options of the second column in My_Frame grid
      -- Options: constant Column_Options := Get_Column_Options(My_Frame, 1);
      -- COMMANDS
      -- grid columnconfigure master column
      -- SEE ALSO
      -- Grid.Get_Column_Options_(child_name), Grid.Get_Column_Options_(child)
      -- SOURCE
   function Get_Column_Options
     (Master: Tk_Widget; Column: Natural) return Column_Options with
      Pre => Master /= Null_Widget;
      -- ****

      -- ****f* Grid/Grid.Configure_(single_widget)
      -- FUNCTION
      -- Configure the selected widget in the grid
      -- PARAMETERS
      -- Widget  - Tk_Widget which will be configured. Must be existing widget
      -- Options - Grid_Options to set. Cannot be empty
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Move My_Label widget to the second row
      -- Configure(My_Label, (Row => 1, others => <>));
      -- COMMANDS
      -- grid configure widget options
      -- SEE ALSO
      -- Grid.Configure_(many_widgets)
      -- SOURCE
   procedure Configure(Widget: Tk_Widget; Options: Grid_Options) with
      Pre => Widget /= Null_Widget and Options /= Grid_Options'(others => <>);
      -- ****

      -- ****f* Grid/Grid.Configure_(many_widgets)
      -- FUNCTION
      -- Configure the selected widgets in the grid
      -- PARAMETERS
      -- Widget  - Widgets_Array with widgets to configure. All widgets must be exist
      -- Options - Grid_Options to set. Cannot be empty
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Move My_Label and My_Button widgets to the second row
      -- Configure((My_Label, My_Button), (Row => 1, others => <>));
      -- COMMANDS
      -- grid configure widgets options
      -- SEE ALSO
      -- Grid.Configure_(single_widget)
      -- SOURCE
   procedure Configure(Widgets: Widgets_Array; Options: Grid_Options) with
      Pre => Widgets'Length > 0 and Options /= Grid_Options'(others => <>);
      -- ****

      -- ****f* Grid/Grid.Forget_(single_widget)
      -- FUNCTION
      -- Remove the selected widget from the grid and unmap its window. The
      -- grid configuration for the widget will be removed too.
      -- PARAMETERS
      -- Widget - Tk_Widget to remove. Must be existing widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Remove My_Label from grid
      -- Forget(My_Label);
      -- COMMANDS
      -- grid forget widget
      -- SEE ALSO
      -- Grid.Forget_(many_widgets), Grid.Remove_(single_widget),
      -- Grid.Remove_(many_widgets)
      -- SOURCE
   procedure Forget(Widget: Tk_Widget) with
      Pre => Widget /= Null_Widget;
      -- ****

      -- ****f* Grid/Grid.Forget_(many_widgets)
      -- FUNCTION
      -- Remove the selected widgets from the grid and unmap its window. The
      -- grid configuration for the widget will be removed too.
      -- PARAMETERS
      -- Widgets - Widgets_Array of widgets to remove. All widgets must exist
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Remove My_Label and My_Button from grid
      -- Forget((My_Label, My_Button));
      -- COMMANDS
      -- grid forget widgets
      -- SEE ALSO
      -- Grid.Forget_(single_widget), Grid.Remove_(single_widget),
      -- Grid.Remove_(many_widgets)
      -- SOURCE
   procedure Forget(Widgets: Widgets_Array) with
      Pre => Widgets'Length > 0;
      -- ****

      -- ****f* Grid/Grid.Info
      -- FUNCTION
      -- Get the grid configuration options for the selected widget
      -- PARAMETERS
      -- Widget - Tk_Widget which grid configuration options will be get.
      --          Must be existing widget
      -- RESULT
      -- Grid_Options with all grid options for the selected widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the grid options for the My_Label widget
      -- Options: constant String := Info(My_Label);
      -- COMMANDS
      -- grid info widget
      -- SOURCE
   function Info(Widget: Tk_Widget) return Grid_Options with
      Pre => Widget /= Null_Widget;
      -- ****

      -- ****f* Grid/Grid.Location
      -- FUNCTION
      -- Get the column and row at the selected location in the selected
      -- window
      -- PARAMETERS
      -- Master - Tk_Widget in which the grid is. Must be existing widget
      -- X      - X coordinate of point relative to the Master window
      -- Y      - Y coordinate of point relative to the Master window
      -- RESULT
      -- Result_Array with the first value as column number and the second
      -- value as row number. If location is above, return -1 for row, if
      -- to the left of grid, return -1 for column.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the column at point (10, 10) in My_Frame window grid
      -- declare
      --    Values: constant Result_Array := Location(My_Frame, (10, PIXEL), (10, PIXEL));
      --    Column, Row: Extended_Natural;
      -- begin
      --    Column := Values(1);
      --    Row := Values(2);
      -- end;
      -- COMMANDS
      -- grid location master x y
      -- SOURCE
   function Location
     (Master: Tk_Widget; X, Y: Pixel_Data) return Result_Array with
      Pre => Master /= Null_Widget and X.Value > -1.0 and Y.Value > -1.0;
      -- ****

      -- ****f* Tk.Grid/Propagate_(procedure)
      -- FUNCTION
      -- Set the propagation state for the selected grid in Master widget
      -- PARAMETERS
      -- Master - Tk_Widget in which the grid is. Must be existing widget
      -- Enable - If true, enable propagation, otherwise disable it
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Disable propagation in My_Frame window grid
      -- Propagate(My_Frame, False);
      -- SEE ALSO
      -- Propagate_(function)
      -- COMMANDS
      -- grid propagate master boolean
      -- SOURCE
   procedure Propagate(Master: Tk_Widget; Enable: Boolean := True) with
      Pre => Master /= Null_Widget;
      -- ****

      -- ****f* Tk.Grid/Propagate_(function)
      -- FUNCTION
      -- Get the propagation state for the selected grid in Master widget
      -- PARAMETERS
      -- Master - Tk_Widget in which the grid is. Must be existing widget
      -- RESULT
      -- True if propagation is enabled for the grid, otherwise false. The
      -- propagation is by default enabled.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the propagation state for My_Frame window grid
      -- Is_Enabled: constant Boolean := Propagate(My_Frame);
      -- SEE ALSO
      -- Propagate_(procedure)
      -- COMMANDS
      -- grid propagate master
      -- SOURCE
   function Propagate(Master: Tk_Widget) return Boolean with
      Pre => Master /= Null_Widget;
      -- ****

      -- ****f* Grid/Grid.Row_Configure_(child_name)
      -- FUNCTION
      -- Configure the selected row in the selected grid
      -- PARAMETERS
      -- Master     - Tk_Widget in which the grid is. Must be existing widget
      -- Child_Name - The name of the child widget which row will be
      --              configured. Cannot be empty
      -- Options    - Column_Options to set. Cannot be empty
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the weight of grid in My_Frame where .myframe.mybutton is to 1
      -- Row_Configure(My_Frame, To_Tcl_String(".myframe.mybutton"), (Weight => 1, others => <>));
      -- COMMANDS
      -- grid rowconfigure master child_name options
      -- SEE ALSO
      -- Grid.Row_Configure_(child), Grid.Row_Configure_(row_number)
      -- SOURCE
   procedure Row_Configure
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) with
      Pre => Master /= Null_Widget and Length(Child_Name) > 0 and
      Options /= Column_Options'(others => <>);
      -- ****

      -- ****f* Grid/Grid.Row_Configure_(child)
      -- FUNCTION
      -- Configure the selected row in the selected grid
      -- PARAMETERS
      -- Master  - Tk_Widget in which the grid is. Must be existing widget
      -- Child   - The child widget which row will be configured. Must be
      --           existing widget.
      -- Options - Column_Options to set. Cannot be empty
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the weight of grid in My_Frame where My_Button2 is to 2
      -- Row_Configure(My_Frame, My_Button2, (Weight => 2, others => <>));
      -- COMMANDS
      -- grid rowconfigure master child options
      -- SEE ALSO
      -- Grid.Row_Configure_(child_name), Grid.Row_Configure_(row_number)
      -- SOURCE
   procedure Row_Configure
     (Master, Child: Tk_Widget; Options: Column_Options) with
      Pre => Master /= Null_Widget and Child /= Null_Widget and
      Options /= Column_Options'(others => <>);
      -- ****

      -- ****f* Grid/Grid.Row_Configure_(row_number)
      -- FUNCTION
      -- Configure the selected row in the selected grid
      -- PARAMETERS
      -- Master  - Tk_Widget in which the grid is. Must be existing widget
      -- Row     - The number of row which will be configured. Rows
      --           indexes starts from 0
      -- Options - Column_Options to set. Cannot be empty
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the weight of the third row in grid in My_Frame to 3
      -- Row_Configure(My_Frame, 2, (Weight => 3, others => <>));
      -- COMMANDS
      -- grid rowconfigure master row options
      -- SEE ALSO
      -- Grid.Row_Configure_(child_name), Grid.Row_Configure_(child)
      -- SOURCE
   procedure Row_Configure
     (Master: Tk_Widget; Row: Natural; Options: Column_Options) with
      Pre => Master /= Null_Widget and
      Options /= Column_Options'(others => <>);
      -- ****

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
