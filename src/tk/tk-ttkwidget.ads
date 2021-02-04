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

   -- ****t* TtkWidget/TtkWidget.Ttk_Widget
   -- FUNCTION
   -- The identifier of the Ttk Widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Ttk_Widget is Tk_Widget;
   -- ****

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

      -- ****t* TtkWidget/TtkWidget.Ttk_State_Type
      -- FUNCTION
      -- Type used to set the current state of the selected Ttk widget
      -- SOURCE
   type Ttk_State_Type is
     (ACTIVE, DISABLED, FOCUS, PRESSED, SELECTED, BACKGROUND, READONLY,
      ALTERNATE, INVALID, HOVER);
   -- ****

   -- ****t* TtkWidget/TtkWidget.Ttk_State_Array
   -- FUNCTION
   -- Array of Ttk_State_Type. Used mostly in taking information about the
   -- state of the selecte Ttk widget
   -- SOURCE
   type Ttk_State_Array is array(Positive range <>) of Ttk_State_Type;
   -- ****

      -- ****t* TtkWidget/TtkWidget.Compound_Type
      -- FUNCTION
      -- Type of possible place directions for text and image on the Ttk
      -- widgets
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   type Compound_Type is
     (EMPTY, NONE, BOTTOM, TOP, LEFT, RIGHT, CENTER, TEXT, IMAGE) with
      Default_Value => EMPTY;
      -- ****

      -- ****t* TtkWidget/TtkWidget.Disabled_State_Type
      -- FUNCTION
      -- Type used to set disabled bit of the Ttk widgets for compatybility
      -- with old Tk widgets
      -- SOURCE
   type Disabled_State_Type is (NORMAL, DISABLED, NONE) with
      Default_Value => NONE;
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
      Test_Case => ("Test_Option_Image_Compound_Type", Nominal);
   procedure Option_Image
     (Name: String; Value: Disabled_State_Type;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => ("Test_Option_Image_Distabled_State_Type", Nominal);
   procedure Option_Image
     (Name: String; Value: Ttk_Image_Option;
      Options_String: in out Unbounded_String) with
      Pre => Name'Length > 0,
      Test_Case => ("Test_Option_Image_Image_Option", Nominal);
      -- ****

   -- ****f* TtkWidget/TtkWidget.In_State_(function)
   -- FUNCTION
   -- Check if the selected Ttk widget is in the selected state
   -- PARAMETERS
   -- Widget - The Ttk widget which state will be tested
   -- State  - Ttk_State to check
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
     (Widget: Ttk_Widget; State: Ttk_State_Type) return Boolean with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Ttk_Widget_In_State", Nominal);
      -- ****

      -- ****f* TtkWidget/TtkWidget.In_State(procedure)
      -- FUNCTION
      -- Check if the selected Ttk widget is in the selected state. If is,
      -- then execute the selected Tcl commands
      -- PARAMETERS
      -- Widget     - The Ttk widget which state will be checked
      -- State      - Ttk_State to check
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
     (Widget: Ttk_Widget; State: Ttk_State_Type; Tcl_Script: Tcl_String) with
      Pre => Widget /= Null_Widget and Length(Tcl_Script) > 0,
      Test_Case => ("Test_Ttk_Widget_In_State2", Nominal);
      -- ****

      -- ****f* TtkWidget/TtkWidget.State_(procedure)
      -- FUNCTION
      -- Set the selected state for the selected Ttk widget
      -- PARAMETERS
      -- Widget  - The Ttk widget which state will be changed
      -- State   - The selected state to set or unset
      -- Disable - If True, disable the selected State. Otherwise enable it
      --           for the selected Widget. Default value is False.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Enable Ttk widget My_Button
      -- State(My_Button, DISABLED, True);
      -- SEE ALSO
      -- TtkWidget.State_(function)
      -- COMMANDS
      -- Widget state State
      -- SOURCE
   procedure State
     (Widget: Ttk_Widget; State: Ttk_State_Type;
      Disable: Boolean := False) with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Ttk_Widget_State", Nominal);
      -- ****

      -- ****f* TtkWidget/Ttk_Widget.State_(function)
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
      -- States: constant Ttk_State_Array := State(My_Button);
      -- SEE ALSO
      -- TtkWidget.State_(procedure)
      -- COMMANDS
      -- Widget state
      -- SOURCE
   function State(Widget: Ttk_Widget) return Ttk_State_Array with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Ttk_Widget_State2", Nominal);
      -- ****

end Tk.TtkWidget;
