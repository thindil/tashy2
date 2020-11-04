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

with Ada.Strings.Unbounded;

package Tcl.Strings is

   -- ****t* Strings/Strings.Tcl_String
   -- FUNCTION
   -- Used to store Tcl string values. Strings in Tcl can be evaluated or
   -- literal.
   -- SOURCE
   type Tcl_String is new Ada.Strings.Unbounded.Unbounded_String;
   -- ****

   function To_Tcl_String
     (Source: String; Evaluate: Boolean := False) return Tcl_String with
      Pre => Source'Length > 0;

end Tcl.Strings;
