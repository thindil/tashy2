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

with Ada.Characters.Handling; use Ada.Characters.Handling;

package body Tk.TtkWidget is

   function In_State
     (Widget: Ttk_Widget; State: Ttk_State_Type) return Boolean is
   begin
      Execute_Widget_Command
        (Widget, "instate", To_Lower(Ttk_State_Type'Image(State)));
      if Tcl_GetResult(Tk_Interp(Widget)) = 1 then
         return True;
      else
         return False;
      end if;
   end In_State;

   procedure In_State
     (Widget: Ttk_Widget; State: Ttk_State_Type; Tcl_Script: Tcl_String) is
   begin
      Execute_Widget_Command
        (Widget, "instate",
         To_Lower(Ttk_State_Type'Image(State)) & " " &
         To_Ada_String(Tcl_Script));
   end In_State;

end Tk.TtkWidget;
