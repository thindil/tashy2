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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with System;
with Tcl.Strings; use Tcl.Strings;

-- ****h* Tk/Widget
-- FUNCTION
-- Provide code for manipulate Tk widgets. Parent of the all widget.
-- SOURCE
package Tk.Widget is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****t* Widget/Widget.Tk_Widget
   -- FUNCTION
   -- The identifier of the Tk Widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Tk_Widget is new System.Address;
   -- ****

   -- ****d* Widget/Widget.Null_Widget
   -- FUNCTION
   -- Not created or not existing Tk widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Null_Widget: constant Tk_Widget := Tk_Widget(System.Null_Address);
   -- ****

   -- ****t* Widget/Widget.Relief_Type
   -- FUNCTION
   -- Type of Tk widget 3D effect
   -- OPTIONS
   -- NONE   - Empty value, used mostly in setting default value for widgets
   -- RAISED - Widget visually will be raised
   -- SUNKEN - Widget visually will be lowered
   -- FLAT   - Widget visually will be flat (no border)
   -- RIDGE  - Widget visually will be ridget
   -- SOLID  - The widget's border will be solid at this same level like widget
   -- GROOVE - Widget visually will be grooved
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Relief_Type is (NONE, RAISED, SUNKEN, FLAT, RIDGE, SOLID, GROOVE) with
      Default_Value => NONE;
      -- ****

      -- ****d* Widget/Widget.Default_Relief
      -- FUNCTION
      -- Default value for Relief_Type
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Relief: constant Relief_Type := NONE;
   -- ****

   -- ****t* Widget/Widget.Pixel_Unit
   -- FUNCTION
   -- Type of possible screen distance units
   -- OPTIONS
   -- PIXEL - Units are in pixels, default value
   -- C     - Units are in centimeters
   -- I     - Units are in inches
   -- M     - Units are in milimeters
   -- P     - Units are in printer's points
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Pixel_Unit is (PIXEL, C, I, M, P) with
      Default_Value => PIXEL;
      -- ****

      -- ****d* Widget/Widget.Default_Pixel_Unit
      -- FUNCTION
      -- Default Pixel_Unit value
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Pixel_Unit: constant Pixel_Unit := PIXEL;
   -- ****

   -- ****t* Widget/Widget.Directions_Type
   -- FUNCTION
   -- Type of possible directions for various widgets configuration options
   -- OPTIONS
   -- NONE   - Used mostly when setting default direction for widgets
   -- N      - North
   -- NE     - North east
   -- E      - East
   -- SE     - South east
   -- S      - South
   -- SW     - South west
   -- W      - West
   -- NW     - North west
   -- CENTER - Centered
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Directions_Type is (NONE, N, NE, E, SE, S, SW, W, NW, CENTER) with
      Default_Value => NONE;
      -- ****

      -- ****d* Widget/Widget.Default_Direction
      -- FUNCTION
      -- Default Direction_Type value
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Direction: constant Directions_Type := NONE;
   -- ****

   -- ****t* Widget/Widget.Positive_Float
   -- FUNCTION
   -- Type used for positive float values, value -1 means empty value
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Positive_Float is digits 2 range -1.0 .. Float'Last with
      Default_Value => -1.0;
      -- ****

      -- ****d* Widget/Widget.Default_Positive_Float
      -- FUNCTION
      -- Default value for Positive_Float
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Positive_Float: constant Positive_Float := -1.0;
   -- ****

   -- ****t* Widget/Widget.Place_Type
   -- FUNCTION
   -- Type of possible place directions for various widgets configuration
   -- options
   -- OPTIONS
   -- EMPTY  - Default value, used to set default setting for widgets
   -- NONE   - Depends on configuration option of widgets
   -- BOTTOM - Set value to bottom of widget
   -- TOP    - Set value to top of widget
   -- LEFT   - Set value to left side of widget
   -- RIGHT  - Set value to right side of widget
   -- CENTER - Set value to centered in widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Place_Type is (EMPTY, NONE, BOTTOM, TOP, LEFT, RIGHT, CENTER) with
      Default_Value => EMPTY;
      -- ****

      -- ****d* Widget/Widget.Default_Place
      -- FUNCTION
      -- Default value for Place_Type
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Place: constant Place_Type := EMPTY;
   -- ****

   -- ****t* Widget/Widget.Extended_Boolean
   -- FUNCTION
   -- Type used for set boolean values of various widgets configuration
   -- options
   -- OPTIONS
   -- FALSE - Equivalent of Ada False
   -- TRUE  - Equivalent of Ada True
   -- NONE  - Used mostly in setting default value for configuration option
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Extended_Boolean is (FALSE, TRUE, NONE) with
      Default_Value => NONE;
      -- ****

      -- ****d* Widget/Widget.Default_Extended_Boolean
      -- FUNCTION
      -- Default value for Extended_Boolean
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Extended_Boolean: constant Extended_Boolean := NONE;
   -- ****

   -- ****t* Widget/Widget.Justify_Type
   -- FUNCTION
   -- Type used to set text justify option of various widgets
   -- OPTIONS
   -- NONE   - Used mostly in setting the default value for widgets
   -- LEFT   - Justify text to the left
   -- CENTER - Center text
   -- RIGHT  - Justify text to the right
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Justify_Type is (NONE, LEFT, CENTER, RIGHT) with
      Default_Value => NONE;
      -- ****

      -- ****d* Widget/Widget.Default_Justify_Type
      -- FUNCTION
      -- Default value for Justify_Type
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Justify: constant Justify_Type := NONE;
   -- ****

   -- ****t* Widget/Widget.Extended_Natural
   -- FUNCTION
   -- Type used for set non-negative values for various widgets
   -- configuration options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Extended_Natural is new Integer range -1 .. Integer'Last with
      Default_Value => -1;
      -- ****

      -- ****d* Widget/Widget.Default_Extended_Natural
      -- FUNCTION
      -- Default value for Extended_Natural
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Extended_Natural: constant Extended_Natural := -1;
   -- ****

   -- ****t* Widget/Widget.State_Type
   -- FUNCTION
   -- Type used to set the state of the selected widget
   -- OPTIONS
   -- NORMAL   - The widget is in normal, default state
   -- ACTIVE   - The mouse is above the widget
   -- DISABLED - The widget is disabled, insensitive, no keyboard or mouse
   --            events
   -- NONE     - Used mostly in setting the default state for the widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type State_Type is (NORMAL, ACTIVE, DISABLED, NONE) with
      Default_Value => NONE;
      -- ****

      -- ****d* Widget/Widget.Default_State
      -- FUNCTION
      -- Default value for State_Type
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_State: constant State_Type := NONE;
   -- ****

   -- ****s* Widget/Widget.Pixel_Data
   -- FUNCTION
   -- Data structure to store information about pixel
   -- OPTIONS
   -- Value      - Value of screen distance for the pixel
   -- Value_Unit - Type of screen distance unit. Default are pixels
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Pixel_Data is record
      Value: Positive_Float;
      Value_Unit: Pixel_Unit := PIXEL;
   end record;
   -- ****

   -- ****d* Widget/Widget.Empty_Pixel_Data
   -- FUNCTION
   -- Empty value for Pixel Data
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Pixel_Data: constant Pixel_Data := Pixel_Data'(others => <>);
   -- ****

   --## rule off TYPE_INITIAL_VALUES
   -- ****s* Widget/Widget.Widget_Options
   -- FUNCTION
   -- Abstract records to store available options and their values for widgets.
   -- All Tk widgets options should be children of this record
   -- OPTIONS
   -- Cursor       - Name of the cursor to set for the selected Tk widget
   -- Take_Focus   - Can be "1", "0", empty string or Tcl script which will
   --                return "1", "0" or empty string
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Widget_Options is abstract tagged record
      Cursor: Tcl_String;
      Take_Focus: Tcl_String;
   end record;
   -- ****
   --## rule on TYPE_INITIAL_VALUES

   -- ****t* Widget/Widget.Widgets_Array
   -- FUNCTION
   -- Array of Tk_Widgets. Used mostly in commands which allow to set a few
   -- widgets as parameters
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Widgets_Array is array(Positive range <>) of Tk_Widget;
   -- ****

   --****d* Widget/Empty_Widgets_Array
   -- FUNCTION
   -- Empty array of widgets constant
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Widgets_Array: constant Widgets_Array(1 .. 0) := (others => <>);
   -- ****

   -- ****s* Widget/Widget.Pad_Data
   -- FUNCTION
   -- Data structure used to store infomation about padding
   -- OPTIONS
   -- Left  - Padding on the left of the widget
   -- Right - Padding on the right of the widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Pad_Data is record
      Left: Pixel_Data;
      Right: Pixel_Data;
   end record;
   -- ****

   -- ****d* Widget/Widget.Empty_Pad_Data
   -- FUNCTION
   -- Default value for Pad_Data - no padding at all
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Pad_Data: constant Pad_Data :=
     Pad_Data'(others => Empty_Pixel_Data);
     -- ****

     -- ****s* Widget/Widget.Bbox_Data
     -- FUNCTION
     -- Data structure used to store values for bounding boxes of widgets
     -- OPTIONS
     -- Start_X - Start X coordinate of the bounding box
     -- Start_Y - Start Y coordinate of the bounding box
     -- Width   - Width of the bounding box
     -- Height  - Height of the bounding box
     -- HISTORY
     -- 8.6.0 - Added
     -- SOURCE
   type Bbox_Data is record
      Start_X: Natural := 0;
      Start_Y: Natural := 0;
      Width: Natural := 0;
      Height: Natural := 0;
   end record;
   -- ****

   -- ****d* Widget/Widget.mpty_Bbox_Data
   -- FUNCTION
   -- Empty bounding box data
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Bbox_Data: constant Bbox_Data := (others => 0);
   -- ****

   -- ****t* Widget/Widget.Tk_Window
   -- FUNCTION
   -- The window manager identifier for Tk_Widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Tk_Window is new System.Address;
   -- ****

   -- ****d* Widget/Widget.Null_Window
   -- FUNCTION
   -- Not created or not existing Tk window
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Null_Window: constant Tk_Window := Tk_Window(System.Null_Address);
   -- ****

   -- ****t* Widget/Widget.Anchor_Directions
   -- FUNCTION
   -- Possible directions for text in label of some widgets (mostly Label_Frame)
   -- NONE   - Used mostly when setting default anchor for widgets
   -- NW     - Set anchor to north west
   -- N      - Set anchor to north
   -- NE     - Set anchor to north east
   -- EN     - Set anchor to north east
   -- E      - Set anchor to east
   -- ES     - Set anchor to south east
   -- SE     - Set anchor to south east
   -- S      - Set anchor to south
   -- SW     - Set anchor to south west
   -- WS     - Set anchor to south west
   -- W      - Set anchor to west
   -- WN     - Set anchor to north west
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Anchor_Directions is
     (NONE, NW, N, NE, EN, E, ES, SE, S, SW, WS, W, WN) with
      Default_Value => NONE;
      -- ****

      -- ****d* Widget/Widget.Default_Anchor_Direction
      -- FUNCTION
      -- Default value for text anchor direction for Tk_Label_Frame
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Anchor_Direction: constant Anchor_Directions := NW;
   -- ****

     -- ****s* Widget/Widget.Point_Position
     -- FUNCTION
     -- Data structure used to set position of point on the screen
     -- X - The X coordinate of the point
     -- Y - The Y coordinate of the point
     -- HISTORY
     -- 8.6.0 - Added
     -- SOURCE
   type Point_Position is record
      X: Extended_Natural;
      Y: Extended_Natural;
   end record;
   -- ****

   -- ****d* Widget/Widget.Empty_Point_Position
   -- FUNCTION
   -- Empty values for position of point
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Point_Position: constant Point_Position :=
     Point_Position'(others => -1);
     -- ****

   -----------------------------------------------
   -- Various functions to convert types to String
   -----------------------------------------------

   -- ****f* Widget/Widget.Widgets_Array_Image
   -- FUNCTION
   -- Convert Widgets_Array to Ada String
   -- PARAMETERS
   -- Widgets - Widgets_Array which will be converted
   -- RESULT
   -- Ada String with Tk path names of the widgets
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get the Tk path names of widgets My_Button and My_Label
   -- Widgets_Names: constant String := Widgets_Array_Image((My_Button, My_Label));
   -- SOURCE
   function Widgets_Array_Image(Widgets: Widgets_Array) return String with
      Pre => Widgets'Length > 0,
      Post => Widgets_Array_Image'Result'Length > 0,
      Test_Case => (Name => "Test_Widgets_Array_Image", Mode => Nominal);
      -- ****

      ---------------------------------------------------------
      -- Various functions to convert String to Tk.Widget types
      ---------------------------------------------------------

      -- ****f* Widget/Widget.Pixel_Data_Value
      -- FUNCTION
      -- Convert Ada String to Pixel_Data
      -- PARAMETERS
      -- Value - String which will be converted to Pixel_Data
      -- RESULT
      -- Pixel_Data with value converted from String
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Convert string 2c to Pixel_Data
      -- Pixel: constant Pixel_Data := Pixel_Data_Value("2c");
      -- SOURCE
   function Pixel_Data_Value(Value: String) return Pixel_Data with
      Test_Case => (Name => "Test_Pixel_Data_Value", Mode => Nominal);
      -- ****

      -- ****f* Widget/Widget.Pixel_Data_Image
      -- FUNCTION
      -- Convert Pixel_Data to Ada String
      -- PARAMETERS
      -- Value - Pixel_Data which will be converted to String
      -- RESULT
      -- String with value converted from Pixel_Data
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Convert Pixel_Data 2.0 PIXEL to String
      -- PixelString: constant String := Pixel_Data_Image(Pixel_Data'(2.0, PIXEL));
      -- SOURCE
   function Pixel_Data_Image(Value: Pixel_Data) return String with
      Post => Pixel_Data_Image'Result'Length > 0;
   -- ****

   ---------------------------------
   -- Getting info about a Tk widget
   ---------------------------------

   -- ****f* Widget/Widget.Get_Widget
   -- FUNCTION
   -- Get existing Tk widget from its Tk path name and on the seelcted
   -- interpreter.
   -- PARAMETERS
   -- Path_Name   - Full Tk path name for the selected widget
   -- Interpreter - Tcl interpreter on which the selected widget is. Default
   --               value is default Tcl interpreter
   -- RESULT
   -- Tk_Widget with specified path name on the selected Tcl interpreter
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get the Tk Widget ID for .mybutton pathname widget on the default Tcl interpreter
   -- My_Button: constant Tk_Widget := Get_Widget(".mybutton");
   -- SOURCE
   function Get_Widget
     (Path_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Widget with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Get_Widget", Mode => Nominal);
      -- ****

      -- ****f* Widget/Widget.Tk_Path_Name
      -- FUNCTION
      -- Get the full Tk path name of the selected Tk widget
      -- PARAMETERS
      -- Widgt - Tk widget which path name will be taken
      -- RESULT
      -- Full Tk path name of the selected Tk widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the Tk path name of widget My_Button
      -- Path_Name: constant String := Tk_Path_Name(My_Button);
      -- SOURCE
   function Tk_Path_Name(Widgt: Tk_Widget) return String with
      Pre => Widgt /= Null_Widget,
      Post => Tk_Path_Name'Result'Length > 0,
      Test_Case => (Name => "Test_Tk_PathName", Mode => Nominal);
   -- ****

   -- ****f* Widget/Widget.Tk_Interp
   -- FUNCTION
   -- Get Tcl interpreter on which the selected Tk widget exists
   -- PARAMETERS
   -- Widgt - Tk widget which Tcl interpreter will be taken
   -- RESULT
   -- Tcl interpreter of the selected Tk widget
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get the Tcl interpreter of widget My_Label
   -- Interpreter: constant Tcl_Interpreter := Tk_Interp(My_Label);
   -- SOURCE
   function Tk_Interp(Widgt: Tk_Widget) return Tcl_Interpreter with
      Pre => Widgt /= Null_Widget,
      Test_Case => (Name => "Test_Tk_Interp", Mode => Nominal),
      Import => True,
      Convention => C,
      External_Name => "Tk_Interp";
      -- ****

      -- ****f* Widget/Widget.Tk_Window_Id
      -- FUNCTION
      -- Get the window manager identifier for the selected Tk_Widget
      -- PARAMETERS
      -- Widgt - Tk widget which identifier will be get
      -- RESULT
      -- The window manager identifier for the selected widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the window manager identifier of widget My_Dialog
      -- Window: constant Tk_Window := Tk_Window_Id(My_Dialog);
      -- SOURCE
   function Tk_Window_Id(Widgt: Tk_Widget) return Tk_Window with
      Pre => Widgt /= Null_Widget,
      Test_Case => (Name => "Test_Tk_Window_Id", Mode => Nominal),
      Import => True,
      Convention => C,
      External_Name => "Get_Window_Id";
      -- ****

      -- ****f* Widget/Widget.Option_Image
      -- FUNCTION
      -- Allow to convert the selected widget's option to Unbounded_String
      -- which can be used in creating or configuring the widget.
      -- PARAMETERS
      -- Name           - The name of the selected widget's option
      -- Value          - The value of the selected widget's option which will
      --                  be converted to Unbounded_String
      -- Options_String - String with currently set options for the selected
      --                  widget
      -- OUTPUT
      -- If Value has default value for the selected type, then return
      -- unmodified Options_String. Otherwise append the proper Tk
      -- configuration option to the Options_String.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the text option to hello world in My_Options string
      -- declare
      --    My_Options: Unbounded_String;
      -- begin
      --    Option_Image("text", To_Tcl_String("hello world"), My_Options);
      -- end;
      -- SOURCE
   procedure Option_Image
     (Name: String; Value: Tcl_String;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Tcl_String", Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Extended_Natural;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Extended_Natural",
       Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Pixel_Data;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Pixed_Data", Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Relief_Type;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Relief_Type", Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: State_Type;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_State_Type", Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Directions_Type;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Directions_Type",
       Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Place_Type;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Place_Type", Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Justify_Type;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Justify_Type", Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Pad_Data;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Pad_Data", Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Tk_Widget;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Tk_Widget", Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Extended_Boolean;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Extended_Boolean",
       Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Tk_Window;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Tk_Window", Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Anchor_Directions;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Anchor_Directions",
       Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Positive_Float;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Positive_Float",
       Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Point_Position;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Point_Position",
       Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Boolean;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Boolean", Mode => Nominal);
      -- ****

      -- ****f* Widget/Widget.Option_Image_(Integer)
      -- FUNCTION
      -- Allow to convert the selected widget's option to Unbounded_String
      -- which can be used in creating or configuring the widget.
      -- PARAMETERS
      -- Name           - The name of the selected widget's option
      -- Value          - The value of the selected widget's option which will
      --                  be converted to Unbounded_String
      -- Options_String - String with currently set options for the selected
      --                  widget
      -- Base           - Type of result number, 10 for decimal, 16 for
      --                  hexadecimal
      -- OUTPUT
      -- If Value has default value for the selected type, then return
      -- unmodified Options_String. Otherwise append the proper Tk
      -- configuration option to the Options_String.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the option use to hexadecimal 1 in My_Options string
      -- declare
      --    My_Options: Unbounded_String;
      -- begin
      --    Option_Image("use", 1, My_Options, 16);
      -- end;
      -- SOURCE
   procedure Option_Image
     (Name: String; Value: Integer; Options_String: in out Unbounded_String;
      Base: Positive := 10) with
      Pre => Name'Length > 0 and Base in 10 | 16,
      Test_Case => (Name => "Test_Option_Image_Integer", Mode => Nominal);
      -- ****

   -- ****f* Widget/Widget.Option_Value
   -- FUNCTION
   -- Allow convert the selected widget's option from Tcl string value to
   -- proper Widget_Options field value. It is mostly used in the widgets
   -- Get_Options funcion
   -- PARAMETERS
   -- Widgt - Tk_Widget which option will be get
   -- Name   - The name of the option to get
   -- RESULT
   -- Tcl string value converted to the proper Ada binding type
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get the value of option text in My_Button widget
   -- Text: constant Tcl_String := Option_Value(My_Button, "text");
   -- SOURCE
   function Option_Value(Widgt: Tk_Widget; Name: String) return Tcl_String with
      Pre => Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Tcl_String", Mode => Nominal);
   function Option_Value
     (Widgt: Tk_Widget; Name: String) return Directions_Type with
      Pre => Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Direction_Type",
       Mode => Nominal);
   function Option_Value(Widgt: Tk_Widget; Name: String) return Pixel_Data with
      Pre => Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Pixel_Data", Mode => Nominal);
   function Option_Value(Widgt: Tk_Widget; Name: String) return Place_Type with
      Pre => Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Place_Type", Mode => Nominal);
   function Option_Value(Widgt: Tk_Widget; Name: String) return State_Type with
      Pre => Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_State_Type", Mode => Nominal);
   function Option_Value
     (Widgt: Tk_Widget; Name: String) return Justify_Type with
      Pre => Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Justify_Type", Mode => Nominal);
   function Option_Value
     (Widgt: Tk_Widget; Name: String) return Relief_Type with
      Pre => Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Relief_Type", Mode => Nominal);
   function Option_Value
     (Widgt: Tk_Widget; Name: String) return Extended_Natural with
      Pre => Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Extended_Natural",
       Mode => Nominal);
   function Option_Value
     (Widgt: Tk_Widget; Name: String) return Extended_Boolean with
      Pre => Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Extended_Boolean",
       Mode => Nominal);
   function Option_Value(Widgt: Tk_Widget; Name: String) return Tk_Widget with
      Pre => Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Tk_Widget", Mode => Nominal);
   function Option_Value(Widgt: Tk_Widget; Name: String) return Tk_Window with
      Pre => Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Tk_Window", Mode => Nominal);
   function Option_Value(Widgt: Tk_Widget; Name: String) return Integer with
      Pre => Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Integer", Mode => Nominal);
   function Option_Value
     (Widgt: Tk_Widget; Name: String) return Anchor_Directions with
      Pre => Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Anchor_Directions",
       Mode => Nominal);
   -- ****

   --------------------------------
   -- Destroy or delete a Tk widget
   --------------------------------

   -- ****f* Widget/Widget.Destroy
   -- FUNCTION
   -- Destroy the selected Tk widget and everything what is related to it,
   -- like children, events, etc
   -- PARAMETERS
   -- Widgt - Tk widget to destroy
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Destroy My_Label widget
   -- Destroy(My_Label);
   -- COMMANDS
   -- destroy Widget
   -- SOURCE
   procedure Destroy(Widgt: in out Tk_Widget) with
      Pre => Widgt /= Null_Widget,
      Post => Widgt = Null_Widget,
      Test_Case => (Name => "Test_Destroy", Mode => Nominal);
   -- ****

   ----------------
   -- Miscellaneous
   ----------------

      -- ****f* Widget/Widget.Execute_Widget_Command_(procedure)
      -- FUNCTION
      -- Execute the selected command on the selected widget. Generally the
      -- function shouldn't be used, use it only when the selected Tk widget
      -- command isn't implemented. If you want to get result of the command,
      -- use Tcl_GetStringResult function.
      -- PARAMETERS
      -- Widget       - Tk widget on which the command will be executed
      -- Command_Name - Tk command which will be executed
      -- Options      - Option for the selected Tk command
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set text on My_Button to click me
      -- Execute_Widget_Command(My_Button, "text", "{click me}");
      -- SEE ALSO
      -- Widget.Execute_Widget_Command_(function)
      -- SOURCE
   procedure Execute_Widget_Command
     (Widgt: Tk_Widget; Command_Name: String; Options: String := "") with
      Pre => Widgt /= Null_Widget and Command_Name'Length > 0,
      Test_Case => (Name => "Test_Execute_Widget_Command", Mode => Nominal);
      -- ****

      -- ****f* Widget/Widget.Execute_Widget_Command_(function)
      -- FUNCTION
      -- Execute the selected command on the selected widget and returns its
      -- result as Ada Strings. Generally the function shouldn't be used,
      -- use it only when the selected Tk widget command isn't implemented.
      -- PARAMETERS
      -- Widget       - Tk widget on which the command will be executed
      -- Command_Name - Tk command which will be executed
      -- Options      - Option for the selected Tk command
      -- RESULT
      -- Ada String with result of the executed Tk widget command
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the type of menu entry of My_Menu second entry
      -- Menu_Entry_Type: constant String := Execute_Widget_Command(My_Menu, "type", "1");
      -- SEE ALSO
      -- Widget.Execute_Widget_Command_(procedure)
      -- SOURCE
   function Execute_Widget_Command
     (Widgt: Tk_Widget; Command_Name: String; Options: String := "")
      return String with
      Pre => Widgt /= Null_Widget and Command_Name'Length > 0,
      Test_Case => (Name => "Test_Execute_Widget_Command2", Mode => Nominal);
      -- ****

      -- ****g* Widget/Widget.Generic_Scalar_Execute_Widget_Command
      -- FUNCTION
      -- Generic function to execute Tk widget command and return its result
      -- as as scalar type
      -- PARAMETERS
      -- Widget       - Tk widget on which the command will be executed
      -- Command_Name - Tk command which will be executed
      -- Options      - Option for the selected Tk command
      -- RESULT
      -- Scalar type with the result of the Tk widget command
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Execute Tk widget command and get its result as Integer
      -- Integer_Execute is new Generic_Scalar_Execute_Widget_Command(Integer);
      -- Result: constant Integer := Integer_Execute(My_Grid, "slaves");
      -- SEE ALSO
      -- Widget.Generic_Float_Execute_Widget_Command;
      -- SOURCE
   generic
      type Result_Type is (<>);
   function Generic_Scalar_Execute_Widget_Command
     (Widgt: Tk_Widget; Command_Name: String; Options: String := "")
      return Result_Type;
      -- ****

      -- ****g* Widget/Widget.Generic_Float_Execute_Widget_Command
      -- FUNCTION
      -- Generic function to execute Tk widget command and return its result
      -- as as float type
      -- PARAMETERS
      -- Widget       - Tk widget on which the command will be executed
      -- Command_Name - Tk command which will be executed
      -- Options      - Option for the selected Tk command
      -- RESULT
      -- Float type with the result of the Tk widget command
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Execute Tk widget command and get its result as Float
      -- Float_Execute is new Generic_Float_Execute_Widget_Command(Float);
      -- Result: constant Float := Float_Execute(My_Grid, "slaves", "-row 0");
      -- SEE ALSO
      -- Widget.Generic_Scalar_Execute_Widget_Command;
      -- SOURCE
   generic
      type Result_Type is digits <>;
   function Generic_Float_Execute_Widget_Command
     (Widgt: Tk_Widget; Command_Name: String; Options: String := "")
      return Result_Type;
      -- ****

      --## rule off REDUCEABLE_SCOPE

end Tk.Widget;
