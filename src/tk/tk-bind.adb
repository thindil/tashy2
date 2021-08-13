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

package body Tk.Bind is

   procedure Bind
     (Window: Tk_Widget; Sequence: Modifiers_Type; Script: Tcl_String;
      Append: Boolean := False) is
   begin
      null;
   end Bind;

   procedure Bind
     (Window: Tk_Widget; Sequence: Modifiers_Array; Script: Tcl_String;
      Append: Boolean := False) is
   begin
      null;
   end Bind;

end Tk.Bind;
