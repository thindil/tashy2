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

with Tcl.Strings; use Tcl.Strings;
with Tk.Widget; use Tk.Widget;

-- ****h* Tk/Grid
-- FUNCTION
-- Provide bindings for manipulate Tk geometry manager grid
-- SOURCE
package Tk.Grid is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****t* Grid/Grid.Sticky_Type
   -- FUNCTION
   -- All possible values of position or stretch the widget in the grid
   -- OPTIONS
   -- NONE   - Not set, used to set the empty value for the widget's grid option
   -- CENTER - Default value, don't modify the widget
   -- HEIGHT - Resize the widget to the grid height
   -- WIDTH  - Resize the widget to the grid width
   -- WHOLE  - Resize the widget in all directions, to take the whole grid
   -- N      - Position the widget at the top border of the grid
   -- W      - Position the widget at the left border of the grid
   -- E      - Position the widget at the right border of the grid
   -- S      - Position the widget at the bottom border of the grid
   -- NW     - Position the widget at the top left corner of the grid
   -- NE     - Position the widget at the top right corner of the grid
   -- SW     - Position the widget at the bottom left corner of the grid
   -- SE     - Position the widget at the bottom right corner of the grid
   -- SOURCE
   type Sticky_Type is
     (NONE, CENTER, HEIGHT, WIDTH, WHOLE, N, W, E, S, NW, NE, SW, SE) with
      Default_Value => NONE;
      -- ****

      -- ****d* Tk.Grid/Default_Sticky_Value
      -- FUNCTION
      -- Default value for the position or stretch of the widget in the grid
      -- SOURCE
   Default_Sticky_Value: constant Sticky_Type := CENTER;
   -- ****

   -- ****s* Grid/Grid.Grid_Options
   -- FUNCTION
   -- Data structure for all available grid slaves options
   -- OPTIONS
   -- Column         - Index of column in which the widget is placed. Index
   --                  starts from zero
   -- Column_Span    - Amount of columns which the widget occupy
   -- In_Master      - Tk_Widget which is the master for the selected widget
   -- Internal_Pad_X - Amount of internal horizontal padding for the widget
   -- Internal_Pad_Y - Amount of internal vertical padding for the widget
   -- Pad_X          - Amount of external horizontal padding for the widget. The
   --                  first value is left padding, second right padding
   -- Pad_Y          - Amount of external vertical padding for the widget. The
   --                  first value is top padding, the second is bottom padding
   -- Row            - Index of row in which the widget is placed. Index starts
   --                  from zero.
   -- Row_Span       - Amount of rows which the widget occupy
   -- Sticky         - Position (or stretch) the widget in the selected directions.
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Grid_Options is record
      Column: Extended_Natural;
      Column_Span: Extended_Natural;
      In_Master: Tk_Widget := Null_Widget;
      Internal_Pad_X: Pixel_Data;
      Internal_Pad_Y: Pixel_Data;
      Pad_X: Horizontal_Pad_Data := Default_Horizontal_Pad_Data;
      Pad_Y: Vertical_Pad_Data := Default_Vertical_Pad_Data;
      Row: Extended_Natural;
      Row_Span: Extended_Natural;
      Sticky: Sticky_Type;
   end record;
   -- ****

   -- ****d* Grid/Grid.Default_Grid_Options
   -- FUNCTION
   -- Default options for the Tk grid
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Grid_Options: constant Grid_Options := Grid_Options'(others => <>);
   -- ****

   -- ****s* Grid/Grid.Column_Options
   -- FUNCTION
   -- Data structure for all available grid rows and columns options
   -- OPTIONS
   -- Min_Size - Minimum size of the selected rows or columns
   -- Weight   - Weigth of the selected rows or columns. 0 means no resize,
   --            2 means that selected rows or columns will grow twice the rate
   --            as rows or columns with weight 1.
   -- Uniform  - Name of the uniform group to which rows or columns belong
   -- Pad      - Padding added to the largest widget in rows or columns
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Column_Options is record
      Min_Size: Pixel_Data := Empty_Pixel_Data;
      Weight: Extended_Natural := -1;
      Uniform: Tcl_String := Null_Tcl_String;
      Pad: Pixel_Data := Empty_Pixel_Data;
   end record;
   -- ****

   -- ****d* Grid/Grid.Default_Column_Options
   -- FUNCTION
   -- Default values for Tk grid column and row options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Column_Options: constant Column_Options :=
     Column_Options'(others => <>);
     -- ****

     -- ****s* Grid/Grid.Location_Position
     -- FUNCTION
     -- Data structure for get grid location in columns and rows for various
     -- Tk grid commands
     -- OPTIONS
     -- Column - Column position of the location
     -- Row    - Row position of the location
     -- HISTORY
     -- 8.6.0 - Added
     -- SOURCE
   type Location_Position is record
      Column: Extended_Natural;
      Row: Extended_Natural;
   end record;
   -- ****

   -- ****d* Grid/Grid.Empty_Location
   -- FUNCTION
   -- Empty grid location
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Location: constant Location_Position :=
     Location_Position'(others => <>);
   -- ****

   -- ****f* Grid/Grid.Add_(single_widget)
   -- FUNCTION
   -- Add the selected Tk_Widget to the grid geometry manager
   -- PARAMETERS
   -- Child  - Tk_Widget which will be added to the grid. Must be existing
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
     (Child: Tk_Widget; Options: Grid_Options := Default_Grid_Options) with
      Pre => Child /= Null_Widget,
      Test_Case => (Name => "Test_Add1", Mode => Nominal);
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
      Options: Grid_Options := Default_Grid_Options) with
      Pre => Widgets'Length > 0,
      Test_Case => (Name => "Test_Add2", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Set_Anchor
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
      -- Set_Anchor(My_Frame, W);
      -- SEE ALSO
      -- Grid.Get_Anchor
      -- COMMANDS
      -- grid anchor master new_direction
      -- SOURCE
   procedure Set_Anchor(Master: Tk_Widget; New_Direction: Directions_Type) with
      Pre => Master /= Null_Widget and New_Direction /= NONE,
      Test_Case => (Name => "Test_Anchor1", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Get_Anchor
      -- FUNCTION
      -- Get the current anchor value for the selected grid geometry manager
      -- PARAMETERS
      -- Master - Tk_Widget in which the grid is. Must be existing widget
      -- RESULT
      -- Direction_Type with value of current the grid anchor
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get anchor of grid in My_Frame widget
      -- Current_Anchor: constant Directions_Type := Get_Anchor(My_Frame);
      -- SEE ALSO
      -- Grid.Set_Anchor
      -- COMMANDS
      -- grid anchor master
      -- SOURCE
   function Get_Anchor(Master: Tk_Widget) return Directions_Type is
     (Directions_Type'Value
        (Tcl_Eval
           (Tcl_Script => "grid anchor " & Tk_Path_Name(Widgt => Master),
            Interpreter => Tk_Interp(Widgt => Master))
           .Result)) with
      Pre => Master /= Null_Widget
      or else Tk_Interp(Widgt => Master) /= Null_Interpreter,
      Test_Case => (Name => "Test_Anchor2", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Get_Bounding_Box_(all_values)
      -- FUNCTION
      -- Get the bounding box of the selected grid
      -- PARAMETERS
      -- Master  - Tk_Widget in which the grid is. Must be existing widget
      -- Column  - The starting column for the bounding box of the grid.
      -- Row     - The starting row for the bounding box of the grid.
      -- Column2 - The ending column for the bounding box of the grid.
      -- Row2    - The ending column for the bounding box of the grid.
      -- RESULT
      -- BBox_Data with 4 values. The first two are staring point (x, y) of
      -- the bounding box, the third is width and the fourth is height of the
      -- bounding box. The return is the bouding box of the selected columns and
      -- rows.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the bounding box of grid from two first rows and columns in My_Frame widget
      -- Bounding_Box: constant BBox_Data := Get_Bounding_Box(My_Frame, 0, 0, 1, 1);
      -- SEE ALSO
      -- Grid.Get_Bounding_Box_(col_row), Grid.Get_Bounding_Box
      -- COMMANDS
      -- grid bbox master column row column2 row2
      -- SOURCE
   function Get_Bounding_Box
     (Master: Tk_Widget; Column, Row, Column2, Row2: Natural)
      return Bbox_Data with
      Pre => Master /= Null_Widget,
      Test_Case => (Name => "Test_Get_BBox", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Get_Bounding_Box_(col_row)
      -- FUNCTION
      -- Get the bounding box of the selected cell in grid
      -- PARAMETERS
      -- Master  - Tk_Widget in which the grid is. Must be existing widget
      -- Column  - The starting column for the bounding box of the grid.
      -- Row     - The starting row for the bounding box of the grid.
      -- RESULT
      -- BBox_Data with 4 values. The first two are staring point (x, y) of
      -- the bounding box, the third is width and the fourth is height of the
      -- bounding box. It is the bounding box of the selected cell.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the bounding box of grid for the first row and column in My_Frame widget
      -- Bounding_Box: constant BBox_Data := Get_Bounding_Box(My_Frame, 0, 0);
      -- SEE ALSO
      -- Grid.Get_Bounding_Box_(all_values), Grid.Get_Bounding_Box
      -- COMMANDS
      -- grid bbox master column row
      -- SOURCE
   function Get_Bounding_Box
     (Master: Tk_Widget; Column, Row: Natural) return Bbox_Data with
      Pre => Master /= Null_Widget,
      Test_Case => (Name => "Test_Get_BBox2", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Get_Bounding_Box
      -- FUNCTION
      -- Get the bounding box of the selected grid
      -- PARAMETERS
      -- Master  - Tk_Widget in which the grid is. Must be existing widget
      -- RESULT
      -- BBox_Data with 4 values. The first two are staring point (x, y) of
      -- the bounding box, the third is width and the fourth is height of the
      -- bounding box. The return is the bouding box of the whole grid.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the bounding box of grid in My_Frame widget
      -- Bounding_Box: constant BBox_Data := Get_Bounding_Box(My_Frame);
      -- SEE ALSO
      -- Grid.Get_Bounding_Box_(col_row), Grid.Get_Bounding_Box_(all_values)
      -- COMMANDS
      -- grid bbox master
      -- SOURCE
   function Get_Bounding_Box(Master: Tk_Widget) return Bbox_Data with
      Pre => Master /= Null_Widget,
      Test_Case => (Name => "Test_Get_BBox3", Mode => Nominal);

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
      -- Grid.Column_Configure_(widget), Grid.Column_Configure_(column_number)
      -- SOURCE
   procedure Column_Configure
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) with
      Pre => Master /= Null_Widget and Length(Source => Child_Name) > 0 and
      Options /= Default_Column_Options,
      Test_Case => (Name => "Test_Column_Configure1", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Column_Configure_(widget)
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
      Options /= Default_Column_Options,
      Test_Case => (Name => "Test_Column_Configure2", Mode => Nominal);
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
      -- Grid.Column_Configure_(child_name), Grid.Column_Configure_(widget)
      -- SOURCE
   procedure Column_Configure
     (Master: Tk_Widget; Column: Natural; Options: Column_Options) with
      Pre => Master /= Null_Widget and Options /= Default_Column_Options,
      Test_Case => (Name => "Test_Column_Configure3", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Get_Column_Options
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
      -- SOURCE
   function Get_Column_Options
     (Master: Tk_Widget; Column: Natural) return Column_Options with
      Pre => Master /= Null_Widget,
      Test_Case => (Name => "Test_Get_Column_Options", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Configure_(single_widget)
      -- FUNCTION
      -- Configure the selected widget in the grid
      -- PARAMETERS
      -- Child   - Tk_Widget which will be configured. Must be existing widget
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
   procedure Configure(Child: Tk_Widget; Options: Grid_Options) with
      Pre => Child /= Null_Widget and Options /= Default_Grid_Options,
      Test_Case => (Name => "Test_Configure1", Mode => Nominal);
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
      Pre => Widgets'Length > 0 and Options /= Default_Grid_Options,
      Test_Case => (Name => "Test_Configure2", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Forget_(single_widget)
      -- FUNCTION
      -- Remove the selected widget from the grid and unmap its window. The
      -- grid configuration for the widget will be removed too.
      -- PARAMETERS
      -- Child - Tk_Widget to remove. Must be existing widget
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
   procedure Forget(Child: Tk_Widget) with
      Pre => Child /= Null_Widget,
      Test_Case => (Name => "Test_Forget1", Mode => Nominal);
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
      Pre => Widgets'Length > 0,
      Test_Case => (Name => "Test_Forget2", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Get_Info
      -- FUNCTION
      -- Get the grid configuration options for the selected widget
      -- PARAMETERS
      -- Child - Tk_Widget which grid configuration options will be get.
      --         Must be existing widget
      -- RESULT
      -- Grid_Options with all grid options for the selected widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the grid options for the My_Label widget
      -- Options: constant String := Get_Info(My_Label);
      -- COMMANDS
      -- grid info widget
      -- SOURCE
   function Get_Info(Child: Tk_Widget) return Grid_Options with
      Pre => Child /= Null_Widget,
      Test_Case => (Name => "Test_Info", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Get_Location
      -- FUNCTION
      -- Get the column and row at the selected location in the selected
      -- window
      -- PARAMETERS
      -- Master - Tk_Widget in which the grid is. Must be existing widget
      -- X      - X coordinate of point relative to the Master window
      -- Y      - Y coordinate of point relative to the Master window
      -- RESULT
      -- Location_Position value. If location is above, return -1 for row, if
      -- to the left of grid, return -1 for column.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the column at point (10, 10) in My_Frame window grid
      -- Location: constant Location_Position := Get_Location(My_Frame, (10.0, PIXEL), (10.0, PIXEL));
      -- COMMANDS
      -- grid location master x y
      -- SOURCE
   function Get_Location
     (Master: Tk_Widget; X, Y: Pixel_Data) return Location_Position with
      Pre => Master /= Null_Widget and X.Value > -1.0 and Y.Value > -1.0,
      Test_Case => (Name => "Test_Location", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Set_Propagate
      -- FUNCTION
      -- Set the propagation state for the selected grid in Master widget
      -- PARAMETERS
      -- Master - Tk_Widget in which the grid is. Must be existing widget
      -- Enable - If true, enable propagation, otherwise disable it
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Disable propagation in My_Frame window grid
      -- Set_Propagate(My_Frame, False);
      -- SEE ALSO
      -- Grid.Get_Propagate
      -- COMMANDS
      -- grid propagate master boolean
      -- SOURCE
   procedure Set_Propagate(Master: Tk_Widget; Enable: Boolean := True) with
      Pre => Master /= Null_Widget,
      Test_Case => (Name => "Test_Propagate1", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Get_Propagate
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
      -- Is_Enabled: constant Tcl_Boolean_Result := Get_Propagate(My_Frame);
      -- SEE ALSO
      -- Grid.Set_Propagate
      -- COMMANDS
      -- grid propagate master
      -- SOURCE
   function Get_Propagate(Master: Tk_Widget) return Tcl_Boolean_Result is
     (Tcl_Eval
        (Tcl_Script => "grid propagate " & Tk_Path_Name(Widgt => Master),
         Interpreter => Tk_Interp(Widgt => Master))) with
      Pre => Master /= Null_Widget,
      Test_Case => (Name => "Test_Propagate2", Mode => Nominal);
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
      -- Grid.Row_Configure_(widget), Grid.Row_Configure_(row_number)
      -- SOURCE
   procedure Row_Configure
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) with
      Pre => Master /= Null_Widget and Length(Source => Child_Name) > 0 and
      Options /= Default_Column_Options,
      Test_Case => (Name => "Test_Row_Configure1", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Row_Configure_(widget)
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
      Options /= Default_Column_Options,
      Test_Case => (Name => "Test_Row_Configure2", Mode => Nominal);
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
      -- Grid.Row_Configure_(child_name), Grid.Row_Configure_(widget)
      -- SOURCE
   procedure Row_Configure
     (Master: Tk_Widget; Row: Natural; Options: Column_Options) with
      Pre => Master /= Null_Widget and Options /= Default_Column_Options,
      Test_Case => (Name => "Test_Row_Configure3", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Get_Row_Options
      -- FUNCTION
      -- Get the configuration options of the selected row in the selected grid
      -- PARAMETERS
      -- Master  - Tk_Widget in which the grid is. Must be existing widget
      -- Row     - The number of row which options will be get. Rows
      --           indexes starts from 0
      -- RESULT
      -- Column_Options record with all configuration options values
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the configuration options of the second row in My_Frame grid
      -- Options: constant Column_Options := Get_Row_Options(My_Frame, 1);
      -- COMMANDS
      -- grid rowconfigure master row
      -- SOURCE
   function Get_Row_Options
     (Master: Tk_Widget; Row: Natural) return Column_Options with
      Pre => Master /= Null_Widget,
      Test_Case => (Name => "Test_Get_Row_Options", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Remove_(single_widget)
      -- FUNCTION
      -- Remove the selected widget from the grid and unmap its window. The
      -- grid configuration for the widget will not be removed thus if the
      -- widget will be added to the same grid again, it will be using
      -- the previous configuration instead of default.
      -- PARAMETERS
      -- Child - Tk_Widget to remove. Must be existing widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Remove My_Label from grid
      -- Remove(My_Label);
      -- COMMANDS
      -- grid remove widget
      -- SEE ALSO
      -- Grid.Forget_(single_widget), Grid.Forget_(many_widget2),
      -- Grid.Remove_(many_widgets)
      -- SOURCE
   procedure Remove(Child: Tk_Widget) with
      Pre => Child /= Null_Widget,
      Test_Case => (Name => "Test_Remove1", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Remove_(many_widgets)
      -- FUNCTION
      -- Remove the selected widgets from the grid and unmap their windows.
      -- The grid configuration for the widgets will not be removed thus if
      -- the widgets will be added to the same grid again, they will be using
      -- the previous configuration instead of default.
      -- PARAMETERS
      -- Widgets - Widgets_Array of widgets to remove. All widgets must exist
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Remove My_Label and My_Button from grid
      -- Remove((My_Label, My_Button));
      -- COMMANDS
      -- grid remove widgets
      -- SEE ALSO
      -- Grid.Forget_(single_widget), Grid.Forget_(many_widgets),
      -- Grid.Remove_(single_widget)
      -- SOURCE
   procedure Remove(Widgets: Widgets_Array) with
      Pre => Widgets'Length > 0,
      Test_Case => (Name => "Test_Remove2", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Get_Size
      -- FUNCTION
      -- Get the size in columns then rows of the selected grid
      -- PARAMETERS
      -- Master  - Tk_Widget in which the grid is. Must be existing widget
      -- RESULT
      -- The Location_Position with the amount of columns in
      -- the grid, and amount of rows in the grid
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the size of the grid in My_Frame widget
      -- Grid_Size: constant Location_Position := Get_Size(My_Frame);
      -- COMMANDS
      -- grid size master
      -- SOURCE
   function Get_Size(Master: Tk_Widget) return Location_Position with
      Pre => Master /= Null_Widget,
      Test_Case => (Name => "Test_Size", Mode => Nominal);
      -- ****

      -- ****f* Grid/Grid.Get_Slaves
      -- FUNCTION
      -- Get the widgets which are in Master grid
      -- PARAMETERS
      -- Master - Tk_Widget in which the grid is. Must be existing widget
      -- Row    - The row number from which widgets will be taken. Default
      --          value is -1 (take widgets from all rows).
      -- Column - The column number from which widgets will be taken. Default
      --          value is -1 (take widgets from all columns).
      -- RESULT
      -- WidgetS_Array with Tk_Widgets from the Master grid
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get all widgets from the grid in My_Frame widget
      -- Widgets: constant Widgets_Array := Get_Slaves(My_Frame);
      -- COMMANDS
      -- grid slaves master ?-row row? ?-column column?
      -- SOURCE
   function Get_Slaves
     (Master: Tk_Widget; Row, Column: Extended_Natural := -1)
      return Widgets_Array with
      Pre => Master /= Null_Widget,
      Test_Case => (Name => "Test_Slaves", Mode => Nominal);
      -- ****
      --## rule on REDUCEABLE_SCOPE

end Tk.Grid;
