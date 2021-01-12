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

   -- ****f* Info/Info.Exists
   -- FUNCTION
   -- Check if the selected Tcl variable exists
   -- PARAMETERS
   -- Var_Name    - Name of Tcl variable which existence will be checked
   -- Interpreter - Tcl interpreter on which existence of the variable will be
   --               checked. By default it is current default Tcl interpreter.
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
