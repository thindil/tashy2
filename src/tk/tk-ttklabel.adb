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

package body Tk.TtkLabel is

   -- ****if* TtkLabel/TtkLabel.Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options - Ada Ttk_Label_Options to convert
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Options_To_String(Options: Ttk_Label_Options) return String is
      -- ****
      use Ada.Strings.Unbounded;

      Options_String: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "anchor", Value => Options.Anchor,
         Options_String => Options_String);
      Option_Image
        (Name => "background", Value => Options.Background,
         Options_String => Options_String);
      Option_Image
        (Name => "class", Value => Options.Class,
         Options_String => Options_String);
      Option_Image
        (Name => "compound", Value => Options.Compound,
         Options_String => Options_String);
      Option_Image
        (Name => "cursor", Value => Options.Cursor,
         Options_String => Options_String);
      Option_Image
        (Name => "font", Value => Options.Font,
         Options_String => Options_String);
      Option_Image
        (Name => "foreground", Value => Options.Foreground,
         Options_String => Options_String);
      Option_Image
        (Name => "image", Value => Options.Image,
         Options_String => Options_String);
      Option_Image
        (Name => "justify", Value => Options.Justify,
         Options_String => Options_String);
      Option_Image
        (Name => "padding", Value => Options.Padding,
         Options_String => Options_String);
      Option_Image
        (Name => "relief", Value => Options.Relief,
         Options_String => Options_String);
      Option_Image
        (Name => "state", Value => Options.State,
         Options_String => Options_String);
      Option_Image
        (Name => "style", Value => Options.Style,
         Options_String => Options_String);
      Option_Image
        (Name => "takefocus", Value => Options.Take_Focus,
         Options_String => Options_String);
      Option_Image
        (Name => "text", Value => Options.Text,
         Options_String => Options_String);
      Option_Image
        (Name => "textvariable", Value => Options.Text_Variable,
         Options_String => Options_String);
      Option_Image
        (Name => "underline", Value => Options.Underline,
         Options_String => Options_String);
      Option_Image
        (Name => "width", Value => Options.Width,
         Options_String => Options_String);
      Option_Image
        (Name => "wraplength", Value => Options.Wrap_Length,
         Options_String => Options_String);
      return To_String(Source => Options_String);
   end Options_To_String;

   function Create
     (Path_Name: Tk_Path_String; Options: Ttk_Label_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Label is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "ttk::label " & Path_Name & Options_To_String(Options => Options),
         Interpreter => Interpreter);
      return Get_Widget(Path_Name => Path_Name, Interpreter => Interpreter);
   end Create;

   procedure Create
     (Label: out Ttk_Label; Path_Name: Tk_Path_String;
      Options: Ttk_Label_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Label :=
        Create
          (Path_Name => Path_Name, Options => Options,
           Interpreter => Interpreter);
   end Create;

   function Get_Options(Label: Ttk_Label) return Ttk_Label_Options is
   begin
      return Options: Ttk_Label_Options := Default_Ttk_Label_Options do
         Options.Anchor := Option_Value(Widgt => Label, Name => "anchor");
         Options.Background :=
           Option_Value(Widgt => Label, Name => "background");
         Options.Class := Option_Value(Widgt => Label, Name => "class");
         Options.Compound :=
           Option_Value(Ttk_Widgt => Label, Name => "compound");
         Options.Cursor := Option_Value(Widgt => Label, Name => "cursor");
         Options.Font := Option_Value(Widgt => Label, Name => "font");
         Options.Foreground :=
           Option_Value(Widgt => Label, Name => "foreground");
         Options.Image := Option_Value(Ttk_Widgt => Label, Name => "image");
         Options.Justify := Option_Value(Widgt => Label, Name => "justify");
         Options.Padding :=
           Option_Value(Ttk_Widgt => Label, Name => "padding");
         Options.Relief := Option_Value(Widgt => Label, Name => "relief");
         Options.State := Option_Value(Ttk_Widgt => Label, Name => "state");
         Options.Style := Option_Value(Widgt => Label, Name => "style");
         Options.Take_Focus :=
           Option_Value(Widgt => Label, Name => "takefocus");
         Options.Text := Option_Value(Widgt => Label, Name => "text");
         Options.Text_Variable :=
           Option_Value(Widgt => Label, Name => "textvariable");
         Options.Underline :=
           Option_Value(Widgt => Label, Name => "underline");
         Options.Width := Option_Value(Widgt => Label, Name => "width");
         Options.Wrap_Length :=
           Option_Value(Widgt => Label, Name => "wraplength");
      end return;
   end Get_Options;

   procedure Configure(Label: Ttk_Label; Options: Ttk_Label_Options) is
   begin
      Execute_Widget_Command
        (Widgt => Label, Command_Name => "configure",
         Options => Options_To_String(Options => Options));
   end Configure;

end Tk.TtkLabel;
