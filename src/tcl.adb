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

with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Tashy2; use Tashy2;
with Tcl.Variables; use Tcl.Variables;

package body Tcl is

   --## rule off GLOBAL_REFERENCES
   -- ****iv* Tcl/Tcl.Default_Interpreter
   -- FUNCTION Pointer to the default Tcl interpreter
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Interpreter: Tcl_Interpreter := Null_Interpreter;
   -- ****
   --## rule on GLOBAL_REFERENCES

   procedure Set_Interpreter(Interpreter: Tcl_Interpreter) is
   begin
      if Interpreter = Null_Interpreter then
         return;
      end if;
      Default_Interpreter := Interpreter;
   end Set_Interpreter;

   function Get_Interpreter return Tcl_Interpreter is
   begin
      return Default_Interpreter;
   end Get_Interpreter;

   function Tcl_Init(Interpreter: Tcl_Interpreter) return Boolean is
      function Native_Tcl_Init(Interp: Tcl_Interpreter) return Tcl_Results with
         Global => null,
         Import,
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
      Import,
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
      Message, Result_String: Unbounded_String := Null_Unbounded_String;
      Result_Code: Tcl_Results;
   begin
      if Interpreter = Null_Interpreter then
         Result_Code := TCL_ERROR;
         Message :=
           To_Unbounded_String(Source => "Tcl interpreter not initialized.");
      elsif Tcl_Script'Length = 0 then
         Result_Code := TCL_ERROR;
         Message :=
           To_Unbounded_String(Source => "Empty Tcl script to evaluate.");
      else
         Result_Code :=
           Native_Tcl_Eval
             (Interp => Interpreter, Script => To_C_String(Str => Tcl_Script));
         if Result_Code = TCL_ERROR then
            Message :=
              To_Unbounded_String
                (Source =>
                   Tcl_Get_Var
                     (Var_Name => "errorInfo", Interpreter => Interpreter));
         else
            Result_String :=
              To_Unbounded_String
                (Source => Tcl_Get_Result(Interpreter => Interpreter));
         end if;
      end if;
      Return_Result_Block :
      declare
         Message_Length: constant Natural := Length(Source => Message);
         Result_Length: constant Natural := Length(Source => Result_String);
         Result: constant Tcl_String_Result
           (Message_Length => Message_Length,
            Result_Length => Result_Length) :=
           (Message_Length => Message_Length, Result_Length => Result_Length,
            Return_Code => Result_Code,
            Result => To_String(Source => Result_String),
            Message => To_String(Source => Message));
      begin
         return Result;
      end Return_Result_Block;
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
             (Source =>
                Tcl_Get_Var
                  (Var_Name => "errorInfo", Interpreter => Interpreter));
      end if;
      Return_Result_Block :
      declare
         Message_Length: constant Natural := Length(Source => Message);
         Result: constant Tcl_Boolean_Result
           (Message_Length => Message_Length) :=
           (Message_Length => Message_Length, Return_Code => Result_Code,
            Result =>
              (if
                 Tcl_Get_Result(Interpreter => Interpreter) in "1" | "true" |
                     "on" | "yes"
               then True
               else False),
            Message => To_String(Source => Message));
      begin
         return Result;
      end Return_Result_Block;
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
             (Source =>
                Tcl_Get_Var
                  (Var_Name => "errorInfo", Interpreter => Interpreter));
      end if;
      Return_Result_Block :
      declare
         Message_Length: constant Natural := Length(Source => Message);
         Result: constant Tcl_Integer_Result
           (Message_Length => Message_Length) :=
           (Message_Length => Message_Length, Return_Code => Result_Code,
            Result => Tcl_Get_Result(Interpreter => Interpreter).Result,
            Message => To_String(Source => Message));
      begin
         return Result;
      end Return_Result_Block;
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
             (Source =>
                Tcl_Get_Var
                  (Var_Name => "errorInfo", Interpreter => Interpreter));
      end if;
      Return_Result_Block :
      declare
         Message_Length: constant Natural := Length(Source => Message);
         Result: constant Tcl_Float_Result
           (Message_Length => Message_Length) :=
           (Message_Length => Message_Length, Return_Code => Result_Code,
            Result => Tcl_Get_Result(Interpreter => Interpreter).Result,
            Message => To_String(Source => Message));
      begin
         return Result;
      end Return_Result_Block;
   end Tcl_Eval;

   function Tcl_Eval_File
     (File_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tcl_Results is
      function Native_Tcl_Eval_File
        (Interp: Tcl_Interpreter; File: chars_ptr) return Tcl_Results with
         Global => null,
         Import,
         Convention => C,
         External_Name => "Tcl_EvalFile";
   begin
      return
        Native_Tcl_Eval_File
          (Interp => Interpreter, File => To_C_String(Str => File_Name));
   end Tcl_Eval_File;

   function Tcl_Get_Result
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
      function Tcl_Get_String_Result
        (Interp: Tcl_Interpreter) return chars_ptr with
         Global => null,
         Import,
         Convention => C,
         External_Name => "Tcl_GetStringResult";
   begin
      return
        From_C_String(Item => Tcl_Get_String_Result(Interp => Interpreter));
   end Tcl_Get_Result;

   function Tcl_Get_Result
     (Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tcl_Integer_Result is
      Result: constant String := Tcl_Get_Result(Interpreter => Interpreter);
   begin
      if Result'Length = 0 or Result = " " or Result = "-" then
         return
           Tcl_Integer_Result'
             (Message_Length => 26, Return_Code => TCL_ERROR,
              Message => "Tcl result has empty value", Result => 0);
      end if;
      if Result'Length > Integer'Width then
         return
           Tcl_Integer_Result'
             (Message_Length => 33, Return_Code => TCL_ERROR,
              Message => "Tcl result is too long to convert", Result => 0);
      end if;
      if Result(Result'First) not in '-' | '0' .. '9' then
         return
           Tcl_Integer_Result'
             (Message_Length => 50, Return_Code => TCL_ERROR,
              Message => "Tcl result doesn't start with minus sign or number",
              Result => 0);
      end if;
      if Result'Length > 1
        and then
        (for some I in Result'First + 1 .. Result'Last =>
           Result(I) not in '0' .. '9') then
         return
           Tcl_Integer_Result'
             (Message_Length => 25, Return_Code => TCL_ERROR,
              Message => "Tcl result isn't a number", Result => 0);
      end if;
      if Long_Long_Integer'Value(Result) not in
          Long_Long_Integer(Integer'First) ..
                Long_Long_Integer(Integer'Last) then
         return
           Tcl_Integer_Result'
             (Message_Length => 33, Return_Code => TCL_ERROR,
              Message => "Tcl result isn't in Integer range", Result => 0);
      end if;
      pragma Annotate
        (GNATprove, False_Positive, "precondition might fail",
         "need check with other than CVC4 provers");
      return
        Tcl_Integer_Result'
          (Message_Length => 0, Return_Code => TCL_OK, Message => "",
           Result => Integer'Value(Result));
      pragma Annotate
        (GNATprove, False_Positive, "precondition might fail",
         "need check with other than CVC4 provers");
   end Tcl_Get_Result;

   function Tcl_Get_Result
     (Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tcl_Float_Result is
      Result: constant String := Tcl_Get_Result(Interpreter => Interpreter);
      use Ada.Strings.Fixed;

   begin
      if Result'Length = 0 or Result = " " or Result = "-" then
         return
           Tcl_Float_Result'
             (Message_Length => 26, Return_Code => TCL_ERROR,
              Message => "Tcl result has empty value", Result => 0.0);
      end if;
      if Result'Length > Float'Width then
         return
           Tcl_Float_Result'
             (Message_Length => 33, Return_Code => TCL_ERROR,
              Message => "Tcl result is too long to convert", Result => 0.0);
      end if;
      if Result(Result'First) not in '-' | '0' .. '9' | '.' then
         return
           Tcl_Float_Result'
             (Message_Length => 55, Return_Code => TCL_ERROR,
              Message =>
                "Tcl result doesn't start with minus sign, dot or number",
              Result => 0.0);
      end if;
      if Count(Source => Result, Pattern => ".") /= 1 then
         return
           Tcl_Float_Result'
             (Message_Length => 28, Return_Code => TCL_ERROR,
              Message => "Tcl result has too many dots", Result => 0.0);
      end if;
      if Result'Length > 1
        and then
        (for some I in Result'First + 1 .. Result'Last =>
           Result(I) not in '0' .. '9' | '.') then
         return
           Tcl_Float_Result'
             (Message_Length => 25, Return_Code => TCL_ERROR,
              Message => "Tcl result isn't a number", Result => 0.0);
      end if;
      return
        Tcl_Float_Result'
          (Message_Length => 0, Return_Code => TCL_OK, Message => "",
           Result => Float'Value(Result));
      pragma Annotate
        (GNATprove, False_Positive, "precondition might fail",
         "need check with other than CVC4 provers");
   end Tcl_Get_Result;

   procedure Tcl_Set_Result
     (Tcl_Result: String; Result_Type: Result_Types := Default_Result_Type;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      use Interfaces.C;

      procedure Native_Tcl_Set_Result
        (Interp: Tcl_Interpreter; Result: chars_ptr; Free_Proc: int) with
         Global => null,
         Import,
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
