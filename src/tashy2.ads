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

with Interfaces.C.Strings; use Interfaces.C.Strings;

-- ****h* Tashy2/Tashy2
-- FUNCTION
-- Various utility code not related to any Tcl command or API
-- SOURCE
package Tashy2 is
-- ****

   pragma Warnings(Off, "no Global Contract available");

   -- ****f* Utils/Utils.To_C_String
   -- FUNCTION
   -- Convert Ada String to C characters array
   -- PARAMETERS
   -- Str - Ada String to convert
   -- RESULT
   -- C characters array with converted String content
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Convert "Hello world" String to C characters array
   -- C_String: constant chars_ptr := To_C_String("Hello world");
   -- SEE ALSO
   -- Utils.From_C_String
   -- SOURCE
   function To_C_String(Str: String) return chars_ptr is
     (New_String(Str => Str)) with
      Global => null,
      Test_Case => (Name => "Test_To_C_String", Mode => Nominal);
      -- ****

      -- ****f* Utils/Utils.From_C_String
      -- FUNCTION
      -- Convert C characters array to Ada String
      -- PARAMETERS
      -- Item - C characters array to convert
      -- RESULT
      -- Ada String with converted C characters array content
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Convert "Hello world" C characters array to Ada String
      -- Ada_String: constant String := From_C_String(To_C_String("Hello world"));
      -- SEE ALSO
      -- Utils.To_C_String
      -- SOURCE
   function From_C_String(Item: chars_ptr) return String is
     (Value(Item => Item)) with
      Global => null,
      Test_Case => (Name => "Test_From_C_String", Mode => Nominal);
      -- ****

   pragma Warnings(On, "no Global Contract available");

end Tashy2;
