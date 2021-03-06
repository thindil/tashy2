-- Copyright (c) 2020-2021 Bartek thindil Jasicki <thindil@laeran.pl>
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

with Ada.Strings.Maps;

package body Tcl.Strings is

   function To_Tcl_String
     (Source: String; Evaluate: Boolean := False) return Tcl_String is
      New_String: Tcl_String := Null_Tcl_String;
      Element_Index: Natural := 1;
   begin
      Append(Source => New_String, New_Item => Source);
      if Index(Source => New_String, Pattern => " ") = 0 then
         return New_String;
      end if;
      if Evaluate then
         Evaluated_String_Loop :
         loop
            Element_Index :=
              Index
                (Source => New_String, Pattern => """", From => Element_Index);
            exit Evaluated_String_Loop when Element_Index = 0;
            Insert
              (Source => New_String, Before => Element_Index, New_Item => "\");
            Element_Index := Element_Index + 2;
         end loop Evaluated_String_Loop;
         Insert(Source => New_String, Before => 1, New_Item => """");
         Append(Source => New_String, New_Item => """");
      else
         Insert(Source => New_String, Before => 1, New_Item => "{");
         Append(Source => New_String, New_Item => "}");
      end if;
      return New_String;
   end To_Tcl_String;

   function To_Ada_String(Source: Tcl_String) return String is
      use Ada.Strings.Maps;
      New_String: Tcl_String := Source;
      Element_Index: Natural := 1;
   begin
      if Length(Source => Source) = 0 then
         return "";
      end if;
      if Element(Source => New_String, Index => 1) = '{' then
         Trim
           (Source => New_String, Left => To_Set(Sequence => "{"),
            Right => To_Set(Sequence => "}"));
      elsif Element(Source => New_String, Index => 1) = '"' then
         Trim
           (Source => New_String, Left => To_Set(Sequence => """"),
            Right => To_Set(Sequence => """"));
         Remove_Quotes_Loop :
         loop
            Element_Index :=
              Index
                (Source => New_String, Pattern => "\""",
                 From => Element_Index);
            exit Remove_Quotes_Loop when Element_Index = 0;
            Delete
              (Source => New_String, From => Element_Index,
               Through => Element_Index);
            Element_Index := Element_Index + 1;
         end loop Remove_Quotes_Loop;
      end if;
      return
        Slice
          (Source => New_String, Low => 1,
           High => Length(Source => New_String));
   end To_Ada_String;

end Tcl.Strings;
