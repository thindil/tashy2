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

with Tcl.Strings; use Tcl.Strings;
with Tk.Widget; use Tk.Widget;

package Tk.TopLevel is

   type Tk_TopLevel is new Tk_Widget;

   type TopLevel_Options is new Widget_Options with record
      Background: Tcl_String;
      Border_Width: Pixel_Data;
      Height: Pixel_Data;
      Highlight_Background: Tcl_String;
      Highlight_Color: Tcl_String;
      Highlight_Thickness: Pixel_Data;
      Menu: Tcl_String;
      PadX: Pixel_Data;
      PadY: Pixel_Data;
      Relief: Relief_Type;
      Width: Pixel_Data;
   end record;

   type TopLevel_Create_Options is new TopLevel_Options with record
      Class: Tcl_String;
      Color_Map: Tcl_String;
      Container: Extended_Boolean;
      Screen: Tcl_String;
      Use_Container: Integer;
      Visual: Tcl_String;
   end record;

   function TopLevel_New
     (Path_Name: String; Options: TopLevel_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_TopLevel;

   procedure TopLevel_New
     (Widget: out Tk_TopLevel; Path_Name: String; Options: TopLevel_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter);

   function Get_Options(Widget: Tk_TopLevel) return TopLevel_Create_Options;

end Tk.TopLevel;
