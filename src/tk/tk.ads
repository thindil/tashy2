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

with Tcl; use Tcl;

-- ****h* Tk/Tk
-- FUNCTION
-- Provide bindings for Tk library
-- SOURCE
package Tk is
-- ****

   -------------------------------
   -- Initialization of Tk binding
   -------------------------------

   -- ****f* Tk/Tk_Init
   -- FUNCTION
   -- Initialize the Tk library on the selected Tcl interpreter
   -- PARAMETERS
   -- Interpreter - The Tcl interpreter on which the Tk library will be
   --               initialized. By default it is the default Tcl interpreter
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Initalize Tk library on the default Tcl interpreter
   -- Tk_Init;
   -- SOURCE
   procedure Tk_Init(Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Interpreter /= Null_Interpreter;
   -- ****

   -- ****f* Tk/Tk_MainLoop
   -- FUNCTION
   -- Loop for events until all windows are destroyed
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Start the Tk main loop
   -- Tk_MainLoop;
   -- SOURCE
   procedure Tk_MainLoop with
      Import => True,
      Convention => C,
      External_Name => "Tk_MainLoop";
   -- ****

end Tk;
