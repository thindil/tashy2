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

package body Tk.Wm is

   procedure Aspect
     (Window: Tk_Widget;
      Min_Numer, Min_Denom, Max_Numer, Max_Denom: Natural) is
   begin
      null;
   end Aspect;

   function Aspect(Window: Tk_Widget) return Bbox_Array is
      pragma Unreferenced(Window);
   begin
      return Empty_Bbox_Array;
   end Aspect;

   function Get_Attributes(Window: Tk_Widget) return Window_Attributes_Data is
      pragma Unreferenced(Window);
   begin
      return Default_Window_Attributes;
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

   procedure Color_Map_Windows(Window: Tk_Widget; Windows: Widgets_Array) is
      pragma Unreferenced(Window, Windows);
   begin
      null;
   end Color_Map_Windows;

   function Command(Window: Tk_Widget) return Tcl_String is
      pragma Unreferenced(Window);
   begin
      return Null_Tcl_String;
   end Command;

   procedure Command(Window: Tk_Widget; Command: Tcl_String) is
      pragma Unreferenced(Window, Command);
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

end Tk.Wm;
