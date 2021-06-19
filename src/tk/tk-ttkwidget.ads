-- Copyright (c) 2021 Bartek thindil Jasicki <thindil@laeran.pl>
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
with Tk.Widget; use Tk.Widget;
with Tcl.Strings; use Tcl.Strings;

-- ****h* Tk/TtkWidget
-- FUNCTION
-- Provide code for manipulate Ttk widgets. Parent of the all Ttk widgets.
-- SOURCE
package Tk.TtkWidget is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****t* TtkWidget/TtkWidget.Ttk_Widget
   -- FUNCTION
   -- The identifier of the Ttk Widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Ttk_Widget is Tk_Widget;
   -- ****

   --## rule off TYPE_INITIAL_VALUES
   -- ****s* TtkWidget/TtkWidget.Ttk_Widget_Options
   -- FUNCTION
   -- Abstract records to store available options and their values for widgets.
   -- All Ttk widgets options should be children of this record
   -- OPTIONS
   -- Class - The class of the widget. Used to query for the widget options
   --         and default binding tags for the widget
   -- Style - The name of the style used by the widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Ttk_Widget_Options is abstract new Widget_Options with record
      Class: Tcl_String;
      Style: Tcl_String;
   end record;
   -- ****
   --## rule on TYPE_INITIAL_VALUES

   -- ****t* TtkWidget/TtkWidget.Ttk_State_Type
   -- FUNCTION
   -- Type used to set the current state of the selected Ttk widget
   -- OPTIONS
   -- ACTIVE     - Mouse cursor is above the widget, aka hover state
   -- DISABLED   - The widget is disabled aka inactive state
   -- FOCUS      - The widget has keyboard focus
   -- PRESSED    - The widget is being pressed
   -- SELECTED   - The widget (checkbuttons or radiobuttons) is on, selected
   -- BACKGROUND - The widget is in background state (Windows and Mac only)
   -- READONLY   - The widget can't be modified by the user
   -- ALTERNATE  - The widget specific alternate display format. For example,
   --              checkbuttons with mixed or tristate state
   -- INVALID    - The widget value is invalid (mostly entries and scales)
   -- HOVER      - Mouse cursor is above the widget, similar to ACTIVE state
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Ttk_State_Type is
     (ACTIVE, DISABLED, FOCUS, PRESSED, SELECTED, BACKGROUND, READONLY,
      ALTERNATE, INVALID, HOVER) with
      Default_Value => ACTIVE;
   -- ****

   -- ****d* TtkWidget/TtkWidget.Default_Ttk_State
   -- FUNCTION
   -- Default Ttk_State_Type value
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Ttk_State: constant Ttk_State_Type := ACTIVE;

   --## rule off TYPE_INITIAL_VALUES
   -- ****t* TtkWidget/TtkWidget.Ttk_State_Array
   -- FUNCTION
   -- Array of Ttk_State_Type. Used mostly in taking information about the
   -- state of the selecte Ttk widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Ttk_State_Array is array(Positive range <>) of Ttk_State_Type with
      Default_Component_Value => Default_Ttk_State;
   -- ****
   --## rule on TYPE_INITIAL_VALUES

   -- ****t* TtkWidget/TtkWidget.Compound_Type
   -- FUNCTION
   -- Type of possible place directions for text and image on the Ttk
   -- widgets
   -- OPTIONS
   -- EMPTY  - Used only during setting the widget configuration. Use the
   --          default setting for the selected widget
   -- NONE   - The default, display image if present, otherwise text
   -- BOTTOM - Display image below text
   -- TOP    - Display image above text
   -- LEFT   - Display image on the right from text
   -- RIGHT  - Display image on the left from text
   -- CENTER - Display text on top of image
   -- TEXT   - Display text only
   -- IMAGE  - Display image only
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Compound_Type is
     (EMPTY, NONE, BOTTOM, TOP, LEFT, RIGHT, CENTER, TEXT, IMAGE) with
      Default_Value => EMPTY;
      -- ****

      -- ****d* TtkWidget/TtkWidget.Default_Compound_Type
      -- FUNCTION
      -- Default value for Compound_Type
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Compound_Type: constant Compound_Type := EMPTY;
   -- ****

   -- ****t* TtkWidget/TtkWidget.Disabled_State_Type
   -- FUNCTION
   -- Type used to set disabled bit of the Ttk widgets for compatybility
   -- with old Tk widgets
   -- OPTIONS
   -- NORMAL   - The widget is not disabled
   -- DISABLED - The widget is disabled
   -- NONE     - Used only in configuring the widget, to set default state
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Disabled_State_Type is (NORMAL, DISABLED, NONE) with
      Default_Value => NONE;
      -- ****

      -- ****d* TtkWidget/TtkWidget.Default_Disabled_State
      -- FUNCTION
      -- Default value for Disabled_State_Type
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Disabled_State: constant Disabled_State_Type := NONE;
   -- ****

   -- ****s* TtkWidget/TtkWidget.Ttk_Image_Option
   -- FUNCTION
   -- Used to store configuration of images used by the selected Ttk_Widget
   -- OPTIONS
   -- Default    - The default image, used when no other specified for other
   --              states
   -- Active     - The image used when widget is in active state
   -- Disabled   - The image used when widget is in disabled state
   -- Focus      - The image used when widget is in focus state
   -- Pressed    - The image used when widget is in pressed state
   -- Selected   - The image used when widget is in selected state
   -- Background - The image used when widget is in background state
   -- Readonly   - The image used when widget is in readonly state
   -- Alternate  - The image used when widget is in alternate state
   -- Invalid    - The image used when widget is in invalid state
   -- Hover      - The image used when widget is in hover state
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Ttk_Image_Option is record
      Default: Tcl_String;
      Active: Tcl_String;
      Disabled: Tcl_String;
      Focus: Tcl_String;
      Pressed: Tcl_String;
      Selected: Tcl_String;
      Background: Tcl_String;
      Readonly: Tcl_String;
      Alternate: Tcl_String;
      Invalid: Tcl_String;
      Hover: Tcl_String;
   end record;
   -- ****

   -- ****d* TtkWidget/TtkWidget.Default_Ttk_Image_Option
   -- FUNCTION
   -- Default value for Ttk_Image_Option
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Ttk_Image_Option: constant Ttk_Image_Option :=
     (others => Null_Tcl_String);
   -- ****

   -- ****s* TtkWidget/TtkWidget.Padding_Data
   -- FUNCTION
   -- Store padding information for ttk widgets
   -- OPTIONS
   -- Left   - Free space added at the left side of the widget
   -- Top    - Free space added at the top of the widget
   -- Right  - Free space added at the right side of the widget
   -- Bottom - Free space added at the bottom of the widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Padding_Data is record
      Left: Pixel_Data;
      Top: Pixel_Data;
      Right: Pixel_Data;
      Bottom: Pixel_Data;
   end record;
   -- ****

   -- ****d* Tk.TtkWidget/Empty_Padding_Data
   -- FUNCTION
   -- Empty value for Padding_Data
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Padding_Data: constant Padding_Data := Padding_Data'(others => <>);
   -- ****

   -- ****f* TtkWidget/TtkWidget.Option_Image
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
   --    Option_Image("compound", BOTTOM, My_Options);
   -- end;
   -- SOURCE
   procedure Option_Image
     (Name: String; Value: Compound_Type;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Compound_Type",
       Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Disabled_State_Type;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Distabled_State_Type",
       Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Ttk_Image_Option;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Image_Option", Mode => Nominal);
   procedure Option_Image
     (Name: String; Value: Padding_Data;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Option_Image_Padding_Data", Mode => Nominal);
      -- ****

   -- ****f* TtkWidget/TtkWidget.Option_Value
   -- FUNCTION
   -- Allow convert the selected widget's option from Tcl string value to
   -- proper Widget_Options field value. It is mostly used in the widgets
   -- Get_Options funcion
   -- PARAMETERS
   -- Widget - Tk_Widget which option will be get
   -- Name   - The name of the option to get
   -- RESULT
   -- Tcl string value converted to the proper Ada binding type
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get the value of option state in My_Button widget
   -- Button_State: constant Disabled_State_Type := Option_Value(My_Button, "state");
   -- SOURCE
   function Option_Value
     (Ttk_Widgt: Ttk_Widget; Name: String) return Compound_Type with
      Pre => Ttk_Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Compound_Type",
       Mode => Nominal);
   function Option_Value
     (Ttk_Widgt: Ttk_Widget; Name: String) return Disabled_State_Type with
      Pre => Ttk_Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Disabled_State_Type",
       Mode => Nominal);
   function Option_Value
     (Ttk_Widgt: Ttk_Widget; Name: String) return Ttk_Image_Option with
      Pre => Ttk_Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Ttk_Image_Option",
       Mode => Nominal);
   function Option_Value
     (Ttk_Widgt: Ttk_Widget; Name: String) return Padding_Data with
      Pre => Ttk_Widgt /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Option_Value_Padding_Data", Mode => Nominal);
      -- ****

   -- ****f* TtkWidget/TtkWidget.In_State_(function)
   -- FUNCTION
   -- Check if the selected Ttk widget is in the selected state
   -- PARAMETERS
   -- Widget    - The Ttk widget which state will be tested
   -- State_Ttk - Ttk_State to check
   -- RESULT
   -- True if the selected Ttk widget is in the selected state, otherwise
   -- False
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Check if the Ttk widget My_Button is disabled
   -- Is_Disabled: constant Boolean := In_State(My_Button, DISABLED);
   -- SEE ALSO
   -- TtkWidget.In_State_(procedure)
   -- COMMANDS
   -- Widget instate State
   -- SOURCE
   function In_State
     (Ttk_Widgt: Ttk_Widget; State_Ttk: Ttk_State_Type) return Boolean with
      Pre => Ttk_Widgt /= Null_Widget,
      Test_Case => (Name => "Test_Ttk_Widget_In_State", Mode => Nominal);
      -- ****

      -- ****f* TtkWidget/TtkWidget.In_State(procedure)
      -- FUNCTION
      -- Check if the selected Ttk widget is in the selected state. If is,
      -- then execute the selected Tcl commands
      -- PARAMETERS
      -- Widget     - The Ttk widget which state will be checked
      -- State_Type - Ttk_State to check
      -- Tcl_Script - The Tcl commands which will be executed if the widget
      --              is in the selected state
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Exit the program if My_Entry Ttk widget is disabled
      -- In_State(My_Entry, DISABLED, To_Tcl_String("exit"));
      -- SEE ALSO
      -- TtkWidget.In_State_(function)
      -- COMMANDS
      -- Widget instate State Tcl_Script
      -- SOURCE
   procedure In_State
     (Ttk_Widgt: Ttk_Widget; State_Type: Ttk_State_Type;
      Tcl_Script: Tcl_String) with
      Pre => Ttk_Widgt /= Null_Widget and Length(Source => Tcl_Script) > 0,
      Test_Case => (Name => "Test_Ttk_Widget_In_State2", Mode => Nominal);
      -- ****

      -- ****f* TtkWidget/TtkWidget.Set_State
      -- FUNCTION
      -- Set the selected state for the selected Ttk widget
      -- PARAMETERS
      -- Widget       - The Ttk widget which state will be changed
      -- Widget_State - The selected state to set or unset
      -- Disable      - If True, disable the selected State. Otherwise enable
      --                it for the selected Widget. Default value is False.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Enable Ttk widget My_Button
      -- Set_State(My_Button, DISABLED, True);
      -- SEE ALSO
      -- TtkWidget.Get_States
      -- COMMANDS
      -- Widget state State
      -- SOURCE
   procedure Set_State
     (Ttk_Widgt: Ttk_Widget; Widget_State: Ttk_State_Type;
      Disable: Boolean := False) with
      Pre => Ttk_Widgt /= Null_Widget,
      Test_Case => (Name => "Test_Ttk_Widget_State", Mode => Nominal);
      -- ****

      -- ****f* TtkWidget/Ttk_Widget.Get_States
      -- FUNCTION
      -- Get the states of the selected Ttk widget
      -- PARAMETERS
      -- Widget - The Ttk widget which states will be taken
      -- RESULT
      -- Ttk_State_Array with all states currently set for the selected Widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the states of Ttk widget My_Button
      -- States: constant Ttk_State_Array := Get_States(My_Button);
      -- SEE ALSO
      -- TtkWidget.Set_State
      -- COMMANDS
      -- Widget state
      -- SOURCE
   function Get_States(Ttk_Widgt: Ttk_Widget) return Ttk_State_Array with
      Pre => Ttk_Widgt /= Null_Widget,
      Test_Case => (Name => "Test_Ttk_Widget_State2", Mode => Nominal);
      -- ****
      --## rule on REDUCEABLE_SCOPE

end Tk.TtkWidget;
