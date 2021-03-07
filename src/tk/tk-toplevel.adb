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
      Options_String: Unbounded_String;
   begin
      Option_Image("background", Options.Background, Options_String);
      Option_Image("borderwidth", Options.Border_Width, Options_String);
      Option_Image("class", Options.Class, Options_String);
      Option_Image("colormap", Options.Color_Map, Options_String);
      Option_Image("container", Options.Container, Options_String);
      Option_Image("cursor", Options.Cursor, Options_String);
      Option_Image("height", Options.Height, Options_String);
      Option_Image
        ("highlightbackground", Options.Highlight_Background, Options_String);
      Option_Image("highlightcolot", Options.Highlight_Color, Options_String);
      Option_Image
        ("highlighthickness", Options.Highlight_Thickness, Options_String);
      Option_Image("menu", Options.Menu, Options_String);
      Option_Image("padx", Options.Pad_X, Options_String);
      Option_Image("pady", Options.Pad_Y, Options_String);
      Option_Image("relief", Options.Relief, Options_String);
      Option_Image("screen", Options.Screen, Options_String);
      Option_Image("takefocus", Options.Take_Focus, Options_String);
      Option_Image("use", Options.Use_Container, Options_String);
      Option_Image("visual", Options.Visual, Options_String);
      Option_Image("width", Options.Width, Options_String);
      Tcl_Eval
        ("toplevel " & Path_Name & " " & To_String(Options_String),
         Interpreter);
      return Get_Widget(Path_Name, Interpreter);
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
      Option_Image("background", Options.Background, Options_String);
      Option_Image("borderwidth", Options.Border_Width, Options_String);
      Option_Image("cursor", Options.Cursor, Options_String);
      Option_Image("height", Options.Height, Options_String);
      Option_Image
        ("highlightbackground", Options.Highlight_Background, Options_String);
      Option_Image("highlightcolot", Options.Highlight_Color, Options_String);
      Option_Image
        ("highlighthickness", Options.Highlight_Thickness, Options_String);
      Option_Image("menu", Options.Menu, Options_String);
      Option_Image("padx", Options.Pad_X, Options_String);
      Option_Image("pady", Options.Pad_Y, Options_String);
      Option_Image("relief", Options.Relief, Options_String);
      Option_Image("takefocus", Options.Take_Focus, Options_String);
      Option_Image("width", Options.Width, Options_String);
      Execute_Widget_Command
        (Toplevel_Widget, "configure", To_String(Options_String));
   end Configure;

end Tk.TopLevel;
