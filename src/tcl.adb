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
with Interfaces.C.Strings; use Interfaces.C.Strings;

package body Tcl is

   --## rule off GLOBAL_REFERENCES
   -- ****iv* Tcl/Tcl.Default_Interpreter
   -- FUNCTION
   -- Pointer to the default Tcl interpreter
   -- SOURCE
   Default_Interpreter: Tcl_Interpreter := Null_Interpreter;
   -- ****
   --## rule on GLOBAL_REFERENCES

   procedure Set_Interpreter(Interpreter: Tcl_Interpreter) is
   begin
      Default_Interpreter := Interpreter;
   end Set_Interpreter;

   function Get_Interpreter return Tcl_Interpreter is
   begin
      if Default_Interpreter = Null_Interpreter then
         raise Tcl_Exception
           with "Default Tcl interpreter is not created yet.";
      end if;
      return Default_Interpreter;
   end Get_Interpreter;

   function Create_Interpreter
     (Default: Boolean := True) return Tcl_Interpreter is
      function Tcl_Create_Interp return Tcl_Interpreter with
         Import => True,
         Convention => C,
         External_Name => "Tcl_CreateInterp";
      Interpreter: constant Tcl_Interpreter := Tcl_Create_Interp;
   begin
      if Interpreter = Null_Interpreter then
         raise Tcl_Exception with "Failed to create Tcl interpreter";
      end if;
      if Default then
         Set_Interpreter(Interpreter => Interpreter);
         return Get_Interpreter;
      end if;
      return Interpreter;
   end Create_Interpreter;

   procedure Tcl_Init(Interpreter: Tcl_Interpreter) is
      function Native_Tcl_Init(Interp: Tcl_Interpreter) return int with
         Import => True,
         Convention => C,
         External_Name => "Tcl_Init";
   begin
      if Native_Tcl_Init(Interp => Interpreter) =
        int(Tcl_Results'Pos(TCL_ERROR)) then
         raise Tcl_Exception with Tcl_Get_Result;
      end if;
   end Tcl_Init;

   procedure Tcl_Eval
     (Tcl_Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter) is
      function Native_Tcl_Eval
        (Interp: Tcl_Interpreter; Script: chars_ptr) return int with
         Import => True,
         Convention => C,
         External_Name => "Tcl_Eval";
   begin
      if Native_Tcl_Eval
          (Interp => Interpreter, Script => New_String(Str => Tcl_Script)) =
        int(Tcl_Results'Pos(TCL_ERROR)) then
         raise Tcl_Exception with Tcl_Get_Result;
      end if;
   end Tcl_Eval;

   function Tcl_Get_Result
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
      function Tcl_Get_String_Result
        (Interp: Tcl_Interpreter) return chars_ptr with
         Import => True,
         Convention => C,
         External_Name => "Tcl_GetStringResult";
   begin
      return Value(Item => Tcl_Get_String_Result(Interp => Interpreter));
   end Tcl_Get_Result;

   procedure Tcl_Set_Result
     (Tcl_Result: String; Result_Type: Result_Types := Default_Result_Type;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      procedure Native_Tcl_Set_Result
        (Interp: Tcl_Interpreter; Result: chars_ptr; Free_Proc: int) with
         Import => True,
         Convention => C,
         External_Name => "Tcl_SetResult";
   begin
      Native_Tcl_Set_Result
        (Interp => Interpreter, Result => New_String(Str => Tcl_Result),
         Free_Proc => Result_Types'Enum_Rep(Result_Type));
   end Tcl_Set_Result;

end Tcl;
