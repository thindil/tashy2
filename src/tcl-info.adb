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

package body Tcl.Info is

   function Integer_Eval is new Generic_Scalar_Tcl_Eval
     (Result_Type => Integer);

   function Procedure_Body
     (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String is
   begin
      return Tcl_Eval
          (Tcl_Script => "info body " & Proc_Name, Interpreter => Interpreter);
   end Procedure_Body;

   function Commands_Count
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Natural is
   begin
      return Integer_Eval
          (Tcl_Script => "info cmdcount", Interpreter => Interpreter);
   end Commands_Count;

   function Commands
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      return Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "info commands " & Pattern,
                Interpreter => Interpreter),
           Interpreter => Interpreter);
   end Commands;

   function Complete
     (Command: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean is
   begin
      if Integer_Eval
          (Tcl_Script => "info complete " & Command,
           Interpreter => Interpreter) =
        1 then
         return True;
      end if;
      return False;
   end Complete;

   function Coroutine
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      return Tcl_Eval
          (Tcl_Script => "info coroutine", Interpreter => Interpreter);
   end Coroutine;

   function Default
     (Proc_Name, Argument, Var_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Boolean is
   begin
      if Integer_Eval
          (Tcl_Script =>
             "info default " & Proc_Name & " " & Argument & " " & Var_Name,
           Interpreter => Interpreter) =
        1 then
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
      if Integer_Eval
          (Tcl_Script => "info exists " & Var_Name,
           Interpreter => Interpreter) =
        1 then
         return True;
      end if;
      return False;
   end Exists;

   function Functions
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      return Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "info functions " & Pattern,
                Interpreter => Interpreter),
           Interpreter => Interpreter);
   end Functions;

   function Globals
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      return Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "info globals " & Pattern,
                Interpreter => Interpreter),
           Interpreter => Interpreter);
   end Globals;

   function Host_Name
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      return Tcl_Eval
          (Tcl_Script => "info hostname", Interpreter => Interpreter);
   end Host_Name;

   function Library
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      return Tcl_Eval
          (Tcl_Script => "info library", Interpreter => Interpreter);
   end Library;

   function Locals
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      return Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "info locals " & Pattern,
                Interpreter => Interpreter),
           Interpreter => Interpreter);
   end Locals;

   function Name_Of_Executable
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      return Tcl_Eval
          (Tcl_Script => "info nameofexecutable", Interpreter => Interpreter);
   end Name_Of_Executable;

   function Patch_Level
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      return Tcl_Eval
          (Tcl_Script => "info patchlevel", Interpreter => Interpreter);
   end Patch_Level;

   function Procs
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      return Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "info procs " & Pattern,
                Interpreter => Interpreter),
           Interpreter => Interpreter);
   end Procs;

   function Script
     (File_Name: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String is
   begin
      return Tcl_Eval
          (Tcl_Script => "info script " & File_Name,
           Interpreter => Interpreter);
   end Script;

   function Tcl_Version
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      return Tcl_Eval
          (Tcl_Script => "info tclversion", Interpreter => Interpreter);
   end Tcl_Version;

   function Vars
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      return Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "info vars " & Pattern,
                Interpreter => Interpreter),
           Interpreter => Interpreter);
   end Vars;

end Tcl.Info;
