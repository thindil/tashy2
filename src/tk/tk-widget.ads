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

   -- ****s* Widget/Widget.Widget_Options
   -- FUNCTION
   -- Abstract records to store available options and their values for widgets.
   -- All Tk widgets options should be children of this record
   -- PARAMETERS
   -- Cursor     - Name of the cursor to set for the selected Tk widget
   -- Take_Focus - Can be "1", "0", empty string or Tcl script which will
   --              return "1", "0" or empty string
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Widget_Options is abstract tagged record
      Cursor: Unbounded_String := Null_Unbounded_String;
      Take_Focus: Unbounded_String := Null_Unbounded_String;
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
   -- SOURCE
   function Tk_Interp(Widget: Tk_Widget'Class) return Tcl_Interpreter;
   -- ****

   function Get_Options
     (Widget: Tk_Widget'Class) return Widget_Options is abstract;

   function Get_Option
     (Widget: Tk_Widget'Class; Name: String; Class: String := "")
      return String with
      Pre => Name'Length > 0;

   function Get_Option
     (Widget: Tk_Widget'Class; Name: String; Class: String := "")
      return Integer with
      Pre => Name'Length > 0;

   function Get_Option
     (Widget: Tk_Widget'Class; Name: String; Class: String := "")
      return Float with
      Pre => Name'Length > 0;

   procedure Configure(Widget: Tk_Widget'Class; Options: String) with
      Pre => Options'Length > 0;

   procedure Destroy(Widget: in out Tk_Widget'Class);

   procedure Execute_Widget_Command
     (Widget: Tk_Widget'Class; Command_Name: String;
      Options: String := "") with
      Pre => Command_Name'Length > 0;

end Tk.Widget;
