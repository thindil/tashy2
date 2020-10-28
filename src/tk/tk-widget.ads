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
   -- Abstract record to store data about widgets. All Tk widgets should be
   -- children of this record
   -- PARAMETERS
   -- Tk_Window - Identifier of the Tk widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Tk_Widget is abstract tagged record
      Tk_Window: Integer := 0;
   end record;
   -- ****

   type Directions is (N, NE, E, SE, S, SW, W, NW, CENTER);
   type Place is (NONE, BOTTOM, TOP, LEFT, RIGHT, CENTER);

   -- ****s* Widget/Widget.Widget_Options
   -- FUNCTION
   -- Abstract records to store available options and their values for widgets.
   -- All Tk widgets options should be children of this record
   -- PARAMETERS
   -- Ttk - If True, the widget options are for Ttk widget, otherwise for old
   --       type of widgets
   -- OPTIONS
   -- Cursor     - Name of the cursor to set for the selected Tk widget
   -- Take_Focus - Can be "1", "0", empty string or Tcl script which will
   --              return "1", "0" or empty string
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Widget_Options(Ttk: Boolean) is abstract tagged record
      Cursor: Unbounded_String := Null_Unbounded_String;
      Take_Focus: Unbounded_String := Null_Unbounded_String;
      case Ttk is
         when False =>
            Active_Background: Unbounded_String := Null_Unbounded_String;
            Active_Foreground: Unbounded_String := Null_Unbounded_String;
            Anchor: Directions := CENTER;
            Background: Unbounded_String := Null_Unbounded_String;
            Bitmap: Unbounded_String := Null_Unbounded_String;
            Border_Width: Unbounded_String := Null_Unbounded_String;
            Compound: Place := NONE;
            Disabled_Foreground: Unbounded_String := Null_Unbounded_String;
            Font: Unbounded_String := Null_Unbounded_String;
         when True =>
            null;
      end case;
   end record;
   -- ****

   ---------------------------
   -- Creating a new Tk widget
   ---------------------------

   -- ****f* Widget/Widget.Create_(function)
   -- FUNCTION
   -- Abstract function to create a widget. All Tk widgets should implement
   -- their own version of the function
   -- PARAMETERS
   -- Path_Name   - Full Tk path for the newly created Tk widget
   -- Options     - Tk options for the newly created Tk widget
   -- Interpreter - Tcl interpreter on which the widget will be created.
   --               Default value is default Tcl interpreter
   -- RESULT
   -- The newly created Tk_Widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SEE ALSO
   -- Widget.Create_(procedure)
   -- SOURCE
   function Create
     (Path_Name: String; Options: Widget_Options'Class;
      Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Widget is abstract;
      -- ****

      -- ****f* Widget/Widget.Create_(procedure)
      -- FUNCTION
      -- Abstract function to create a widget. All Tk widgets should implement
      -- their own version of the function
      -- PARAMETERS
      -- Widget      - Tk_Widget which will be created
      -- Path_Name   - Full Tk path for the newly created Tk widget
      -- Options     - Tk options for the newly created Tk widget
      -- Interpreter - Tcl interpreter on which the widget will be created.
      --               Default value is default Tcl interpreter
      -- OUTPUT
      -- The newly created Tk_Widget as Widget parameter
      -- HISTORY
      -- 8.6.0 - Added
      -- SEE ALSO
      -- Widget.Create_(function)
      -- SOURCE
   procedure Create
     (Widget: out Tk_Widget; Path_Name: String; Options: Widget_Options'Class;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is abstract;
      -- ****

   -- ****f* Widget/Widget.Get_Widget
   -- FUNCTION
   -- Abstract function to get existing Tk widget from its Tk path name and
   -- on the seelcted interpreter. All Tk widgets should implement their own
   -- version of the function
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
      return Tk_Widget is abstract;
      -- ****

      ---------------------------------
      -- Getting info about a Tk widget
      ---------------------------------

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
   function Tk_PathName(Widget: Tk_Widget'Class) return String;
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
   function Tk_Interp(Widget: Tk_Widget'Class) return Tcl_Interpreter;
   -- ****

   -- ****f* Widget/Widget.Get_Options
   -- FUNCTION
   -- Abstract function to get values of all available options for the
   -- selected Tk widget. All Tk widgets should implement their own
   -- version of the function.
   -- PARAMETERS
   -- Widget - Tk widget which options will be taken
   -- RESULT
   -- Widget specific Widget_Options record with all options and their
   -- values for the selected Tk widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Get_Options
     (Widget: Tk_Widget'Class) return Widget_Options is abstract;
     -- ****

     -- ****f* Widget/Widget.Get_Option_(String)
     -- FUNCTION
     -- Get value of the selected option for the selected Tk widget
     -- PARAMETERS
     -- Widget - Tk widget which option's value will be taken
     -- Name   - Name of the option which value will be taken
     -- Class  - Class of the option which value will be taken. Can be empty.
     --          Default value is empty.
     -- RESULT
     -- String with value of the selected option for the selected Tk widget
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
     -- -- Get the value of text option for My_Label widget
     -- Text: constant String := Get_Option(My_Label, "text");
     -- SEE ALSO
     -- Widget.Get_Option_(Integer) and Widget.Get_Option_(Float)
     -- SOURCE
   function Get_Option
     (Widget: Tk_Widget'Class; Name: String; Class: String := "")
      return String with
      Pre => Name'Length > 0;
      -- ****

     -- ****f* Widget/Widget.Get_Option_(Integer)
     -- FUNCTION
     -- Get value of the selected option for the selected Tk widget
     -- PARAMETERS
     -- Widget - Tk widget which option's value will be taken
     -- Name   - Name of the option which value will be taken
     -- Class  - Class of the option which value will be taken. Can be empty.
     --          Default value is empty.
     -- RESULT
     -- Integer value of the selected option for the selected Tk widget
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
     -- -- Get the value of width option for My_Frame widget
     -- Width: constant Integer := Get_Option(My_Frame, "width");
     -- SEE ALSO
     -- Widget.Get_Option_(String) and Widget.Get_Option_(Float)
     -- SOURCE
   function Get_Option
     (Widget: Tk_Widget'Class; Name: String; Class: String := "")
      return Integer with
      Pre => Name'Length > 0;
      -- ****

     -- ****f* Widget/Widget.Get_Option_(Float)
     -- FUNCTION
     -- Get value of the selected option for the selected Tk widget
     -- PARAMETERS
     -- Widget - Tk widget which option's value will be taken
     -- Name   - Name of the option which value will be taken
     -- Class  - Class of the option which value will be taken. Can be empty.
     --          Default value is empty.
     -- RESULT
     -- Float value of the selected option for the selected Tk widget
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
     -- -- Get the value of maximum option for My_ProgressBar widget
     -- Maximum: constant Float := Get_Option(My_ProgressBar, "maximum");
     -- SEE ALSO
     -- Widget.Get_Option_(String) and Widget.Get_Option_(Integer)
     -- SOURCE
   function Get_Option
     (Widget: Tk_Widget'Class; Name: String; Class: String := "")
      return Float with
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
   procedure Configure(Widget: Tk_Widget'Class; Options: String) with
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
   procedure Destroy(Widget: in out Tk_Widget'Class);
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
     (Widget: Tk_Widget'Class; Command_Name: String;
      Options: String := "") with
      Pre => Command_Name'Length > 0;
      -- ****

end Tk.Widget;
