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

with Interfaces.C;
with Interfaces.C.Strings;
with Tcl.Commands;
with Tcl.Variables;

package body Tcl.Lists is

   function Split_List
     (List: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
      use Interfaces.C;
      use Interfaces.C.Strings;
      use Tcl.Commands;
      function Tcl_Split_List
        (Interp: Tcl_Interpreter; Tcl_List: chars_ptr; Argc_Ptr: out int;
         Argv_Ptr: out Argv_Pointer.Pointer) return Tcl_Results with
         Import => True,
         Convention => C,
         External_Name => "Tcl_SplitList";
      Amount: Natural := 0;
      Values: Argv_Pointer.Pointer;
   begin
      if Tcl_Split_List
          (Interp => Interpreter, Tcl_List => New_String(Str => List),
           Argc_Ptr => int(Amount), Argv_Ptr => Values) =
        TCL_ERROR then
         raise Tcl_Exception with Tcl_Get_Result(Interpreter => Interpreter);
      end if;
      if Amount = 0 then
         return Empty_Array_List;
      end if;
      Convert_List_To_Array_Block :
      declare
         Ada_Array: Array_List(1 .. Amount) :=
           (others => To_Tcl_String(Source => ""));
      begin
         Convert_List_To_Array_Loop :
         for I in Ada_Array'Range loop
            Ada_Array(I) :=
              To_Unbounded_String
                (Source =>
                   Get_Argument(Arguments_Pointer => Values, Index => I - 1));
         end loop Convert_List_To_Array_Loop;
         return Ada_Array;
      end Convert_List_To_Array_Block;
   end Split_List;

   function Split_List_Variable
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
      use Tcl.Variables;
   begin
      return Split_List
          (List => Tcl_Get_Var(Var_Name => Name, Interpreter => Interpreter),
           Interpreter => Interpreter);
   end Split_List_Variable;

end Tcl.Lists;
