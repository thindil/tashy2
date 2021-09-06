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

with Tcl; use Tcl;

-- ****h* CalculatorCommands/CalculatorCommands
-- FUNCTION
-- Provide various Tcl commands related to the calculator demo
-- SOURCE
package CalculatorCommands with
   SPARK_Mode
is
-- ****

private

   -- ****f* CalculatorCommands/CalculatorCommands.Click_Action
   -- FUNCTION
   -- Update display with the pressed button text or count its expression if
   -- button equal was pressed. It is moved from On_Click function so it can
   -- be checked by SPARK
   -- PARAMETERS
   -- ButtonName  - The Tk path name of the button which was clicked
   -- LabelName   - The Tk path name of the display label
   -- Interpreter - The Tcl interpreter on which the button was clicked
   -- RESULT
   -- This function always return TCL_OK
   -- SOURCE
   function Click_Action
     (ButtonName, LabelName: String; Interpreter: Tcl_Interpreter)
      return Tcl_Results;
      -- ****

   -- ****f* CalculatorCommands/CalculatorCommands.Clear_Action
   -- FUNCTION
   -- Reset the calculator's display to it inital state. Show just zero
   -- number. It is moved from On_Click function so it can be checked by SPARK
   -- PARAMETERS
   -- LabelName   - The name of display label to clear
   -- Interpreter - The Tcl interpreter on which the button was clicked
   -- RESULT
   -- This function always return TCL_OK
   -- SOURCE
   function Clear_Action
     (LabelName: String; Interpreter: Tcl_Interpreter) return Tcl_Results;
     -- ****

end CalculatorCommands;
