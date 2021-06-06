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

with Ada.Strings.Unbounded;

package body Tk.Image.Photo is

   -- ****if* Photo/Photo.Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options - Ada Button_Options to convert
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Options_To_String(Options: Photo_Options) return String is
      -- ****
      use Ada.Strings.Unbounded;

      Options_String: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "data", Value => Options.Data,
         Options_String => Options_String);
      Option_Image
        (Name => "format", Value => Options.Format,
         Options_String => Options_String);
      Option_Image
        (Name => "file", Value => Options.File,
         Options_String => Options_String);
      Option_Image
        (Name => "gamma", Value => Options.Gamma,
         Options_String => Options_String);
      Option_Image
        (Name => "height", Value => Options.Height,
         Options_String => Options_String);
      Option_Image
        (Name => "palette", Value => Options.Palette,
         Options_String => Options_String);
      Option_Image
        (Name => "width", Value => Options.Width,
         Options_String => Options_String);
      case Options.Photo_Format is
         when GIF =>
            Option_Image
              (Name => "index", Value => Options.Index,
               Options_String => Options_String);
         when PNG =>
            Option_Image
              (Name => "alpha", Value => Options.Alpha,
               Options_String => Options_String);
         when OTHER =>
            null;
      end case;
      return To_String(Source => Options_String);
   end Options_To_String;

   procedure Create
     (Photo_Image: Tk_Image; Options: Photo_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "image create photo " & Photo_Image &
           Options_To_String(Options => Options),
         Interpreter => Interpreter);
   end Create;

   function Create
     (Options: Photo_Options; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String is
   begin
      return
        Tcl_Eval
          (Tcl_Script =>
             "image create photo" & Options_To_String(Options => Options),
           Interpreter => Interpreter);
   end Create;

   procedure Blank
     (Photo_Image: Tk_Image;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Tcl_Eval
        (Tcl_Script => Photo_Image & " blank", Interpreter => Interpreter);
   end Blank;

   procedure Configure
     (Photo_Image: Tk_Image; Options: Photo_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced(Photo_Image, Options, Interpreter);
   begin
      null;
   end Configure;

   function Get_Options
     (Photo_Image: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Photo_Options is
      pragma Unreferenced(Photo_Image, Interpreter);
   begin
      return Photo_Options'(Photo_Format => PNG, others => <>);
   end Get_Options;

   procedure Copy
     (Destination_Image, Source_Image: Tk_Image; From, To: Dimensions_Type;
      Shrink: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced
        (Destination_Image, Source_Image, From, To, Shrink, Interpreter);
   begin
      null;
   end Copy;

   function Get_Data
     (Photo_Image: Tk_Image; Background: Tcl_String := Null_Tcl_String;
      Format: Photo_Formats := Default_Photo_Format;
      From: Dimensions_Type := Empty_Dimension; Grayscale: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tcl_String is
      pragma Unreferenced
        (Photo_Image, Background, Format, From, Grayscale, Interpreter);
   begin
      return Null_Tcl_String;
   end Get_Data;

   function Get_Color
     (Photo_Image: Tk_Image; X, Y: Natural;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Color_Type is
      pragma Unreferenced(Photo_Image, X, Y, Interpreter);
   begin
      return (Red => 255, Green => 255, Blue => 255);
   end Get_Color;

   procedure Put_Data
     (Photo_Image: Tk_Image; Data: Tcl_String;
      Format: Photo_Formats := Default_Photo_Format;
      To: Dimensions_Type := Empty_Dimension;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced(Photo_Image, Data, Format, To, Interpreter);
   begin
      null;
   end Put_Data;

   procedure Read
     (Photo_Image: Tk_Image; File_Name: Tcl_String;
      Format: Photo_Formats := Default_Photo_Format;
      From: Dimensions_Type := Empty_Dimension; Shrink: Boolean := False;
      To: Point_Position := Empty_Point_Position;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced
        (Photo_Image, File_Name, Format, From, Shrink, To, Interpreter);
   begin
      null;
   end Read;

   procedure Redither
     (Photo_Image: Tk_Image;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced(Photo_Image, Interpreter);
   begin
      null;
   end Redither;

   function Get_Transparency
     (Photo_Image: Tk_Image; X, Y: Natural;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Boolean is
      pragma Unreferenced(Photo_Image, X, Y, Interpreter);
   begin
      return True;
   end Get_Transparency;

   procedure Set_Transparency
     (Photo_Image: Tk_Image; X, Y: Natural; Transparent: Boolean;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced(Photo_Image, X, Y, Transparent, Interpreter);
   begin
      null;
   end Set_Transparency;

   procedure Write
     (Photo_Image: Tk_Image; File_Name: Tcl_String;
      Background: Tcl_String := Null_Tcl_String;
      Format: Photo_Formats := Default_Photo_Format;
      From: Dimensions_Type := Empty_Dimension; Grayscale: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced
        (Photo_Image, File_Name, Background, Format, Grayscale, Interpreter);
   begin
      null;
   end Write;

end Tk.Image.Photo;
