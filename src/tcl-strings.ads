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

-- ****h* Tcl/Strings
-- FUNCTION
-- Provide code to manipulate the Tcl strings.
-- SOURCE
package Tcl.Strings is
-- ****

   -- ****t* Strings/Strings.Tcl_String
   -- FUNCTION
   -- Used to store Tcl string values. Strings in Tcl can be evaluated or
   -- literal.
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Tcl_String is new Ada.Strings.Unbounded.Unbounded_String;
   -- ****

   -- ****f* Strings/Strings.To_Tcl_String
   -- FUNCTION
   -- Convert simple Ada String to Tcl_String and format it to evaluation
   -- or as literal string
   -- PARAMETERS
   -- Source   - Ada String which will be converted to Tcl_String
   -- Evaluate - If true, Source should be formatted to be evaluated as a
   --            Tcl code (variables replaced by values, etc). Otherwise
   --            format Source to be a literal string
   -- RESULT
   -- A new Tcl_String properly formatted to be evaluated or as literal
   -- string
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Convert text hello world to literal Tcl string
   -- My_String: constant Tcl_String := To_Tcl_String("hello world");
   -- SOURCE
   function To_Tcl_String
     (Source: String; Evaluate: Boolean := False) return Tcl_String with
      Pre => Source'Length > 0,
      Test_Case => ("Test_To_Tcl_String", Nominal);
      -- ****

end Tcl.Strings;
