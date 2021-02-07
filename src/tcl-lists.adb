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
with Tcl.Commands; use Tcl.Commands;
with Tcl.Variables; use Tcl.Variables;

package body Tcl.Lists is

   -- ****if* Lists/Lists.TclSplitList
   -- FUNCTION
   -- Ada thick binding for Tcl_SplitList function
   -- PARAMETERS
   -- interp  - The Tcl interpreter on which Tcl list will be splitted
   -- list    - The Tcl list to split
   -- argcPtr - The amount of elements of Tcl list
   -- argvPtr - The array with splitted the list elements
   -- RESULT
   -- If list was splitted, return TCL_OK, otherwise return TCL_ERROR
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function TclSplitList
     (interp: Tcl_Interpreter; list: chars_ptr; argcPtr: out int;
      argvPtr: out Argv_Pointer.Pointer) return Tcl_Results with
      Import => True,
      Convention => C,
      External_Name => "Tcl_SplitList";
      -- ****

   function Split_List_Variable
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
      Amount: Positive;
      Values: Argv_Pointer.Pointer;
   begin
      if TclSplitList
          (Interpreter, New_String(Tcl_GetVar(Name, Interpreter)), int(Amount),
           Values) =
        TCL_ERROR then
         raise Tcl_Exception with Tcl_GetResult(Interpreter);
      end if;
      return ArrayList: Array_List(1 .. Amount) do
         for I in ArrayList'Range loop
            ArrayList(I) := To_Unbounded_String(Get_Argument(Values, I - 1));
         end loop;
      end return;
   end Split_List_Variable;

   function Split_List
     (List: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
      Amount: Positive;
      Values: Argv_Pointer.Pointer;
   begin
      if TclSplitList(Interpreter, New_String(List), int(Amount), Values) =
        TCL_ERROR then
         raise Tcl_Exception with Tcl_GetResult(Interpreter);
      end if;
      return ArrayList: Array_List(1 .. Amount) do
         for I in ArrayList'Range loop
            ArrayList(I) := To_Unbounded_String(Get_Argument(Values, I - 1));
         end loop;
      end return;
   end Split_List;

end Tcl.Lists;
