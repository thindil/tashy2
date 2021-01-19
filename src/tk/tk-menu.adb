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

with Ada.Characters.Handling; use Ada.Characters.Handling;

package body Tk.Menu is

   function Create
     (Path_Name: String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Menu is
      pragma Unreferenced(Options);
   begin
      Tcl_Eval("menu " & Path_Name & " ", Interpreter);
      return Get_Widget(Path_Name, Interpreter);
   end Create;

   procedure Create
     (Widget: out Tk_Menu; Path_Name: String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Widget := Create(Path_Name, Options, Interpreter);
   end Create;

   procedure Activate(Menu: Tk_Menu; Index: Tcl_String) is
   begin
      Execute_Widget_Command(Menu, "activate", To_Ada_String(Index));
   end Activate;

   procedure Add
     (Menu: Tk_Menu; Item_Type: Menu_Item_Types; Options: Menu_Item_Options) is
      pragma Unreferenced(Options);
   begin
      Execute_Widget_Command
        (Menu, "add", To_Lower(Menu_Item_Types'Image(Item_Type)));
   end Add;

   function Get_Options(Widget: Tk_Menu) return Menu_Options is
      pragma Unreferenced(Widget);
   begin
      return Menu_Options'(others => <>);
   end Get_Options;

   procedure Configure(Widget: Tk_Menu; Options: Menu_Options) is
      pragma Unreferenced(Options);
   begin
      Execute_Widget_Command(Widget, "configure");
   end Configure;

end Tk.Menu;
