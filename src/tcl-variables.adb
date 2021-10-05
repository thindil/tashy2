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
with Tashy2; use Tashy2;

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
      Default_Unsigned_Integer: constant Unsigned_Integer := 0;
      Flag: Unsigned_Integer := Default_Unsigned_Integer;
   begin
      Set_Flags_Loop :
      for Value of Flags loop
         Flag := Flag or Variables_Flags'Enum_Rep(Value);
      end loop Set_Flags_Loop;
      return int(Flag);
   end Create_Flag;

   function Tcl_Set_Var
     (Var_Name, New_Value: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Boolean is
      function Tcl_Set_Var_C
        (Interp: Tcl_Interpreter; Var_Name_C, New_Value_C: chars_ptr;
         Flags_C: int) return chars_ptr with
         Global => null,
         Import,
         Convention => C,
         External_Name => "Tcl_SetVar";
      Result: constant String :=
        From_C_String
          (Item =>
             Tcl_Set_Var_C
               (Interp => Interpreter,
                Var_Name_C => To_C_String(Str => Var_Name),
                New_Value_C => To_C_String(Str => New_Value),
                Flags_C => Create_Flag(Flags => Flags)));
   begin
      if Result'Length = 0 then
         return False;
      end if;
      return True;
   end Tcl_Set_Var;

   function Tcl_Set_Var2
     (Array_Name, Index_Name, New_Value: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Boolean is
      function Tcl_Set_Var2_C
        (Interp: Tcl_Interpreter; Name1, Name2, New_Value_C: chars_ptr;
         Flags_C: int) return chars_ptr with
         Global => null,
         Import,
         Convention => C,
         External_Name => "Tcl_SetVar2";
      Result: constant String :=
        From_C_String
          (Item =>
             Tcl_Set_Var2_C
               (Interp => Interpreter, Name1 => To_C_String(Str => Array_Name),
                Name2 => To_C_String(Str => Index_Name),
                New_Value_C => To_C_String(Str => New_Value),
                Flags_C => Create_Flag(Flags => Flags)));
   begin
      if Result'Length = 0 then
         return False;
      end if;
      return True;
   end Tcl_Set_Var2;

   function Tcl_Get_Var
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return String is
      function Tcl_Get_Var_C
        (Interp: Tcl_Interpreter; Var_Name_C: chars_ptr; Flags_C: int)
         return chars_ptr with
         Global => null,
         Import,
         Convention => C,
         External_Name => "Tcl_GetVar";
      Result: constant chars_ptr :=
        Tcl_Get_Var_C
          (Interp => Interpreter, Var_Name_C => To_C_String(Str => Var_Name),
           Flags_C => Create_Flag(Flags => Flags));
   begin
      if Result = Null_Ptr then
         return "";
      end if;
      return From_C_String(Item => Result);
   end Tcl_Get_Var;

   function Generic_Scalar_Tcl_Get_Var
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Result_Type is
   begin
      return
        Result_Type'Value
          (Tcl_Get_Var
             (Var_Name => Var_Name, Interpreter => Interpreter,
              Flags => Flags));
   end Generic_Scalar_Tcl_Get_Var;

   function Generic_Float_Tcl_Get_Var
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Result_Type is
   begin
      return
        Result_Type'Value
          (Tcl_Get_Var
             (Var_Name => Var_Name, Interpreter => Interpreter,
              Flags => Flags));
   end Generic_Float_Tcl_Get_Var;

   function Tcl_Get_Var2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return String is
      function Tcl_Get_Var2_C
        (Interp: Tcl_Interpreter; Var_Name_C, Index_Name_C: chars_ptr;
         Flags_C: int) return chars_ptr with
         Global => null,
         Import,
         Convention => C,
         External_Name => "Tcl_GetVar2";
      Result: constant chars_ptr :=
        Tcl_Get_Var2_C
          (Interp => Interpreter, Var_Name_C => To_C_String(Str => Var_Name),
           Index_Name_C => To_C_String(Str => Index_Name),
           Flags_C => Create_Flag(Flags => Flags));
   begin
      if Result = Null_Ptr then
         return "";
      end if;
      return From_C_String(Item => Result);
   end Tcl_Get_Var2;

   function Generic_Scalar_Tcl_Get_Var2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Result_Type is
   begin
      return
        Result_Type'Value
          (Tcl_Get_Var2
             (Var_Name => Var_Name, Index_Name => Index_Name,
              Interpreter => Interpreter, Flags => Flags));
   end Generic_Scalar_Tcl_Get_Var2;

   function Generic_Float_Tcl_Get_Var2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Result_Type is
   begin
      return
        Result_Type'Value
          (Tcl_Get_Var2
             (Var_Name => Var_Name, Index_Name => Index_Name,
              Interpreter => Interpreter, Flags => Flags));
   end Generic_Float_Tcl_Get_Var2;

   procedure Tcl_Unset_Var
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) is
      function Tcl_Unset_Var_C
        (Interp: Tcl_Interpreter; Var_Name_C: chars_ptr; Flags_C: int)
         return int with
         Global => null,
         Import,
         Convention => C,
         External_Name => "Tcl_UnsetVar";
   begin
      if Tcl_Unset_Var_C
          (Interp => Interpreter, Var_Name_C => To_C_String(Str => Var_Name),
           Flags_C => Create_Flag(Flags => Flags)) =
        int(Tcl_Results'Enum_Rep(TCL_ERROR)) then
         raise Tcl_Exception with "Can't unset " & Var_Name;
      end if;
   end Tcl_Unset_Var;

   procedure Tcl_Unset_Var2
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) is
      function Tcl_Unset_Var2_C
        (Interp: Tcl_Interpreter; Var_Name_C, Index_Name_C: chars_ptr;
         Flags_C: int) return int with
         Global => null,
         Import,
         Convention => C,
         External_Name => "Tcl_UnsetVar2";
   begin
      if Tcl_Unset_Var2_C
          (Interp => Interpreter, Var_Name_C => To_C_String(Str => Var_Name),
           Index_Name_C => To_C_String(Str => Index_Name),
           Flags_C => Create_Flag(Flags => Flags)) =
        int(Tcl_Results'Enum_Rep(TCL_ERROR)) then
         raise Tcl_Exception
           with "Can't unset element " & Index_Name & " in array " & Var_Name;
      end if;
   end Tcl_Unset_Var2;

end Tcl.Variables;
