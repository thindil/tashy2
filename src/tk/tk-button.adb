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

package body Tk.Button is

   function Create
     (Path_Name: String; Options: Widget_Options'Class;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Button is
      New_Button: Tk_Button;
   begin
      return New_Button;
   end Create;

   procedure Create
     (Widget: out Tk_Button; Path_Name: String; Options: Widget_Options'Class;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Widget := Create(Path_Name, Options, Interpreter);
   end Create;

   function Get_Widget
     (Path_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Button is
      Button: Tk_Button;
   begin
      return Button;
   end Get_Widget;

   function Get_Options(Widget: Tk_Widget'Class) return Button_Options is
      Options: Button_Options;
   begin
      return Options;
   end Get_Options;

end Tk.Button;
