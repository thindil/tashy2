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

package body Tk.TtkEntry is

   function Create
     (Path_Name: String; Options: Ttk_Entry_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Entry is
   begin
      return Null_Widget;
   end Create;

   procedure Create
     (Entry_Widget: out Ttk_Entry; Path_Name: String; Options: Ttk_Entry_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      null;
   end Create;

   function Get_Options(Entry_Widget: Ttk_Entry) return Ttk_Entry_Options is
   begin
      return Default_Ttk_Entry_Options;
   end Get_Options;

   procedure Configure(Entry_Widget: Ttk_Entry; Options: Ttk_Entry_Options) is
   begin
      null;
   end Configure;

end Tk.TtkEntry;
