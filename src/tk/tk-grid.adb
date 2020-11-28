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
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with GNAT.String_Split; use GNAT.String_Split;

package body Tk.Grid is

   -- ****if* Grid/Grid.Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options - Ada Grid_Options to convert
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Options_To_String(Options: Grid_Options) return String is
      -- ****
      Options_String: Unbounded_String;
   begin
      Option_Image("column", Options.Column, Options_String);
      Option_Image("columnspan", Options.ColumnSpan, Options_String);
      Option_Image("in", Options.In_Master, Options_String);
      Option_Image("ipadx", Options.IPadX, Options_String);
      Option_Image("ipady", Options.IPadY, Options_String);
      Option_Image("padx", Options.PadX, Options_String);
      Option_Image("pady", Options.PadY, Options_String);
      Option_Image("row", Options.Row, Options_String);
      Option_Image("rowspan", Options.RowSpan, Options_String);
      Option_Image("sticky", Options.Sticky, Options_String);
      return To_String(Options_String);
   end Options_To_String;

   procedure Add
     (Widget: Tk_Widget;
      Options: Grid_Options := Grid_Options'(others => <>)) is
   begin
      Tcl_Eval
        ("grid " & Tk_PathName(Widget) & Options_To_String(Options),
         Tk_Interp(Widget));
   end Add;

   procedure Add
     (Widgets: Widgets_Array;
      Options: Grid_Options := Grid_Options'(others => <>)) is
      Widgets_Names: Unbounded_String;
   begin
      for Widget of Widgets loop
         Append(Widgets_Names, " " & Tk_PathName(Widget));
      end loop;
      Tcl_Eval
        ("grid" & To_String(Widgets_Names) & Options_To_String(Options),
         Tk_Interp(Widgets(1)));
   end Add;

   procedure Anchor(Master: Tk_Widget; New_Direction: Directions_Type) is
   begin
      Tcl_Eval
        ("grid anchor " & Tk_PathName(Master) & " " &
         To_Lower(Directions_Type'Image(New_Direction)));
   end Anchor;

   function Anchor(Master: Tk_Widget) return Directions_Type is
   begin
      Tcl_Eval("grid anchor " & Tk_PathName(Master));
      return Directions_Type'Value(Tcl_GetResult);
   end Anchor;

   function BBox
     (Master: Tk_Widget; Column, Row, Column2, Row2: Extended_Natural := -1)
      return BBox_Array is
      Options: Unbounded_String;
      Tokens: Slice_Set;
   begin
      if Column > -1 then
         Append(Options, Extended_Natural'Image(Column));
      end if;
      if Row > -1 then
         if Column = -1 then
            raise Tcl_Exception with "Column value not specified";
         end if;
         Append(Options, Extended_Natural'Image(Row));
      end if;
      if Column2 > -1 then
         if Column = -1 then
            raise Tcl_Exception with "Column value not specified";
         end if;
         if Row = -1 then
            raise Tcl_Exception with "Row value not specified";
         end if;
         Append(Options, Extended_Natural'Image(Column2));
      end if;
      if Row2 > -1 then
         if Column = -1 then
            raise Tcl_Exception with "Column value not specified";
         end if;
         if Row = -1 then
            raise Tcl_Exception with "Row value not specified";
         end if;
         if Column2 = -1 then
            raise Tcl_Exception with "Column2 value not specified";
         end if;
         Append(Options, Extended_Natural'Image(Row2));
      end if;
      Tcl_Eval("grid bbox " & Tk_PathName(Master) & To_String(Options));
      Create(Tokens, Tcl_GetResult, " ");
      return Coords: BBox_Array do
         for I in 1 .. 4 loop
            Coords(I) := Natural'Value(Slice(Tokens, Slice_Number(I)));
         end loop;
      end return;
   end BBox;

end Tk.Grid;
