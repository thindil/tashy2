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

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Pointers;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System; use System;

-- ****h* Tcl/Commands
-- FUNCTION
-- Provide code to manipulate Tcl commands (adding, deleting, etc)
-- SOURCE
package Tcl.Commands with
   SPARK_Mode => Off
is
-- ****

   -----------------------------
   -- Creating a new Tcl command
   -----------------------------

   --## rule off REDUCEABLE_SCOPE
   -- ****t* Commands/Commands.Argv_Pointer
   -- FUNCTION
   -- Used to store arguments of the selected Tcl command
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   package Argv_Pointer is new Interfaces.C.Pointers
     (Index => size_t, Element => chars_ptr, Element_Array => chars_ptr_array,
      Default_Terminator => Null_Ptr);
   -- ****

   -- ****t* Commands/Commands.Tcl_Cmd_Proc
   -- FUNCTION
   -- The Ada code which will be executed when the selected command will be
   -- invoked.
   -- PARAMETERS
   -- Cliend_Data  - Generally unused
   -- Interpreter  - The Tcl interpreter on which the command was invoked
   -- Argc         - The number of arguments passed to the command. Minimum one.
   -- Argv         - The pointer to the list of arguments passed to the command.
   --                The first element is always the name of invoked procedure
   -- RESULT
   -- Should be one of TCL_OK, TCL_ERROR, TCL_RETURN, TCL_BREAK, TCL_CONTINUE
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Tcl_Cmd_Proc is access function
     (Client_Data: System.Address; Interpreter: Tcl_Interpreter;
      Argc: Positive; Argv: Argv_Pointer.Pointer) return Tcl_Results with
      Convention => C;
      -- ****

      -- ****d* Commands/Commands.Null_Tcl_Cmd_Proc
      -- FUNCTION
      -- Null Tcl command procedure
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Null_Tcl_Cmd_Proc: constant Tcl_Cmd_Proc := null;
   -- ****

   -- ****t* Commands/Commands.Tcl_Cmd_Delete_Proc
   -- FUNCTION
   -- The Ada code which will be executed when the selected command will be
   -- deleted.
   -- PARAMETERS
   -- Client_Data - Generally unused
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Tcl_Cmd_Delete_Proc is access procedure
     (Client_Data: System.Address) with
      Convention => C;
      -- ****

      -- ****d* Commands/Commands.Null_Tcl_Cmd_Delete_Proc
      -- FUNCTION
      -- Null Tcl command delete procedure
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Null_Tcl_Cmd_Delete_Proc: constant Tcl_Cmd_Delete_Proc := null;
   -- ****

      -- ****t* Commands/Commands.Tcl_Command
      -- FUNCTION
      -- The pointer to a Tcl command
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   type Tcl_Command is new System.Address;
   -- ****

   -- ****d* Commands/Commands.Null_Tcl_Command
   -- FUNCTION
   -- Null Tcl command
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Null_Tcl_Command: constant Tcl_Command := Tcl_Command(System.Null_Address);
   -- ****

   -- ****f* Commands/Commands.Tcl_Create_Command
   -- FUNCTION
   -- Add a new Tcl command to the selected Tcl interpreter
   -- PARAMETERS
   -- Command_Name - The name of the Tcl command to add
   -- Proc         - The code of the Tcl command to add
   -- Interpreter  - The Tcl interpreter to which the command will be added.
   --                By default it is the default Tcl interpreter
   -- Delete_Proc  - The code which will be executed on deleting Tcl command.
   --                Default value is null
   -- RESULT
   -- The pointer to the newly created Tcl command or Null_Tcl_Command is the
   -- command can't be created
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Add command MyProc with Ada function My_Command as code on default interpreter without deleting code
   -- My_Command: constant Tcl_Command := Tcl_Create_Command("MyProc", My_Command'Access);
   -- SOURCE
   function Tcl_Create_Command
     (Command_Name: String; Proc: Tcl_Cmd_Proc;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Delete_Proc: Tcl_Cmd_Delete_Proc := Null_Tcl_Cmd_Delete_Proc)
      return Tcl_Command with
      Pre => Command_Name'Length > 0 and Proc /= Null_Tcl_Cmd_Proc and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Tcl_CreateCommand", Mode => Nominal);
      -- ****

      -----------------------------------------
      -- Manipulating a Tcl command arguments
      -----------------------------------------

      -- ****f* Commands/Commands.Get_Argument
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
     (Arguments_Pointer: not null Argv_Pointer.Pointer; Index: Natural)
      return String;
     -- ****
     --## rule on REDUCEABLE_SCOPE

end Tcl.Commands;
