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

with Tk.Colors; use Tk.Colors;

-- ****h* Image/Bitmap
-- FUNCTION
-- Provide bindings for manipulate Tk images type bitmap
-- SOURCE
package Tk.Image.Bitmap is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****s* Bitmap/Bitmap.Bitmap_Options
   -- FUNCTION
   -- Data structure for all available options for image photo
   -- OPTIONS
   -- Data       - The content of the image as a string. The format of the string
   --              must be one of those for which there is an image file format
   --              handler that will accept string data. If both the Data and
   --              File options are specified, the File option takes precedence.
   -- File       - The name of the file which will be loaded as an image.
   -- Background - The color used for the background of the image. If set as
   --              Empty_Color, the background will be transparent
   -- Foreground - The foreground color of the image
   -- Mask_Data  - The bitmap data used as mask for the image. If both Mask_Data
   --              and Mask_File are set, then Mask_Data option takes precedence.
   -- Mask_File  - The file which content will be used as mask for the image
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Bitmap_Options is new Image_Options with record
      Background: Color_Type := Empty_Color;
      Foreground: Color_Type := Empty_Color;
      Mask_Data: Tcl_String := Null_Tcl_String;
      Mask_File: Tcl_String := Null_Tcl_String;
   end record;
   -- ****

   -- ****f* Bitmap/Bitmap.Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options - Ada Button_Options to convert
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Convert Bitmap_Options to String
   -- Options_String: constant String :=
   --    Options_To_String(Bitmap_Options'(Foreground => Rgb(BLACK), others => <>));
   -- SOURCE
   function Options_To_String(Options: Bitmap_Options) return String with
      Test_Case => (Name => "Test_Options_To_String", Mode => Robustness);
   -- ****

   -- ****f* Bitmap/Bitmap.Create_(procedure)
   -- FUNCTION
   -- Create a new Tk image of bitmap type with the selected name and options
   -- PARAMETERS
   -- Name        - Tk name for the newly created image
   -- Options     - Options for the newly created image
   -- Interpreter - Tcl interpreter on which the image will be created. Can
   --               be empty. Default value is the default Tcl interpreter
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Create the image with name .mybitmap from file mybitmap.bm
   -- Create(".mybitmap", Bitmap_Options'(File => "mybitmap.bm", others => <>));
   -- SEE ALSO
   -- Bitmap.Create_(function)
   -- COMMANDS
   -- image create bitmap Name Options
   -- SOURCE
   procedure Create
     (Bitmap_Image: Tk_Image; Options: Bitmap_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre'Class =>
      (Bitmap_Image'Length > 0
       and then
         Bitmap_Image'Length + Options_To_String(Options => Options)'Length <=
         Long_Long_Integer(Natural'Last) - 21) and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Create_Bitmap", Mode => Nominal);
      -- ****

      -- ****f* Bitmap/Bitmap.Create_(function)
      -- FUNCTION
      -- Create a new Tk image of bitmap type with random name and options
      -- PARAMETERS
      -- Options     - Options for the newly created image
      -- Interpreter - Tcl interpreter on which the image will be created. Can
      --               be empty. Default value is the default Tcl interpreter
      -- RESULT
      -- The Tk_Image with the name of the newly created image
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Create the image with random name from file mybitmap.bm
      -- My_Bitmap: constant Tk_Image := Create(Bitmap_Options'(File => "mybitmap.bm", others => <>));
      -- SEE ALSO
      -- Bitmap.Create_(procedure)
      -- COMMANDS
      -- image create bitmap Options
      -- SOURCE
   function Create
     (Options: Bitmap_Options; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Image with
      Pre'Class => Options_To_String(Options => Options)'Length <=
      Natural'Last - 19 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Create2_Bitmap", Mode => Nominal);
      -- ****

      -- ****f* Bitmap/Bitmap.Configure
      -- FUNCTION
      -- Set the selected options for the selected bitmap image
      -- PARAMETERS
      -- Bitmap_Image - The bitmap image which will options will be changed
      -- Options     - The record with image options to change
      -- Interpreter - Tcl interpreter on which the image will be configured.
      --               Can be empty. Default value is the default Tcl
      --               interpreter
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set My_Image format to GIF on default Tcl interpreter
      -- Configure(My_Image, Bitmap_Options'(Format => To_Tcl_String("gif"), others => <>));
      -- COMMANDS
      -- Bitmap_Image configure Options
      -- SOURCE
   procedure Configure
     (Bitmap_Image: Tk_Image; Options: Bitmap_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre'Class => Bitmap_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Configure_Bitmap", Mode => Nominal);
      -- ****

      -- ****f* Bitmap/Bitmap.Get_Option
      -- FUNCTION
      -- Get the value of the selected option of the selected bitmap image.
      -- It is recommended to use Bitmap.Get_Options instead as it return
      -- properly converted the selected option value.
      -- PARAMETERS
      -- Bitmap_Image - The bitmap image which option will be get
      -- Name        - The name of the option to get
      -- Interpreter - Tcl interpreter on which the image option will be get.
      --               Can be empty. Default value is the default Tcl
      --               interpreter
      -- RESULT
      -- The Ada String with the value of the selected option for the selected
      -- bitmap image
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the data of image My_Image on default Tcl interpreter
      -- Data: constant String := Get_Option(My_Image, "data");
      -- SEE ALSO
      -- Bitmap.Get_Options
      -- COMMANDS
      -- Bitmap_Image cget Name
      -- SOURCE
   function Get_Option
     (Bitmap_Image: Tk_Image; Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return String with
      Pre => Bitmap_Image'Length > 0 and Name'Length > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Option_Bitmap", Mode => Nominal);
      -- ****

      -- ****f* Bitmap/Bitmap.Get_Options
      -- FUNCTION
      -- Get all options of the selected bitmap image
      -- PARAMETERS
      -- Bitmap_Image - The bitmap image which options will be get
      -- Interpreter - Tcl interpreter on which the image options will be get.
      --               Can be empty. Default value is the default Tcl
      --               interpreter
      -- RESULT
      -- The record Bitmap_Options with all options of the selected bitmap image
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the options of image My_Image on default Tcl interpreter
      -- Options: constant Bitmap_Options := Get_Options(My_Image);
      -- SEE ALSO
      -- Bitmap.Get_Option
      -- COMMANDS
      -- Bitmap_Image configure
      -- SOURCE
   function Get_Options
     (Bitmap_Image: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Bitmap_Options with
      Pre'Class => Bitmap_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Options_Bitmap", Mode => Nominal);
      -- ****

      -- ****d* Bitmap/Bitmap.Default_Bitmap_Options
      -- FUNCTION
      -- Default values for the bitmap image
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Bitmap_Options: constant Bitmap_Options :=
     Bitmap_Options'(others => <>);
     -- ****
     --## rule on REDUCEABLE_SCOPE

end Tk.Image.Bitmap;
