-- Copyright (c) 2021 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- Licensed under the Apache License, Version 2.0 (the "License"); you may not
-- use this file except in compliance with the License. You may obtain a copy
-- of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
-- WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
-- License for the specific language governing permissions and limitations
-- under the License.

with Tk.Widget; use Tk.Widget;
with Tcl.Lists; use Tcl.Lists;

-- ****h* Tk/Winfo
-- FUNCTION
-- Provide bindings for Tk command winfo (information about the selected
-- widget) SOURCE
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

   function Colors_Depth(Window: Tk_Widget) return Positive with
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

   function Geometry(Window: Tk_Widget) return Window_Geometry with
      Pre => Window /= Null_Widget,
      Post => Geometry'Result /= Empty_Window_Geometry,
      Test_Case => (Name => "Test_Winfo_Geometry", Mode => Nominal);

   function Height(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Height", Mode => Nominal);

   function Id(Window: Tk_Widget) return Positive with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Id", Mode => Nominal);

   function Interpreters
     (Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List with
      Test_Case => (Name => "Test_Winfo_Interpreters", Mode => Robustness);

   function Is_Mapped(Window: Tk_Widget) return Boolean with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Is_Mapped", Mode => Nominal);

   function Manager(Window: Tk_Widget) return String with
      Pre => Window /= Null_Widget,
      Post => Manager'Result'Length > 0,
      Test_Case => (Name => "Test_Winfo_Manager", Mode => Nominal);

   function Name(Window: Tk_Widget) return String with
      Pre => Window /= Null_Widget,
      Post => Name'Result'Length > 0,
      Test_Case => (Name => "Test_Winfo_Name", Mode => Nominal);

   function Parent(Window: Tk_Widget) return String with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Parent", Mode => Nominal);

   function Path_Name
     (Id: Positive; Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return String with
      Test_Case => (Name => "Test_Winfo_Path_Name", Mode => Robustness);

   function Pixels(Window: Tk_Widget; Number: Pixel_Data) return Integer with
      Pre => Window /= Null_Widget and Number /= Empty_Pixel_Data,
      Test_Case => (Name => "Test_Winfo_Pixels", Mode => Nominal);

   function Pointer_X(Window: Tk_Widget) return Extended_Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Pointer_X", Mode => Nominal);

   function Pointer_X_Y(Window: Tk_Widget) return Point_Position with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Pointer_X_Y", Mode => Nominal);

   function Pointer_Y(Window: Tk_Widget) return Extended_Natural with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Winfo_Pointer_Y", Mode => Nominal);

end Tk.Winfo;
