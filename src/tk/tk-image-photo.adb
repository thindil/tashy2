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

with Ada.Characters.Handling;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Tk.Image.Photo is

   function Options_To_String(Options: Photo_Options) return String is
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
      if Options.Palette /= Empty_Shades then
         if Options.Palette.Grayscale then
            Append
              (Source => Options_String,
               New_Item =>
                 " -palette" & Shades_Range'Image(Options.Palette.Gray));
         else
            Append
              (Source => Options_String,
               New_Item =>
                 " -palette" & Shades_Range'Image(Options.Palette.Red) & "/" &
                 Trim
                   (Source => Shades_Range'Image(Options.Palette.Green),
                    Side => Left) &
                 "/" &
                 Trim
                   (Source => Shades_Range'Image(Options.Palette.Blue),
                    Side => Left));
         end if;
      end if;
      Option_Image
        (Name => "width", Value => Options.Width,
         Options_String => Options_String);
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
      return Tk_Image is
   begin
      return
        Tcl_Eval
          (Tcl_Script =>
             "image create photo" & Options_To_String(Options => Options),
           Interpreter => Interpreter)
          .Result;
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
   begin
      Tcl_Eval
        (Tcl_Script =>
           Photo_Image & " configure " & Options_To_String(Options => Options),
         Interpreter => Interpreter);
   end Configure;

   function Get_Option
     (Photo_Image: Tk_Image; Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
      Result_List: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => Photo_Image & " configure -" & Name,
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   begin
      if Result_List'Length = 0 then
         return "";
      end if;
      return To_Ada_String(Source => Result_List(Result_List'Last));
   end Get_Option;

   function Get_Options
     (Photo_Image: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Photo_Options is
      Result: constant String :=
        Get_Option
          (Photo_Image => Photo_Image, Name => "palette",
           Interpreter => Interpreter);
      Slash_Index: constant Natural := Index(Source => Result, Pattern => "/");
   begin
      return Options: Photo_Options := Default_Photo_Options do
         Options.Data :=
           To_Tcl_String
             (Source =>
                Get_Option
                  (Photo_Image => Photo_Image, Name => "data",
                   Interpreter => Interpreter));
         Options.File :=
           To_Tcl_String
             (Source =>
                Get_Option
                  (Photo_Image => Photo_Image, Name => "file",
                   Interpreter => Interpreter));
         Options.Format :=
           To_Unbounded_Variable_Name
             (Source =>
                Get_Option
                  (Photo_Image => Photo_Image, Name => "format",
                   Interpreter => Interpreter));
         Options.Gamma :=
           Positive_Float'Value
             (Get_Option
                (Photo_Image => Photo_Image, Name => "gamma",
                 Interpreter => Interpreter));
         Options.Height :=
           Natural'Value
             (Get_Option
                (Photo_Image => Photo_Image, Name => "height",
                 Interpreter => Interpreter));
         Options.Width :=
           Natural'Value
             (Get_Option
                (Photo_Image => Photo_Image, Name => "width",
                 Interpreter => Interpreter));
         --## rule off IMPROPER_INITIALIZATION
         Get_Palette_Block :
         declare
            Result_Palette: Shades_Type
              (Grayscale => (if Slash_Index = 0 then True else False));
         begin
            if Slash_Index = 0 then
               if Result'Length > 0 then
                  Result_Palette.Gray := Shades_Range'Value(Result);
               else
                  Result_Palette.Gray := -1;
               end if;
            else
               Result_Palette.Red :=
                 Shades_Range'Value(Result(Result'First .. Slash_Index - 1));
               Result_Palette.Green :=
                 Shades_Range'Value
                   (Result
                      (Slash_Index + 1 ..
                           Index
                             (Source => Result, Pattern => "/",
                              From => Slash_Index + 1) -
                           1));
               Result_Palette.Blue :=
                 Shades_Range'Value
                   (Result
                      (Index
                           (Source => Result, Pattern => "/",
                            Going => Backward) +
                         1 ..
                           Result'Last));
            end if;
            Options.Palette := Result_Palette;
         end Get_Palette_Block;
         --## rule on IMPROPER_INITIALIZATION
      end return;
   end Get_Options;

   procedure Dimension_To_String
     (Name: String; Value: Dimensions_Type;
      Options: in out Unbounded_String) is
   begin
      if Value /= Empty_Dimension then
         Append
           (Source => Options,
            New_Item =>
              " -" & Name & Natural'Image(Value.Start_X) &
              Natural'Image(Value.Start_Y));
         if Value.End_X > -1 then
            Append
              (Source => Options,
               New_Item =>
                 Extended_Natural'Image(Value.End_X) &
                 Extended_Natural'Image(Value.End_Y));
         end if;
      end if;
   end Dimension_To_String;

   procedure Copy
     (Destination_Image, Source_Image: Tk_Image;
      From, To: Dimensions_Type := Empty_Dimension; Shrink: Boolean := False;
      Zoom, Sub_Sample: Point_Position := Empty_Point_Position;
      Compositing_Rule: Compositing_Types := NONE;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      use Ada.Characters.Handling;

      Options: Unbounded_String := Null_Unbounded_String;
   begin
      Dimension_To_String(Name => "from", Value => From, Options => Options);
      Dimension_To_String(Name => "to", Value => To, Options => Options);
      Option_Image
        (Name => "shrink", Value => Shrink, Options_String => Options);
      Option_Image(Name => "zoom", Value => Zoom, Options_String => Options);
      Option_Image
        (Name => "subsample", Value => Sub_Sample, Options_String => Options);
      if Compositing_Rule /= NONE then
         Append
           (Source => Options,
            New_Item =>
              " -compositingrule " &
              To_Lower(Item => Compositing_Types'Image(Compositing_Rule)));
      end if;
      Tcl_Eval
        (Tcl_Script =>
           Destination_Image & " copy " & Source_Image &
           To_String(Source => Options),
         Interpreter => Interpreter);
   end Copy;

   function Get_Data
     (Photo_Image: Tk_Image;
      Background, Format: Unbounded_Variable_Name :=
        Empty_Unbounded_Variable_Name;
      From: Dimensions_Type := Empty_Dimension; Grayscale: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tcl_String is
      Options: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "background", Value => Background, Options_String => Options);
      Option_Image
        (Name => "format", Value => Format, Options_String => Options);
      Dimension_To_String(Name => "from", Value => From, Options => Options);
      Option_Image
        (Name => "grayscale", Value => Grayscale, Options_String => Options);
      return
        To_Tcl_String
          (Source =>
             Tcl_Eval
               (Tcl_Script =>
                  Photo_Image & " data" & To_String(Source => Options),
                Interpreter => Interpreter)
               .Result);
   end Get_Data;

   function Get_Color
     (Photo_Image: Tk_Image; X, Y: Natural;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Color_Type is
      Result_List: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script =>
                  Photo_Image & " get" & Natural'Image(X) & Natural'Image(Y),
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   begin
      return
        (Red => Color_Range'Value(To_Ada_String(Source => Result_List(1))),
         Green => Color_Range'Value(To_Ada_String(Source => Result_List(2))),
         Blue => Color_Range'Value(To_Ada_String(Source => Result_List(3))));
   end Get_Color;

   procedure Put_Data
     (Photo_Image: Tk_Image; Data: Tcl_String;
      Format: Unbounded_Variable_Name := Empty_Unbounded_Variable_Name;
      To: Dimensions_Type := Empty_Dimension;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      Options: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "format", Value => Format, Options_String => Options);
      Dimension_To_String(Name => "to", Value => To, Options => Options);
      Tcl_Eval
        (Tcl_Script =>
           Photo_Image & " put " & To_String(Source => Data) & " " &
           To_String(Source => Options),
         Interpreter => Interpreter);
   end Put_Data;

   procedure Read
     (Photo_Image: Tk_Image; File_Name: Tcl_String;
      Format: Unbounded_Variable_Name := Empty_Unbounded_Variable_Name;
      From: Dimensions_Type := Empty_Dimension; Shrink: Boolean := False;
      To: Point_Position := Empty_Point_Position;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      Options: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "format", Value => Format, Options_String => Options);
      Dimension_To_String(Name => "from", Value => From, Options => Options);
      Option_Image
        (Name => "shrink", Value => Shrink, Options_String => Options);
      Option_Image(Name => "to", Value => To, Options_String => Options);
      Tcl_Eval
        (Tcl_Script =>
           Photo_Image & " read " & To_String(Source => File_Name) & " " &
           To_String(Source => Options),
         Interpreter => Interpreter);
   end Read;

   procedure Redither
     (Photo_Image: Tk_Image;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Tcl_Eval
        (Tcl_Script => Photo_Image & " redither", Interpreter => Interpreter);
   end Redither;

   function Get_Transparency
     (Photo_Image: Tk_Image; X, Y: Natural;
      Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tcl_Boolean_Result is
   begin
      return
        Tcl_Eval
          (Tcl_Script =>
             Photo_Image & " transparency get" & Natural'Image(X) &
             Natural'Image(Y),
           Interpreter => Interpreter);
   end Get_Transparency;

   procedure Set_Transparency
     (Photo_Image: Tk_Image; X, Y: Natural; Transparent: Boolean;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           Photo_Image & " transparency set" & Natural'Image(X) &
           Natural'Image(Y) & " " & (if Transparent then "1" else "0"),
         Interpreter => Interpreter);
   end Set_Transparency;

   procedure Write
     (Photo_Image: Tk_Image; File_Name: Tcl_String;
      Background, Format: Unbounded_Variable_Name :=
        Empty_Unbounded_Variable_Name;
      From: Dimensions_Type := Empty_Dimension; Grayscale: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
      Options: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "background", Value => Background, Options_String => Options);
      Option_Image
        (Name => "format", Value => Format, Options_String => Options);
      Dimension_To_String(Name => "from", Value => From, Options => Options);
      Option_Image
        (Name => "grayscale", Value => Grayscale, Options_String => Options);
      Tcl_Eval
        (Tcl_Script =>
           Photo_Image & " write " & To_String(Source => File_Name) &
           To_String(Source => Options),
         Interpreter => Interpreter);
   end Write;

end Tk.Image.Photo;
