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

   -- ****s* Grid/Grid.Grid_Options
   -- FUNCTION
   -- Data structure for all available grid slaves options
   -- OPTIONS
   -- Column     - Index of column in which the widget will be placed.
   --              Index starts from zero.
   -- ColumnSpan - Amount of columns which the widget will be occupy.
   -- In_Master  -
   -- IPadX      -
   -- IPadY      -
   -- PadX       -
   -- PadY       -
   -- Row        -
   -- RowSpan    -
   -- Sticky     -
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Grid_Options is record
      Column: Extended_Natural;
      ColumnSpan: Extended_Natural;
      In_Master: Tk_Widget;
      IPadX: Pixel_Data;
      IPadY: Pixel_Data;
      PadX: Pad_Array := (others => <>);
      PadY: Pad_Array := (others => <>);
      Row: Extended_Natural;
      RowSpan: Extended_Natural;
      Sticky: Tcl_String;
   end record;

   type Column_Options is record
      MinSize: Pixel_Data;
      Weight: Extended_Natural;
      Uniform: Tcl_String;
      Pad: Pixel_Data;
   end record;

   type Result_Array is array(1 .. 2) of Extended_Natural;

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
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) with
      Pre => Master /= Null_Widget and Length(Child_Name) > 0 and
      Options /= Column_Options'(others => <>);

   procedure Column_Configure
     (Master, Child: Tk_Widget; Options: Column_Options) with
      Pre => Master /= Null_Widget and Child /= Null_Widget and
      Options /= Column_Options'(others => <>);

   procedure Column_Configure
     (Master: Tk_Widget; Column: Natural; Options: Column_Options) with
      Pre => Master /= Null_Widget and
      Options /= Column_Options'(others => <>);

   function Get_Column_Options
     (Master: Tk_Widget; Index: Tcl_String) return Column_Options with
      Pre => Master /= Null_Widget and Length(Index) > 0;

   function Get_Column_Options
     (Master, Child: Tk_Widget) return Column_Options with
      Pre => Master /= Null_Widget and Child /= Null_Widget;

   function Get_Column_Options
     (Master: Tk_Widget; Column: Natural) return Column_Options with
      Pre => Master /= Null_Widget;

   procedure Configure(Widget: Tk_Widget; Options: Grid_Options) with
      Pre => Widget /= Null_Widget and Options /= Grid_Options'(others => <>);

   procedure Configure(Widgets: Widgets_Array; Options: Grid_Options) with
      Pre => Widgets'Length > 0 and Options /= Grid_Options'(others => <>);

   procedure Forget(Widget: Tk_Widget) with
      Pre => Widget /= Null_Widget;

   procedure Forget(Widgets: Widgets_Array) with
      Pre => Widgets'Length > 0;

   function Info(Widget: Tk_Widget) return Grid_Options with
      Pre => Widget /= Null_Widget;

   function Location
     (Master: Tk_Widget; X, Y: Pixel_Data) return Result_Array with
      Pre => Master /= Null_Widget and X.Value > -1.0 and Y.Value > -1.0;

   procedure Propagate(Master: Tk_Widget; Enable: Boolean := True) with
      Pre => Master /= Null_Widget;

   function Propagate(Master: Tk_Widget) return Boolean with
      Pre => Master /= Null_Widget;

   procedure Row_Configure
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) with
      Pre => Master /= Null_Widget and Length(Child_Name) > 0 and
      Options /= Column_Options'(others => <>);

   procedure Row_Configure
     (Master, Child: Tk_Widget; Options: Column_Options) with
      Pre => Master /= Null_Widget and Child /= Null_Widget and
      Options /= Column_Options'(others => <>);

   procedure Row_Configure
     (Master: Tk_Widget; Row: Natural; Options: Column_Options) with
      Pre => Master /= Null_Widget and
      Options /= Column_Options'(others => <>);

   function Get_Row_Options
     (Master: Tk_Widget; Index: Tcl_String) return Column_Options with
      Pre => Master /= Null_Widget and Length(Index) > 0;

   function Get_Row_Options
     (Master, Child: Tk_Widget) return Column_Options with
      Pre => Master /= Null_Widget and Child /= Null_Widget;

   function Get_Row_Options
     (Master: Tk_Widget; Row: Natural) return Column_Options with
      Pre => Master /= Null_Widget;

   procedure Remove(Widget: Tk_Widget) with
      Pre => Widget /= Null_Widget;

   procedure Remove(Widgets: Widgets_Array) with
      Pre => Widgets'Length > 0;

   function Size(Master: Tk_Widget) return Result_Array with
      Pre => Master /= Null_Widget;

   function Slaves
     (Master: Tk_Widget; Row, Column: Extended_Natural := -1)
      return Widgets_Array with
      Pre => Master /= Null_Widget;

end Tk.Grid;
