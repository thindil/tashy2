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
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Tcl_Eval
        (Tcl_Script => "image delete " & Image_Name,
         Interpreter => Interpreter);
   end Delete;

   procedure Delete
     (Images: Array_List; Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Tcl_Eval
        (Tcl_Script => "image delete " & Merge_List(List => Images),
         Interpreter => Interpreter);
   end Delete;

   function Height
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Natural is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "image height " & Image_Name,
           Interpreter => Interpreter)
          .Result;
   end Height;

   function In_Use
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tcl_Boolean_Result is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "image inuse " & Image_Name,
           Interpreter => Interpreter);
   end In_Use;

   function Names
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List is
   begin
      return
        Split_List
          (List =>
             Tcl_Eval(Tcl_Script => "image names", Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   end Names;

   function Image_Type
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "image type " & Image_Name,
           Interpreter => Interpreter)
          .Result;
   end Image_Type;

   function Types
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List is
   begin
      return
        Split_List
          (List =>
             Tcl_Eval(Tcl_Script => "image types", Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   end Types;

   function Width
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Natural is
   begin
      return
        Tcl_Eval
          (Tcl_Script => "image width " & Image_Name,
           Interpreter => Interpreter)
          .Result;
   end Width;

end Tk.Image;
