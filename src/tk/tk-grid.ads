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

-- ****h* Tk/Grid
-- FUNCTION
-- Provide bindings for manipulate Tk geometry manager grid
-- SOURCE
package Tk.Grid is
-- ****

   type Grid_Options is record
      Column: Tcl_String;
      ColumnSpan: Tcl_String;
      In_Master: Tcl_String;
      IPadX: Pixel_Data;
      IPadY: Pixel_Data;
      PadX: Pad_Array := (others => <>);
      PadY: Pad_Array := (others => <>);
      Row: Extended_Natural;
      RowSpan: Tcl_String;
      Sticky: Directions_Type;
   end record;

   procedure Add(Widget: Tk_Widget; Options: Grid_Options := Grid_Options'(others => <>));

end Tk.Grid;
