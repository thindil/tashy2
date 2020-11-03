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

package body Tk.TopLevel is

   function TopLevel_New
     (Path_Name: String; Options: TopLevel_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_TopLevel is
      New_TopLevel: Tk_TopLevel;
   begin
      -- TODO: add creating a TopLevel
      return New_TopLevel;
   end TopLevel_New;

   procedure TopLevel_New
     (Widget: out Tk_TopLevel; Path_Name: String; Options: TopLevel_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Widget := TopLevel_New(Path_Name, Options, Interpreter);
   end TopLevel_New;

   function Get_Options(Widget: Tk_TopLevel) return TopLevel_Options is
      Options: TopLevel_Options;
   begin
      return Options;
   end Get_Options;

end Tk.TopLevel;
