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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

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
      Options_String: Unbounded_String;
   begin
      Option_Image("anchor", Options.Anchor, Options_String);
      Option_Image("background", Options.Background, Options_String);
      Option_Image("class", Options.Class, Options_String);
      Option_Image("compound", Options.Compound, Options_String);
      Option_Image("cursor", Options.Cursor, Options_String);
      Option_Image("font", Options.Font, Options_String);
      Option_Image("foreground", Options.Foreground, Options_String);
      Option_Image("image", Options.Image, Options_String);
      Option_Image("justify", Options.Justify, Options_String);
      Option_Image("padding", Options.Padding, Options_String);
      Option_Image("relief", Options.Relief, Options_String);
      Option_Image("state", Options.State, Options_String);
      Option_Image("style", Options.Style, Options_String);
      Option_Image("takefocus", Options.Take_Focus, Options_String);
      Option_Image("text", Options.Text, Options_String);
      Option_Image("textvariable", Options.Text_Variable, Options_String);
      Option_Image("underline", Options.Underline, Options_String);
      Option_Image("width", Options.Width, Options_String);
      Option_Image("wraplength", Options.Wrap_Length, Options_String);
      return To_String(Options_String);
   end Options_To_String;

   function Create
     (Path_Name: String; Options: Ttk_Label_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Label is
   begin
      Tcl_Eval
        ("ttk::label " & Path_Name & " " & Options_To_String(Options),
         Interpreter);
      return Get_Widget(Path_Name, Interpreter);
   end Create;

   procedure Create
     (Label: out Ttk_Label; Path_Name: String; Options: Ttk_Label_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Label := Create(Path_Name, Options, Interpreter);
   end Create;

   function Get_Options(Label: Ttk_Label) return Ttk_Label_Options is
   begin
      return Options: Ttk_Label_Options do
         Options.Anchor := Option_Value(Label, "anchor");
         Options.Background := Option_Value(Label, "background");
         Options.Class := Option_Value(Label, "class");
         Options.Compound := Option_Value(Label, "compound");
         Options.Cursor := Option_Value(Label, "cursor");
         Options.Font := Option_Value(Label, "font");
         Options.Foreground := Option_Value(Label, "foreground");
         Options.Image := Option_Value(Label, "image");
         Options.Justify := Option_Value(Label, "justify");
         Options.Padding := Option_Value(Label, "padding");
         Options.Relief := Option_Value(Label, "relief");
         Options.State := Option_Value(Label, "state");
         Options.Style := Option_Value(Label, "style");
         Options.Take_Focus := Option_Value(Label, "takefocus");
         Options.Text := Option_Value(Label, "text");
         Options.Text_Variable := Option_Value(Label, "textvariable");
         Options.Underline := Option_Value(Label, "underline");
         Options.Width := Option_Value(Label, "width");
         Options.Wrap_Length := Option_Value(Label, "wraplength");
      end return;
   end Get_Options;

   procedure Configure(Label: Ttk_Label; Options: Ttk_Label_Options) is
   begin
      Execute_Widget_Command(Label, "configure", Options_To_String(Options));
   end Configure;

end Tk.TtkLabel;
