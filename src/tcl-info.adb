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

with GNAT.String_Split; use GNAT.String_Split;

package body Tcl.Info is

   function Arguments
     (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbouned_Strings_Array is
      Tokens: Slice_Set;
   begin
      Tcl_Eval("info args " & Proc_Name, Interpreter);
      Create(Tokens, Tcl_GetResult(Interpreter), " ");
      if Slice_Count(Tokens) = 0 then
         return (1 => Null_Unbounded_String);
      end if;
      return
        Result: Unbouned_Strings_Array(1 .. Positive(Slice_Count(Tokens))) do
         for I in 1 .. Positive(Slice_Count(Tokens)) loop
            Result(I) := To_Unbounded_String(Slice(Tokens, Slice_Number(I)));
         end loop;
      end return;
   end Arguments;

   function Procedure_Body
     (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String is
   begin
      Tcl_Eval("info body " & Proc_Name, Interpreter);
      return Tcl_GetResult(Interpreter);
   end Procedure_Body;

   function Commands_Count
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Natural is
   begin
      Tcl_Eval("info cmdcount", Interpreter);
      return Tcl_GetResult(Interpreter);
   end Commands_Count;

   function Exists
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean is
   begin
      Tcl_Eval("info exists " & Var_Name, Interpreter);
      if Tcl_GetResult(Interpreter) = 1 then
         return True;
      end if;
      return False;
   end Exists;

end Tcl.Info;
