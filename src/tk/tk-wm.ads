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

with Tk.Widget; use Tk.Widget;

package Tk.Wm is

   type Window_Manager_Types is (X11, WINDOWS, MACOSX);

   type Alpha_Type is digits 2 range -1.0 .. 1.0;

   type Window_Attributes_Data (WM_Type: Window_Manager_Types := X11) is record
      Alpha: Alpha_Type;
   end record;

   procedure Aspect
     (Window: Tk_Widget;
      Min_Numer, Min_Denom, Max_Numer, Max_Denom: Extended_Natural) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Aspect", Mode => Nominal);

   function Aspect(Window: Tk_Widget) return Bbox_Array with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Aspect2", Mode => Nominal);

end Tk.Wm;
