-- Copyright (c) 2020-2021 Bartek thindil Jasicki <thindil@laeran.pl>
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

package Tk.Menu is

   subtype Tk_Menu is Tk_Widget;

   type Menu_Types is (NONE, MENUBAR, TEAROFF, NORMAL) with
      Default_Value => NONE;

   type Menu_Options is new Widget_Options with record
      Active_Background: Tcl_String;
      Active_Border_Width: Pixel_Data;
      Active_Foreground: Tcl_String;
      Background: Tcl_String;
      Border_Width: Pixel_Data;
      Disabled_Foreground: Tcl_String;
      Font: Tcl_String;
      Foreground: Tcl_String;
      Relief: Relief_Type;
      Post_Command: Tcl_String;
      Select_Color: Tcl_String;
      Tear_Off: Extended_Boolean;
      Tear_Off_Command: Tcl_String;
      Title: Tcl_String;
      Menu_Type: Menu_Types;
   end record;

   function Create
     (Path_Name: String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Menu with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Create'Result /= Null_Widget,
      Test_Case => ("Test_Menu_Create1", Nominal);

   procedure Create
     (Widget: out Tk_Menu; Path_Name: String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Widget /= Null_Widget,
      Test_Case => ("Test_Menu_Create2", Nominal);

   procedure Activate(Menu: Tk_Menu; Index: Tcl_String) with
      Pre => Length(Index) > 0,
      Test_Case => ("Test_Menu_Activate", Nominal);

end Tk.Menu;
