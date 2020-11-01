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

package body Tk.MainWindow is

   function Get_Main_Window(Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_TopLevel is
      function Tk_MainWindow(interp: Tcl_Interpreter) return int with
         Import => True,
         Convention => C,
         External_Name => "Tk_MainWindow";
   begin
      return Main_Window : Tk_TopLevel do
         Main_Window.Tk_Window := Integer(Tk_MainWindow(Interpreter));
      end return;
   end Get_Main_Window;

end Tk.MainWindow;
