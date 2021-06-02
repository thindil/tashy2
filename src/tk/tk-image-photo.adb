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

package body Tk.Image.Photo is

   procedure Create
     (Name: String; Options: Photo_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced(Name, Options, Interpreter);
   begin
      null;
   end Create;

   procedure Blank
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced(Name, Interpreter);
   begin
      null;
   end Blank;

   procedure Configure
     (Name: String; Options: Photo_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced(Name, Options, Interpreter);
   begin
      null;
   end Configure;

   function Get_Options
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Photo_Options is
      pragma Unreferenced(Name, Interpreter);
   begin
      return Photo_Options'(Photo_Format => PNG, others => <>);
   end Get_Options;

   procedure Copy
     (Destination_Image, Source_Image: String; From, To: Dimensions_Type;
      Shrink: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced
        (Destination_Image, Source_Image, From, To, Shrink, Interpreter);
   begin
      null;
   end Copy;

   function Get_Data
     (Name: String; Background: Tcl_String := Null_Tcl_String;
      Format: Photo_Formats := OTHER; From: Dimensions_Type := (others => <>);
      Grayscale: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tcl_String is
      pragma Unreferenced
        (Name, Background, Format, From, Grayscale, Interpreter);
   begin
      return Null_Tcl_String;
   end Get_Data;

   function Get_Color
     (Name: String; X, Y: Natural;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Color_Type is
      pragma Unreferenced(Name, X, Y, Interpreter);
   begin
      return (255, 255, 255);
   end Get_Color;

   procedure Put_Data
     (Name: String; Data: Tcl_String; Format: Photo_Formats := OTHER;
      To: Dimensions_Type := (0, 0, -1, -1);
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced(Name, Data, Format, To, Interpreter);
   begin
      null;
   end Put_Data;

   procedure Read
     (Name: String; FileName: Tcl_String; Format: Photo_Formats := OTHER;
      From: Dimensions_Type := (0, 0, -1, -1); Shrink: Boolean := False;
      To: Point_Position := (0, 0);
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced
        (Name, FileName, Format, From, Shrink, To, Interpreter);
   begin
      null;
   end Read;

   procedure Redither
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced(Name, Interpreter);
   begin
      null;
   end Redither;

   function Get_Transparency
     (Name: String; X, Y: Natural;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Boolean is
      pragma Unreferenced(Name, X, Y, Interpreter);
   begin
      return True;
   end Get_Transparency;

   procedure Set_Transparency
     (Name: String; X, Y: Natural; Transparent: Boolean;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced(Name, X, Y, Transparent, Interpreter);
   begin
      null;
   end Set_Transparency;

   procedure Write
     (Name: String; FileName: Tcl_String;
      Background: Tcl_String := Null_Tcl_String;
      Format: Photo_Formats := OTHER; From: Dimensions_Type := (0, 0, -1, -1);
      Grayscale: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      pragma Unreferenced
        (Name, FileName, Background, Format, Grayscale, Interpreter);
   begin
      null;
   end Write;

end Tk.Image.Photo;
