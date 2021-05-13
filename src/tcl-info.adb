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

package body Tcl.Info is

   function Commands_Count
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Natural is
      function Integer_Eval is new Generic_Scalar_Tcl_Eval
        (Result_Type => Integer);
   begin
      return Integer_Eval
          (Tcl_Script => "info cmdcount",
           Interpreter => Interpreter);
   end Commands_Count;

end Tcl.Info;
