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
with Tk.Widget;
with Tk.Winfo;

package body Tk.Image.Bitmap is

   function Options_To_String(Options: Bitmap_Options) return String is
      use Ada.Strings.Unbounded;
      use Tk.Widget;

      Options_String: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "data", Value => Options.Data,
         Options_String => Options_String);
      Option_Image
        (Name => "file", Value => Options.File,
         Options_String => Options_String);
      Option_Image
        (Name => "background", Value => Options.Background,
         Options_String => Options_String);
      Option_Image
        (Name => "foreground", Value => Options.Foreground,
         Options_String => Options_String);
      Option_Image
        (Name => "maskdata", Value => Options.Mask_Data,
         Options_String => Options_String);
      Option_Image
        (Name => "maskfile", Value => Options.Mask_File,
         Options_String => Options_String);
      return To_String(Source => Options_String);
   end Options_To_String;

   procedure Create
     (Bitmap_Image: Tk_Image; Options: Bitmap_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "image create bitmap " & Bitmap_Image &
           Options_To_String(Options => Options),
         Interpreter => Interpreter);
   end Create;

   function Create
     (Options: Bitmap_Options; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Image is
   begin
      return
        Tcl_Eval
          (Tcl_Script =>
             "image create bitmap" & Options_To_String(Options => Options),
           Interpreter => Interpreter)
          .Result;
   end Create;

   procedure Configure
     (Bitmap_Image: Tk_Image; Options: Bitmap_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           Bitmap_Image & " configure " &
           Options_To_String(Options => Options),
         Interpreter => Interpreter);
   end Configure;

   function Get_Option
     (Bitmap_Image: Tk_Image; Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
      Result_List: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => Bitmap_Image & " configure -" & Name,
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   begin
      return To_Ada_String(Source => Result_List(Result_List'Last));
   end Get_Option;

   function Get_Options
     (Bitmap_Image: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Bitmap_Options is
      use Winfo;

      Fore_Color: constant String :=
        Get_Option
          (Bitmap_Image => Bitmap_Image, Name => "foreground",
           Interpreter => Interpreter);
      Back_Color: constant String :=
        Get_Option
          (Bitmap_Image => Bitmap_Image, Name => "background",
           Interpreter => Interpreter);
   begin
      return Options: Bitmap_Options := Default_Bitmap_Options do
         Options.Data :=
           To_Tcl_String
             (Source =>
                Get_Option
                  (Bitmap_Image => Bitmap_Image, Name => "data",
                   Interpreter => Interpreter));
         Options.File :=
           To_Tcl_String
             (Source =>
                Get_Option
                  (Bitmap_Image => Bitmap_Image, Name => "file",
                   Interpreter => Interpreter));
         Options.Background :=
           (if Back_Color(Fore_Color'First) /= '#' then
              Rgb(Color_Name => Colors_Names_Value(Image => Back_Color))
            elsif Back_Color'Length = 10 then
              (Red => Color_Range'Value(Back_Color(2 .. 4)) * 257,
               Green => Color_Range'Value(Back_Color(5 .. 7)) * 257,
               Blue => Color_Range'Value(Back_Color(8 .. 10)) * 257)
            else Empty_Color);
         Options.Foreground :=
           (if Fore_Color(Fore_Color'First) /= '#' then
              Rgb(Color_Name => Colors_Names_Value(Image => Fore_Color))
            elsif Fore_Color'Length = 10 then
              (Red => Color_Range'Value(Fore_Color(2 .. 4)) * 257,
               Green => Color_Range'Value(Fore_Color(5 .. 7)) * 257,
               Blue => Color_Range'Value(Fore_Color(8 .. 10)) * 257)
            else Empty_Color);
         Options.Mask_Data :=
           To_Tcl_String
             (Source =>
                Get_Option
                  (Bitmap_Image => Bitmap_Image, Name => "maskdata",
                   Interpreter => Interpreter));
         Options.Mask_File :=
           To_Tcl_String
             (Source =>
                Get_Option
                  (Bitmap_Image => Bitmap_Image, Name => "maskfile",
                   Interpreter => Interpreter));
      end return;
   end Get_Options;

end Tk.Image.Bitmap;
