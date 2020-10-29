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

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Pointers;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System; use System;

-- ****h* Tcl/Commands
-- FUNCTION
-- Provide code to manipulate Tcl commands (adding, deleting, etc)
-- SOURCE
package Tcl.Commands is
-- ****

   -----------------------------
   -- Creating a new Tcl command
   -----------------------------

   -- ****t* Commands/Argv_Pointer
   -- FUNCTION
   -- Used to store arguments of the selected Tcl command
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   package Argv_Pointer is new Interfaces.C.Pointers(Index => size_t,
      Element => chars_ptr, Element_Array => chars_ptr_array,
      Default_Terminator => Null_Ptr);
   -- ****

   -- ****t* Commands/Commands.Tcl_Command_Result
   -- FUNCTION
   -- Used as result of Tcl_CmdProc type
   -- SOURCE
   subtype Tcl_Command_Result is Natural range 0 .. 4;
   -- ****

   -- ****t* Commands/Tcl_CmdProc
   -- FUNCTION
   -- The Ada code which will be executed when the selected command will be
   -- invoked.
   -- PARAMETERS
   -- CliendData  - Generally unused
   -- Interpreter - The Tcl interpreter on which the command was invoked
   -- Argc        - The number of arguments passed to the command. Minimum one.
   -- Argv        - The pointer to the list of arguments passed to the command.
   --               The first element is always the name of invoked procedure
   -- RESULT
   -- Should be one of TCL_OK, TCL_ERROR, TCL_RETURN, TCL_BREAK, TCL_CONTINUE
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Tcl_CmdProc is access function
     (ClientData: System.Address; Interpreter: Tcl_Interpreter; Argc: Positive;
      Argv: Argv_Pointer.Pointer) return Tcl_Command_Result with
      Convention => C;
      -- ****

      -- ****t* Commands/Tcl_CmdDeleteProc
      -- FUNCTION
      -- The Ada code which will be executed when the selected command will be
      -- deleted.
      -- PARAMETERS
      -- ClientData - Generally unused
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   type Tcl_CmdDeleteProc is access procedure(ClientData: System.Address) with
      Convention => C;
      -- ****

      -- ****t* Commands/Tcl_Command
      -- FUNCTION
      -- The pointer to a Tcl command
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   type Tcl_Command is new System.Address;
   -- ****

   -- ****f* Commands/Tcl_CreateCommand
   -- FUNCTION
   -- Add a new Tcl command to the selected Tcl interpreter
   -- PARAMETERS
   -- Command_Name - The name of the Tcl command to add
   -- Proc         - The code of the Tcl command to add
   -- Interpreter  - The Tcl interpreter to which the command will be added.
   --                By default it is the default Tcl interpreter
   -- DeleteProc   - The code which will be executed on deleting Tcl command.
   --                Default value is null
   -- RESULT
   -- The pointer to the newly created Tcl command
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Add command MyProc with Ada function My_Command as code on default interpreter without deleting code
   -- My_Command: constant Tcl_Command := Tcl_CreateCommand("MyProc", My_Command'Access);
   -- SOURCE
   function Tcl_CreateCommand
     (Command_Name: String; Proc: Tcl_CmdProc;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      DeleteProc: Tcl_CmdDeleteProc := null) return Tcl_Command with
      Pre => Command_Name'Length > 0,
      Test_Case => ("Test_Tcl_CreateCommand", Nominal);
      -- ****

      -----------------------------------------
      -- Manipulating a Tcl command arguments
      -----------------------------------------

      -- ****f* Commands/Get_Argument
      -- FUNCTION
      -- Get the selected argument from the arguments list
      -- PARAMETERS
      -- Arguments_Pointer - C pointer to the list of arguments from which the
      --                     argument will be taken
      -- Index             - Index of the argument to take
      -- RESULT
      -- The selected argument from the list
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the name of the Tcl command (always the first argument) from My_Arguments pointer
      -- Proc_Name: constant String := Get_Argument(My_Arguments, 0);
      -- SOURCE
   function Get_Argument
     (Arguments_Pointer: Argv_Pointer.Pointer; Index: Natural) return String;
     -- ****

end Tcl.Commands;
