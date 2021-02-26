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

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

package body Tcl.Variables is

   -- ****if* Variables/Variables.Create_Flag
   -- FUNCTION
   -- Create C flag for the manipulating Tcl variables
   -- PARAMETERS
   -- Flags - Ada array with flags which will be added to the Tcl variable
   --         manipulation subprogram
   -- RESULT
   -- C flag from the selected array
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Create_Flag(Flags: Flags_Array) return int is
      -- ****
      type Unsigned_Integer is mod 2**Integer'Size;
      Flag: Unsigned_Integer :=
        Unsigned_Integer(Variables_Flags'Enum_Rep(Flags(1)));
   begin
      for I in 2 .. Flags'Last loop
         Flag := Flag or Unsigned_Integer(Variables_Flags'Enum_Rep(Flags(I)));
      end loop;
      return int(Flag);
   end Create_Flag;

   procedure Tcl_Set_Var
     (Var_Name, New_Value: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) is
      function Tcl_Set_Var_C
        (Interp: Tcl_Interpreter; Var_Name_C, New_Value_C: chars_ptr;
         Flags_C: int) return chars_ptr with
         Import => True,
         Convention => C,
         External_Name => "Tcl_SetVar";
      Result: constant String :=
        Value
          (Tcl_Set_Var_C
             (Interpreter, New_String(Var_Name), New_String(New_Value),
              Create_Flag(Flags)));
   begin
      if Result'Length = 0 then
         raise Tcl_Exception with "Can't set " & Var_Name & " to " & New_Value;
      end if;
   end Tcl_Set_Var;

   procedure Tcl_Set_Var2
     (Array_Name, Index_Name, New_Value: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) is
      function Tcl_Set_Var2_C
        (Interp: Tcl_Interpreter; Name1, Name2, New_Value_C: chars_ptr;
         Flags_C: int) return chars_ptr with
         Import => True,
         Convention => C,
         External_Name => "Tcl_SetVar2";
      Result: constant String :=
        Value
          (Tcl_Set_Var2_C
             (Interpreter, New_String(Array_Name), New_String(Index_Name),
              New_String(New_Value), Create_Flag(Flags)));
   begin
      if Result'Length = 0 then
         raise Tcl_Exception
           with "Can't set element " & Index_Name & " to " & New_Value &
           " in array " & Array_Name;
      end if;
   end Tcl_Set_Var2;

   function Tcl_Get_Var
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return String is
      function TclGetVar
        (interp: Tcl_Interpreter; varName: chars_ptr; flags: int)
         return chars_ptr with
         Import => True,
         Convention => C,
         External_Name => "Tcl_GetVar";
      Result: constant chars_ptr :=
        TclGetVar(Interpreter, New_String(Var_Name), Create_Flag(Flags));
   begin
      if Result = Null_Ptr then
         raise Tcl_Exception
           with "Can't get value of Tcl variable '" & Var_Name & "'";
      end if;
      return Value(Result);
   end Tcl_Get_Var;

   function Tcl_Get_Var2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return String is
      function TclGetVar2
        (interp: Tcl_Interpreter; varName, indexName: chars_ptr; flags: int)
         return chars_ptr with
         Import => True,
         Convention => C,
         External_Name => "Tcl_GetVar2";
      Result: constant chars_ptr :=
        TclGetVar2
          (Interpreter, New_String(Var_Name), New_String(Index_Name),
           Create_Flag(Flags));
   begin
      if Result = Null_Ptr then
         raise Tcl_Exception
           with "Can't get value of the element '" & Index_Name &
           "' of Tcl array '" & Var_Name & "'";
      end if;
      return Value(Result);
   end Tcl_Get_Var2;

   procedure Tcl_Unset_Var
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) is
      function TclUnsetVar
        (interp: Tcl_Interpreter; varName: chars_ptr; flags: int)
         return int with
         Import => True,
         Convention => C,
         External_Name => "Tcl_UnsetVar";
   begin
      if TclUnsetVar(Interpreter, New_String(Var_Name), Create_Flag(Flags)) =
        int(Tcl_Results'Enum_Rep(TCL_ERROR)) then
         raise Tcl_Exception with "Can't unset " & Var_Name;
      end if;
   end Tcl_Unset_Var;

   procedure Tcl_Unset_Var2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) is
      function TclUnsetVar2
        (interp: Tcl_Interpreter; varName, indexName: chars_ptr; flags: int)
         return int with
         Import => True,
         Convention => C,
         External_Name => "Tcl_UnsetVar2";
   begin
      if TclUnsetVar2
          (Interpreter, New_String(Var_Name), New_String(Index_Name),
           Create_Flag(Flags)) =
        int(Tcl_Results'Enum_Rep(TCL_ERROR)) then
         raise Tcl_Exception
           with "Can't unset element " & Index_Name & " in array " & Var_Name;
      end if;
   end Tcl_Unset_Var2;

end Tcl.Variables;
