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

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Tcl.Commands;

package body Tcl.Lists is

   function Split_List
     (List: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List with
      SPARK_Mode => Off
   is
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
      return
        Ada_Array: Array_List(1 .. Amount) := (others => Null_Tcl_String) do
         Convert_List_To_Array_Loop :
         for I in Ada_Array'Range loop
            Ada_Array(I) :=
              To_Unbounded_String
                (Source =>
                   Get_Argument(Arguments_Pointer => Values, Index => I - 1));
         end loop Convert_List_To_Array_Loop;
      end return;
   end Split_List;

   function Merge_List(List: Array_List) return String is
      function Tcl_Merge
        (Argc: int; Argv: chars_ptr_array) return chars_ptr with
         Import => True,
         Convention => C,
         External_Name => "Tcl_Merge";
      New_List: chars_ptr_array(1 .. List'Length);
   begin
      Convert_Ada_String_To_C_Loop :
      for I in List'Range loop
         New_List(size_t(I)) :=
           New_String(Str => To_Ada_String(Source => List(I)));
      end loop Convert_Ada_String_To_C_Loop;
      return Value(Item => Tcl_Merge(Argc => List'Length, Argv => New_List));
   end Merge_List;

end Tcl.Lists;
