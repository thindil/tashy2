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

with System;
with Tcl; use Tcl;
with Tcl.Commands; use Tcl.Commands;

-- ****h* CalculatorCommands/CalculatorCommands
-- FUNCTION
-- Provide various Tcl commands related to the calculator demo
-- SOURCE
package CalculatorCommands is
-- ****

   -- ****f* CalculatorCommands/CalculatorCommands.On_Click
   -- FUNCTION
   -- Update display with the pressed button text or count its expression if
   -- button equal was pressed
   -- PARAMETERS
   -- Unused_Client_Data - Optional data passed to the function.
   -- Interpreter        - Tcl interpreter on which the command was invoked.
   -- Unused_Argc        - The amount of arguments passed to the command.
   -- Argv               - The array of arguments passed to the command
   -- RESULT
   -- This function always return TCL_OK
   -- COMMANDS
   -- OnClick buttonpath displaypath
   -- Buttonpath is Tk path name for the button which was clicked, displaypath
   -- is the Tk path name for the calculator display widget
   -- SOURCE
   function On_Click
     (Unused_Client_Data: System.Address; Interpreter: Tcl_Interpreter;
      Unused_Argc: Positive; Argv: Argv_Pointer.Pointer)
      return Tcl_Results with
      Convention => C;
      -- ****

      -- ****f* CalculatorCommands/CalculatorCommands.Clear_Display
      -- FUNCTION
      -- Reset the calculator's display to it inital state. Show just zero
      -- number
      -- Client_Data - Optional data passed to the function. Unused
      -- Interpreter - Tcl interpreter on which the command was invoked.
      -- Argc        - The amount of arguments passed to the command. Unused
      -- Argv        - The array of arguments passed to the command
      -- RESULT
      -- This function always return TCL_OK
      -- COMMANDS
      -- ClearDisplay displaypath
      -- Displaypath is the Tk path name for the calculator's display widget
      -- SOURCE
   function Clear_Display
     (Client_Data: System.Address; Interpreter: Tcl_Interpreter;
      Argc: Positive; Argv: Argv_Pointer.Pointer) return Tcl_Results with
      Convention => C;
      -- ****

end CalculatorCommands;
