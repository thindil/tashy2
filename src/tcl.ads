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

   type Tcl_Interpreter is private;

   type Return_Codes is private;

   --------------------------------
   -- Initialization of Tcl binding
   --------------------------------

   -- ****f* Tcl/Create_Interpreter
   -- FUNCTION
   -- Create a new Tcl interpreter
   -- PARAMETERS
   -- Default - If true, set a newly created Tcl interpreter as a default.
   --           Default value is true
   -- RESULT
   -- Pointer to the newly created Tcl interpreter
   -- SOURCE
   function Create_Interpreter
     (Default: Boolean := True) return Tcl_Interpreter;
     -- ****

     -- ****f* Tcl/Get_Interpreter
     -- FUNCTION
     -- Get the default Tcl interpreter
     -- SOURCE
   function Get_Interpreter return Tcl_Interpreter;
   -- ****

   -- ****f* Tcl/Tcl_Init
   -- FUNCTION
   -- Initialize Tcl intepreter
   -- PARAMETERS
   -- Interpreter - Tcl interpreter to initialize.
   -- SOURCE
   procedure Tcl_Init(Interpreter: Tcl_Interpreter);
   -- ****

   -------------------------
   -- Evaluation of Tcl code
   -------------------------

   -- ****f* Tcl/Tcl_Eval
   -- FUNCTION
   -- Evaluate the selected Tcl script on the selected Tcl intepreter
   -- PARAMETERS
   -- Script      - Tcl script to evaluate
   -- Interpreter - Tcl interpreter on which the script will be evaluated.
   --               By default it is current default Tcl interpreter
   -- SOURCE
   procedure Tcl_Eval
     (Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter);
   -- ****

private

   -- ****it* Tcl/Tcl_Interpreter_Record
   -- FUNCTION
   -- Used to store data about the selected Tcl interpreter
   -- SOURCE
   type Tcl_Interpreter_Record is null record;
   -- ****

   -- ****t* Tcl/Tcl_Interpreter
   -- FUNCTION
   -- Pointer to the selected Tcl interpreter
   -- SOURCE
   type Tcl_Interpreter is access all Tcl_Interpreter_Record;
   -- ****

   -- ****t* Tcl/Return_Codes
   -- FUNCTION
   -- Tcl return codes returned by scripts or API
   -- SOURCE
   type Return_Codes is
     (TCL_OK, TCL_ERROR, TCL_RETURN, TCL_BREAK, TCL_CONTINUE);
   -- ****

end Tcl;
