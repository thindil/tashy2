-- Copyright (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
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

package body Tk.TopLevel is

   function Create
     (Path_Name: String; Options: Toplevel_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Toplevel is
      Options_String: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "background", Value => Options.Background,
         Options_String => Options_String);
      Option_Image
        (Name => "borderwidth", Value => Options.Border_Width,
         Options_String => Options_String);
      Option_Image
        (Name => "class", Value => Options.Class,
         Options_String => Options_String);
      Option_Image
        (Name => "colormap", Value => Options.Color_Map,
         Options_String => Options_String);
      Option_Image
        (Name => "container", Value => Options.Container,
         Options_String => Options_String);
      Option_Image
        (Name => "cursor", Value => Options.Cursor,
         Options_String => Options_String);
      Option_Image
        (Name => "height", Value => Options.Height,
         Options_String => Options_String);
      Option_Image
        (Name => "highlightbackground", Value => Options.Highlight_Background,
         Options_String => Options_String);
      Option_Image
        (Name => "highlightcolot", Value => Options.Highlight_Color,
         Options_String => Options_String);
      Option_Image
        (Name => "highlighthickness", Value => Options.Highlight_Thickness,
         Options_String => Options_String);
      Option_Image
        (Name => "menu", Value => Options.Menu,
         Options_String => Options_String);
      Option_Image
        (Name => "padx", Value => Options.Pad_X,
         Options_String => Options_String);
      Option_Image
        (Name => "pady", Value => Options.Pad_Y,
         Options_String => Options_String);
      Option_Image
        (Name => "relief", Value => Options.Relief,
         Options_String => Options_String);
      Option_Image
        (Name => "screen", Value => Options.Screen,
         Options_String => Options_String);
      Option_Image
        (Name => "takefocus", Value => Options.Take_Focus,
         Options_String => Options_String);
      Option_Image
        (Name => "use", Value => Options.Use_Container,
         Options_String => Options_String);
      Option_Image
        (Name => "visual", Value => Options.Visual,
         Options_String => Options_String);
      Option_Image
        (Name => "width", Value => Options.Width,
         Options_String => Options_String);
      Tcl_Eval
        (Tcl_Script =>
           "toplevel " & Path_Name & " " & To_String(Source => Options_String),
         Interpreter => Interpreter);
      return Get_Widget(Path_Name => Path_Name, Interpreter => Interpreter);
   end Create;

   procedure Create
     (Toplevel_Widget: out Tk_Toplevel; Path_Name: String;
      Options: Toplevel_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Toplevel_Widget := Create(Path_Name, Options, Interpreter);
   end Create;

   function Get_Options
     (Toplevel_Widget: Tk_Toplevel) return Toplevel_Create_Options is
   begin
      return Options: Toplevel_Create_Options do
         Options.Background := Option_Value(Toplevel_Widget, "background");
         Options.Border_Width := Option_Value(Toplevel_Widget, "borderwidth");
         Options.Class := Option_Value(Toplevel_Widget, "class");
         Options.Color_Map := Option_Value(Toplevel_Widget, "colormap");
         Options.Container := Option_Value(Toplevel_Widget, "container");
         Options.Cursor := Option_Value(Toplevel_Widget, "cursor");
         Options.Height := Option_Value(Toplevel_Widget, "height");
         Options.Highlight_Background :=
           Option_Value(Toplevel_Widget, "highlightbackground");
         Options.Highlight_Color :=
           Option_Value(Toplevel_Widget, "highlightcolor");
         Options.Highlight_Thickness :=
           Option_Value(Toplevel_Widget, "highlightthickness");
         Options.Menu := Option_Value(Toplevel_Widget, "menu");
         Options.Pad_X := Option_Value(Toplevel_Widget, "padx");
         Options.Pad_Y := Option_Value(Toplevel_Widget, "pady");
         Options.Relief := Option_Value(Toplevel_Widget, "relief");
         Options.Screen := Option_Value(Toplevel_Widget, "screen");
         Options.Take_Focus := Option_Value(Toplevel_Widget, "takefocus");
         Options.Use_Container := Option_Value(Toplevel_Widget, "use");
         Options.Visual := Option_Value(Toplevel_Widget, "visual");
         Options.Width := Option_Value(Toplevel_Widget, "width");
      end return;
   end Get_Options;

   procedure Configure
     (Toplevel_Widget: Tk_Toplevel; Options: Toplevel_Options) is
      Options_String: Unbounded_String;
   begin
      Option_Image
        (Name => "background", Value => Options.Background,
         Options_String => Options_String);
      Option_Image
        (Name => "borderwidth", Value => Options.Border_Width,
         Options_String => Options_String);
      Option_Image
        (Name => "cursor", Value => Options.Cursor,
         Options_String => Options_String);
      Option_Image
        (Name => "height", Value => Options.Height,
         Options_String => Options_String);
      Option_Image
        ("highlightbackground", Value => Options.Highlight_Background,
         Options_String => Options_String);
      Option_Image
        (Name => "highlightcolot", Value => Options.Highlight_Color,
         Options_String => Options_String);
      Option_Image
        ("highlighthickness", Value => Options.Highlight_Thickness,
         Options_String => Options_String);
      Option_Image
        (Name => "menu", Value => Options.Menu,
         Options_String => Options_String);
      Option_Image
        (Name => "padx", Value => Options.Pad_X,
         Options_String => Options_String);
      Option_Image
        (Name => "pady", Value => Options.Pad_Y,
         Options_String => Options_String);
      Option_Image
        (Name => "relief", Value => Options.Relief,
         Options_String => Options_String);
      Option_Image
        (Name => "takefocus", Value => Options.Take_Focus,
         Options_String => Options_String);
      Option_Image
        (Name => "width", Value => Options.Width,
         Options_String => Options_String);
      Execute_Widget_Command
        (Toplevel_Widget, "configure", To_String(Options_String));
   end Configure;

end Tk.TopLevel;
