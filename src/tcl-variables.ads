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

-- ****h* Tcl/Variables
-- FUNCTION
-- Provides binding to manipulate Tcl variables (setting, getting, removing,
-- etc)
-- SOURCE
package Tcl.Variables is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****t* Variables/Variables.Variables_Flags
   -- FUNCTION
   -- Available flags for manipulation of Tcl variables
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Variables_Flags is
     (NONE, TCL_GLOBAL_ONLY, TCL_NAMESPACE_ONLY, TCL_APPEND_VALUE,
      TCL_LIST_ELEMENT, TCL_LEAVE_ERR_MSG);

   for Variables_Flags use
     (NONE => 16#0000#, TCL_GLOBAL_ONLY => 16#0001#,
      TCL_NAMESPACE_ONLY => 16#0002#, TCL_APPEND_VALUE => 16#0004#,
      TCL_LIST_ELEMENT => 16#0008#, TCL_LEAVE_ERR_MSG => 16#0200#);
   -- ****

   -- ****d* Variables/Variables.Default_Flag
   -- FUNCTION
   -- Default flag for Tcl variables
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Flag: constant Variables_Flags := NONE;
   -- ****

   -- ****t* Variables/Variables.Flags_Array
   -- FUNCTION
   -- Used as to set flags for Tcl variables manipulation subprograms
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Flags_Array is array(Positive range <>) of Variables_Flags;
   -- ****

   -- ****d* Variables/Variables.Default_Flags_Array
   -- FUNCTION
   -- Default flags array
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Flags_Array: constant Flags_Array(1 .. 1) := (1 => Default_Flag);
   -- ****

   -- ****f* Variables/Variables.Tcl_Set_Var
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
   -- Tcl_Set_Var("myvar", "2");
   -- SOURCE
   procedure Tcl_Set_Var
     (Var_Name, New_Value: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) with
      Pre => Var_Name'Length > 0 and New_Value'Length > 0,
      Test_Case => (Name => "Test_Tcl_SetVar", Mode => Nominal);
      -- ****

      -- ****f* Variables/Variables.Tcl_Set_Var2
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
      -- Tcl_Set_Var2("myarray", "2", "5");
      -- SOURCE
   procedure Tcl_Set_Var2
     (Array_Name, Index_Name, New_Value: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) with
      Pre => Array_Name'Length > 0 and Index_Name'Length > 0 and
      New_Value'Length > 0,
      Test_Case => (Name => "Test_Tcl_SetVar2", Mode => Nominal);
      -- ****

      -- ****f* Variables/Variables.Tcl_Get_Var_(String)
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
      -- Value: constant String := Tcl_Get_Var("myvar");
      -- SOURCE
   function Tcl_Get_Var
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return String with
      Pre => Var_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Tcl_GetVar", Mode => Nominal);
      -- ****

      -- ****g* Tcl/Tcl.Generic_Scalar_Tcl_Get_Var
      -- FUNCTION
      -- Generic function to get the value of Tcl variable as a scalar type
      -- PARAMETERS
      -- Var_Name    - Name of the Tcl variable to get. If contains open and
      --               close parenthesis it will be treated as index of the item
      --               in the array. Cannot be empty.
      -- Interpreter - Tcl interpreter on which the result will be get. By
      --               default it is current default Tcl interpreter.
      -- Flags       - Array of flags used in getting variable. Can be empty.
      --               Default value is one element array NONE
      -- RESULT
      -- Scalar type result with the value of Tcl variable
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the value of the variable $myvar the default Tcl interpreter as Integer
      -- function Integer_Get_Var is new Generic_Scalar_Tcl_Get_Var(Integer);
      -- Variable: constant Integer := Integer_Get_Var("myvar");
      -- SEE ALSO
      -- Tcl.Generic_Float_Tcl_Get_Var;
      -- SOURCE
   generic
      type Result_Type is (<>);
   function Generic_Scalar_Tcl_Get_Var
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Result_Type;
      -- ****

      -- ****g* Tcl/Tcl.Generic_Float_Tcl_Get_Var
      -- FUNCTION
      -- Generic function to get the value of Tcl variable as a float type
      -- PARAMETERS
      -- Var_Name    - Name of the Tcl variable to get. If contains open and
      --               close parenthesis it will be treated as index of the item
      --               in the array. Cannot be empty.
      -- Interpreter - Tcl interpreter on which the result will be get. By
      --               default it is current default Tcl interpreter.
      -- Flags       - Array of flags used in getting variable. Can be empty.
      --               Default value is one element array NONE
      -- RESULT
      -- Float type result with the value of Tcl variable
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the value of the variable $myvar the default Tcl interpreter as Float
      -- function Float_Get_Var is new Generic_Float_Tcl_Get_Var(Float);
      -- Variable: constant Float := Integer_Get_Var("myvar");
      -- SEE ALSO
      -- Tcl.Generic_Scalar_Tcl_Get_Var;
      -- SOURCE
   generic
      type Result_Type is digits <>;
   function Generic_Float_Tcl_Get_Var
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Result_Type;
      -- ****

      -- ****f* Variables/Variables.Tcl_Get_Var2_(String)
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
   function Tcl_Get_Var2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return String with
      Pre => Var_Name'Length > 0 and Index_Name'Length > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Tcl_GetVar2", Mode => Nominal);
      -- ****

      -- ****g* Tcl/Tcl.Generic_Scalar_Tcl_Get_Var2
      -- FUNCTION
      -- Generic function to get the value of Tcl variable as a scalar type
      -- PARAMETERS
      -- Var_Name    - Name of the Tcl variable to get. If contains open and
      --               close parenthesis it will be treated as index of the item
      --               in the array. Cannot be empty.
      -- Interpreter - Tcl interpreter on which the result will be get. By
      --               default it is current default Tcl interpreter.
      -- Index_Name  - Name of the index of element in the Tcl array which
      --               the value will be get. Cannot be empty.
      -- Flags       - Array of flags used in getting variable. Can be empty.
      --               Default value is one element array NONE
      -- RESULT
      -- Scalar type result with the value of Tcl variable
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the value of the variable $myvar the default Tcl interpreter as Integer
      -- function Integer_Get_Var is new Generic_Scalar_Tcl_Get_Var2(Integer);
      -- Variable: constant Integer := Integer_Get_Var("myvar");
      -- SEE ALSO
      -- Tcl.Generic_Float_Tcl_Get_Var2;
      -- SOURCE
   generic
      type Result_Type is (<>);
   function Generic_Scalar_Tcl_Get_Var2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Result_Type;
      -- ****

      -- ****g* Tcl/Tcl.Generic_Float_Tcl_Get_Var2
      -- FUNCTION
      -- Generic function to get the value of Tcl variable in the selected array as a float type
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
      -- Float type result with the value of Tcl variable
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the value of the variable $myvar the default Tcl interpreter as Float
      -- function Float_Get_Var is new Generic_Float_Tcl_Get_Var2(Float);
      -- Variable: constant Float := Integer_Get_Var2("myvar");
      -- SEE ALSO
      -- Tcl.Generic_Scalar_Tcl_Get_Var2;
      -- SOURCE
   generic
      type Result_Type is digits <>;
   function Generic_Float_Tcl_Get_Var2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Result_Type;
      -- ****

      -- ****f* Variables/Variables.Tcl_Unset_Var
      -- FUNCTION
      -- Delete the selected Tcl variable
      -- PARAMETERS
      -- Var_Name    - Name of the Tcl variable to delete. If contains open and
      --               close parenthesis it will be treated as index of the item
      --               in the array. Cannot be empty.
      -- Interpreter - Tcl interpreter on which the variable will be deleted. By
      --               default it is current default Tcl interpreter.
      -- Flags       - Array of flags used in deleting variable. Can be empty.
      --               Default value is one element array NONE
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Delete the Tcl variable $myvar on default Tcl interpreter
      -- Tcl_Unset_Var("myvar");
      -- SOURCE
   procedure Tcl_Unset_Var
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) with
      Pre => Var_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Tcl_UnsetVar", Mode => Nominal);
      -- ****

      -- ****f* Variables/Variables.Tcl_Unset_Var2
      -- FUNCTION
      -- Delete the selected Tcl variable in the selected Tcl array
      -- PARAMETERS
      -- Var_Name    - Name of the Tcl variable to delete. If contains open and
      --               close parenthesis it will be treated as index of the item
      --               in the array. Cannot be empty.
      -- Index_Name  - Name of the index of element in the Tcl array which
      --               will be deleted. Cannot be empty.
      -- Interpreter - Tcl interpreter on which the variable will be deleted. By
      --               default it is current default Tcl interpreter.
      -- Flags       - Array of flags used in deleting variable. Can be empty.
      --               Default value is one element array NONE
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Delete the third element in the Tcl array $myarray on default Tcl interpreter
      -- Tcl_Unset_Var("myarray", "2");
      -- SOURCE
   procedure Tcl_Unset_Var2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) with
      Pre => Var_Name'Length > 0 and Index_Name'Length > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Tcl_UnsetVar2", Mode => Nominal);
      -- ****
      --## rule on REDUCEABLE_SCOPE

end Tcl.Variables;
