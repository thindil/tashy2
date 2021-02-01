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

package body Tk.TtkButton is

   function Create
     (Path_Name: String; Options: Ttk_Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Button is
   begin
      return Null_Widget;
   end Create;

   procedure Create
     (Widget: out Ttk_Button; Path_Name: String; Options: Ttk_Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Widget := Create(Path_Name, Options, Interpreter);
   end Create;

   function Get_Options(Widget: Ttk_Button) return Ttk_Button_Options is
   begin
      return Ttk_Button_Options'(others => <>);
   end Get_Options;

   procedure Configure(Widget: Ttk_Button; Options: Ttk_Button_Options) is
   begin
      null;
   end Configure;

   procedure Invoke(Widget: Ttk_Button) is
   begin
      null;
   end Invoke;

   function Invoke(Widget: Ttk_Button) return String is
   begin
      return "";
   end Invoke;

end Tk.TtkButton;
