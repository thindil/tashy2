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

package body Tk.Winfo is

   function Atom
     (Name: String; Window: Tk_Widget := Null_Widget) return Positive is
      pragma Unreferenced(Name, Window);
   begin
      return 1;
   end Atom;

   function Atom_Name
     (Id: Positive; Window: Tk_Widget := Null_Widget) return String is
      pragma Unreferenced(Id, Window);
   begin
      return "";
   end Atom_Name;

   function Cells(Window: Tk_Widget) return Natural is
      pragma Unreferenced(Window);
   begin
      return 0;
   end Cells;

   function Children(Window: Tk_Widget) return Widgets_Array is
      pragma Unreferenced(Window);
   begin
      return Empty_Widgets_Array;
   end Children;

   function Class(Window: Tk_Widget) return String is
      pragma Unreferenced(Window);
   begin
      return "";
   end Class;

end Tk.Winfo;
