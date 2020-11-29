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
      Sticky: Tcl_String;
   end record;

   type Column_Options is record
      MinSize: Pixel_Data;
      Weight: Extended_Natural;
      Uniform: Tcl_String;
      Pad: Pixel_Data;
   end record;

   procedure Add
     (Widget: Tk_Widget;
      Options: Grid_Options := Grid_Options'(others => <>)) with
      Pre => Widget /= Null_Widget;

   procedure Add
     (Widgets: Widgets_Array;
      Options: Grid_Options := Grid_Options'(others => <>)) with
      Pre => Widgets'Length > 0;

   procedure Anchor(Master: Tk_Widget; New_Direction: Directions_Type) with
      Pre => Master /= Null_Widget and New_Direction /= NONE;

   function Anchor(Master: Tk_Widget) return Directions_Type with
      Pre => Master /= Null_Widget;

   function BBox
     (Master: Tk_Widget; Column, Row, Column2, Row2: Extended_Natural := -1)
      return BBox_Array with
      Pre => Master /= Null_Widget;

   procedure Column_Configure
     (Master: Tk_Widget; Index: Tcl_String; Options: Column_Options) with
      Pre => Master /= Null_Widget and
      Options /= Column_Options'(others => <>);

   function Get_Column_Options
     (Master: Tk_Widget; Index: Tcl_String) return Column_Options with
      Pre => Master /= Null_Widget and Length(Index) > 0;

   procedure Configure(Widget: Tk_Widget; Options: Grid_Options) with
      Pre => Widget /= Null_Widget and Options /= Grid_Options'(others => <>);

   procedure Configure(Widgets: Widgets_Array; Options: Grid_Options) with
      Pre => Widgets'Length > 0 and Options /= Grid_Options'(others => <>);

   procedure Configure(Widget: Character; Options: Grid_Options) with
      Pre => Widget in '-' | 'x' | '^' and
      Options /= Grid_Options'(others => <>);

end Tk.Grid;
