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

   type Ttk_State_Type is
     (ACTIVE, DISABLED, FOCUS, PRESSED, SELECTED, BACKGROUND, READONLY,
      ALTERNATE, INVALID, HOVER, NONE) with
      Default_Value => NONE;

end Tk.TtkWidget;
