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

package body Tcl.Commands is

   function Tcl_Create_Command
     (Command_Name: String; Proc: Tcl_Cmd_Proc;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Delete_Proc: Tcl_Cmd_Delete_Proc := Null_Tcl_Cmd_Delete_Proc)
      return Tcl_Command is

      function Tcl_Create_Command_C
        (Interp: Tcl_Interpreter; Cmd_Name: chars_ptr; Ada_Proc: Tcl_Cmd_Proc;
         Client_Data: System.Address; Delete_Proc_Ada: Tcl_Cmd_Delete_Proc)
         return Tcl_Command with
         Import => True,
         Convention => C,
         External_Name => "Tcl_CreateCommand";

      Result: constant Tcl_Command :=
        Tcl_Create_Command_C
          (Interp => Interpreter, Cmd_Name => New_String(Str => Command_Name),
           Ada_Proc => Proc, Client_Data => Null_Address,
           Delete_Proc_Ada => Delete_Proc);
   begin
      if Result = Null_Tcl_Command then
         raise Tcl_Exception with "Can't create command " & Command_Name;
      end if;
      return Result;
   end Tcl_Create_Command;

   function Get_Argument
     (Arguments_Pointer: Argv_Pointer.Pointer; Index: Natural) return String is
   begin
      return
        Value
          (Item =>
             Argv_Pointer.Value(Ref => Arguments_Pointer)(size_t(Index)));
   end Get_Argument;

end Tcl.Commands;
