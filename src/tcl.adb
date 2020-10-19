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
with Interfaces.C.Strings; use Interfaces.C.Strings;

package body Tcl is

   -- ****iv* Tcl/Default_Interpreter
   -- FUNCTION
   -- Pointer to the default Tcl interpreter
   -- SOURCE
   Default_Interpreter: Tcl_Interpreter;
   -- ****

   -- ****ie* Tcl/Tcl_Exception
   -- FUNCTION
   -- Standard TASHY2 exception. Raised when something bad happens (mostly
   -- when TCL_ERROR arrive)
   -- SOURCE
   Tcl_Exception: exception;
   -- ****

   function Create_Interpreter
     (Default: Boolean := True) return Tcl_Interpreter is
      function Tcl_CreateInterp return Tcl_Interpreter with
         Import => True,
         Convention => C,
         External_Name => "Tcl_CreateInterp";
   begin
      if Default then
         Default_Interpreter := Tcl_CreateInterp;
         return Default_Interpreter;
      end if;
      return Tcl_CreateInterp;
   end Create_Interpreter;

   function Get_Interpreter return Tcl_Interpreter is
   begin
      return Default_Interpreter;
   end Get_Interpreter;

   procedure Tcl_Init(Interpreter: Tcl_Interpreter) is
      function Tcl_Init(interp: Tcl_Interpreter) return int with
         Import => True,
         Convention => C,
         External_Name => "Tcl_Init";
   begin
      if Tcl_Init(Interpreter) = Return_Codes'Pos(TCL_ERROR) then
         raise Tcl_Exception with Tcl_GetStringResult;
      end if;
   end Tcl_Init;

   procedure Tcl_Eval
     (Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter) is
      function TclEval
        (interp: Tcl_Interpreter; script: chars_ptr) return int with
         Import => True,
         Convention => C,
         External_Name => "Tcl_Eval";
   begin
      if TclEval(Interpreter, New_String(Script)) =
        Return_Codes'Pos(TCL_ERROR) then
         raise Tcl_Exception with Tcl_GetStringResult;
      end if;
   end Tcl_Eval;

   function Tcl_GetStringResult
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
      function TclGetStringResult
        (interp: Tcl_Interpreter) return chars_ptr with
         Import => True,
         Convention => C,
         External_Name => "Tcl_GetStringResult";
   begin
      return Value(TclGetStringResult(Interpreter));
   end Tcl_GetStringResult;

   procedure Tcl_SetResult
     (Result: String; Result_Type: Result_Types := TCL_STATIC;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      procedure TclSetResult
        (interp: Tcl_Interpreter; result: chars_ptr; freeProc: int) with
         Import => True,
         Convention => C,
         External_Name => "Tcl_SetResult";
   begin
      TclSetResult
        (Interpreter, New_String(Result), Result_Types'Enum_Rep(Result_Type));
   end Tcl_SetResult;

end Tcl;
