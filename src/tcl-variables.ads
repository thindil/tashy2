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

      -- ****t* Variables/Variables.Variables_Flags
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

   -- ****d* Variables/Variables.Default_Flag
   -- FUNCTION
   -- Default flag for Tcl variables
   -- SOURCE
   Default_Flag: constant Variables_Flags := NONE;
   -- ****

   -- ****t* Variables/Variables.Flags_Array
   -- FUNCTION
   -- Used as to set flags for Tcl variables manipulation subprograms
   -- SOURCE
   type Flags_Array is array(Positive range <>) of Variables_Flags;
   -- ****

   -- ****d* Variables/Variables.Default_Flags_Array
   -- FUNCTION
   -- Default flags array
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

      -- ****f* Variables/Variables.Tcl_Get_Var_(Integer)
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
   function Tcl_Get_Var
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Integer is
     (Integer'Value
        (Tcl_Get_Var
           (Var_Name => Var_Name, Interpreter => Interpreter,
            Flags => Flags))) with
      Pre => Var_Name'Length > 0 and Interpreter /= Null_Interpreter;
     -- ****

     -- ****f* Variables/Variables.Tcl_Get_Var_(Float)
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
   function Tcl_Get_Var
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Float is
     (Float'Value
        (Tcl_Get_Var
           (Var_Name => Var_Name, Interpreter => Interpreter,
            Flags => Flags))) with
      Pre => Var_Name'Length > 0 and Interpreter /= Null_Interpreter;
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

      -- ****f* Variables/Variables.Tcl_Get_Var2_(Integer)
      -- FUNCTION
      -- Get the value for the selected Tcl variable in the selected array as Integer
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
      -- Value: constant Integer := Tcl_Get_Var2("myarray", "2");
      -- SOURCE
   function Tcl_Get_Var2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Integer is
     (Integer'Value
        (Tcl_Get_Var2
           (Var_Name => Var_Name, Index_Name => Index_Name,
            Interpreter => Interpreter, Flags => Flags))) with
      Pre => Var_Name'Length > 0 and Index_Name'Length > 0 and
      Interpreter /= Null_Interpreter;
     -- ****

     -- ****f* Variables/Variables.Tcl_Get_Var2_(Float)
     -- FUNCTION
     -- Get the value for the selected Tcl variable in the selected array as Float
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
     -- Value: constant Float := Tcl_Get_Var2("myarray", "2");
     -- SOURCE
   function Tcl_Get_Var2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Float is
     (Float'Value
        (Tcl_Get_Var2
           (Var_Name => Var_Name, Index_Name => Index_Name,
            Interpreter => Interpreter, Flags => Flags))) with
      Pre => Var_Name'Length > 0 and Index_Name'Length > 0 and
      Interpreter /= Null_Interpreter;
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

end Tcl.Variables;
