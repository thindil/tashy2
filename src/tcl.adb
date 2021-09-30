-- Copyright (c) 2020-2021 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- Licensed under the Apache License, Version 2.0 (the "License"); you may not
-- use this file except in compliance with the License. You may obtain a copy
-- of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
-- WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
-- License for the specific language governing permissions and limitations
-- under the License.

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Tashy2; use Tashy2;
with Tcl.Variables; use Tcl.Variables;

package body Tcl is

   --## rule off GLOBAL_REFERENCES
   -- ****iv* Tcl/Tcl.Default_Interpreter FUNCTION Pointer to the default Tcl
   -- interpreter HISTORY 8.6.0 - Added SOURCE
   Default_Interpreter: Tcl_Interpreter := Null_Interpreter;
   -- ****
   --## rule on GLOBAL_REFERENCES

   procedure Set_Interpreter(Interpreter: Tcl_Interpreter) is
   begin
      Default_Interpreter := Interpreter;
   end Set_Interpreter;

   function Get_Interpreter return Tcl_Interpreter is
   begin
      return Default_Interpreter;
   end Get_Interpreter;

   function Tcl_Init(Interpreter: Tcl_Interpreter) return Boolean is
      function Native_Tcl_Init(Interp: Tcl_Interpreter) return Tcl_Results with
         Global => null,
         Import => True,
         Convention => C,
         External_Name => "Tcl_Init";
   begin
      if Native_Tcl_Init(Interp => Interpreter) = TCL_ERROR then
         return False;
      end if;
      return True;
   end Tcl_Init;

   -- ****if* Tcl/Tcl.Native_Tcl_Eval
   -- FUNCTION
   -- Binding to C function Tcl_Eval, evalutate the selected Tcl script
   -- PARAMETERS
   -- Interp - Tcl interpreter on which the Tcl script will be evaluated
   -- Script - Tcl script to evaluate
   -- RESULT
   -- Tcl_Results value
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Native_Tcl_Eval
     (Interp: Tcl_Interpreter; Script: chars_ptr) return Tcl_Results with
      Global => null,
      Import => True,
      Convention => C,
      External_Name => "Tcl_Eval";
      -- ****

   procedure Tcl_Eval
     (Tcl_Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      if Native_Tcl_Eval
          (Interp => Interpreter, Script => To_C_String(Str => Tcl_Script)) =
        TCL_ERROR then
         return;
      end if;
   end Tcl_Eval;

   function Tcl_Eval
     (Tcl_Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tcl_String_Result is
      Message: Unbounded_String := Null_Unbounded_String;
      Result_Code: constant Tcl_Results :=
        Native_Tcl_Eval
          (Interp => Interpreter, Script => To_C_String(Str => Tcl_Script));
      Result_String: constant String :=
        Tcl_Get_Result(Interpreter => Interpreter);
   begin
      if Result_Code = TCL_ERROR then
         Message :=
           To_Unbounded_String
             (Tcl_Get_Var
                (Var_Name => "errorInfo", Interpreter => Interpreter));
      end if;
      return
        Result: Tcl_String_Result
          (Length(Source => Message), Result_String'Length)
      do
         Result.Return_Code := Result_Code;
         Result.Result := Result_String;
         Result.Message := To_String(Message);
      end return;
   end Tcl_Eval;

   function Tcl_Eval
     (Tcl_Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tcl_Boolean_Result is
      Message: Unbounded_String := Null_Unbounded_String;
      Result_Code: constant Tcl_Results :=
        Native_Tcl_Eval
          (Interp => Interpreter, Script => To_C_String(Str => Tcl_Script));
   begin
      if Result_Code = TCL_ERROR then
         Message :=
           To_Unbounded_String
             (Tcl_Get_Var
                (Var_Name => "errorInfo", Interpreter => Interpreter));
      end if;
      return Result: Tcl_Boolean_Result (Length(Source => Message)) do
         Result.Return_Code := Result_Code;
         Result.Result :=
           (if
              Tcl_Get_Result(Interpreter => Interpreter) in "1" | "true" |
                  "on" | "yes"
            then True
            else False);
         Result.Message := To_String(Message);
      end return;
   end Tcl_Eval;

   function Tcl_Eval
     (Tcl_Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tcl_Integer_Result is
      Message: Unbounded_String := Null_Unbounded_String;
      Result_Code: constant Tcl_Results :=
        Native_Tcl_Eval
          (Interp => Interpreter, Script => To_C_String(Str => Tcl_Script));
   begin
      if Result_Code = TCL_ERROR then
         Message :=
           To_Unbounded_String
             (Tcl_Get_Var
                (Var_Name => "errorInfo", Interpreter => Interpreter));
      end if;
      return Result: Tcl_Integer_Result (Length(Source => Message)) do
         Result.Return_Code := Result_Code;
         Result.Result :=
           Integer'Value(Tcl_Get_Result(Interpreter => Interpreter));
         Result.Message := To_String(Message);
      end return;
   end Tcl_Eval;

   function Tcl_Eval
     (Tcl_Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tcl_Float_Result is
      Message: Unbounded_String := Null_Unbounded_String;
      Result_Code: constant Tcl_Results :=
        Native_Tcl_Eval
          (Interp => Interpreter, Script => To_C_String(Str => Tcl_Script));
   begin
      if Result_Code = TCL_ERROR then
         Message :=
           To_Unbounded_String
             (Tcl_Get_Var
                (Var_Name => "errorInfo", Interpreter => Interpreter));
      end if;
      return Result: Tcl_Float_Result (Length(Source => Message)) do
         Result.Return_Code := Result_Code;
         Result.Result :=
           Float'Value(Tcl_Get_Result(Interpreter => Interpreter));
         Result.Message := To_String(Message);
      end return;
   end Tcl_Eval;

   procedure Tcl_Eval_File
     (File_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter) is
      function Native_Tcl_Eval_File
        (Interp: Tcl_Interpreter; File: chars_ptr) return Tcl_Results with
         Global => null,
         Import => True,
         Convention => C,
         External_Name => "Tcl_EvalFile";
   begin
      if Native_Tcl_Eval_File
          (Interp => Interpreter, File => To_C_String(Str => File_Name)) =
        TCL_ERROR then
         raise Tcl_Exception with Tcl_Get_Result;
      end if;
   end Tcl_Eval_File;

   function Tcl_Get_Result
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
      function Tcl_Get_String_Result
        (Interp: Tcl_Interpreter) return chars_ptr with
         Global => null,
         Import => True,
         Convention => C,
         External_Name => "Tcl_GetStringResult";
   begin
      return
        From_C_String(Item => Tcl_Get_String_Result(Interp => Interpreter));
   end Tcl_Get_Result;

   function Generic_Scalar_Tcl_Get_Result
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Result_Type is
   begin
      if Interpreter = Null_Interpreter then
         raise Tcl_Exception
           with "Can't get result from non existing Tcl interpreter";
      end if;
      return Result_Type'Value(Tcl_Get_Result(Interpreter => Interpreter));
   end Generic_Scalar_Tcl_Get_Result;

   function Generic_Float_Tcl_Get_Result
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Result_Type is
   begin
      if Interpreter = Null_Interpreter then
         raise Tcl_Exception
           with "Can't get result from non existing Tcl interpreter";
      end if;
      return Result_Type'Value(Tcl_Get_Result(Interpreter => Interpreter));
   end Generic_Float_Tcl_Get_Result;

   procedure Tcl_Set_Result
     (Tcl_Result: String; Result_Type: Result_Types := Default_Result_Type;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      use Interfaces.C;

      procedure Native_Tcl_Set_Result
        (Interp: Tcl_Interpreter; Result: chars_ptr; Free_Proc: int) with
         Global => null,
         Import => True,
         Convention => C,
         External_Name => "Tcl_SetResult";
   begin
      Native_Tcl_Set_Result
        (Interp => Interpreter, Result => To_C_String(Str => Tcl_Result),
         Free_Proc => Result_Types'Enum_Rep(Result_Type));
   end Tcl_Set_Result;

   procedure Tcl_Update
     (Interpreter: Tcl_Interpreter := Get_Interpreter;
      Idle_Tasks_Only: Boolean := False) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "update" & (if Idle_Tasks_Only then " idletasks" else ""),
         Interpreter => Interpreter);
   end Tcl_Update;

end Tcl;
