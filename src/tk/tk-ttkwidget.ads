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

package Tk.TtkWidget is

   subtype Ttk_Widget is Tk_Widget;

   type Ttk_Widget_Options is abstract new Widget_Options with record
      Class: Tcl_String;
      Style: Tcl_String;
   end record;

   function Get_Options
     (Widget: Ttk_Widget) return Ttk_Widget_Options is abstract with
      Pre'Class => Widget /= Null_Widget;

   type Ttk_State_Type is
     (ACTIVE, DISABLED, FOCUS, PRESSED, SELECTED, BACKGROUND, READONLY,
      ALTERNATE, INVALID, HOVER);

   function In_State
     (Widget: Ttk_Widget; State: Ttk_State_Type) return Boolean with
      Pre => Widget /= Null_Widget;

   procedure In_State
     (Widget: Ttk_Widget; State: Ttk_State_Type; Tcl_Script: Tcl_String) with
      Pre => Widget /= Null_Widget and Length(Tcl_Script) > 0;

end Tk.TtkWidget;
