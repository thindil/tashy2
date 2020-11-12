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

with Ada.Characters.Handling; use Ada.Characters.Handling;
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
      procedure Option_Image(Name: String; Value: Tcl_String) is
      begin
         if Length(Value) > 0 then
            Append(Options_String, " -" & Name & " " & To_String(Value));
         end if;
      end Option_Image;
      procedure Option_Image(Name: String; Value: Extended_Natural) is
      begin
         if Value > -1 then
            Append
              (Options_String,
               " -" & Name & " " & Extended_Natural'Image(Value));
         end if;
      end Option_Image;
      procedure Option_Image(Name: String; Value: Pixel_Data) is
      begin
         if Value.Value > -1.0 then
            Append
              (Options_String,
               "-" & Name & Positive_Float'Image(Value.Value) &
               To_Lower(Pixel_Unit'Image(Value.Value_Unit)));
         end if;
      end Option_Image;
      procedure Option_Image(Name: String; Value: Relief_Type) is
      begin
         if Value /= NONE then
            Append
              (Options_String,
               " -" & Name & " " & To_Lower(Relief_Type'Image(Value)));
         end if;
      end Option_Image;
      procedure Option_Image(Name: String; Value: State_Type) is
      begin
         if Value /= NONE then
            Append
               (Options_String,
               " -" & Name & " " & To_Lower(State_Type'Image(Value)));
         end if;
      end Option_Image;
      procedure Option_Image(Name: String; Value: Directions_Type) is
      begin
         if Value /= NONE then
            Append
               (Options_String,
               " -" & Name & " " & To_Lower(Directions_Type'Image(Value)));
         end if;
      end Option_Image;
      procedure Option_Image(Name: String; Value: Place_Type) is
      begin
         if Value /= NONE then
            Append
               (Options_String,
               " -" & Name & " " & To_Lower(Place_Type'Image(Value)));
         end if;
      end Option_Image;
      procedure Option_Image(Name: String; Value: Justify_Type) is
      begin
         if Value /= NONE then
            Append
               (Options_String,
               " -" & Name & " " & To_Lower(Justify_Type'Image(Value)));
         end if;
      end Option_Image;
   begin
      Option_Image("activeforeground", Options.Active_Foreground);
      Option_Image("activebackground", Options.Active_Background);
      Option_Image("anchor", Options.Anchor);
      Option_Image("bitmap", Options.Bitmap);
      Option_Image("borderwidth", Options.Border_Width);
      Option_Image("command", Options.Command);
      Option_Image("compound", Options.Compound);
      Option_Image("cursor", Options.Cursor);
      Option_Image("default", Options.Default);
      Option_Image("disabledforeground", Options.Disabled_Foreground);
      Option_Image("font", Options.Font);
      Option_Image("foreground", Options.Foreground);
      Option_Image("height", Options.Height);
      Option_Image("highlightbackground", Options.Highlight_Background);
      Option_Image("highlightcolot", Options.Highlight_Color);
      Option_Image("highlighthickness", Options.Highlight_Thickness);
      Option_Image("image", Options.Image);
      Option_Image("justify", Options.Justify);
      Option_Image("overrelief", Options.Over_Relief);
      Option_Image("padx", Options.PadX);
      Option_Image("pady", Options.PadY);
      Option_Image("relief", Options.Relief);
      Option_Image("repeatdelay", Options.Repeat_Delay);
      Option_Image("repeatiterval", Options.Repeat_Interval);
      Option_Image("takefocus", Options.Take_Focus);
      Option_Image("state", Options.State);
      Option_Image("text", Options.Text);
      Option_Image("textvariable", Options.Text_Variable);
      Option_Image("underline", Options.Underline);
      Option_Image("width", Options.Width);
      Option_Image("wraplength", Options.Wrap_Length);
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
      Options: Button_Options;
   begin
      return Options;
   end Get_Options;

   procedure Configure(Widget: Tk_Button; Options: Button_Options) is
   begin
      Execute_Widget_Command
        (Tk_Widget(Widget), "configure", Options_To_String(Options));
   end Configure;

end Tk.Button;
