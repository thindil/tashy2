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

with Ada.Strings.Maps; use Ada.Strings.Maps;

package body Tcl.Strings is

   function To_Tcl_String
     (Source: String; Evaluate: Boolean := False) return Tcl_String is
      New_String: Tcl_String;
      Element_Index: Natural := 1;
   begin
      Append(New_String, Source);
      if Index(New_String, " ") = 0 then
         return New_String;
      end if;
      if Evaluate then
         loop
            Element_Index := Index(New_String, """", Element_Index);
            exit when Element_Index = 0;
            Insert(New_String, Element_Index, "\");
            Element_Index := Element_Index + 2;
         end loop;
         Insert(New_String, 1, """");
         Append(New_String, """");
      else
         Insert(New_String, 1, "{");
         Append(New_String, "}");
      end if;
      return New_String;
   end To_Tcl_String;

   function To_Ada_String(Source: Tcl_String) return String is
      New_String: Tcl_String := Source;
      Element_Index: Natural := 1;
   begin
      if Element(New_String, 1) = '{' then
         Trim(New_String, To_Set("{"), To_Set("}"));
      elsif Element(New_String, 1) = '"' then
         Trim(New_String, To_Set(""""), To_Set(""""));
         loop
            Element_Index := Index(New_String, "\""", Element_Index);
            exit when Element_Index = 0;
            Delete(New_String, Element_Index, Element_Index);
            Element_Index := Element_Index + 1;
         end loop;
      end if;
      return Slice(New_String, 1, Length(New_String));
   end To_Ada_String;

end Tcl.Strings;
