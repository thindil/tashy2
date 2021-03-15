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

with Interfaces.C;

package body Tk is

   procedure Tk_Init(Interpreter: Tcl_Interpreter := Get_Interpreter) is
      use Interfaces.C;
      function Tk_Init_C(Interp: Tcl_Interpreter) return int with
         Import => True,
         Convention => C,
         External_Name => "Tk_Init";
   begin
      if Tk_Init_C(Interp => Interpreter) =
        int(Tcl_Results'Pos(TCL_ERROR)) then
         raise Tcl_Exception with Tcl_Get_Result;
      end if;
   end Tk_Init;

end Tk;
