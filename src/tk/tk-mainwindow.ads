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

with Tk.TopLevel;

-- ****h* Tk/MainWindow
-- FUNCTION
-- Provides code for manipulate Tk main window widget
-- SOURCE
package Tk.MainWindow with
   SPARK_Mode
is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****f* MainWindow/MainWindow.Get_Main_Window
   -- FUNCTION
   -- Get the main window widget of Tk application on the selected Tcl
   -- interpreter
   -- PARAMETERS
   -- Interpreter - Tcl interpreter on which the main window will be get
   -- RESULT
   -- The main window of the Tk application as Tk_TopLevel widget
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get the main window of Tk application on default Tcl interpreter
   -- My_Main_Window: constant Tk_Toplevel := Get_Main_Window;
   -- SOURCE
   function Get_Main_Window
     (Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk.TopLevel.Tk_Toplevel with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Main_Window", Mode => Nominal);
      -- ****
      --## rule on REDUCEABLE_SCOPE

end Tk.MainWindow;
