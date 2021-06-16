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

   procedure Blank
     (Photo_Image: Tk_Image;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Blank_Photo", Mode => Nominal);

   procedure Configure
     (Photo_Image: Tk_Image; Options: Photo_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Configure_Photo", Mode => Nominal);

   function Get_Option
     (Photo_Image: Tk_Image; Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return String with
      Pre => Photo_Image'Length > 0 and Name'Length > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Option_Photo", Mode => Nominal);

   function Get_Options
     (Photo_Image: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Photo_Options with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Options_Photo", Mode => Nominal);

   Default_Photo_Options: constant Photo_Options :=
     Photo_Options'(others => <>);

   procedure Copy
     (Destination_Image, Source_Image: Tk_Image;
      From, To: Dimensions_Type := Empty_Dimension; Shrink: Boolean := False;
      Zoom, Sub_Sample: Point_Position := Empty_Point_Position;
      Compositing_Rule: Compositing_Types := NONE;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Destination_Image'Length > 0 and Source_Image'Length > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Copy_Photo", Mode => Nominal);

   function Get_Data
     (Photo_Image: Tk_Image; Background, Format: Tcl_String := Null_Tcl_String;
      From: Dimensions_Type := Empty_Dimension; Grayscale: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tcl_String with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Data_Photo", Mode => Nominal);

   function Get_Color
     (Photo_Image: Tk_Image; X, Y: Natural;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Color_Type with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Color_Photo", Mode => Nominal);

   procedure Put_Data
     (Photo_Image: Tk_Image; Data: Tcl_String;
      Format: Tcl_String := Null_Tcl_String;
      To: Dimensions_Type := Empty_Dimension;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Length(Source => Data) > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Put_Data_Photo", Mode => Nominal);

   procedure Read
     (Photo_Image: Tk_Image; File_Name: Tcl_String;
      Format: Tcl_String := Null_Tcl_String;
      From: Dimensions_Type := Empty_Dimension; Shrink: Boolean := False;
      To: Point_Position := Empty_Point_Position;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Length(Source => File_Name) > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Read_Photo", Mode => Nominal);

   procedure Redither
     (Photo_Image: Tk_Image;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Redither_Photo", Mode => Nominal);

   function Get_Transparency
     (Photo_Image: Tk_Image; X, Y: Natural;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Boolean with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Transparency_Photo", Mode => Nominal);

   procedure Set_Transparency
     (Photo_Image: Tk_Image; X, Y: Natural; Transparent: Boolean;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Set_Transparency_Photo", Mode => Nominal);

   procedure Write
     (Photo_Image: Tk_Image; File_Name: Tcl_String;
      Background, Format: Tcl_String := Null_Tcl_String;
      From: Dimensions_Type := Empty_Dimension; Grayscale: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Length(Source => File_Name) > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Write_Photo", Mode => Nominal);

   --## rule on REDUCEABLE_SCOPE

end Tk.Image.Photo;
