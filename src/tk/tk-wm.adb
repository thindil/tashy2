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

with Tcl.Variables; use Tcl.Variables;

package body Tk.Wm is

   procedure Aspect
     (Window: Tk_Toplevel;
      Min_Numer, Min_Denom, Max_Numer, Max_Denom: Natural) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm aspect " & Tk_Path_Name(Widgt => Window) &
           Natural'Image(Min_Numer) & Natural'Image(Min_Denom) &
           Natural'Image(Max_Numer) & Natural'Image(Max_Denom),
         Interpreter => Tk_Interp(Widgt => Window));
   end Aspect;

   function Aspect(Window: Tk_Toplevel) return Aspect_Data is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "wm aspect " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter),
           Interpreter => Interpreter);
   begin
      if Result = Empty_Array_List then
         return Empty_Aspect_Data;
      end if;
      return Result_Value: Aspect_Data := Empty_Aspect_Data do
         Result_Value.Min_Numer :=
           Natural'Value(To_Ada_String(Source => Result(1)));
         Result_Value.Min_Denom :=
           Natural'Value(To_Ada_String(Source => Result(2)));
         Result_Value.Max_Numer :=
           Natural'Value(To_Ada_String(Source => Result(3)));
         Result_Value.Max_Denom :=
           Natural'Value(To_Ada_String(Source => Result(4)));
      end return;
   end Aspect;

   function Get_Attributes(Window: Tk_Widget) return Window_Attributes_Data is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "wm attributes " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter),
           Interpreter => Interpreter);
      Index: Positive := 1;
      Window_Attributes: Window_Attributes_Data
        (Wm_Type =>
           (if
              Tcl_Get_Var2
                (Var_Name => "tcl_platform", Index_Name => "os",
                 Interpreter => Interpreter) =
              "Windows"
            then WINDOWS
            elsif
              Tcl_Get_Var2
                (Var_Name => "tcl_platform", Index_Name => "os",
                 Interpreter => Interpreter) =
              "Darwin"
            then MACOSX
            else X_11)) :=
        Empty_Window_Attributes;
   begin
      while Index < Result'Last loop
         if Result(Index) = "-alpha" then
            Window_Attributes.Alpha :=
              Alpha_Type'Value(To_Ada_String(Result(Index + 1)));
         end if;
         Index := Index + 2;
      end loop;
      return Window_Attributes;
   end Get_Attributes;

   procedure Set_Attributes
     (Window: Tk_Widget; Attributes_Data: Window_Attributes_Data) is
      pragma Unreferenced(Window, Attributes_Data);
   begin
      null;
   end Set_Attributes;

   function Get_Attribute(Window: Tk_Widget; Name: String) return Tcl_String is
      pragma Unreferenced(Window, Name);
   begin
      return Null_Tcl_String;
   end Get_Attribute;

   function Get_Attribute
     (Window: Tk_Widget; Name: String) return Extended_Boolean is
      pragma Unreferenced(Window, Name);
   begin
      return NONE;
   end Get_Attribute;

   function Get_Attribute(Window: Tk_Widget; Name: String) return Alpha_Type is
      pragma Unreferenced(Window, Name);
   begin
      return Default_Alpha;
   end Get_Attribute;

   function Get_Attribute
     (Window: Tk_Widget; Name: String) return Window_Types is
      pragma Unreferenced(Window, Name);
   begin
      return Default_Window_Type;
   end Get_Attribute;

   function Client(Window: Tk_Widget) return String is
      pragma Unreferenced(Window);
   begin
      return "";
   end Client;

   procedure Client(Window: Tk_Widget; Name: Tcl_String) is
      pragma Unreferenced(Window, Name);
   begin
      null;
   end Client;

   function Color_Map_Windows(Window: Tk_Widget) return Array_List is
      pragma Unreferenced(Window);
   begin
      return Empty_Array_List;
   end Color_Map_Windows;

   procedure Color_Map_Windows(Window: Tk_Widget; Widgets: Widgets_Array) is
      pragma Unreferenced(Window, Widgets);
   begin
      null;
   end Color_Map_Windows;

   function Command(Window: Tk_Widget) return Tcl_String is
      pragma Unreferenced(Window);
   begin
      return Null_Tcl_String;
   end Command;

   procedure Command(Window: Tk_Widget; Wm_Command: Tcl_String) is
      pragma Unreferenced(Window, Wm_Command);
   begin
      null;
   end Command;

   procedure Deiconify(Window: Tk_Widget) is
      pragma Unreferenced(Window);
   begin
      null;
   end Deiconify;

   function Focus_Model(Window: Tk_Widget) return Focus_Model_Types is
      pragma Unreferenced(Window);
   begin
      return Default_Focus_Model;
   end Focus_Model;

   procedure Focus_Model(Window: Tk_Widget; Model: Focus_Model_Types) is
      pragma Unreferenced(Window, Model);
   begin
      null;
   end Focus_Model;

   procedure Forget(Window: Tk_Widget) is
      pragma Unreferenced(Window);
   begin
      null;
   end Forget;

   function Frame(Window: Tk_Widget) return Tk_Window is
      pragma Unreferenced(Window);
   begin
      return Null_Window;
   end Frame;

   function Geometry(Window: Tk_Widget) return Window_Geometry is
      pragma Unreferenced(Window);
   begin
      return Empty_Window_Geometry;
   end Geometry;

   procedure Geometry
     (Window: Tk_Widget; Width, Height, X, Y: Extended_Natural := -1) is
      pragma Unreferenced(Window, Width, Height, X, Y);
   begin
      null;
   end Geometry;

   function Grid(Window: Tk_Widget) return Window_Grid_Geometry is
      pragma Unreferenced(Window);
   begin
      return Empty_Window_Grid_Geometry;
   end Grid;

   procedure Grid
     (Window: Tk_Widget;
      Base_Width, Base_Height, Width_Inc, Height_Inc: Extended_Natural :=
        -1) is
      pragma Unreferenced(Window, Base_Width, Base_Height, Width_Inc,
         Height_Inc);
   begin
      null;
   end Grid;

   function Group(Window: Tk_Widget) return String is
      pragma Unreferenced(Window);
   begin
      return "";
   end Group;

   procedure Group(Window: Tk_Widget; Path_Name: Tcl_String) is
      pragma Unreferenced(Window, Path_Name);
   begin
      null;
   end Group;

   function Icon_Bitmap(Window: Tk_Widget) return String is
      pragma Unreferenced(Window);
   begin
      return "";
   end Icon_Bitmap;

   procedure Icon_Bitmap(Window: Tk_Widget; Bitmap: Tcl_String) is
      pragma Unreferenced(Window, Bitmap);
   begin
      null;
   end Icon_Bitmap;

   procedure Iconify(Window: Tk_Widget) is
      pragma Unreferenced(Window);
   begin
      null;
   end Iconify;

   function Icon_Mask(Window: Tk_Widget) return String is
      pragma Unreferenced(Window);
   begin
      return "";
   end Icon_Mask;

   procedure Icon_Mask(Window: Tk_Widget; Bitmap: Tcl_String) is
      pragma Unreferenced(Window, Bitmap);
   begin
      null;
   end Icon_Mask;

   function Icon_Name(Window: Tk_Widget) return String is
      pragma Unreferenced(Window);
   begin
      return "";
   end Icon_Name;

   procedure Icon_Name(Window: Tk_Widget; New_Name: Tcl_String) is
      pragma Unreferenced(Window, New_Name);
   begin
      null;
   end Icon_Name;

   procedure Icon_Photo
     (Window: Tk_Widget; Images: Array_List; Default: Boolean := False) is
      pragma Unreferenced(Window, Images, Default);
   begin
      null;
   end Icon_Photo;

   function Icon_Position(Window: Tk_Widget) return Window_Position is
      pragma Unreferenced(Window);
   begin
      return Empty_Window_Position;
   end Icon_Position;

   procedure Icon_Position(Window: Tk_Widget; X, Y: Natural) is
      pragma Unreferenced(Window, X, Y);
   begin
      null;
   end Icon_Position;

   function Icon_Window(Window: Tk_Widget) return String is
      pragma Unreferenced(Window);
   begin
      return "";
   end Icon_Window;

   procedure Icon_Window(Window: Tk_Widget; Path_Name: Tcl_String) is
      pragma Unreferenced(Window, Path_Name);
   begin
      null;
   end Icon_Window;

end Tk.Wm;
