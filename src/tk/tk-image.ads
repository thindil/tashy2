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

with Tcl.Lists; use Tcl.Lists;

-- ****d* Tk/Image
-- FUNCTION
-- Provides code for manipulate Tk images
-- SOURCE
package Tk.Image is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****t* Image/Image.Tk_Image
   -- FUNCTION
   -- The Tk identifier of the button
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Tk_Image is String;
   -- ****

   -- ****f* Tk.Image/Image.Delete_(single_image)
   -- FUNCTION
   -- Delete the selected Tk image
   -- PARAMETERS
   -- Image_Name  - The name of the Tk image to delete
   -- Interpreter - Tcl interpreter on which the image will be deleted. Can
   --               be empty. Default value is the default Tcl interpreter
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Delete Tk image named mybitmap on default Tcl interpreter
   -- Delete("mybitmap");
   -- SEE ALSO
   -- Delete_(many_images)
   -- COMMANDS
   -- image delete Image_Name
   -- SOURCE
   procedure Delete
     (Image_Name: Tk_Image;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Image_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Image_Delete", Mode => Nominal);
      -- ****

   -- ****f* Tk.Image/Image.Delete_(many_images)
   -- FUNCTION
   -- Delete the selected Tk images
   -- PARAMETERS
   -- Images      - The list of names of the Tk images to delete
   -- Interpreter - Tcl interpreter on which the images will be deleted. Can
   --               be empty. Default value is the default Tcl interpreter
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Delete Tk images named mybitmap and mybitmap2 on default Tcl interpreter
   -- Delete(Array_List'(To_Tcl_String("mybitmap"), To_Tcl_String("mybitmap2")));
   -- SEE ALSO
   -- Delete_(single_image)
   -- COMMANDS
   -- image delete Images
   -- SOURCE
   procedure Delete
     (Images: Array_List; Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Images'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Image_Delete2", Mode => Nominal);
      -- ****

   function Height
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Natural with
      Pre => Image_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Image_Height", Mode => Nominal);

   function In_Use
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean with
      Pre => Image_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Image_In_Use", Mode => Nominal);

   function Names
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Image_Names", Mode => Nominal);

   function Image_Type
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String with
      Pre => Image_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Image_Type", Mode => Nominal);

   function Types
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List with
      Test_Case => (Name => "Test_Image_Types", Mode => Nominal);

   function Width
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Natural with
      Pre => Image_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Image_Width", Mode => Nominal);
   --## rule on REDUCEABLE_SCOPE

end Tk.Image;
