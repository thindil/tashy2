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
with Tk.Widget; use Tk.Widget;

package Tk.Button is

   type Tk_Button is new Tk_Widget;

   type Button_Options is new Widget_Options with record
      Border_Width: Pixel_Data;
      Relief: Relief_Type;
      Text: Unbounded_String;
   end record;

   function Create
     (Path_Name: String; Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Button;

   procedure Create
     (Widget: out Tk_Button; Path_Name: String; Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter);

   function Get_Options(Widget: Tk_Button) return Button_Options;

end Tk.Button;
