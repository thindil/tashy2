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
   type Relief_Type is (NONE, RAISED, SUNKEN, FLAT, RIDGE, SOLID, GROOVE);
   -- ****

   -- ****t* Widget/Tk.Pixel_Unit
   -- FUNCTION
   -- Type of possible screen distance units
   -- SOURCE
   type Pixel_Unit is (PIXEL, 'c', 'i', 'm', 'p');
   -- ****

   -- ****s* Widget/Tk.Pixel_Data
   -- FUNCTION
   -- Data structure to store information about pixel
   -- PARAMETERS
   -- Value      - Value of screen distance for the pixel
   -- Value_Unit - Type of screen distance unit. Default are pixels
   -- SOURCE
   type Pixel_Data is record
      Value: Float range -1.0 .. Float'Last := -1.0;
      Value_Unit: Pixel_Unit := PIXEL;
   end record;
   -- ****

   -- ****s* Widget/Widget.Widget_Options
   -- FUNCTION
   -- Abstract records to store available options and their values for widgets.
   -- All Tk widgets options should be children of this record
   -- PARAMETERS
   -- Ttk - If True, the widget options are for Ttk widget, otherwise for old
   --       type of widgets
   -- OPTIONS
   -- Cursor       - Name of the cursor to set for the selected Tk widget
   -- Take_Focus   - Can be "1", "0", empty string or Tcl script which will
   --                return "1", "0" or empty string
   -- Border_Width - The width of the border of the selected Tk Widget. Only
   --                non-ttk widgets
   -- Relief       - Type of 3D effect for the Tk widget. Only non-ttk widgets
   -- Class        - Class of the selected Ttk widget
   -- Style        - Style for the selected Ttk widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Widget_Options(Ttk: Boolean) is abstract tagged record
      Cursor: Unbounded_String := Null_Unbounded_String;
      Take_Focus: Unbounded_String := Null_Unbounded_String;
      case Ttk is
         when False =>
            Border_Width: Pixel_Data;
            Relief: Relief_Type := NONE;
         when True =>
            Class: Unbounded_String := Null_Unbounded_String;
            Style: Unbounded_String := Null_Unbounded_String;
      end case;
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

     -- ****f* Widget/Widget.Get_Option_(String)
     -- FUNCTION
     -- Get value of the selected option for the selected Tk widget
     -- PARAMETERS
     -- Widget - Tk widget which option's value will be taken
     -- Name   - Name of the option which value will be taken
     -- RESULT
     -- String with value of the selected option for the selected Tk widget
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
     -- -- Get the value of text option for My_Label widget
     -- Text: constant String := Get_Option(My_Label, "-text");
     -- SEE ALSO
     -- Widget.Get_Option_(Integer) and Widget.Get_Option_(Float)
     -- SOURCE
   function Get_Option(Widget: Tk_Widget; Name: String) return String with
      Pre => Name'Length > 0;
      -- ****

     -- ****f* Widget/Widget.Get_Option_(Integer)
     -- FUNCTION
     -- Get value of the selected option for the selected Tk widget
     -- PARAMETERS
     -- Widget - Tk widget which option's value will be taken
     -- Name   - Name of the option which value will be taken
     -- RESULT
     -- Integer value of the selected option for the selected Tk widget
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
     -- -- Get the value of width option for My_Frame widget
     -- Width: constant Integer := Get_Option(My_Frame, "-width");
     -- SEE ALSO
     -- Widget.Get_Option_(String) and Widget.Get_Option_(Float)
     -- SOURCE
   function Get_Option(Widget: Tk_Widget; Name: String) return Integer with
      Pre => Name'Length > 0;
      -- ****

     -- ****f* Widget/Widget.Get_Option_(Float)
     -- FUNCTION
     -- Get value of the selected option for the selected Tk widget
     -- PARAMETERS
     -- Widget - Tk widget which option's value will be taken
     -- Name   - Name of the option which value will be taken
     -- RESULT
     -- Float value of the selected option for the selected Tk widget
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
     -- -- Get the value of maximum option for My_ProgressBar widget
     -- Maximum: constant Float := Get_Option(My_ProgressBar, "-maximum");
     -- SEE ALSO
     -- Widget.Get_Option_(String) and Widget.Get_Option_(Integer)
     -- SOURCE
   function Get_Option(Widget: Tk_Widget; Name: String) return Float with
      Pre => Name'Length > 0;
      -- ****

      -- ****f* Widget/Widget.Configure
      -- FUNCTION
      -- Set a new value(s) for the selected option(s) in the selected Tk
      -- widget
      -- PARAMETERS
      -- Widget  - Tk widget which option(s) will be set
      -- Options - List of pairs option value which will be set
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the option text value to hello world for My_Label widget
      -- Configure(My_Label, "-text {hello world}");
      -- SOURCE
   procedure Configure(Widget: Tk_Widget; Options: String) with
      Pre => Options'Length > 0;
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
