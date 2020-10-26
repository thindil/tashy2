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

package Tk.Widget is

   type Tk_Widget is abstract tagged record
      Tk_Window: Integer;
   end record;

   type Widget_Options is abstract tagged null record;

   function Create
     (Path_Name: String; Options: Widget_Options'Class;
      Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Widget is abstract;

   procedure Create
     (Widget: out Tk_Widget; Path_Name: String; Options: Widget_Options'Class;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is abstract;

   function Tk_PathName(Widget: Tk_Widget'Class) return String;

   function Tk_Interp(Widget: Tk_Widget'Class) return Tcl_Interpreter;

   function Get_Widget
     (Path_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Widget is abstract;

   function Get_Options
     (Widget: Tk_Widget'Class; Options_Names: String := "") return String;

   procedure Configure(Widget: Tk_Widget'Class; Options: String) with
      Pre => Options'Length > 0;

   procedure Destroy(Widget: in out Tk_Widget'Class);

   procedure Execute_Widget_Command
     (Widget: Tk_Widget'Class; Command_Name: String;
      Options: String := "") with
      Pre => Command_Name'Length > 0;

end Tk.Widget;
