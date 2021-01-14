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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

-- ****h* Tcl/Info
-- FUNCTION
-- Provide bindings for Tcl command info
-- SOURCE
package Tcl.Info is

   -- ****t* Info/Info.Info_Result_Array
   -- FUNCTION
   -- Array used for take result from some Info functions
   -- SOURCE
   type Unbouned_Strings_Array is array(Positive range <>) of Unbounded_String;
   -- ****

   -- ****f* Info/Info.Arguments
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
   -- Arguments_Names: constant Unbouned_Strings_Array := Arguments("myproc");
   -- SOURCE
   function Arguments
     (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbouned_Strings_Array with
      Pre => Proc_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Info_Arguments", Nominal);
      -- ****

      -- ****f* Info/Info.Procedure_Body
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
      -- Proc_Body: constant String := Procedure_Body("myproc2");
      -- SOURCE
   function Procedure_Body
     (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String with
      Pre => Proc_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Info_Procedure_Body", Nominal);
      -- ****

      -- ****f* Info/Info.Commands_Count
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
      -- Amount: constant Natural := Commands_Count;
      -- SOURCE
   function Commands_Count
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Natural with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Info_Commands_Count", Nominal);

      -- ****f* Info/Info.Commands
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
      -- Commands_Names: constant Unbouned_Strings_Array := Commands;
      -- SOURCE
   function Commands
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbouned_Strings_Array with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Info_Command", Nominal);
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
      -- SOURCE
   function Complete
     (Command: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean with
      Pre => Command'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Info_Complete", Nominal);
      -- ****

      -- ****f* Info/Info.Coroutine
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
      -- Coroutine_Name: constant String := Coroutine(My_Interpreter);
      -- SOURCE
   function Coroutine
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Info_Coroutine", Nominal);
      -- ****

      -- ****f* Info/Info.Default
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
      -- Has_Default: constant Boolean := Default("myproc", "myarg", "myvar");
      -- SOURCE
   function Default
     (Proc_Name, Argument, Var_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Boolean with
      Pre => Proc_Name'Length > 0 and Argument'Length > 0 and
      Var_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Info_Default", Nominal);
      -- ****

      -- ****f* Info/Info.ErrorStack
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
      -- Error_Stack: constant String := ErrorStack;
      -- SOURCE
   function ErrorStack
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Info_ErrorStack", Nominal);
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
      -- SOURCE
   function Exists
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean with
      Pre => Var_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Info_Exists", Nominal);
      -- ****

      -- ****f* Info/Info.Functions
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
      -- Functions_Names: constant Unbouned_Strings_Array := Functions;
      -- SOURCE
   function Functions
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbouned_Strings_Array with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Info_Functions", Nominal);
      -- ****

      -- ****f* Info/Info.Globals
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
      -- Global_Variables_Names: constant Unbouned_Strings_Array := Globals;
      -- SOURCE
   function Globals
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbouned_Strings_Array with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Info_Globals", Nominal);
      -- ****

      -- ****f* Info/Info.HostName
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
      -- Host_Name: constant String := HostName;
      -- SOURCE
   function HostName
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Info_HostName", Nominal);
      -- ****

end Tcl.Info;
