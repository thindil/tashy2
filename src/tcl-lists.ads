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

with Tcl.Strings; use Tcl.Strings;

-- ****h* Tcl/Lists
-- FUNCTION
-- Provide code to manipulate the Tcl lists.
-- SOURCE
package Tcl.Lists is
-- ****

   -- ****t* Lists/List.Array_List
   -- FUNCTION
   -- Ada array of values converted from or to Tcl list
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Array_List is array(Positive range <>) of Tcl_String;
   -- ****

   -- ****f* Lists/Lists.Split_List
   -- FUNCTION
   -- Convert Tcl list to Ada array
   -- PARAMETERS
   -- List        - The the Tcl list which will be converted to array
   -- Interpreter - The Tcl interpreter on which the list will be converted
   -- RESULT
   -- Array_List with values converted from Tcl list
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Convert the {a b c d} Tcl list to My_List Ada array
   -- My_List: constant Array_List := Split_List("{a b c d}");
   -- SEE ALSO
   -- Lists.Split_List_Variable
   -- SOURCE
   function Split_List
     (List: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List with
      Pre => List'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Split_List", Nominal);
      -- ****

      -- ****f* Lists/Lists.Split_List_Variable
      -- FUNCTION
      -- Convert Tcl list variable to Ada array
      -- PARAMETERS
      -- Name        - The name of the Tcl list which will be converted to array
      -- Interpreter - The Tcl interpreter on which the list will be converted
      -- RESULT
      -- Array_List with values converted from Tcl list variable
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Convert mylist Tcl list to My_List Ada array
      -- My_List: constant Array_List := Split_List("mylist");
      -- SEE ALSO
      -- List.Split_List
      -- SOURCE
   function Split_List_Variable
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List with
      Pre => Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Split_List_Variable", Nominal);
      -- ****

end Tcl.Lists;
