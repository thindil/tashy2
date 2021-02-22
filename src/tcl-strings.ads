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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

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
   type Tcl_String is new Unbounded_String;
   -- ****

   -- ****d* Tcl.Strings/Null_Tcl_String
   -- FUNCTION
   -- Empty Tcl_String
   -- SOURCE
   Null_Tcl_String: constant Tcl_String := Tcl_String(Null_Unbounded_String);
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
      Test_Case => (Name => "Test_To_Tcl_String", Mode => Nominal);
      -- ****

      -- ****f* Strings/Strings.To_Ada_String
      -- FUNCTION
      -- Convert Tcl_String to Ada String
      -- PARAMETERS
      -- Source - Tcl_String which will be converted to Ada String
      -- RESULT
      -- A new String with removed starting and ending braces or quotes signs
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Convert Tcl_String {hello world} to Ada String
      -- My_String: constant String := To_String(To_Tcl_String("hello world"));
      -- SOURCE
   function To_Ada_String(Source: Tcl_String) return String with
      Test_Case => (Name => "Test_To_Ada_String", Mode => Robustness);
   -- ****

end Tcl.Strings;
