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

with System;

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
      Pre => Script'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Tcl_Eval", Nominal);
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
     (TCL_OK, TCL_ERROR, TCL_RETURN, TCL_BREAK, TCL_CONTINUE);
   -- ****

   -- ****f* Tcl/Tcl.Tcl_GetResult_(String)
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
   -- Ada.Text_IO.Put_Line(Tcl_GetResult);
   -- SOURCE
   function Tcl_GetResult
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Tcl_GetResult", Nominal);
     -- ****

   -- ****f* Tcl/Tcl.Tcl_GetResult_(Integer)
   -- FUNCTION
   -- Get the result of last Tcl command as integer
   -- PARAMETERS
   -- Interpreter - Tcl interpreter from which the result will be taken. By
   --               default it is current default Tcl interpreter.
   -- RESULT
   -- Integer value the result of the last Tcl command
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get the result of the last Tcl command on the default Tcl interpreter
   -- Result := constant Integer := Tcl_GetResult;
   -- SOURCE
   function Tcl_GetResult
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Integer is
     (Integer'Value(Tcl_GetResult(Interpreter))) with
      Pre => Interpreter /= Null_Interpreter;
     -- ****

   -- ****f* Tcl/Tcl.Tcl_GetResult_(Float)
   -- FUNCTION
   -- Get the result of last Tcl command as float
   -- PARAMETERS
   -- Interpreter - Tcl interpreter from which the result will be taken. By
   --               default it is current default Tcl interpreter.
   -- RESULT
   -- Float value of the result of the last Tcl command
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get the result of the last Tcl command on the default Tcl interpreter
   -- Result := constant Float := Tcl_GetResult;
   -- SOURCE
   function Tcl_GetResult
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Float is
     (Float'Value(Tcl_GetResult(Interpreter))) with
      Pre => Interpreter /= Null_Interpreter;
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
      Pre => Result'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => ("Test_Tcl_SetResult", Nominal);
      -- ****

      ---------------------------------
      -- Manipulating the Tcl variables
      ---------------------------------

      -- ****t* Tcl/Tcl.Variables_Flags
      -- FUNCTION
      -- Available flags for manipulation of Tcl variables
      -- SOURCE
   type Variables_Flags is
     (NONE, TCL_GLOBAL_ONLY, TCL_NAMESPACE_ONLY, TCL_APPEND_VALUE,
      TCL_LIST_ELEMENT, TCL_LEAVE_ERR_MSG);

   for Variables_Flags use (NONE => 16#0000#, TCL_GLOBAL_ONLY => 16#0001#,
      TCL_NAMESPACE_ONLY => 16#0002#, TCL_APPEND_VALUE => 16#0004#,
      TCL_LIST_ELEMENT => 16#0008#, TCL_LEAVE_ERR_MSG => 16#0200#);
   -- ****

   -- ****t* Tcl/Tcl.Flags_Array
   -- FUNCTION
   -- Used as to set flags for Tcl variables manipulation subprograms
   -- SOURCE
   type Flags_Array is array(Positive range <>) of Variables_Flags;
   -- ****

   -- ****f* Tcl/Tcl.Tcl_SetVar
   -- FUNCTION
   -- Set value for the selected Tcl variable
   -- PARAMETERS
   -- Var_Name    - Name of the Tcl variable to set. If contains open and
   --               close parenthesis it will be treated as index of the item
   --               in the array. Cannot be empty.
   -- New_Value   - A new value for the selected Tcl variable to set. Cannot
   --               empty.
   -- Interpreter - Tcl interpreter on which the result will be set. By
   --               default it is current default Tcl interpreter.
   -- Flags       - Array of flags used in setting variable. Can be empty.
   --               Default value is one element array NONE
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Set the value of the Tcl variable $myvar to 2 on default Tcl interpreter
   -- Tcl_SetVar("myvar", "2");
   -- SOURCE
   procedure Tcl_SetVar
     (Var_Name, New_Value: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := (1 => NONE)) with
      Pre => Var_Name'Length > 0 and New_Value'Length > 0;
      -- ****

      -- ****f* Tcl/Tcl.Tcl_SetVar2
      -- FUNCTION
      -- Set value for the selected Tcl variable in the selected array
      -- PARAMETERS
      -- Array_Name  - Name of the Tcl array in which the value will be set.
      --               Cannot be empty.
      -- Index_Name  - Name of the index of element in the Tcl array which
      --               the value will be set. Cannot be empty.
      -- New_Value   - A new value for the selected Tcl variable to set.
      --               Cannot empty.
      -- Interpreter - Tcl interpreter on which the result will be set. By
      --               default it is current default Tcl interpreter.
      -- Flags       - Array of flags used in setting variable. Can be empty.
      --               Default value is one element array NONE
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the value of the third element in Tcl array $myarray to 5 on default Tcl interpreter
      -- Tcl_SetVar2("myarray", "2", "5");
      -- SOURCE
   procedure Tcl_SetVar2
     (Array_Name, Index_Name, New_Value: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := (1 => NONE)) with
      Pre => Array_Name'Length > 0 and Index_Name'Length > 0 and
      New_Value'Length > 0;
      -- ****

      -- ****f* Tcl/Tcl.Tcl_GetVar_(String)
      -- FUNCTION
      -- Get the value for the selected Tcl variable as a String
      -- PARAMETERS
      -- Var_Name    - Name of the Tcl variable to get. If contains open and
      --               close parenthesis it will be treated as index of the item
      --               in the array. Cannot be empty.
      -- Interpreter - Tcl interpreter on which the result will be get. By
      --               default it is current default Tcl interpreter.
      -- Flags       - Array of flags used in getting variable. Can be empty.
      --               Default value is one element array NONE
      -- RESULT
      -- String with the value of the selected Tcl variable
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the value of the Tcl variable $myvar on default Tcl interpreter
      -- Value: constant String := Tcl_GetVar("myvar");
      -- SOURCE
   function Tcl_GetVar
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := (1 => NONE)) return String with
      Pre => Var_Name'Length > 0 and Interpreter /= Null_Interpreter;
      -- ****

      -- ****f* Tcl/Tcl.Tcl_GetVar_(Integer)
      -- FUNCTION
      -- Get the value for the selected Tcl variable as an Integer
      -- PARAMETERS
      -- Var_Name    - Name of the Tcl variable to get. If contains open and
      --               close parenthesis it will be treated as index of the item
      --               in the array. Cannot be empty.
      -- Interpreter - Tcl interpreter on which the result will be get. By
      --               default it is current default Tcl interpreter.
      -- Flags       - Array of flags used in getting variable. Can be empty.
      --               Default value is one element array NONE
      -- RESULT
      -- Integer with the value of the selected Tcl varible
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the value of the Tcl variable $myvar on default Tcl interpreter
      -- Value: constant Integer := Tcl_GetVar("myvar");
      -- SOURCE
   function Tcl_GetVar
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := (1 => NONE)) return Integer is
     (Integer'Value(Tcl_GetVar(Var_Name, Interpreter, Flags))) with
      Pre => Var_Name'Length > 0 and Interpreter /= Null_Interpreter;
     -- ****

     -- ****f* Tcl/Tcl.Tcl_GetVar_(Float)
     -- FUNCTION
     -- Get the value for the selected Tcl variable as a Float
     -- PARAMETERS
     -- Var_Name    - Name of the Tcl variable to get. If contains open and
     --               close parenthesis it will be treated as index of the item
     --               in the array. Cannot be empty.
     -- Interpreter - Tcl interpreter on which the result will be get. By
     --               default it is current default Tcl interpreter.
     -- Flags       - Array of flags used in getting variable. Can be empty.
     --               Default value is one element array NONE
     -- RESULT
     -- Float with the value of the selected Tcl varible
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
     -- -- Get the value of the Tcl variable $myvar on default Tcl interpreter
     -- Value: constant Float := Tcl_GetVar("myvar");
   -- SOURCE
   function Tcl_GetVar
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := (1 => NONE)) return Float is
     (Float'Value(Tcl_GetVar(Var_Name, Interpreter, Flags))) with
      Pre => Var_Name'Length > 0 and Interpreter /= Null_Interpreter;
     -- ****

      -- ****f* Tcl/Tcl.Tcl_GetVar2_(String)
      -- FUNCTION
      -- Get the value for the selected Tcl variable in the selected array as String
      -- PARAMETERS
      -- Var_Name    - Name of the Tcl variable to get. If contains open and
      --               close parenthesis it will be treated as index of the item
      --               in the array. Cannot be empty.
      -- Index_Name  - Name of the index of element in the Tcl array which
      --               the value will be get. Cannot be empty.
      -- Interpreter - Tcl interpreter on which the result will be get. By
      --               default it is current default Tcl interpreter.
      -- Flags       - Array of flags used in getting variable. Can be empty.
      --               Default value is one element array NONE
      -- RESULT
      -- String with the value of the selected Tcl array element variable
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the value of the third element in the Tcl array $myarray on default Tcl interpreter
      -- Value: constant String := Tcl_GetVar2("myarray", "2");
      -- SOURCE
   function Tcl_GetVar2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := (1 => NONE)) return String with
      Pre => Var_Name'Length > 0 and Index_Name'Length > 0 and
      Interpreter /= Null_Interpreter;
      -- ****

      -- ****f* Tcl/Tcl.Tcl_GetVar_(Integer)
      -- FUNCTION
      -- Get the value for the selected Tcl variable as an Integer
      -- PARAMETERS
      -- Var_Name    - Name of the Tcl variable to get. If contains open and
      --               close parenthesis it will be treated as index of the item
      --               in the array. Cannot be empty.
      -- Index_Name  - Name of the index of element in the Tcl array which
      --               the value will be get. Cannot be empty.
      -- Interpreter - Tcl interpreter on which the result will be get. By
      --               default it is current default Tcl interpreter.
      -- Flags       - Array of flags used in getting variable. Can be empty.
      --               Default value is one element array NONE
      -- RESULT
      -- Integer with the value of the selected Tcl varible
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the value of the third element in the Tcl array $myarray on default Tcl interpreter
      -- Value: constant Integer := Tcl_GetVar2("myarray", "2");
      -- SOURCE
   function Tcl_GetVar2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := (1 => NONE)) return Integer is
     (Integer'Value
        (Tcl_GetVar2(Var_Name, Index_Name, Interpreter, Flags))) with
      Pre => Var_Name'Length > 0 and Index_Name'Length > 0 and
      Interpreter /= Null_Interpreter;
     -- ****

     -- ****f* Tcl/Tcl.Tcl_GetVar_(Float)
     -- FUNCTION
     -- Get the value for the selected Tcl variable as a Float
     -- PARAMETERS
     -- Var_Name    - Name of the Tcl variable to get. If contains open and
     --               close parenthesis it will be treated as index of the item
     --               in the array. Cannot be empty.
      -- Index_Name  - Name of the index of element in the Tcl array which
      --               the value will be get. Cannot be empty.
     -- Interpreter - Tcl interpreter on which the result will be get. By
     --               default it is current default Tcl interpreter.
     -- Flags       - Array of flags used in getting variable. Can be empty.
     --               Default value is one element array NONE
     -- RESULT
     -- Float with the value of the selected Tcl varible
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
      -- -- Get the value of the third element in the Tcl array $myarray on default Tcl interpreter
      -- Value: constant Float := Tcl_GetVar2("myarray", "2");
   -- SOURCE
   function Tcl_GetVar2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := (1 => NONE)) return Float is
     (Float'Value(Tcl_GetVar2(Var_Name, Index_Name, Interpreter, Flags))) with
      Pre => Var_Name'Length > 0 and Index_Name'Length > 0 and
      Interpreter /= Null_Interpreter;
     -- ****

end Tcl;
