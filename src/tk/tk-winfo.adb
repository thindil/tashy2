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

package body Tk.Winfo is

   -- ****if* Winfo/Winfo.Eval_Script
   -- FUNCTION
   -- Used to get Natural result from the selected Tcl command
   -- PARAMETERS
   -- Tcl_Script  - Tcl comamnd to evaluate
   -- Interpreter - Tcl interpreter from which result will be get
   -- RESULT
   -- Natural value for the last Tcl command
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Eval_Script is new Generic_Scalar_Tcl_Eval(Result_Type => Natural);
   -- ****

   function Atom
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return Positive is
   begin
      if Window /= Null_Widget then
         return
           Eval_Script
             ("winfo atom -displayof " & Tk_Path_Name(Widgt => Window) & " " &
              Name,
              Interpreter => Tk_Interp(Widgt => Window));
      end if;
      return Eval_Script("winfo atom " & Name, Interpreter => Interpreter);
   end Atom;

   function Atom_Name
     (Id: Positive; Window: Tk_Widget := Null_Widget) return String is
      pragma Unreferenced(Id, Window);
   begin
      return "";
   end Atom_Name;

   function Cells(Window: Tk_Widget) return Natural is
      pragma Unreferenced(Window);
   begin
      return 0;
   end Cells;

   function Children(Window: Tk_Widget) return Widgets_Array is
      pragma Unreferenced(Window);
   begin
      return Empty_Widgets_Array;
   end Children;

   function Class(Window: Tk_Widget) return String is
      pragma Unreferenced(Window);
   begin
      return "";
   end Class;

end Tk.Winfo;
