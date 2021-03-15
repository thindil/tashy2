-- Copyright (c) 2020-2021 Bartek thindil Jasicki <thindil@laeran.pl>
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

package body Tk.Button is

   -- ****if* Button/Button.Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options - Ada Button_Options to convert
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Options_To_String(Options: Button_Options) return String is
      -- ****
      use Ada.Strings.Unbounded;

      Options_String: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "activeforeground", Value => Options.Active_Foreground,
         Options_String => Options_String);
      Option_Image
        (Name => "activebackground", Value => Options.Active_Background,
         Options_String => Options_String);
      Option_Image
        (Name => "anchor", Value => Options.Anchor,
         Options_String => Options_String);
      Option_Image
        (Name => "background", Value => Options.Background,
         Options_String => Options_String);
      Option_Image
        (Name => "bitmap", Value => Options.Bitmap,
         Options_String => Options_String);
      Option_Image
        (Name => "borderwidth", Value => Options.Border_Width,
         Options_String => Options_String);
      Option_Image
        (Name => "command", Value => Options.Command,
         Options_String => Options_String);
      Option_Image
        (Name => "compound", Value => Options.Compound,
         Options_String => Options_String);
      Option_Image
        (Name => "cursor", Value => Options.Cursor,
         Options_String => Options_String);
      Option_Image
        (Name => "default", Value => Options.Default,
         Options_String => Options_String);
      Option_Image
        (Name => "disabledforeground", Value => Options.Disabled_Foreground,
         Options_String => Options_String);
      Option_Image
        (Name => "font", Value => Options.Font,
         Options_String => Options_String);
      Option_Image
        (Name => "foreground", Value => Options.Foreground,
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
        (Name => "image", Value => Options.Image,
         Options_String => Options_String);
      Option_Image
        (Name => "justify", Value => Options.Justify,
         Options_String => Options_String);
      Option_Image
        (Name => "overrelief", Value => Options.Over_Relief,
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
        (Name => "repeatdelay", Value => Options.Repeat_Delay,
         Options_String => Options_String);
      Option_Image
        (Name => "repeatiterval", Value => Options.Repeat_Interval,
         Options_String => Options_String);
      Option_Image
        (Name => "takefocus", Value => Options.Take_Focus,
         Options_String => Options_String);
      Option_Image
        (Name => "state", Value => Options.State,
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
     (Path_Name: String; Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Button is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "button " & Path_Name & " " & Options_To_String(Options => Options),
         Interpreter => Interpreter);
      return Get_Widget(Path_Name => Path_Name, Interpreter => Interpreter);
   end Create;

   procedure Create
     (Button_Widget: out Tk_Button; Path_Name: String; Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Button_Widget :=
        Create
          (Path_Name => Path_Name, Options => Options,
           Interpreter => Interpreter);
   end Create;

   function Get_Options(Button_Widget: Tk_Button) return Button_Options is
   begin
      return Options: Button_Options := Default_Button_Options do
         Options.Active_Background :=
           Option_Value(Widgt => Button_Widget, Name => "activebackground");
         Options.Active_Foreground :=
           Option_Value(Widgt => Button_Widget, Name => "activeforeground");
         Options.Anchor :=
           Option_Value(Widgt => Button_Widget, Name => "anchor");
         Options.Background :=
           Option_Value(Widgt => Button_Widget, Name => "background");
         Options.Bitmap :=
           Option_Value(Widgt => Button_Widget, Name => "bitmap");
         Options.Border_Width :=
           Option_Value(Widgt => Button_Widget, Name => "borderwidth");
         Options.Command :=
           Option_Value(Widgt => Button_Widget, Name => "command");
         Options.Compound :=
           Option_Value(Widgt => Button_Widget, Name => "compound");
         Options.Cursor :=
           Option_Value(Widgt => Button_Widget, Name => "cursor");
         Options.Default :=
           Option_Value(Widgt => Button_Widget, Name => "default");
         Options.Disabled_Foreground :=
           Option_Value(Widgt => Button_Widget, Name => "disabledforeground");
         Options.Font := Option_Value(Widgt => Button_Widget, Name => "font");
         Options.Foreground :=
           Option_Value(Widgt => Button_Widget, Name => "foreground");
         Options.Height :=
           Option_Value(Widgt => Button_Widget, Name => "height");
         Options.Highlight_Background :=
           Option_Value(Widgt => Button_Widget, Name => "highlightbackground");
         Options.Highlight_Color :=
           Option_Value(Widgt => Button_Widget, Name => "highlightcolor");
         Options.Highlight_Thickness :=
           Option_Value(Widgt => Button_Widget, Name => "highlightthickness");
         Options.Image :=
           Option_Value(Widgt => Button_Widget, Name => "image");
         Options.Justify :=
           Option_Value(Widgt => Button_Widget, Name => "justify");
         Options.Over_Relief :=
           Option_Value(Widgt => Button_Widget, Name => "overrelief");
         Options.Pad_X := Option_Value(Widgt => Button_Widget, Name => "padx");
         Options.Pad_Y := Option_Value(Widgt => Button_Widget, Name => "pady");
         Options.Relief :=
           Option_Value(Widgt => Button_Widget, Name => "relief");
         Options.Repeat_Delay :=
           Option_Value(Widgt => Button_Widget, Name => "repeatdelay");
         Options.Repeat_Interval :=
           Option_Value(Widgt => Button_Widget, Name => "repeatinterval");
         Options.State :=
           Option_Value(Widgt => Button_Widget, Name => "state");
         Options.Take_Focus :=
           Option_Value(Widgt => Button_Widget, Name => "takefocus");
         Options.Text := Option_Value(Widgt => Button_Widget, Name => "text");
         Options.Text_Variable :=
           Option_Value(Widgt => Button_Widget, Name => "textvariable");
         Options.Underline :=
           Option_Value(Widgt => Button_Widget, Name => "underline");
         Options.Width :=
           Option_Value(Widgt => Button_Widget, Name => "width");
         Options.Wrap_Length :=
           Option_Value(Widgt => Button_Widget, Name => "wraplength");
      end return;
   end Get_Options;

   procedure Configure(Button_Widget: Tk_Button; Options: Button_Options) is
   begin
      Execute_Widget_Command
        (Widgt => Button_Widget, Command_Name => "configure",
         Options => Options_To_String(Options => Options));
   end Configure;

   procedure Flash(Button_Widget: Tk_Button) is
   begin
      Execute_Widget_Command(Widgt => Button_Widget, Command_Name => "flash");
   end Flash;

   procedure Invoke(Button_Widget: Tk_Button) is
   begin
      Execute_Widget_Command(Widgt => Button_Widget, Command_Name => "invoke");
   end Invoke;

   function Invoke(Button_Widget: Tk_Button) return String is
   begin
      Invoke(Button_Widget => Button_Widget);
      return Tcl_Get_Result(Interpreter => Tk_Interp(Widgt => Button_Widget));
   end Invoke;

end Tk.Button;
