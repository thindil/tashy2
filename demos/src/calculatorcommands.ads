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

-- ****h* CalculatorCommands/CalculatorCommands
-- FUNCTION
-- Provide various Tcl commands related to the calculator demo
-- SOURCE
package CalculatorCommands with
   SPARK_Mode
is
-- ****

   -- ****f* CalculatorCommands/CalculatorCommands.Add_Commands
   -- FUNCTION
   -- Add Tcl commands needed by the program
   -- RESULT
   -- True if commands were successfully added, otherwise False
   -- SOURCE
   function Add_Commands return Boolean;
   -- ****

end CalculatorCommands;
