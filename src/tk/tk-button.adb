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
      Options_String: Unbounded_String;
   begin
      Option_Image
        ("activeforeground", Options.Active_Foreground, Options_String);
      Option_Image
        ("activebackground", Options.Active_Background, Options_String);
      Option_Image("anchor", Options.Anchor, Options_String);
      Option_Image("bitmap", Options.Bitmap, Options_String);
      Option_Image("borderwidth", Options.Border_Width, Options_String);
      Option_Image("command", Options.Command, Options_String);
      Option_Image("compound", Options.Compound, Options_String);
      Option_Image("cursor", Options.Cursor, Options_String);
      Option_Image("default", Options.Default, Options_String);
      Option_Image
        ("disabledforeground", Options.Disabled_Foreground, Options_String);
      Option_Image("font", Options.Font, Options_String);
      Option_Image("foreground", Options.Foreground, Options_String);
      Option_Image("height", Options.Height, Options_String);
      Option_Image
        ("highlightbackground", Options.Highlight_Background, Options_String);
      Option_Image("highlightcolot", Options.Highlight_Color, Options_String);
      Option_Image
        ("highlighthickness", Options.Highlight_Thickness, Options_String);
      Option_Image("image", Options.Image, Options_String);
      Option_Image("justify", Options.Justify, Options_String);
      Option_Image("overrelief", Options.Over_Relief, Options_String);
      Option_Image("padx", Options.PadX, Options_String);
      Option_Image("pady", Options.PadY, Options_String);
      Option_Image("relief", Options.Relief, Options_String);
      Option_Image("repeatdelay", Options.Repeat_Delay, Options_String);
      Option_Image("repeatiterval", Options.Repeat_Interval, Options_String);
      Option_Image("takefocus", Options.Take_Focus, Options_String);
      Option_Image("state", Options.State, Options_String);
      Option_Image("text", Options.Text, Options_String);
      Option_Image("textvariable", Options.Text_Variable, Options_String);
      Option_Image("underline", Options.Underline, Options_String);
      Option_Image("width", Options.Width, Options_String);
      Option_Image("wraplength", Options.Wrap_Length, Options_String);
      return To_String(Options_String);
   end Options_To_String;

   function Create
     (Path_Name: String; Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Button is
   begin
      Tcl_Eval
        ("button " & Path_Name & " " & Options_To_String(Options),
         Interpreter);
      return Get_Widget(Path_Name, Interpreter);
   end Create;

   procedure Create
     (Widget: out Tk_Button; Path_Name: String; Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Widget := Create(Path_Name, Options, Interpreter);
   end Create;

   function Get_Options(Widget: Tk_Button) return Button_Options is
      function Option_Value(Name: String) return Tcl_String is
      begin
         Execute_Widget_Command(Widget, "cget", "-" & Name);
         return To_Tcl_String(Tcl_GetResult(Tk_Interp(Widget)));
      end Option_Value;
   begin
      return Options: Button_Options do
         Options.Active_Background := Option_Value("activebackground");
         Options.Active_Foreground := Option_Value("activeforeground");
         Options.Text := Option_Value("text");
      end return;
   end Get_Options;

   procedure Configure(Widget: Tk_Button; Options: Button_Options) is
   begin
      Execute_Widget_Command
        (Tk_Widget(Widget), "configure", Options_To_String(Options));
   end Configure;

end Tk.Button;
