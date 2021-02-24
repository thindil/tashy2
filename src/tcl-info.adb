-- Copyright (c) 2021 Bartek thindil Jasicki <thindil@laeran.pl>
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

with GNAT.String_Split;

package body Tcl.Info is

   -- ****if* Info/Info.Get_Unbounded_Array_Result
   -- FUNCTION
   -- Get the last Tcl command result and convert it to Unbounded_Strings_Array
   -- PARAMETERS
   -- Interpreter - Tcl interpreter on which the last Tcl command result will
   --               be get
   -- RESULT
   -- Unbounded_Strings_Array with result of the command
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Get_Unbounded_Array_Result
     (Interpreter: Tcl_Interpreter) return Unbounded_Strings_Array is
      -- ****
      use GNAT.String_Split;
      Tokens: Slice_Set;
   begin
      Create
        (S => Tokens, From => Tcl_Get_Result(Interpreter => Interpreter),
         Separators => " ");
      if Slice_Count(S => Tokens) = 0 then
         return Empty_Unbounded_Strings_Array;
      end if;
      return
        Result: Unbounded_Strings_Array
          (1 .. Positive(Slice_Count(S => Tokens))) :=
          (others => Null_Unbounded_String) do
         Get_Result_Array_Loop :
         for I in 1 .. Positive(Slice_Count(S => Tokens)) loop
            Result(I) :=
              To_Unbounded_String
                (Source => Slice(S => Tokens, Index => Slice_Number(I)));
         end loop Get_Result_Array_Loop;
      end return;
   end Get_Unbounded_Array_Result;

   function Arguments
     (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbounded_Strings_Array is
   begin
      Tcl_Eval
        (Tcl_Script => "info args " & Proc_Name, Interpreter => Interpreter);
      return Get_Unbounded_Array_Result(Interpreter => Interpreter);
   end Arguments;

   function Procedure_Body
     (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String is
   begin
      Tcl_Eval
        (Tcl_Script => "info body " & Proc_Name, Interpreter => Interpreter);
      return Tcl_Get_Result(Interpreter => Interpreter);
   end Procedure_Body;

   function Commands_Count
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Natural is
   begin
      Tcl_Eval(Tcl_Script => "info cmdcount", Interpreter => Interpreter);
      return Tcl_Get_Result(Interpreter => Interpreter);
   end Commands_Count;

   function Commands
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbounded_Strings_Array is
   begin
      Tcl_Eval
        (Tcl_Script => "info commands " & Pattern, Interpreter => Interpreter);
      return Get_Unbounded_Array_Result(Interpreter => Interpreter);
   end Commands;

   function Complete
     (Command: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean is
   begin
      Tcl_Eval
        (Tcl_Script => "info complete " & Command, Interpreter => Interpreter);
      if Tcl_Get_Result(Interpreter => Interpreter) = 1 then
         return True;
      end if;
      return False;
   end Complete;

   function Coroutine
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      Tcl_Eval(Tcl_Script => "info coroutine", Interpreter => Interpreter);
      return Tcl_Get_Result(Interpreter => Interpreter);
   end Coroutine;

   function Default
     (Proc_Name, Argument, Var_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Boolean is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "info default " & Proc_Name & " " & Argument & " " & Var_Name,
         Interpreter => Interpreter);
      if Tcl_Get_Result(Interpreter => Interpreter) = 1 then
         return True;
      end if;
      return False;
   end Default;

   function Error_Stack
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      Tcl_Eval(Tcl_Script => "info errorstack", Interpreter => Interpreter);
      return Tcl_Get_Result(Interpreter => Interpreter);
   end Error_Stack;

   function Exists
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean is
   begin
      Tcl_Eval
        (Tcl_Script => "info exists " & Var_Name, Interpreter => Interpreter);
      if Tcl_Get_Result(Interpreter => Interpreter) = 1 then
         return True;
      end if;
      return False;
   end Exists;

   function Functions
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbounded_Strings_Array is
   begin
      Tcl_Eval
        (Tcl_Script => "info functions " & Pattern,
         Interpreter => Interpreter);
      return Get_Unbounded_Array_Result(Interpreter => Interpreter);
   end Functions;

   function Globals
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbounded_Strings_Array is
   begin
      Tcl_Eval
        (Tcl_Script => "info globals " & Pattern, Interpreter => Interpreter);
      return Get_Unbounded_Array_Result(Interpreter => Interpreter);
   end Globals;

   function Host_Name
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      Tcl_Eval(Tcl_Script => "info hostname", Interpreter => Interpreter);
      return Tcl_Get_Result(Interpreter => Interpreter);
   end Host_Name;

   function Library
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      Tcl_Eval(Tcl_Script => "info library", Interpreter => Interpreter);
      return Tcl_Get_Result(Interpreter => Interpreter);
   end Library;

   function Locals
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbounded_Strings_Array is
   begin
      Tcl_Eval
        (Tcl_Script => "info locals " & Pattern, Interpreter => Interpreter);
      return Get_Unbounded_Array_Result(Interpreter => Interpreter);
   end Locals;

   function Name_Of_Executable
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      Tcl_Eval
        (Tcl_Script => "info nameofexecutable", Interpreter => Interpreter);
      return Tcl_Get_Result(Interpreter => Interpreter);
   end Name_Of_Executable;

   function Patch_Level
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      Tcl_Eval(Tcl_Script => "info patchlevel", Interpreter => Interpreter);
      return Tcl_Get_Result(Interpreter => Interpreter);
   end Patch_Level;

   function Procs
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbounded_Strings_Array is
   begin
      Tcl_Eval
        (Tcl_Script => "info procs " & Pattern, Interpreter => Interpreter);
      return Get_Unbounded_Array_Result(Interpreter => Interpreter);
   end Procs;

   function Script
     (File_Name: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String is
   begin
      Tcl_Eval
        (Tcl_Script => "info script " & File_Name, Interpreter => Interpreter);
      return Tcl_Get_Result(Interpreter => Interpreter);
   end Script;

   function Tcl_Version
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      Tcl_Eval(Tcl_Script => "info tclversion", Interpreter => Interpreter);
      return Tcl_Get_Result(Interpreter => Interpreter);
   end Tcl_Version;

   function Vars
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbounded_Strings_Array is
   begin
      Tcl_Eval
        (Tcl_Script => "info vars " & Pattern, Interpreter => Interpreter);
      return Get_Unbounded_Array_Result(Interpreter => Interpreter);
   end Vars;

end Tcl.Info;
