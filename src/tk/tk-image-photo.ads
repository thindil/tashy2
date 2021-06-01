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

package Tk.Image.Photo is

   type Photo_Formats is (PNG, GIF, OTHER);

   type Photo_Options(Photo_Format: Photo_Formats) is new Image_Options with
   record
      Format: Tcl_String;
      Gamma: Positive_Float;
      Height: Natural;
      Palette: Tcl_String;
      Width: Natural;
      case Photo_Format is
         when PNG =>
            Alpha: Positive_Float range -1.0 .. 1.0;
         when GIF =>
            Index: Natural;
         when OTHER =>
            null;
      end case;
   end record;

   type Dimensions_Type is record
      Start_X: Natural;
      Start_Y: Natural;
      End_X: Extended_Natural;
      End_Y: Extended_Natural;
   end record;

   subtype Color_Range is Natural range 0 .. 255;

   type Color_Type is record
      Red: Color_Range;
      Green: Color_Range;
      Blue: Color_Range;
   end record;

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
     (Name: String; Options: Photo_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Create_Photo", Mode => Nominal);
   -- ****

   procedure Blank
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Blank_Photo", Mode => Nominal);

   procedure Configure
     (Name: String; Options: Photo_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Configure_Photo", Mode => Nominal);

   function Get_Options
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Photo_Options with
      Pre => Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Options_Photo", Mode => Nominal);

   procedure Copy
     (Destination_Image, Source_Image: String; From, To: Dimensions_Type;
      Shrink: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Destination_Image'Length > 0 and Source_Image'Length > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Copy_Photo", Mode => Nominal);

   function Get_Data
     (Name: String; Background: Tcl_String := Null_Tcl_String;
      Format: Photo_Formats := OTHER; From: Dimensions_Type := (others => <>);
      Grayscale: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tcl_String with
      Pre => Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Data_Photo", Mode => Nominal);

   function Get_Color
     (Name: String; X, Y: Natural;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Color_Type with
      Pre => Name'Length > 0 and Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Get_Color_Photo", Mode => Nominal);

   procedure Put_Data
     (Name: String; Data: Tcl_String; Format: Photo_Formats := OTHER;
      To: Dimensions_Type := (0, 0, -1, -1);
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Name'Length > 0 and Length(Data) > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Put_Data_Photo", Mode => Nominal);

   procedure Read
     (Name: String; FileName: Tcl_String; Format: Photo_Formats := OTHER;
      From: Dimensions_Type := (0, 0, -1, -1); Shrink: Boolean := False;
      To: Point_Position := (0, 0);
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Name'Length > 0 and Length(FileName) > 0 and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Tests_Read_Photo", Mode => Nominal);

end Tk.Image.Photo;
