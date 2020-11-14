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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Tcl.Strings; use Tcl.Strings;

-- ****h* Tk/Widget
-- FUNCTION
-- Provide code for manipulate Tk widgets. Parent of the all widget.
-- SOURCE
package Tk.Widget is
-- ****

   -- ****s* Widget/Widget.Tk_Widget
   -- FUNCTION
   -- The identifier of the Tk Widget.
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Tk_Widget is new Integer;
   -- ****

   -- ****t* Widget/Widget.Relief_Type
   -- FUNCTION
   -- Type of Tk widget 3D effect
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Relief_Type is (NONE, RAISED, SUNKEN, FLAT, RIDGE, SOLID, GROOVE) with
      Default_Value => NONE;
   -- ****

   -- ****t* Widget/Widget.Pixel_Unit
   -- FUNCTION
   -- Type of possible screen distance units
   -- SOURCE
   type Pixel_Unit is (PIXEL, C, I, M, P) with
      Default_Value => PIXEL;
   -- ****

   -- ****t* Widget/Widget.Directions_Type
   -- FUNCTION
   -- Type of possible directions for various widgets configuration options
   -- SOURCE
   type Directions_Type is (NONE, N, NE, E, SE, S, SW, W, NW, CENTER) with
      Default_Value => NONE;
      -- ****

      -- ****t* Widget/Widget.Positive_Float
      -- FUNCTION
      -- Type used for positive float values, value -1 means empty value
      -- SOURCE
   type Positive_Float is digits 2 range -1.0 .. Float'Last with
      Default_Value => -1.0;
      -- ****

      -- ****t* Widget/Widget.Place_Type
      -- FUNCTION
      -- Type of possible place directions for various widgets configuration
      -- options
      -- SOURCE
   type Place_Type is (EMPTY, NONE, BOTTOM, TOP, LEFT, RIGHT, CENTER) with
      Default_Value => EMPTY;
      -- ****

      -- ****t* Widget/Widget.Extended_Boolean
      -- FUNCTION
      -- Type used for set boolean values of various widgets configuration
      -- options
      -- SOURCE
   type Extended_Boolean is (FALSE, TRUE, NONE) with
      Default_Value => NONE;
      -- ****

      -- ****t* Widget/Widget.Justify_Type
      -- FUNCTION
      -- Type used to set text justify option of various widgets
      -- SOURCE
   type Justify_Type is (NONE, LEFT, CENTER, RIGHT) with
      Default_Value => NONE;
      -- ****

      -- ****t* Widget/Widget.Extended_Natural
      -- FUNCTION
      -- Type used for set non-negative values for various widgets
      -- configuration options
      -- SOURCE
   type Extended_Natural is new Integer range -1 .. Integer'Last with
      Default_Value => -1;
      -- ****

      -- ****t* Widget/Widget.State_Type
      -- FUNCTION
      -- Type used to set the state of the selected widget
      -- SOURCE
   type State_Type is (NORMAL, ACTIVE, DISABLED, NONE) with
      Default_Value => NONE;
      -- ****

      -- ****s* Widget/Tk.Pixel_Data
      -- FUNCTION
      -- Data structure to store information about pixel
      -- PARAMETERS
      -- Value      - Value of screen distance for the pixel
      -- Value_Unit - Type of screen distance unit. Default are pixels
      -- SOURCE
   type Pixel_Data is record
      Value: Positive_Float;
      Value_Unit: Pixel_Unit := PIXEL;
   end record;
   -- ****

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
   -- EXAMPLE
   -- -- Get the Tk Widget ID for .mybutton pathname widget on the default Tcl interpreter
   -- My_Button: constant Tk_Widget := Get_Widget(".mybutton");
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Get_Widget
     (Path_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Widget;
      -- ****

      -- ****f* Widget/Widget.Tk_PathName
      -- FUNCTION
      -- Get the full Tk path name of the selected Tk widget
      -- PARAMETERS
      -- Widget - Tk widget which path name will be taken
      -- RESULT
      -- Full Tk path name of the selected Tk widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the Tk path name of widget My_Button
      -- Path_Name: constant String := Tk_PathName(My_Button);
      -- SOURCE
   function Tk_PathName(Widget: Tk_Widget) return String;
   -- ****

   -- ****f* Widget/Widget.Tk_Interp
   -- FUNCTION
   -- Get Tcl interpreter on which the selected Tk widget exists
   -- PARAMETERS
   -- Widget - Tk widget which Tcl interpreter will be taken
   -- RESULT
   -- Tcl interpreter of the selected Tk widget
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get the Tcl interpreter of widget My_Label
   -- Interpreter: constant Tcl_Interpreter := Tk_Interp(My_Label);
   -- SOURCE
   function Tk_Interp(Widget: Tk_Widget) return Tcl_Interpreter;
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
      --    Options_String("text", To_Tcl_String("hello world"));
      -- end;
      -- SOURCE
   procedure Option_Image
     (Name: String; Value: Tcl_String;
      Options_String: in out Unbounded_String);
   procedure Option_Image
     (Name: String; Value: Extended_Natural;
      Options_String: in out Unbounded_String);
   procedure Option_Image
     (Name: String; Value: Pixel_Data;
      Options_String: in out Unbounded_String);
   procedure Option_Image
     (Name: String; Value: Relief_Type;
      Options_String: in out Unbounded_String);
   procedure Option_Image
     (Name: String; Value: State_Type;
      Options_String: in out Unbounded_String);
   procedure Option_Image
     (Name: String; Value: Directions_Type;
      Options_String: in out Unbounded_String);
   procedure Option_Image
     (Name: String; Value: Place_Type;
      Options_String: in out Unbounded_String);
   procedure Option_Image
     (Name: String; Value: Justify_Type;
      Options_String: in out Unbounded_String);
   -- ****

   -- ****f* Widget/Widget.Option_Value
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
   -- -- Get the value of option text in My_Button widget
   -- Text: constant Tcl_String := Option_Value(My_Button, "text");
   -- SOURCE
   function Option_Value(Widget: Tk_Widget; Name: String) return Tcl_String;
   -- ****

      --------------------------------
      -- Destroy or delete a Tk widget
      --------------------------------

      -- ****f* Widget/Widget.Destroy
      -- FUNCTION
      -- Destroy the selected Tk widget and everything what is related to it,
      -- like children, events, etc
      -- PARAMETERS
      -- Widget - Tk widget to destroy
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Destroy My_Label widget
      -- Destroy(My_Label);
      -- SOURCE
   procedure Destroy(Widget: in out Tk_Widget);
   -- ****

   ----------------
   -- Miscellaneous
   ----------------

   -- ****f* Widget/Widget.Execute_Widget_Command
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
   -- SOURCE
   procedure Execute_Widget_Command
     (Widget: Tk_Widget; Command_Name: String; Options: String := "") with
      Pre => Command_Name'Length > 0;
      -- ****

end Tk.Widget;
