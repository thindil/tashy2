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

package body Tk.Widget is

   function Tk_PathName(Widget: Tk_Widget'Class) return String is
      function Get_PathName(tkwin: int) return chars_ptr with
         Import => True,
         Convention => C,
         External_Name => "Get_PathName";
   begin
      return Value(Get_PathName(int(Widget.Tk_Window)));
   end Tk_PathName;

   function Tk_Interp(Widget: Tk_Widget'Class) return Tcl_Interpreter is
      function TkInterp(tkwin: int) return Tcl_Interpreter with
         Import => True,
         Convention => C,
         External_Name => "Tk_Interp";
   begin
      return TkInterp(int(Widget.Tk_Window));
   end Tk_Interp;

   function Get_Option(Widget: Tk_Widget'Class; Name: String) return String is
   begin
      Tcl_Eval(Tk_PathName(Widget) & " cget " & Name, Tk_Interp(Widget));
      return Tcl_GetStringResult(Tk_Interp(Widget));
   end Get_Option;

   function Get_Option(Widget: Tk_Widget'Class; Name: String) return Integer is
   begin
      return Integer'Value(Get_Option(Widget, Name));
   end Get_Option;

   function Get_Option(Widget: Tk_Widget'Class; Name: String) return Float is
   begin
      return Float'Value(Get_Option(Widget, Name));
   end Get_Option;

   procedure Configure(Widget: Tk_Widget'Class; Options: String) is
   begin
      Tcl_Eval
        (Tk_PathName(Widget) & " configure " & Options, Tk_Interp(Widget));
   end Configure;

   procedure Destroy(Widget: in out Tk_Widget'Class) is
      procedure Tk_DestroyWindow(tkwin: int) with
         Import => True,
         Convention => C,
         External_Name => "Tk_DestroyWindow";
   begin
      Tk_DestroyWindow(int(Widget.Tk_Window));
      Widget.Tk_Window := 0;
   end Destroy;

   procedure Execute_Widget_Command
     (Widget: Tk_Widget'Class; Command_Name: String; Options: String := "") is
   begin
      Tcl_Eval
        (Tk_PathName(Widget) & " " & Command_Name & " " & Options,
         Tk_Interp(Widget));
   end Execute_Widget_Command;

end Tk.Widget;
