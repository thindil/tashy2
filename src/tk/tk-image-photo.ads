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
   -- ****s* Photo/Photo.Photo_Options
   -- FUNCTION
   -- Data structure for all available options for image photo
   -- OPTIONS
   -- TODO: add file and data
   -- Format  - The format of the image. By default Tk support only png and gif
   --           but extensions can add more formats
   -- Gamma   - The gamma correction for the image. Values below 1 make image
   --           darker, when values above 1 make image lighter
   -- Height  - The height of the image in pixels. 0 mean natural height of the
   --           image
   -- Palette - Palette used to display the image. TODO: replace by 3 element array
   -- Width   - The width of the image in pixels. O mean natural width of the
   --           image
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Photo_Options is new Image_Options with record
      Format: Tcl_String;
      Gamma: Positive_Float;
      Height: Natural := 0;
      Palette: Tcl_String;
      Width: Natural := 0;
   end record;
   -- ****

   type Dimensions_Type is record
      Start_X: Natural;
      Start_Y: Natural;
      End_X: Extended_Natural;
      End_Y: Extended_Natural;
   end record;

   Empty_Dimension: constant Dimensions_Type :=
     (Start_X => 0, Start_Y => 0, End_X => -1, End_Y => -1);

   subtype Color_Range is Natural range 0 .. 255;

   type Color_Type is record
      Red: Color_Range;
      Green: Color_Range;
      Blue: Color_Range;
   end record;

   Black_Color: constant Color_Type := (Red => 0, Green => 0, Blue => 0);

   type Compositing_Types is (NONE, OVERLAY, SET);

   Default_Compositing: constant Compositing_Types := OVERLAY;

   -- ****f* Photo/Photo.Create
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
   -- COMMANDS
   -- image create photo Name Options
   -- SOURCE
   procedure Create
     (Photo_Image: Tk_Image; Options: Photo_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Photo_Image'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Create_Photo", Mode => Nominal);
   -- ****

   function Create
     (Options: Photo_Options; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String with
      Pre => Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Create2_Photo", Mode => Nominal);

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
