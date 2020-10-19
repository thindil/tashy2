-- Copyright (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
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

-- ****h* Tcl/Tcl
-- FUNCTION
-- Provides binding to Tcl API
-- SOURCE
package Tcl is
-- ****

   -- ****e* Tcl/Tcl.Tcl_Exception
   -- FUNCTION
   -- Standard TASHY2 exception. Raised when something bad happens (mostly
   -- when TCL_ERROR arrive)
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Tcl_Exception: exception;
   -- ****

   type Tcl_Interpreter is private;

   type Return_Codes is private;

   --------------------------------
   -- Initialization of Tcl binding
   --------------------------------

   -- ****f* Tcl/Tcl.Create_Interpreter
   -- FUNCTION
   -- Create a new Tcl interpreter
   -- PARAMETERS
   -- Default - If true, set a newly created Tcl interpreter as a default.
   --           Default value is true
   -- RESULT
   -- Pointer to the newly created Tcl interpreter
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Create a new Tcl interpreter
   -- My_Interpreter: constant Tcl_Interpreter := Create_Interpreter;
   -- SOURCE
   function Create_Interpreter
     (Default: Boolean := True) return Tcl_Interpreter;
     -- ****

     -- ****f* Tcl/Tcl.Get_Interpreter
     -- FUNCTION
     -- Get the default Tcl interpreter
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
     -- -- Get the default Tcl interpreter
     -- My_Interpreter: constant Tcl_Interpreter := Get_Interpreter;
     -- SOURCE
   function Get_Interpreter return Tcl_Interpreter;
   -- ****

   -- ****f* Tcl/Tcl.Tcl_Init
   -- FUNCTION
   -- Initialize Tcl
   -- PARAMETERS
   -- Interpreter - Tcl interpreter to initialize
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Initialize Tcl on the new Tcl interpreter
   -- Tcl_Init(Create_Interpreter);
   -- SOURCE
   procedure Tcl_Init(Interpreter: Tcl_Interpreter);
   -- ****

   -------------------------
   -- Evaluation of Tcl code
   -------------------------

   -- ****f* Tcl/Tcl.Tcl_Eval
   -- FUNCTION
   -- Evaluate the selected Tcl script on the selected Tcl intepreter
   -- PARAMETERS
   -- Script      - Tcl script to evaluate
   -- Interpreter - Tcl interpreter on which the script will be evaluated.
   --               By default it is current default Tcl interpreter
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Print hello world on default Tcl interpreter
   -- Tcl_Eval("puts {hello world}");
   -- SOURCE
   procedure Tcl_Eval
     (Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Script'Length > 0;
      -- ****

   ---------------------------------------
   -- Manipulating the Tcl commands result
   ---------------------------------------

      -- ****t* Tcl/Tcl.Result_Types
      -- FUNCTION
      -- Type of the Tcl commands result
      -- OPTIONS
      -- TCL_STATIC   - The result string will not be changed by the code
      -- TCL_VOLATILE - The result string is volatile
      -- TCL_DYNAMIC  - The result string will be changed by the code
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   type Result_Types is (TCL_STATIC, TCL_VOLATILE, TCL_DYNAMIC);
   for Result_Types use (TCL_STATIC => 0, TCL_VOLATILE => 1, TCL_DYNAMIC => 3);
   -- ****

   -- ****f* Tcl/Tcl.Tcl_GetStringResult
   -- FUNCTION
   -- Get the result of last Tcl command as string
   -- PARAMETERS
   -- Interpreter - Tcl interpreter from which the result will be taken. By
   --               default it is current default Tcl interpreter.
   -- RESULT
   -- String with the result of the last Tcl command
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Print the result of the last Tcl command on the default Tcl interpreter
   -- Ada.Text_IO.Put_Line(Tcl_GetStringResult);
   -- SOURCE
   function Tcl_GetStringResult
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String;
     -- ****

     -- ****f* Tcl/Tcl.Tcl_SetResult
     -- FUNCTION
     -- Set Tcl result value
     -- PARAMETERS
     -- Result      - String which will be set as Tcl result
     -- Result_Type - Type of the result. Can be only TCL_STATIC, TCL_VOLATILE
     --               or TCL_DYNAMIC
     -- Interpreter - Tcl interpreter on which the result will be set. By
     --               default it is current default Tcl interpreter.
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
     -- -- Set the Tcl result on the default Tcl interpreter to OK as static result
     -- Tcl_SetResult("OK");
     -- SOURCE
   procedure Tcl_SetResult
     (Result: String; Result_Type: Result_Types := TCL_STATIC;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Result'Length > 0;
   -- ****

private

   -- ****it* Tcl/Tcl.Tcl_Interpreter_Record
   -- FUNCTION
   -- Used to store data about the selected Tcl interpreter
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Tcl_Interpreter_Record is null record;
   -- ****

   -- ****t* Tcl/Tcl.Tcl_Interpreter
   -- FUNCTION
   -- Pointer to the selected Tcl interpreter
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Tcl_Interpreter is access Tcl_Interpreter_Record;
   -- ****

   -- ****t* Tcl/Tcl.Return_Codes
   -- FUNCTION
   -- Tcl return codes returned by scripts or API
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Return_Codes is
     (TCL_OK, TCL_ERROR, TCL_RETURN, TCL_BREAK, TCL_CONTINUE);
   -- ****

end Tcl;
