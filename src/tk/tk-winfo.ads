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

-- ****h* Tk/Winfo
-- FUNCTION
-- Provide bindings for Tk command winfo (information about the selected
-- widget)
-- SOURCE
package Tk.Winfo is
-- ****

   function Atom
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return Positive with
      Pre => Name'Length > 0,
      Test_Case => (Name => "Test_Winfo_Atom", Mode => Nominal);

   function Atom_Name
     (Id: Positive; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return String with
      Test_Case => (Name => "Test_Winfo_Atom_Name", Mode => Robustness);

   function Cells(Window: Tk_Widget) return Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Cells", Mode => Nominal);

   function Children(Window: Tk_Widget) return Widgets_Array with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Children", Mode => Nominal);

   function Class(Window: Tk_Widget) return String with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Class", Mode => Nominal);

   function Color_Map_Full(Window: Tk_Widget) return Boolean with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Color_Map_Full", Mode => Nominal);

   function Containing
     (Root_X, Root_Y: Natural; Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Widget with
      Test_Case => (Name => "Test_Winfo_Containing", Mode => Robustness);

   function Depth(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Depth", Mode => Nominal);

   function Exists
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean with
      Pre => Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Winfo_Exists", Mode => Nominal);

   function Floating_Point_Pixels
     (Window: Tk_Widget; Number: Pixel_Data) return Float with
      Pre => Window /= Null_Widget and Number /= Empty_Pixel_Data,
      Test_Case => (Name => "Test_Winfo_Floating_Point_Pixels",
       Mode => Nominal);

end Tk.Winfo;
