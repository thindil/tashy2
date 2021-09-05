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

package body Tk.Labelframe is

   function Create
     (Path_Name: Tk_Path_String; Options: Label_Frame_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Label_Frame is
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
        (Name => "labelwidget", Value => Options.Label_Widget,
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
        (Name => "text", Value => Options.Text,
         Options_String => Options_String);
      Option_Image
        (Name => "visual", Value => Options.Visual,
         Options_String => Options_String);
      Option_Image
        (Name => "width", Value => Options.Width,
         Options_String => Options_String);
      Option_Image
        (Name => "labelanchor", Value => Options.Label_Anchor,
         Options_String => Options_String);
      Tcl_Eval
        (Tcl_Script =>
           "labelframe " & Path_Name & " " &
           To_String(Source => Options_String),
         Interpreter => Interpreter);
      return Get_Widget(Path_Name => Path_Name, Interpreter => Interpreter);
   end Create;

   procedure Create
     (Frame_Widget: out Tk_Label_Frame; Path_Name: Tk_Path_String;
      Options: Label_Frame_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Frame_Widget :=
        Create
          (Path_Name => Path_Name, Options => Options,
           Interpreter => Interpreter);
   end Create;

   function Get_Options
     (Frame_Widget: Tk_Label_Frame) return Label_Frame_Create_Options is
   begin
      return
        Options: Label_Frame_Create_Options :=
          Label_Frame_Create_Options'(others => <>) do
         Options.Background :=
           Option_Value(Widgt => Frame_Widget, Name => "background");
         Options.Border_Width :=
           Option_Value(Widgt => Frame_Widget, Name => "borderwidth");
         Options.Class := Option_Value(Widgt => Frame_Widget, Name => "class");
         Options.Color_Map :=
           Option_Value(Widgt => Frame_Widget, Name => "colormap");
         Options.Container :=
           Option_Value(Widgt => Frame_Widget, Name => "container");
         Options.Cursor :=
           Option_Value(Widgt => Frame_Widget, Name => "cursor");
         Options.Height :=
           Option_Value(Widgt => Frame_Widget, Name => "height");
         Options.Highlight_Background :=
           Option_Value(Widgt => Frame_Widget, Name => "highlightbackground");
         Options.Highlight_Color :=
           Option_Value(Widgt => Frame_Widget, Name => "highlightcolor");
         Options.Highlight_Thickness :=
           Option_Value(Widgt => Frame_Widget, Name => "highlightthickness");
         Options.Label_Anchor :=
           Option_Value(Widgt => Frame_Widget, Name => "labelanchor");
         Options.Label_Widget :=
           Option_Value(Widgt => Frame_Widget, Name => "labelwidget");
         Options.Pad_X := Option_Value(Widgt => Frame_Widget, Name => "padx");
         Options.Pad_Y := Option_Value(Widgt => Frame_Widget, Name => "pady");
         Options.Relief :=
           Option_Value(Widgt => Frame_Widget, Name => "relief");
         Options.Take_Focus :=
           Option_Value(Widgt => Frame_Widget, Name => "takefocus");
         Options.Text := Option_Value(Widgt => Frame_Widget, Name => "text");
         Options.Visual :=
           Option_Value(Widgt => Frame_Widget, Name => "visual");
         Options.Width := Option_Value(Widgt => Frame_Widget, Name => "width");
      end return;
   end Get_Options;

   overriding procedure Configure
     (Frame_Widget: Tk_Label_Frame; Options: Label_Frame_Options) is
      Options_String: Unbounded_String := Null_Unbounded_String;
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
        (Name => "highlightbackground", Value => Options.Highlight_Background,
         Options_String => Options_String);
      Option_Image
        (Name => "highlightcolot", Value => Options.Highlight_Color,
         Options_String => Options_String);
      Option_Image
        (Name => "highlighthickness", Value => Options.Highlight_Thickness,
         Options_String => Options_String);
      Option_Image
        (Name => "labelwidget", Value => Options.Label_Widget,
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
        (Name => "text", Value => Options.Text,
         Options_String => Options_String);
      Option_Image
        (Name => "width", Value => Options.Width,
         Options_String => Options_String);
      Option_Image
        (Name => "labelanchor", Value => Options.Label_Anchor,
         Options_String => Options_String);
      Execute_Widget_Command
        (Widgt => Frame_Widget, Command_Name => "configure",
         Options => To_String(Source => Options_String));
   end Configure;

end Tk.Labelframe;
