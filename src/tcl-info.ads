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
      -- Commands_Names: constant String := Commands;
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

end Tcl.Info;
