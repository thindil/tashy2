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

-- ****h* Image/Photo
-- FUNCTION
-- Provide bindings for manipulate Tk images type photo
-- SOURCE
package Tk.Image.Photo is

   --## rule off REDUCEABLE_SCOPE
   -- ****t* Photo/Photo.Shades_Range
   -- FUNCTION
   -- Type used to set the photo image palette values
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Shades_Range is Integer range -1 .. Integer'Last;
   -- ****

   -- ****s* Photo/Photo.Shades_Type
   -- FUNCTION
   -- Type used to set the photo image palette
   -- OPTIONS
   -- Grayscale - If True, the palette is in grayscale (only one value).
   --             Default value is False (RGB palette)
   -- Gray      - If palette is grayscale, it is a number of shades of gray to
   --             use
   -- Red       - If palette is color, it is a number of shades of red to use
   -- Green     - If palette is color, it is a number of shades of green to use
   -- Blue      - If palette is color, it is a number of shades of blue to use
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Shades_Type(Grayscale: Boolean := False) is record
      case Grayscale is
         when True =>
            Gray: Shades_Range;
         when False =>
            Red: Shades_Range;
            Green: Shades_Range;
            Blue: Shades_Range;
      end case;
   end record;
   -- ****

   -- ****d* Photo/Photo.Empty_Shades
   -- FUNCTION
   -- Empty value for the photo images shades (no shades)
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Shades: constant Shades_Type := (Grayscale => True, Gray => -1);
   -- ****

   -- ****s* Photo/Photo.Photo_Options
   -- FUNCTION
   -- Data structure for all available options for image photo
   -- OPTIONS
   -- Data    - The content of the image as a string. The format of the string
   --           must be one of those for which there is an image file format
   --           handler that will accept string data. If both the Data and
   --           File options are specified, the File option takes precedence.
   -- File    - The name of the file which will be loaded as an image.
   -- Format  - The format of the image. By default Tk support only png and gif
   --           but extensions can add more formats
   -- Gamma   - The gamma correction for the image. Values below 1 make image
   --           darker, when values above 1 make image lighter
   -- Height  - The height of the image in pixels. 0 mean natural height of the
   --           image
   -- Palette - Palette used to display the image.
   -- Width   - The width of the image in pixels. O mean natural width of the
   --           image
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Photo_Options is new Image_Options with record
      Format: Tcl_String;
      Gamma: Positive_Float;
      Height: Natural := 0;
      Palette: Shades_Type;
      Width: Natural := 0;
   end record;
   -- ****

   -- ****s* Photo/Photo.Dimensions_Type
   -- FUNCTION
   -- Data structure for setting various dimension related options for the image
   -- photo
   -- OPTIONS
   -- Start_X - The X coordinate of starting point of dimension in pixels
   -- Start_Y - The Y coordinate of starting point of dimension in pixels
   -- End_X   - The X coordinate of end point of dimension in pixels
   -- End_Y   - The Y coordinate of end point of dimension in pixels
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Dimensions_Type is record
      Start_X: Natural;
      Start_Y: Natural;
      End_X: Extended_Natural;
      End_Y: Extended_Natural;
   end record;
   -- ****

   -- ****d* Photo/Photo.Empty_Dimension
   -- FUNCTION
   -- Empty values for dimension size
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Dimension: constant Dimensions_Type :=
     (Start_X => 0, Start_Y => 0, End_X => -1, End_Y => -1);
   -- ****

   -- ****t* Photo/Photo.Compositing_Types
   -- FUNCTION
   -- Type of compositing rule used in the photo image used when copying one
   -- image to another
   -- OPTIONS
   -- NONE    - Not set, used mostly to set default value for compositing
   -- OVERLAY - When set, old content of the image is used as background
   -- SET     - When set, delete old content of the image and replace by the
   --           new content
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Compositing_Types is (NONE, OVERLAY, SET);
   -- ****

   -- ****d* Photo/Photo.Default_Compositing
   -- FUNCTION
   -- Default type of compositing used when copying one image to another
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Compositing: constant Compositing_Types := OVERLAY;
-- ****

   -- ****t* Photo/Photo.Color_Range
   -- FUNCTION
   -- Type used to set the photo image colors values
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Color_Range is Integer range -1 .. 255;
   -- ****

   -- ****s* Tk.Image.Photo/Color_Type
   -- FUNCTION
   -- Data structure for setting the photo image colors values
   -- OPTIONS
   -- Red   - The amount of red color in the image
   -- Green - The amount of green color in the image
   -- Blue  - The amount of blue color in the image
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Color_Type is record
      Red: Color_Range;
      Green: Color_Range;
      Blue: Color_Range;
   end record;
   -- ****

   -- ****d* Photo/Photo.Empty_Color
   -- FUNCTION
   -- Empty color, used mostly to set default values for colors in the photo
   -- image
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Color: constant Color_Type := (Red => -1, Green => -1, Blue => -1);
   -- ****

   -- ****f* Photo/Photo.Create_(procedure)
   -- FUNCTION
   -- Create a new Tk image of photo type with the selected name and options
   -- PARAMETERS
   -- Name        - Tk name for the newly created image
   -- Options     - Options for the newly created image
   -- Interpreter - Tcl interpreter on which the image will be created. Can
   --               be empty. Default value is the default Tcl interpreter
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Create the image with name .myimage from file myimage.png
   -- Create(".myimage", Photo_Options'(Photo_Format => PNG, File => "myimage.png", others => <>));
   -- SEE ALSO
   -- Photo.Create_(function)
   -- COMMANDS
   -- image create photo Name Options
   -- SOURCE
   procedure Create
     (Photo_Image: Tk_Image; Options: Photo_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Create_Photo", Mode => Nominal);
      -- ****

      -- ****f* Photo/Photo.Create_(function)
      -- FUNCTION
      -- Create a new Tk image of photo type with random name and options
      -- PARAMETERS
      -- Options     - Options for the newly created image
      -- Interpreter - Tcl interpreter on which the image will be created. Can
      --               be empty. Default value is the default Tcl interpreter
      -- RESULT
      -- The Tk_Image with the name of the newly created image
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Create the image with random name from file myimage.png
      -- My_Image: constant Tk_Image := Create(Photo_Options'(Photo_Format => PNG, File => "myimage.png", others => <>));
      -- SEE ALSO
      -- Photo.Create_(procedure)
      -- COMMANDS
      -- image create photo Options
      -- SOURCE
   function Create
     (Options: Photo_Options; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Image with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Create2_Photo", Mode => Nominal);
      -- ****

      -- ****f* Photo/Photo.Blank
      -- FUNCTION
      -- Blank the image so it don't have any data and will be displayed as
      -- transparent
      -- PARAMETERS
      -- Photo_Image - The image which will be blanked
      -- Interpreter - Tcl interpreter on which the image will be blanked. Can
      --               be empty. Default value is the default Tcl interpreter
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Blank the image My_Image on the default Tcl interpreter
      -- Blank(My_Image);
      -- COMMANDS
      -- Photo_Image blank
      -- SOURCE
   procedure Blank
     (Photo_Image: Tk_Image;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Blank_Photo", Mode => Nominal);
      -- ****

      -- ****f* Photo/Photo.Configure
      -- FUNCTION
      -- Set the selected options for the selected photo image
      -- PARAMETERS
      -- Photo_Image - The photo image which will options will be changed
      -- Options     - The record with image options to change
      -- Interpreter - Tcl interpreter on which the image will be configured.
      --               Can be empty. Default value is the default Tcl
      --               interpreter
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set My_Image format to GIF on default Tcl interpreter
      -- Configure(My_Image, Photo_Options'(Format => To_Tcl_String("gif"), others => <>));
      -- COMMANDS
      -- Photo_Image configure Options
      -- SOURCE
   procedure Configure
     (Photo_Image: Tk_Image; Options: Photo_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Configure_Photo", Mode => Nominal);
      -- ****

      -- ****f* Photo/Photo.Get_Option
      -- FUNCTION
      -- Get the value of the selected option of the selected photo image.
      -- It is recommended to use Photo.Get_Options instead as it return
      -- properly converted the selected option value.
      -- PARAMETERS
      -- Photo_Image - The photo image which option will be get
      -- Name        - The name of the option to get
      -- Interpreter - Tcl interpreter on which the image option will be get.
      --               Can be empty. Default value is the default Tcl
      --               interpreter
      -- RESULT
      -- The Ada String with the value of the selected option for the selected
      -- photo image
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the data of image My_Image on default Tcl interpreter
      -- Data: constant String := Get_Option(My_Image, "data");
      -- SEE ALSO
      -- Photo.Get_Options
      -- COMMANDS
      -- Photo_Image cget Name
      -- SOURCE
   function Get_Option
     (Photo_Image: Tk_Image; Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return String with
      Pre => Photo_Image'Length > 0 and Name'Length > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Option_Photo", Mode => Nominal);
      -- ****

      -- ****f* Photo/Photo.Get_Options
      -- FUNCTION
      -- Get all options of the selected photo image
      -- PARAMETERS
      -- Photo_Image - The photo image which options will be get
      -- Interpreter - Tcl interpreter on which the image options will be get.
      --               Can be empty. Default value is the default Tcl
      --               interpreter
      -- RESULT
      -- The record Photo_Options with all options of the selected photo image
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the options of image My_Image on default Tcl interpreter
      -- Options: constant Photo_Options := Get_Options(My_Image);
      -- SEE ALSO
      -- Photo.Get_Option
      -- COMMANDS
      -- Photo_Image configure
      -- SOURCE
   function Get_Options
     (Photo_Image: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Photo_Options with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Options_Photo", Mode => Nominal);
      -- ****

      -- ****d* Photo/Photo.Default_Photo_Options
      -- FUNCTION
      -- Default values for the photo image
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Photo_Options: constant Photo_Options :=
     Photo_Options'(others => <>);
     -- ****

     -- ****f* Photo/Photo.Copy
     -- FUNCTION
     -- Copy a region of one photo image to the region of the second photo
     -- image
     -- PARAMETERS
     -- Destination_Image - The destination photo image to which the selected
     --                     region will be copied
     -- Source_Image      - The source image from which the selected region
     --                     will be copied
     -- From              - The region in Source_Image which will be copied.
     --                     If is empty, then the whole Source_Image will be
     --                     copied.
     -- To                - The region in Destination_Image in which the source
     --                     region will be copied. If empty, then the same as
     --                     the source image region
     -- Shrink            - If True, the size of destination image should be
     --                     reduced
     -- Zoom              - Specify that the source region should be magnified
     --                     by X and Y values. If empty, don't zoom source image
     -- Sub_Sample        - Reduce source region by X and Y values. If empty,
     --                     don't resize source image.
     -- Compositing_Rule  - Specify how transparent pixels should be combined
     --                     the destination image.
     -- Interpreter       - Tcl interpreter on which the image options will be
     --                     copied. Can be empty. Default value is the default Tcl
     --                     interpreter. Both images must be on this same
     --                     interpreter.
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
     -- -- Copy the whole My_Image to My_New_Image on the default Tcl intepreter
     -- Copy(My_New_Image, My_Image);
     -- COMMANDS
     -- Destination_Image copy Source_Image ?From? ?To? ?Shrink? ?Zoom? ?Sub_Sample? ?Compositing_Rule?
     -- SOURCE
   procedure Copy
     (Destination_Image, Source_Image: Tk_Image;
      From, To: Dimensions_Type := Empty_Dimension; Shrink: Boolean := False;
      Zoom, Sub_Sample: Point_Position := Empty_Point_Position;
      Compositing_Rule: Compositing_Types := NONE;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Destination_Image'Length > 0 and Source_Image'Length > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Copy_Photo", Mode => Nominal);
      -- ****

      -- ****f* Photo/Photo.Get_Data
      -- FUNCTION
      -- Get the data of the selected photo image
      -- PARAMETERS
      -- Photo_Image - The photo image which data will be get
      -- Background  - If specified as color, the data will not contain any
      --               transparency information. It will be replaced by
      --               the selected color. Can be empty.
      -- Format      - The format of photo image used to get data. Can be
      --               empty.
      -- From        - The image region from which the data will be get. Can
      --               be empty.
      -- Grayscale   - If True, all pixels data will not contain information
      --               about colors. Default value is False.
      -- Interpreter - Tcl interpreter on which the image data will be get.
      --               Can be empty. Default value is the default Tcl
      --               interpreter.
      -- RESULT
      -- The Tcl_String with the selected data of the selected photo image
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the whole data of the image My_Image on default Tcl interpreter
      -- Image_Data: constant Tcl_String := Get_Data(My_Image);
      -- SEE ALSO
      -- Photo.Put_Data
      -- COMMANDS
      -- Photo_Image data ?Background? ?Format? ?From? ?Grayscale?
      -- SOURCE
   function Get_Data
     (Photo_Image: Tk_Image; Background, Format: Tcl_String := Null_Tcl_String;
      From: Dimensions_Type := Empty_Dimension; Grayscale: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tcl_String with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Data_Photo", Mode => Nominal);
      -- ****

      -- ****f* Photo/Photo.Get_Color
      -- FUNCTION
      -- Get the color of the selected pixel in the selected photo image
      -- PARAMETERS
      -- Photo_Image - The photo image which the selected pixel color will be
      --               get
      -- X           - The X coordinate of the pixel
      -- Y           - The Y coordinate of the pixel
      -- Interpreter - Tcl interpreter on which the image data will be get.
      --               Can be empty. Default value is the default Tcl
      --               interpreter.
      -- RESULT
      -- The Color_Type record with information about the color of the selected
      -- pixel in the selected photo image
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the color of pixel at (1, 1) in My_Image image on the default Tcl interpreter
      -- Color: constant Color_Type := Get_Color(My_Image, 1, 1);
      -- COMMANDS
      -- Photo_Image get X Y
      -- SOURCE
   function Get_Color
     (Photo_Image: Tk_Image; X, Y: Natural;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Color_Type with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Color_Photo", Mode => Nominal);
      -- ****

      -- ****f* Photo/Photo.Put_Data
      -- FUNCTION
      -- Set the pixels in the selected photo image to the selected data
      -- PARAMETERS
      -- Photo_Image - The photo image which pixels will be set
      -- Data        - The data to set for the pixels in the photo image
      -- Format      - The image format which will be used to set the data.
      --               Can be empty. Default value is empty.
      -- To          - The image region in which pixels will be set. If not set,
      --               then the whole image will be set. Default value is empty.
      -- Interpreter - Tcl interpreter on which the image pixels data will be
      --               set. Can be empty. Default value is the default Tcl
      --               interpreter.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the whole image My_Image as red rectangle on the default Tcl interpreter
      -- Put_Data(My_Image, To_Tcl_String("red"));
      -- COMMANDS
      -- Photo_Image put Data ?Format? ?To?
      -- SOURCE
   procedure Put_Data
     (Photo_Image: Tk_Image; Data: Tcl_String;
      Format: Tcl_String := Null_Tcl_String;
      To: Dimensions_Type := Empty_Dimension;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Length(Source => Data) > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Put_Data_Photo", Mode => Nominal);
      -- ****

      -- ****f* Photo/Photo.Read
      -- FUNCTION
      -- Read the image data from the selected file into the selected image
      -- PARAMETERS
      -- Photo_Image - The photo image in which the data will be loaded
      -- File_Name   - The full path of the file which will be loaded into
      --               image
      -- Format      - The image format used to load the data. Can be empty.
      --               Default value is empty.
      -- From        - The region of the image from file which will be loaded
      --               into photo image. If not set, then entire file data will
      --               be loaded into the image
      -- Shrink      - If True, photo image will be reduced if necessary to fit
      --               the loaded image. Default value is False.
      -- To          - Top left corner of region inside which the data will be
      --               loaded. Can be empty. Default value is 0,0 (top left corner
      --               of the image).
      -- Interpreter - Tcl interpreter on which the image will be loaded. Can be
      --               empty. Default value is the default Tcl interpreter.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Load the file myimage.png into image My_Image on the default Tcl interpreter
      -- Read(My_Image, To_Tcl_String("myimage.png"));
      -- SEE ALSO
      -- Photo.Write
      -- COMMANDS
      -- Photo_Image read File_Name ?Format? ?From? ?Shrink? ?To?
      -- SOURCE
   procedure Read
     (Photo_Image: Tk_Image; File_Name: Tcl_String;
      Format: Tcl_String := Null_Tcl_String;
      From: Dimensions_Type := Empty_Dimension; Shrink: Boolean := False;
      To: Point_Position := Empty_Point_Position;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Length(Source => File_Name) > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Read_Photo", Mode => Nominal);
      -- ****

      -- ****f* Photo/Photo.Redither
      -- FUNCTION
      -- Recalculate and redraw the selected dithered image
      -- PARAMETERS
      -- Photo_Image - The image which will be redithered
      -- Interpreter - Tcl interpreter on which the image will be redithered.
      --               Can be empty. Default value is the default Tcl
      --               interpreter.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Redither image My_Image on the default Tcl interpreter
      -- Redither(My_Image);
      -- COMMANDS
      -- Photo_Image redither
      -- SOURCE
   procedure Redither
     (Photo_Image: Tk_Image;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Redither_Photo", Mode => Nominal);
      -- ****

      -- ****f* Photo/Photo.Get_Transparency
      -- FUNCTION
      -- Check if the selected pixel in the selected image is transparent or
      -- not
      -- PARAMETERS
      -- Photo_Image - The photo image which tranparency data for the pixel
      --               will be get
      -- X           - The X coordinate of the pixel to get transparency
      -- Y           - The Y coordinate of the pixel to get transparency
      -- Interpreter - Tcl interpreter on which the image data will be get.
      --               Can be empty. Default value is the default Tcl
      --               interpreter.
      -- RESULT
      -- If the selected pixel in photo image is transparent, return True.
      -- Otherwise return False.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the transparency status of pixel at (10, 12) in My_Image on the default Tcl interpreter
      -- Is_Transparent: constant Boolean := Get_Transparency(My_Image, 10, 12);
      -- SEE ALSO
      -- Photo.Set_Transparency
      -- COMMANDS
      -- Photo_Image transparency get X Y
      -- SOURCE
   function Get_Transparency
     (Photo_Image: Tk_Image; X, Y: Natural;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Boolean with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Transparency_Photo", Mode => Nominal);
      -- ****

      -- ****f* Photo/Photo.Set_Transparency
      -- FUNCTION
      -- Set the transparency status for the selected pixel in the selected
      -- photo image
      -- PARAMETERS
      -- Photo_Image - The photo image in which the pixel transparency will be
      --               set
      -- X           - The X coordinate of the pixel to set
      -- Y           - The Y coordinate of the pixel to set
      -- Transparent - If True, the selected pixel will be transparent,
      --               otherwise opaque.
      -- Interpreter - Tcl interpreter on which the transparency will be set.
      --               Can be empty. Default value is the default Tcl
      --               interpreter.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set pixel at (13, 56) in My_Image on the default Tcl interpeter to transparent
      -- Set_Transparency(My_Image, 13, 56, True);
      -- SEE ALSO
      -- Photo.Get_Transparency
      -- COMMANDS
      -- Photo_Image transparency set X Y Transparent
      -- SOURCE
   procedure Set_Transparency
     (Photo_Image: Tk_Image; X, Y: Natural; Transparent: Boolean;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Set_Transparency_Photo", Mode => Nominal);
      -- ****

      -- ****f* Photo/Photo.Write
      -- FUNCTION
      -- Write the selected photo image data to the selected file
      -- PARAMETERS
      -- Photo_Image - The photo image which data will be written
      -- File_Name   - The absolute or relative path to the file where data
      --               will be written
      -- Background  - If specified, all transparent pixels color will be
      --               replaced with this color. Can be empty. Default value
      --               is empty.
      -- Format      - The image format used to write the data. Can be empty.
      --               Default value is empty. If not entered, it is guessed
      --               from the File_Name extension
      -- From        - The image region which will be written to file. Can be
      --               empty. Default value is the whole image
      -- Grayscale   - If True, the data will not contain color information.
      --               All pixels will be transformed to grayscale.
      -- Interpreter - Tcl interpreter from which the image will be written.
      --               Can be empty. Default value is the default Tcl
      --               interpreter.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Save the whole My_Image image on the default Tcl interpreter to file myimage.png
      -- Write(My_Image, To_Tcl_String("myimage.png"));
      -- SEE ALSO
      -- COMMANDS
      -- SOURCE
   procedure Write
     (Photo_Image: Tk_Image; File_Name: Tcl_String;
      Background, Format: Tcl_String := Null_Tcl_String;
      From: Dimensions_Type := Empty_Dimension; Grayscale: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Length(Source => File_Name) > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Write_Photo", Mode => Nominal);
      -- ****

   --## rule on REDUCEABLE_SCOPE

end Tk.Image.Photo;
