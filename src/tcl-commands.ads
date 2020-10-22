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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with System; use System;

package Tcl.Commands is

   -- FIXME: Warning about uncontstrained array in foreign caller

   type Arguments_Array is array(Positive range <>) of Unbounded_String;

   type Tcl_CmdProc is access function
     (ClientData: System.Address := Null_Address; Interpreter: Tcl_Interpreter;
      Argc: Positive; Argv: Arguments_Array) return Natural with
      Convention => C;

   type Tcl_CmdDeleteProc is access procedure
     (ClientData: System.Address := Null_Address) with
      Convention => C;

   type Tcl_Command is new System.Address;

   function Tcl_CreateCommand
     (Interpreter: Tcl_Interpreter; Command_Name: String; Proc: Tcl_CmdProc;
      DeleteProc: Tcl_CmdDeleteProc := null) return Tcl_Command with
      Pre => Command_Name'Length > 0,
      Test_Case => ("Test_Tcl_CreateCommand", Nominal);

end Tcl.Commands;
