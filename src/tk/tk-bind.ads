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

with Tcl.Strings; use Tcl.Strings;
with Tk.Widget; use Tk.Widget;

package Tk.Bind is

   type Modifiers_Type is
     (CONTROL, ALT, SHIFT, LOCK, EXTENDED, BUTTON1, BUTTON2, BUTTON3, BUTTON4,
      BUTTON5, MOD1, MOD2, MOD3, MOD4, MOD5, META, DOUBLE, TRIPLE, QUADRUPLE);

   type Modifiers_Array is array(Positive range <>) of Modifiers_Type;

   Empty_Modifiers_Array: constant Modifiers_Array(1 .. 0) := (others => <>);

   procedure Bind
     (Window: Tk_Widget; Sequence: Modifiers_Type; Script: Tcl_String;
      Append: Boolean := False) with
      Pre => Window /= Null_Widget and Length(Script) > 0,
      Test_Case => (Name => "Test_Bind", Mode => Nominal);

   procedure Bind
     (Window: Tk_Widget; Sequence: Modifiers_Array; Script: Tcl_String;
      Append: Boolean := False) with
      Pre => Window /= Null_Widget and Sequence /= Empty_Modifiers_Array and
      Length(Script) > 0,
      Test_Case => (Name => "Test_Bind2", Mode => Nominal);

end Tk.Bind;
