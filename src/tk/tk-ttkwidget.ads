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

   -- ****f* TtkWidget/TtkWidget.Get_Options
   -- FUNCTION
   -- The abstract function to get options of the selected Ttk widget. All
   -- Ttk widgets have to implement their own with own options.
   -- PARAMETERS
   -- Widget - The Ttk widget which options will be get
   -- RESULT
   -- The record with options for the selected Ttk widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Get_Options
     (Widget: Ttk_Widget) return Ttk_Widget_Options is abstract with
      Pre'Class => Widget /= Null_Widget;
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
      -- SOURCE
   procedure In_State
     (Widget: Ttk_Widget; State: Ttk_State_Type; Tcl_Script: Tcl_String) with
      Pre => Widget /= Null_Widget and Length(Tcl_Script) > 0,
      Test_Case => ("Test_Ttk_Widget_In_State2", Nominal);
      -- ****

   procedure State
     (Widget: Ttk_Widget; State: Ttk_State_Type;
      Disable: Boolean := False) with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Ttk_Widget_State", Nominal);

   function State(Widget: Ttk_Widget) return Ttk_State_Array with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Ttk_Widget_State2", Nominal);

end Tk.TtkWidget;
