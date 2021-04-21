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

package body Tk.Image is

   procedure Delete
     (Image: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced(Image, Interpreter);
   begin
      null;
   end Delete;

   procedure Delete
     (Images: Array_List; Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced(Images, Interpreter);
   begin
      null;
   end Delete;

   function Height
     (Image: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Natural is
      pragma Unreferenced(Image, Interpreter);
   begin
      return 0;
   end Height;

   function In_Use
     (Image: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean is
      pragma Unreferenced(Image, Interpreter);
   begin
      return False;
   end In_Use;

   function Names
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List is
      pragma Unreferenced(Interpreter);
   begin
      return Empty_Array_List;
   end Names;

   function Image_Type
     (Image: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String is
      pragma Unreferenced(Image, Interpreter);
   begin
      return "";
   end Image_Type;

   function Types
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List is
      pragma Unreferenced(Interpreter);
   begin
      return Empty_Array_List;
   end Types;

   function Width
     (Image: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Natural is
      pragma Unreferenced(Image, Interpreter);
   begin
      return 0;
   end Width;

end Tk.Image;
