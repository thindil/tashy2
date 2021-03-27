-- Copyright (c) 2020-2021 Bartek thindil Jasicki <thindil@laeran.pl>
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

with System;

-- ****h* Tcl/Tcl
-- FUNCTION
-- Provides binding to Tcl API
-- SOURCE
package Tcl is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****e* Tcl/Tcl.Tcl_Exception
   -- FUNCTION
   -- Standard TASHY2 exception. Raised when something bad happens (mostly
   -- when TCL_ERROR arrive)
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Tcl_Exception: exception;
   -- ****

   -- ****t* Tcl/Tcl.Tcl_Interpreter
   -- FUNCTION
   -- Pointer to the selected Tcl interpreter
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Tcl_Interpreter is new System.Address;
   -- ****

   -- ****d* Tcl/Tcl.Null_Interpreter
   -- FUNCTION
   -- Not set Tcl interterpreter
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Null_Interpreter: constant Tcl_Interpreter :=
     Tcl_Interpreter(System.Null_Address);
   -- ****

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
     --## rule off REDUCEABLE_SCOPE

     -- ****f* Tcl/Set_Interpreter
     -- FUNCTION
     -- Set the default Tcl interpreter to the selected interpreter
     -- PARAMETERS
     -- Interpreter - The Tcl interpreter which will be set as default
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
     -- -- Set My_Interpreter as the default Tcl interpreter
     -- Set_Interpreter(My_Interpreter);
     -- SOURCE
   procedure Set_Interpreter(Interpreter: Tcl_Interpreter) with
      Pre => Interpreter /= Null_Interpreter;
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
   procedure Tcl_Init(Interpreter: Tcl_Interpreter) with
      Pre => Interpreter /= Null_Interpreter;
   -- ****

   -------------------------
   -- Evaluation of Tcl code
   -------------------------

      -- ****f* Tcl/Tcl.Tcl_Eval_(procedure)
      -- FUNCTION
      -- Evaluate the selected Tcl script on the selected Tcl intepreter
      -- PARAMETERS
      -- Tcl_Script  - Tcl script to evaluate
      -- Interpreter - Tcl interpreter on which the script will be evaluated.
      --               By default it is current default Tcl interpreter
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Print hello world on default Tcl interpreter
      -- Tcl_Eval("puts {hello world}");
      -- SEE ALSO
      -- Tcl.Tcl_Eval_(function)
      -- SOURCE
   procedure Tcl_Eval
     (Tcl_Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Tcl_Script'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Tcl_Eval", Mode => Nominal);
      -- ****

      -- ****f* Tcl/Tcl.Tcl_Eval_(function_string_result)
      -- FUNCTION
      -- Evaluate the selected Tcl script on the selected Tcl intepreter and
      -- return its result as String
      -- PARAMETERS
      -- Tcl_Script  - Tcl script to evaluate
      -- Interpreter - Tcl interpreter on which the script will be evaluated.
      --               By default it is current default Tcl interpreter
      -- RESULT
      -- String with the result of the evaluation of Tcl_Script
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get result of expresion on default Tcl interpreter
      -- Result: constant String := Tcl_Eval("expr 2 + 2");
      -- SEE ALSO
      -- Tcl.Tcl_Eval_(procedure), Tcl.Tcl_Eval(function_boolean_result)
      -- SOURCE
   function Tcl_Eval
     (Tcl_Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String with
      Pre => Tcl_Script'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Tcl_Eval2", Mode => Nominal);
      -- ****

      -- ****f* Tcl/Tcl.Tcl_Eval_(function_boolean_result)
      -- FUNCTION
      -- Evaluate the selected Tcl script on the selected Tcl intepreter and
      -- return its result as Boolean
      -- PARAMETERS
      -- Tcl_Script  - Tcl script to evaluate
      -- Interpreter - Tcl interpreter on which the script will be evaluated.
      --               By default it is current default Tcl interpreter
      -- RESULT
      -- Boolean with the result of the evaluation of Tcl_Script
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get result of Tcl command on default Tcl interpreter
      -- Result: constant Boolean := Tcl_Eval("info exists myvar");
      -- SEE ALSO
      -- Tcl.Tcl_Eval_(procedure), Tcl.Tcl_Eval(function_string_result)
      -- SOURCE
   function Tcl_Eval
     (Tcl_Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean with
      Pre => Tcl_Script'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Tcl_Eval3", Mode => Nominal);
      -- ****

      -- ****g* Tcl/Tcl.Generic_Scalar_Tcl_Eval
      -- FUNCTION
      -- Generic function to evaluate Tcl script and return its result as as
      -- scalar type
      -- PARAMETERS
      -- Tcl_Script  - Tcl script to evaluate
      -- Interpreter - Tcl interpreter on which the script will be evaluated.
      --               By default it is current default Tcl interpreter
      -- RESULT
      -- Scalar type with the result of the Tcl_Script
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Evaluate expression on the default Tcl interpreter and get its result as Integer
      -- Integer_Evaluate is new Generic_Scalar_Tcl_Eval(Integer);
      -- Result: constant Integer := Integer_Evaluate("expr 2 + 2");
      -- SEE ALSO
      -- Tcl.Generic_Float_Tcl_Eval;
      -- SOURCE
   generic
      type Result_Type is (<>);
   function Generic_Scalar_Tcl_Eval
     (Tcl_Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Result_Type;
      -- ****

      -- ****g* Tcl/Tcl.Generic_Float_Tcl_Eval
      -- FUNCTION
      -- Generic function to evaluate Tcl script and return its result as as
      -- float type
      -- PARAMETERS
      -- Tcl_Script  - Tcl script to evaluate
      -- Interpreter - Tcl interpreter on which the script will be evaluated.
      --               By default it is current default Tcl interpreter
      -- RESULT
      -- Float type with the result of the Tcl_Script
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Evaluate expression on the default Tcl interpreter and get its result as Float
      -- Float_Evaluate is new Generic_Float_Tcl_Eval(Float);
      -- Result: constant Float := Float_Evaluate("expr 2.5 + 2.2");
      -- SEE ALSO
      -- Tcl.Generic_Scalar_Tcl_Eval;
      -- SOURCE
   generic
      type Result_Type is digits <>;
   function Generic_Float_Tcl_Eval
     (Tcl_Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Result_Type;
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
   type Result_Types is (TCL_STATIC, TCL_VOLATILE, TCL_DYNAMIC) with
      Default_Value => TCL_STATIC;
   for Result_Types use (TCL_STATIC => 0, TCL_VOLATILE => 1, TCL_DYNAMIC => 3);
   -- ****

   -- ****d* Tcl/Default_Result_Type
   -- FUNCTION
   -- The default type of Tcl result
   -- SOURCE
   Default_Result_Type: constant Result_Types := TCL_STATIC;
   -- ****

   --## rule off TYPE_INITIAL_VALUES
   -- ****t* Tcl/Tcl.Tcl_Results
   -- FUNCTION
   -- Used as return Tcl result for commands
   -- OPTIONS
   -- TCL_OK       - Used when a command finished successfuly. Standard result
   -- TCL_ERROR    - Used when a command meet a problem
   -- TCL_RETURN   - Used when a command want to emulate Tcl command return
   -- TCL_BREAK    - Used when a command want to emulate Tcl command break
   -- TCL_CONTINUE - Used when a command want to emulate Tcl command continue
   -- SOURCE
   type Tcl_Results is
     (TCL_OK, TCL_ERROR, TCL_RETURN, TCL_BREAK, TCL_CONTINUE) with
      Default_Value => TCL_OK;
      -- ****
      --## rule off TYPE_INITIAL_VALUES

   -- ****f* Tcl/Tcl.Tcl_Get_Result
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
   -- Ada.Text_IO.Put_Line(Tcl_Get_Result);
   -- SOURCE
   function Tcl_Get_Result
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Tcl_GetResult", Mode => Nominal);
      -- ****

      -- ****g* Tcl/Tcl.Generic_Scalar_Tcl_Get_Result
      -- FUNCTION
      -- Generic function to get result of the last Tcl command as scalar type
      -- PARAMETERS
      -- Interpreter - Tcl interpreter from which the result will be taken. By
      --               default it is current default Tcl interpreter.
      -- RESULT
      -- Scalar type with the result of the last Tcl command
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the result of the last Tcl command on the default Tcl interpreter as Integer
      -- Integer_Get_Result is new Generic_Scalar_Tcl_Get_Result(Integer);
      -- Result: constant Integer := Integer_Get_Result;
      -- SEE ALSO
      -- Tcl.Generic_Float_Tcl_Get_Result;
      -- SOURCE
   generic
      type Result_Type is (<>);
   function Generic_Scalar_Tcl_Get_Result
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Result_Type;
     -- ****

      -- ****g* Tcl/Tcl.Generic_Float_Tcl_Get_Result
      -- FUNCTION
      -- Generic function to get result of the last Tcl command as float type
      -- PARAMETERS
      -- Interpreter - Tcl interpreter from which the result will be taken. By
      --               default it is current default Tcl interpreter.
      -- RESULT
      -- Float type with the result of the last Tcl command
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the result of the last Tcl command on the default Tcl interpreter as Float
      -- Float_Get_Result is new Generic_Float_Tcl_Get_Result(Float);
      -- Result: constant Float := Float_Get_Result;
      -- SEE ALSO
      -- Tcl.Generic_Scalar_Tcl_Get_Result;
      -- SOURCE
   generic
      type Result_Type is digits <>;
   function Generic_Float_Tcl_Get_Result
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Result_Type;
     -- ****

     -- ****f* Tcl/Tcl.Tcl_Set_Result
     -- FUNCTION
     -- Set Tcl result value
     -- PARAMETERS
     -- Tcl_Result  - String which will be set as Tcl result
     -- Result_Type - Type of the result. Can be only TCL_STATIC, TCL_VOLATILE
     --               or TCL_DYNAMIC
     -- Interpreter - Tcl interpreter on which the result will be set. By
     --               default it is current default Tcl interpreter.
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
     -- -- Set the Tcl result on the default Tcl interpreter to OK as static result
     -- Tcl_Set_Result("OK");
     -- SOURCE
   procedure Tcl_Set_Result
     (Tcl_Result: String; Result_Type: Result_Types := Default_Result_Type;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Tcl_Result'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Tcl_SetResult", Mode => Nominal);
      -- ****

end Tcl;
