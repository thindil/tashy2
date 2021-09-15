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

with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;
with Tcl.Lists; use Tcl.Lists;

-- ****h* Tcl/Info
-- FUNCTION
-- Provide bindings for Tcl command info
-- SOURCE
package Tcl.Info with
   SPARK_Mode
is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****f* Info/Info.Get_Arguments
   -- FUNCTION
   -- Get the list of available arguments names for the selected Tcl procedure
   -- PARAMETERS
   -- Proc_Name   - The name of the Tcl procedure which arguments name will be
   --               taken
   -- Interpreter - Tcl interpreter on which arguments names will be taken. By
   --               default it is current default Tcl interpreter.
   -- RESULT
   -- Array with list of names of arguments for the selected Tcl procedure
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get the names of arguments or Tcl procedure myproc on default interpreter
   -- Arguments_Names: constant Array_List := Get_Arguments("myproc");
   -- COMMANDS
   -- info args Proc_Name
   -- SOURCE
   function Get_Arguments
     (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
     (Split_List
        (List =>
           Tcl_Eval
             (Tcl_Script => "info args " & Proc_Name,
              Interpreter => Interpreter),
         Interpreter => Interpreter)) with
      Pre =>
      (Proc_Name'Length > 0 and Proc_Name'Length < Integer'Last - 10) and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Info_Arguments", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Procedure_Body
      -- FUNCTION
      -- Get the body of the selected Tcl procedure
      -- PARAMETERS
      -- Proc_Name   - The name of the Tcl procedure which body will be taken
      -- Interpreter - Tcl interpreter on which body will be taken. By default
      --               it is current default Tcl interpreter.
      -- RESULT
      -- The String with body of the selected Tcl procedure
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the body of Tcl procedure myproc2 on default interpreter
      -- Proc_Body: constant String := Get_Procedure_Body("myproc2");
      -- COMMANDS
      -- info body Proc_Name
      -- SOURCE
   function Get_Procedure_Body
     (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String is
     (Tcl_Eval
        (Tcl_Script => "info body " & Proc_Name,
         Interpreter => Interpreter)) with
      Pre =>
      (Proc_Name'Length > 0 and Proc_Name'Length < Integer'Last - 10) and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Info_Procedure_Body", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Commands_Count
      -- FUNCTION
      -- Get the number of invoked commands on the selected Tcl interpreter
      -- PARAMETERS
      -- Interpreter - Tcl interpreter on which the amount of invoked commands
      --               will be counted. By default it is current default Tcl
      --               interpreter.
      -- RESULT
      -- The amount of invoked commands on the selected Tcl interpreter
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the amount of invoked command on the default Tcl interpreter
      -- Amount: constant Natural := Get_Commands_Count;
      -- COMMANDS
      -- info cmdcount
      -- SOURCE
   function Get_Commands_Count
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Natural with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Info_Commands_Count", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Commands
      -- FUNCTION
      -- Get the list of names of Tcl commands which match the pattern
      -- PARAMETERS
      -- Pattern     - The pattern on which Tcl commands will be matched. Can
      --               be empty. Default value is empty.
      -- Interpreter - Tcl interpreter on which Tcl commands will be searched.
      --               By default it is current default Tcl interpreter.
      -- RESULT
      -- If Pattern is empty, return list of names of all visible in the
      -- current Tcl namespace commands. Otherwise return only list of names
      -- of commands which match the Pattern.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the names of all available commands in default Tcl interpreter
      -- Commands_Names: constant Array_List := Get_Commands;
      -- COMMANDS
      -- info commands ?Pattern?
      -- SOURCE
   function Get_Commands
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
     (Split_List
        (List =>
           Tcl_Eval
             (Tcl_Script => "info commands " & Pattern,
              Interpreter => Interpreter),
         Interpreter => Interpreter)) with
      Pre => Interpreter /= Null_Interpreter and
      Pattern'Length < Integer'Last - 14,
      Test_Case => (Name => "Test_Info_Command", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Complete
      -- FUNCTION
      -- Check if the selected Tcl command is complete (no unclosed quotes,
      -- braces, brackets, etc)
      -- PARAMETERS
      -- Command     - The name of Tcl command to check
      -- Interpreter - Tcl interpreter on which Tcl commands will be checked.
      --               By default it is current default Tcl interpreter.
      -- RESULT
      -- If command is not complete, return False. Otherwise return True
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Check if command mycommand is complete on default interpreter
      -- Is_Complete: constant Boolean := Complete("mycommand");
      -- COMMANDS
      -- info complete Command
      -- SOURCE
   function Complete
     (Command: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean is
     (Tcl_Eval
        (Tcl_Script => "info complete " & Command,
         Interpreter => Interpreter)) with
      Pre => (Command'Length > 0 and Command'Length < Integer'Last - 14) and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Info_Complete", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Coroutine
      -- FUNCTION
      -- Get the name of currently executed coroutine
      -- PARAMETERS
      -- Interpreter - Tcl interpreter on which coroutine will be checked.
      --               By default it is current default Tcl interpreter.
      -- RESULT
      -- The name of currently executed coroutine or empty string if no
      -- coroutine is run currently.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the name of the currently executed coroutine on My_Interpreter interpreter
      -- Coroutine_Name: constant String := Get_Coroutine(My_Interpreter);
      -- COMMANDS
      -- info coroutine
      -- SOURCE
   function Get_Coroutine
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
     (Tcl_Eval
        (Tcl_Script => "info coroutine", Interpreter => Interpreter)) with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Info_Coroutine", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Default
      -- FUNCTION
      -- Get the default value for the selected argument in the selected Tcl
      -- procedure
      -- PARAMETERS
      -- Proc_Name   - The name of the Tcl procedure to check
      -- Argument    - The name of the argument in the Proc_Name procedure to
      --               check
      -- Var_Name    - The name of Tcl variable in which the default value
      --               will be put
      -- Interpreter - Tcl interpreter on which procedure will be checked.
      --               By default it is current default Tcl interpreter.
      -- RESULT
      -- If the selected argument in the selected procedure has default value,
      -- return True and put the default value to the Tcl variable Var_Name.
      -- Otherwise return False;
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the default value of argument myarg in procedure myproc on the default
      -- -- interpreter and put it in Tcl variable myvar
      -- Has_Default: constant Boolean := Get_Default("myproc", "myarg", "myvar");
      -- info default Proc_Name Argument Var_Name
      -- SOURCE
   function Get_Default
     (Proc_Name, Argument, Var_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Boolean is
     (Tcl_Eval
        (Tcl_Script =>
           "info default " & Proc_Name & " " & Argument & " " & Var_Name,
         Interpreter => Interpreter)) with
      Pre =>
      (Proc_Name'Length > 0 and Argument'Length > 0 and Var_Name'Length > 0 and
       Interpreter /= Null_Interpreter)
      and then
        To_Big_Integer(Proc_Name'Length) + To_Big_Integer(Argument'Length) +
          To_Big_Integer(Var_Name'Length) <
        To_Big_Integer(Integer'Last - 15),
      Test_Case => (Name => "Test_Info_Default", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Error_Stack
      -- FUNCTION
      -- Get the call stack of the last error on the selected Tcl interpreter
      -- PARAMETERS
      -- Interpreter - Tcl interpreter on which error stack will be checked.
      --               By default it is current default Tcl interpreter.
      -- RESULT
      -- Full call stack of the last error on the selected Tcl interpreter
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the error call stack on the default interpreter
      -- Error_Stack: constant String := Get_Error_Stack;
      -- COMMANDS
      -- info errorstack Interpreter
      -- SOURCE
   function Get_Error_Stack
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
     (Tcl_Eval
        (Tcl_Script => "info errorstack", Interpreter => Interpreter)) with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Info_ErrorStack", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Exists
      -- FUNCTION
      -- Check if the selected Tcl variable exists
      -- PARAMETERS
      -- Var_Name    - Name of Tcl variable which existence will be checked
      -- Interpreter - Tcl interpreter on which existence of the variable will be
      --               checked. By default it is current default Tcl interpreter.
      -- RESULT
      -- True if the selected variable exists, otherwise False
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Check if the Tcl variable $myvar exists in the default Tcl interpreter
      -- Var_Exists: constant Boolean := Exists("myvar");
      -- COMMANDS
      -- info exists Var_Name
      -- SOURCE
   function Exists
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean is
     (Tcl_Eval
        (Tcl_Script => "info exists " & Var_Name,
         Interpreter => Interpreter)) with
      Pre => (Var_Name'Length > 0 and Var_Name'Length < Integer'Last - 12) and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Info_Exists", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Functions
      -- FUNCTION
      -- Get the list of names of Tcl math functions which match the pattern
      -- PARAMETERS
      -- Pattern     - The pattern on which Tcl math functions will be
      --               matched. Can be empty. Default value is empty.
      -- Interpreter - Tcl interpreter on which Tcl math functions will be
      --               searched. By default it is current default Tcl
      --               interpreter.
      -- RESULT
      -- If Pattern is empty, return list of names of all visible in the
      -- current Tcl namespace math functions. Otherwise return only list of
      -- names of math functions which match the Pattern.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the names of all available math functions in default Tcl interpreter
      -- Functions_Names: constant Array_List := Get_Functions;
      -- COMMANDS
      -- info functions ?Pattern?
      -- SOURCE
   function Get_Functions
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
     (Split_List
        (List =>
           Tcl_Eval
             (Tcl_Script => "info functions " & Pattern,
              Interpreter => Interpreter),
         Interpreter => Interpreter)) with
      Pre => Interpreter /= Null_Interpreter and
      Pattern'Length < Integer'Last - 15,
      Test_Case => (Name => "Test_Info_Functions", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Globals
      -- FUNCTION
      -- Get the list of names of Tcl global variables which match the pattern
      -- PARAMETERS
      -- Pattern     - The pattern on which Tcl global variables will be
      --               matched. Can be empty. Default value is empty.
      -- Interpreter - Tcl interpreter on which Tcl global variables will be
      --               searched. By default it is current default Tcl
      --               interpreter.
      -- RESULT
      -- If Pattern is empty, return list of names of all visible in the
      -- current Tcl namespace global variables. Otherwise return only list of
      -- names of global variables which match the Pattern.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the names of all available global variables in default Tcl interpreter
      -- Global_Variables_Names: constant Array_List := Get_Globals;
      -- COMMANDS
      -- info globals ?Pattern?
      -- SOURCE
   function Get_Globals
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
     (Split_List
        (List =>
           Tcl_Eval
             (Tcl_Script => "info globals " & Pattern,
              Interpreter => Interpreter),
         Interpreter => Interpreter)) with
      Pre => Interpreter /= Null_Interpreter and
      Pattern'Length < Integer'Last - 13,
      Test_Case => (Name => "Test_Info_Globals", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Host_Name
      -- FUNCTION
      -- Get the name of the computer on which the function is executed.
      -- PARAMETERS
      -- Interpreter - Tcl interpreter on which hostname of the computer will
      --               be taken. By default it is current default Tcl
      --               interpreter.
      -- RESULT
      -- String with name of the computer on which the function was executed
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the name of computer on default Tcl interpreter
      -- Host_Name: constant String := Get_Host_Name;
      -- COMMANDS
      -- info hostname
      -- SOURCE
   function Get_Host_Name
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
     (Tcl_Eval(Tcl_Script => "info hostname", Interpreter => Interpreter)) with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Info_HostName", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Library
      -- FUNCTION
      -- Get the library directory where the standard Tcl scripts are stored.
      -- It is a value of global variable $tcl_library
      -- PARAMETERS
      -- Interpreter - Tcl interpreter on which library directory will be
      --               taken. By default it is current default Tcl interpreter.
      -- RESULT
      -- String with the full path to the library directory
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the library directory on default Tcl interpreter
      -- Library_Path: constant String := Get_Library;
      -- COMMANDS
      -- info library
      -- SOURCE
   function Get_Library
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
     (Tcl_Eval(Tcl_Script => "info library", Interpreter => Interpreter)) with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Info_Library", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Locals
      -- FUNCTION
      -- Get the list of names of Tcl local variables which match the pattern
      -- PARAMETERS
      -- Pattern     - The pattern on which Tcl local variables will be
      --               matched. Can be empty. Default value is empty.
      -- Interpreter - Tcl interpreter on which Tcl local variables will be
      --               searched. By default it is current default Tcl
      --               interpreter.
      -- RESULT
      -- If Pattern is empty, return list of names of all visible in the
      -- current Tcl namespace local variables. Otherwise return only list of
      -- names of local variables which match the Pattern.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the names of all available local variables in default Tcl interpreter
      -- Local_Variables_Names: constant Array_List := Get_Locals;
      -- COMMANDS
      -- info locals ?Pattern?
      -- SOURCE
   function Get_Locals
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
     (Split_List
        (List =>
           Tcl_Eval
             (Tcl_Script => "info locals " & Pattern,
              Interpreter => Interpreter),
         Interpreter => Interpreter)) with
      Pre => Interpreter /= Null_Interpreter and
      Pattern'Length < Integer'Last - 12,
      Test_Case => (Name => "Test_Info_Locals", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Name_Of_Executable
      -- FUNCTION
      -- Get the full path to the binary file from which the application was
      -- invoked
      -- PARAMETERS
      -- Interpreter - Tcl interpreter on which name of executable will be
      --               taken. By default it is current default Tcl interpreter.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the name of executable on default interpreter
      -- Full_Path: constant String := Get_Name_Of_Executable;
      -- COMMANDS
      -- info nameofexecutable
      -- SOURCE
   function Get_Name_Of_Executable
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
     (Tcl_Eval
        (Tcl_Script => "info nameofexecutable",
         Interpreter => Interpreter)) with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Info_Name_Of_Executable", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Patch_Level
      -- FUNCTION
      -- Get the exact version of Tcl library. It is a value of global variable
      -- $tcl_pathLevel
      -- PARAMETERS
      -- Interpreter - Tcl interpreter on which library version will be
      --               taken. By default it is current default Tcl interpreter.
      -- RESULT
      -- String with the version of Tcl library
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the library version on default Tcl interpreter
      -- Version: constant String := Get_Patch_Level;
      -- COMMANDS
      -- info patchlevel
      -- SOURCE
   function Get_Patch_Level
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
     (Tcl_Eval
        (Tcl_Script => "info patchlevel", Interpreter => Interpreter)) with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Info_Patch_Level", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Procedures
      -- FUNCTION
      -- Get the list of names of Tcl procedures in current namespace which
      -- match the pattern
      -- PARAMETERS
      -- Pattern     - The pattern on which Tcl procedures will be matched.
      --               Can be empty. Default value is empty.
      -- Interpreter - Tcl interpreter on which Tcl procedures will be
      --               searched. By default it is current default Tcl
      --               interpreter.
      -- RESULT
      -- If Pattern is empty, return list of names of all visible in the
      -- current Tcl namespace procedures. Otherwise return only list of
      -- names of procedures which match the Pattern.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the names of all available procedures in default Tcl interpreter
      -- Procedures_Names: constant Array_List := Get_Procedures;
      -- COMMANDS
      -- info procs ?Pattern?
      -- SOURCE
   function Get_Procedures
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
     (Split_List
        (List =>
           Tcl_Eval
             (Tcl_Script => "info procs " & Pattern,
              Interpreter => Interpreter),
         Interpreter => Interpreter)) with
      Pre => Interpreter /= Null_Interpreter and
      Pattern'Length < Integer'Last - 11,
      Test_Case => (Name => "Test_Info_Procs", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Script
      -- FUNCTION
      -- Get the name of currently evaluated Tcl script
      -- PARAMETERS
      -- File_Name   - If specified, it value will be used as a return value.
      --               Can be empty. Default value is empty.
      -- Interpreter - Tcl interpreter on which script name will be
      --               taken. By default it is current default Tcl interpreter.
      -- RESULT
      -- String with the name of currently evaluated Tcl script or empty
      -- String if no script is evaluated.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the name of the currently evaluated Tcl script on default Tcl interpreter
      -- File_Name: constant String := Get_Script;
      -- COMMANDS
      -- info script ?File_Name?
      -- SOURCE
   function Get_Script
     (File_Name: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String is
     (Tcl_Eval
        (Tcl_Script => "info script " & File_Name,
         Interpreter => Interpreter)) with
      Pre => Interpreter /= Null_Interpreter and
      File_Name'Length < Integer'Last - 12,
      Test_Case => (Name => "Test_Info_Script", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Tcl_Version
      -- FUNCTION
      -- Get the major and minor version of Tcl library. It is a value of
      -- global variable $tcl_version
      -- PARAMETERS
      -- Interpreter - Tcl interpreter on which library version will be
      --               taken. By default it is current default Tcl interpreter.
      -- RESULT
      -- String with the version of Tcl library
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the library version on default Tcl interpreter
      -- Version: constant String := Get_Tcl_Version;
      -- COMMANDS
      -- info tclversion
      -- SOURCE
   function Get_Tcl_Version
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
     (Tcl_Eval
        (Tcl_Script => "info tclversion", Interpreter => Interpreter)) with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Info_Tcl_Version", Mode => Nominal);
      -- ****

      -- ****f* Info/Info.Get_Variables
      -- FUNCTION
      -- Get the list of names of global and local Tcl variables which match
      -- the pattern
      -- PARAMETERS
      -- Pattern     - The pattern on which Tcl variables will be matched.
      --               Can be empty. Default value is empty.
      -- Interpreter - Tcl interpreter on which Tcl variables will be searched.
      --               By default it is current default Tcl interpreter.
      -- RESULT
      -- If Pattern is empty, return list of names of all visible in the
      -- current Tcl namespace local and global variables. Otherwise return
      -- only list of names of local variables which match the Pattern.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the names of all available variables in default Tcl interpreter
      -- Variables_Names: constant Array_List := Get_Variables;
      -- COMMANDS
      -- info vars ?Pattern?
      -- SOURCE
   function Get_Variables
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
     (Split_List
        (List =>
           Tcl_Eval
             (Tcl_Script => "info vars " & Pattern,
              Interpreter => Interpreter),
         Interpreter => Interpreter)) with
      Pre => Interpreter /= Null_Interpreter and
      Pattern'Length < Integer'Last - 10,
      Test_Case => (Name => "Test_Info_Vars", Mode => Nominal);
      -- ****
      --## rule on REDUCEABLE_SCOPE

end Tcl.Info;
