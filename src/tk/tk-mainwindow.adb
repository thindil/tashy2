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

package body Tk.MainWindow is

   function Get_Main_Window
     (Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk.TopLevel.Tk_Toplevel is
      function Tk_Main_Window
        (Interp: Tcl_Interpreter) return Tk.TopLevel.Tk_Toplevel with
         Global => null,
         Import,
         Convention => C,
         External_Name => "Tk_MainWindow";
   begin
      return Tk_Main_Window(Interp => Interpreter);
   end Get_Main_Window;

end Tk.MainWindow;
