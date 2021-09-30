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
with Tcl.Strings; use Tcl.Strings;

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

   --## rule off TYPE_INITIAL_VALUES
   -- ****s* Image/Image.Image_Options
   -- FUNCTION
   -- Abstract record to store images options available for all types of images
   -- OPTIONS
   -- Data - The content of the image as a string. The format of the string
   --        must be one of those for which there is an image file format
   --        handler that will accept string data. If both the Data and
   --        File options are specified, the File option takes precedence.
   -- File - The name of the file which will be loaded as an image.
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Image_Options is abstract tagged record
      Data: Tcl_String := Null_Tcl_String;
      File: Tcl_String := Null_Tcl_String;
   end record;
   -- ****
   --## rule on TYPE_INITIAL_VALUES

   -- ****f* Image/Image.Delete_(single_image)
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
   -- Image.Delete_(many_images)
   -- COMMANDS
   -- image delete Image_Name
   -- SOURCE
   procedure Delete
     (Image_Name: Tk_Image;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Image_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Image_Delete", Mode => Nominal);
      -- ****

   -- ****f* Image/Image.Delete_(many_images)
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
   -- Image.Delete_(single_image)
   -- COMMANDS
   -- image delete Images
   -- SOURCE
   procedure Delete
     (Images: Array_List; Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Images'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Image_Delete2", Mode => Nominal);
      -- ****

      -- ****f* Image/Image.Height
      -- FUNCTION
      -- Get the height in pixels for the selected Tk image
      -- PARAMETERS
      -- Image_Name  - The name of the Tk image which height will be get
      -- Interpreter - Tcl interpreter on which the image which height will be
      --               get. Can be empty. Default value is the default Tcl
      --               interpreter
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the height of the Tk image "myimage" on default Tcl interpreter
      -- Image_Height: constant Natural := Height("myimage");
      -- SEE ALSO
      -- Image.Width
      -- COMMANDS
      -- image height Image_Name
      -- SOURCE
   function Height
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Natural with
      Pre => Image_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Image_Height", Mode => Nominal);
      -- ****

      -- ****f* Image/Image.In_Use
      -- FUNCTION
      -- Check if the selected Tk image is used by any widget
      -- PARAMETERS
      -- Image_Name  - The name of the Tk image which will be checked
      -- Interpreter - Tcl interpreter on which the image will be check. Can
      --               be empty. Default value is the default Tcl interpreter
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Check if the Tk image "myimage" on default Tcl interpreter is used
      -- Is_Used: constant Tcl_Boolean_Result := In_Use("myimage");
      -- COMMANDS
      -- image inuse Image_Name
      -- SOURCE
   function In_Use
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tcl_Boolean_Result with
      Pre => Image_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Image_In_Use", Mode => Nominal);
      -- ****

      -- ****f* Image/Image.Names
      -- FUNCTION
      -- Get the names of the all existing Tk images on the selected Tcl
      -- interpreter
      -- PARAMETERS
      -- Interpreter - Tcl interpreter on which the names will be get. Can
      --               be empty. Default value is the default Tcl interpreter
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the names of Tk images on the default Tcl interpreter
      -- Available_Images: constant Array_List := Names;
      -- COMMANDS
      -- image names
      -- SOURCE
   function Names
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Image_Names", Mode => Nominal);
      -- ****

      -- ****f* Image/Image.Image_Type
      -- FUNCTION
      -- Get the type of the selected Tk image
      -- PARAMETERS
      -- Image_Name  - The name of the Tk image which type will be get
      -- Interpreter - Tcl interpreter on which the image type will be get. Can
      --               be empty. Default value is the default Tcl interpreter
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the type of Tk image "myimage" on the default Tcl interpreter
      -- My_Image_Type: constant String := Image_Type("myimage");
      -- COMMANDS
      -- image type Image_Name
      -- SOURCE
   function Image_Type
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String with
      Pre => Image_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Image_Type", Mode => Nominal);
      -- ****

      -- ****f* Image/Image.Types
      -- FUNCTION
      -- Get all possible types of the Tk images on the selected Tcl
      -- interpreter
      -- PARAMETERS
      -- Interpreter - Tcl interpreter on which the types will be get. Can
      --               be empty. Default value is the default Tcl interpreter
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the available types of Tk images on the default Tcl interpreter
      -- Available_Types: constant Array_List := Types;
      -- COMMANDS
      -- image types
      -- SOURCE
   function Types
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List with
      Test_Case => (Name => "Test_Image_Types", Mode => Nominal);
      -- ****

      -- ****f* Image/Image.Width
      -- FUNCTION
      -- Get the width in pixels for the selected Tk image
      -- PARAMETERS
      -- Image_Name  - The name of the Tk image which width will be get
      -- Interpreter - Tcl interpreter on which the image which width will be
      --               get. Can be empty. Default value is the default Tcl
      --               interpreter
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the width of the Tk image "myimage" on default Tcl interpreter
      -- Image_Width: constant Natural := Width("myimage");
      -- SEE ALSO
      -- Image.Height
      -- COMMANDS
      -- image width Image_Name
      -- SOURCE
   function Width
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Natural with
      Pre => Image_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Image_Width", Mode => Nominal);
      -- ****
      --## rule on REDUCEABLE_SCOPE

end Tk.Image;
