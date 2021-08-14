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
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Tk.Bind is

   function Modifier_Type_Image(Modifier: Modifiers_Type) return String is
      Image: String := To_Lower(Modifiers_Type'Image(Modifier));
   begin
      Image(1) := To_Upper(Image(1));
      if Image(Image'Last - 1) = '_' then
         Image(Image'Last - 1) := '-';
      end if;
      return Image;
   end Modifier_Type_Image;

   procedure Bind
     (Window: Tk_Widget; Sequence: Modifiers_Type; Script: Tcl_String;
      Append: Boolean := False) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "bind " & Tk_Path_Name(Widgt => Window) & " <" &
           Modifier_Type_Image(Sequence) & "> " &
           (if Append then "+" else "") & To_String(Script),
         Interpreter => Tk_Interp(Widgt => Window));
   end Bind;

   procedure Bind
     (Window: Tk_Widget; Sequence: Modifiers_Array; Script: Tcl_String;
      Append: Boolean := False) is
      Modifier: Unbounded_String := Null_Unbounded_String;
   begin
      for I in Sequence'Range loop
         Modifier := Modifier & Modifier_Type_Image(Sequence(I));
         if I < Sequence'Last then
            Modifier := Modifier & "-";
         end if;
      end loop;
      Tcl_Eval
        (Tcl_Script =>
           "bind " & Tk_Path_Name(Widgt => Window) & " <" &
           To_String(Modifier) & "> " & (if Append then "+" else "") &
           To_String(Script),
         Interpreter => Tk_Interp(Widgt => Window));
   end Bind;

end Tk.Bind;
