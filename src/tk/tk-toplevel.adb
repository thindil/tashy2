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

   -- ****if* TopLevel/TopLevel.Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options - Ada TopLevel_Create_Options to convert
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Options_To_String
     (Options: TopLevel_Create_Options) return String is
      -- ****
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
      Option_Image("padx", Options.PadX, Options_String);
      Option_Image("pady", Options.PadY, Options_String);
      Option_Image("relief", Options.Relief, Options_String);
      Option_Image("screen", Options.Screen, Options_String);
      Option_Image("takefocus", Options.Take_Focus, Options_String);
      Option_Image("use", Options.Use_Container, Options_String, 16);
      Option_Image("visual", Options.Visual, Options_String);
      Option_Image("width", Options.Width, Options_String);
      return To_String(Options_String);
   end Options_To_String;

   function TopLevel_New
     (Path_Name: String; Options: TopLevel_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_TopLevel is
   begin
      Tcl_Eval
        ("toplevel " & Path_Name & " " & Options_To_String(Options),
         Interpreter);
      return Get_Widget(Path_Name, Interpreter);
   end TopLevel_New;

   procedure TopLevel_New
     (Widget: out Tk_TopLevel; Path_Name: String;
      Options: TopLevel_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Widget := TopLevel_New(Path_Name, Options, Interpreter);
   end TopLevel_New;

   function Get_Options(Widget: Tk_TopLevel) return TopLevel_Create_Options is
   begin
      return Options: TopLevel_Create_Options do
         Options.Background := Option_Value(Widget, "background");
         Options.Border_Width := Option_Value(Widget, "borderwidth");
         Options.Class := Option_Value(Widget, "class");
         Options.Color_Map := Option_Value(Widget, "colormap");
         Options.Container := Option_Value(Widget, "container");
         Options.Cursor := Option_Value(Widget, "cursor");
         Options.Height := Option_Value(Widget, "height");
         Options.Highlight_Background :=
           Option_Value(Widget, "highlightbackground");
         Options.Highlight_Color := Option_Value(Widget, "highlightcolor");
         Options.Highlight_Thickness :=
           Option_Value(Widget, "highlightthickness");
         Options.Menu := Option_Value(Widget, "menu");
         Options.PadX := Option_Value(Widget, "padx");
         Options.PadY := Option_Value(Widget, "pady");
         Options.Relief := Option_Value(Widget, "relief");
         Options.Screen := Option_Value(Widget, "screen");
         Options.Take_Focus := Option_Value(Widget, "takefocus");
         Options.Width := Option_Value(Widget, "width");
      end return;
   end Get_Options;

end Tk.TopLevel;
