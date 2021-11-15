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

with Ada.Characters.Handling;
with Ada.Strings;
with Ada.Strings.Fixed;

package body Tk.Colors is

   function Colors_Names_Image(Name: Colors_Names) return String is
      use Ada.Characters.Handling;
      use Ada.Strings;
      use Ada.Strings.Fixed;

      Image: String := To_Lower(Item => Colors_Names'Image(Name));
      Has_Underline: Boolean := False;
      Underline_Index: Natural;
   begin
      Replace_Underline_Loop:
      loop
         Underline_Index := Index(Source => Image, Pattern => "_");
         exit Replace_Underline_Loop when Underline_Index = 0;
         Image(Underline_Index + 1) := To_Upper(Item => Image(Underline_Index + 1));
         Delete(Source => Image, From => Underline_Index, Through => Underline_Index);
         Has_Underline := True;
      end loop Replace_Underline_Loop;
      if Has_Underline then
         Image(Image'First) := To_Upper(Item => Image(Image'First));
      end if;
      return Trim(Source => Image, Side => Both);
   end Colors_Names_Image;

end Tk.Colors;
