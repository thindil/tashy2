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

package Tcl.Commands is

   package Argv_Pointer is new Interfaces.C.Pointers(Index => size_t,
      Element => chars_ptr, Element_Array => chars_ptr_array,
      Default_Terminator => Null_Ptr);

   type Tcl_CmdProc is access function
     (ClientData: System.Address; Interpreter: Tcl_Interpreter; Argc: Positive;
      Argv: Argv_Pointer.Pointer) return Natural with
      Convention => C;

   type Tcl_CmdDeleteProc is access procedure(ClientData: System.Address) with
      Convention => C;

   type Tcl_Command is new System.Address;

   function Tcl_CreateCommand
     (Command_Name: String; Proc: Tcl_CmdProc;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      DeleteProc: Tcl_CmdDeleteProc := null) return Tcl_Command with
      Pre => Command_Name'Length > 0,
      Test_Case => ("Test_Tcl_CreateCommand", Nominal);

   function Get_Argument
     (Arguments_Pointer: Argv_Pointer.Pointer; Index: Natural) return String;

end Tcl.Commands;
