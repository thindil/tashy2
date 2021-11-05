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

package body Tk.TtkFrame is

   function Options_To_String(Options: Ttk_Frame_Options) return String is
      Options_String: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "borderwidth", Value => Options.Border_Width,
         Options_String => Options_String);
      Option_Image
        (Name => "class", Value => Options.Class,
         Options_String => Options_String);
      Option_Image
        (Name => "cursor", Value => Options.Cursor,
         Options_String => Options_String);
      Option_Image
        (Name => "height", Value => Options.Height,
         Options_String => Options_String);
      Option_Image
        (Name => "padding", Value => Options.Padding,
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
      return To_String(Source => Options_String);
   end Options_To_String;

   function Create
     (Path_Name: Tk_Path_String; Options: Ttk_Frame_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Frame is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "ttk::frame " & Path_Name & Options_To_String(Options => Options),
         Interpreter => Interpreter);
      return Get_Widget(Path_Name => Path_Name, Interpreter => Interpreter);
   end Create;

   --## rule off IMPROPER_INITIALIZATION
   procedure Create
     (Frame_Widget: out Ttk_Frame; Path_Name: Tk_Path_String;
      Options: Ttk_Frame_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   --## rule on IMPROPER_INITIALIZATION
   begin
      Frame_Widget :=
        Create
          (Path_Name => Path_Name, Options => Options,
           Interpreter => Interpreter);
   end Create;

   function Get_Options(Frame_Widget: Ttk_Frame) return Ttk_Frame_Options is
   begin
      return Options: Ttk_Frame_Options := Default_Ttk_Frame_Options do
         Options.Border_Width :=
           Option_Value(Widgt => Frame_Widget, Name => "borderwidth");
         Options.Class := Option_Value(Widgt => Frame_Widget, Name => "class");
         Options.Cursor :=
           Option_Value(Widgt => Frame_Widget, Name => "cursor");
         Options.Height :=
           Option_Value(Widgt => Frame_Widget, Name => "height");
         Options.Padding :=
           Option_Value(Ttk_Widgt => Frame_Widget, Name => "padding");
         Options.Relief :=
           Option_Value(Widgt => Frame_Widget, Name => "relief");
         Options.Take_Focus :=
           Option_Value(Widgt => Frame_Widget, Name => "takefocus");
         Options.Width := Option_Value(Widgt => Frame_Widget, Name => "width");
      end return;
   end Get_Options;

   procedure Configure(Frame_Widget: Ttk_Frame; Options: Ttk_Frame_Options) is
      Options_String: Unbounded_String := Null_Unbounded_String;
   begin
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
        (Name => "padding", Value => Options.Padding,
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
        (Widgt => Frame_Widget, Command_Name => "configure",
         Options => To_String(Source => Options_String));
   end Configure;

end Tk.TtkFrame;
