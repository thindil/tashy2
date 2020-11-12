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
   begin
      Option_Image("activeforeground", Options.Active_Foreground);
      Option_Image("activebackground", Options.Active_Background);
      if Options.Anchor /= NONE then
         Append
           (Options_String,
            " -anchor " & To_Lower(Directions_Type'Image(Options.Anchor)));
      end if;
      Option_Image("bitmap", Options.Bitmap);
      if Options.Border_Width.Value > -1.0 then
         Append
           (Options_String,
            "-borderwidth" & Positive_Float'Image(Options.Border_Width.Value) &
            To_Lower(Pixel_Unit'Image(Options.Border_Width.Value_Unit)));
      end if;
      Option_Image("command", Options.Command);
      if Options.Compound /= EMPTY then
         Append
           (Options_String,
            " -compound " & To_Lower(Place_Type'Image(Options.Compound)));
      end if;
      Option_Image("cursor", Options.Cursor);
      if Options.Default /= NONE then
         Append
           (Options_String,
            " -default " & To_Lower(State_Type'Image(Options.Default)));
      end if;
      Option_Image("disabledforeground", Options.Disabled_Foreground);
      Option_Image("font", Options.Font);
      Option_Image("foreground", Options.Foreground);
      if Options.Height.Value > -1.0 then
         Append
           (Options_String,
            " -height" & Positive_Float'Image(Options.Height.Value) &
            To_Lower(Pixel_Unit'Image(Options.Height.Value_Unit)));
      end if;
      Option_Image("highlightbackground", Options.Highlight_Background);
      Option_Image("highlightcolot", Options.Highlight_Color);
      if Options.Highlight_Thickness.Value > -1.0 then
         Append
           (Options_String,
            "-highlightthickness" &
            Positive_Float'Image(Options.Highlight_Thickness.Value) &
            To_Lower
              (Pixel_Unit'Image(Options.Highlight_Thickness.Value_Unit)));
      end if;
      Option_Image("image", Options.Image);
      if Options.Justify /= NONE then
         Append
           (Options_String,
            " -justify " & To_Lower(Justify_Type'Image(Options.Justify)));
      end if;
      if Options.Over_Relief /= NONE then
         Append
           (Options_String,
            " -overrelief " &
            To_Lower(Relief_Type'Image(Options.Over_Relief)));
      end if;
      if Options.PadX.Value > -1.0 then
         Append
           (Options_String,
            " -padx" & Positive_Float'Image(Options.PadX.Value) &
            To_Lower(Pixel_Unit'Image(Options.PadX.Value_Unit)));
      end if;
      if Options.PadY.Value > -1.0 then
         Append
           (Options_String,
            " -pady" & Positive_Float'Image(Options.PadY.Value) &
            To_Lower(Pixel_Unit'Image(Options.PadY.Value_Unit)));
      end if;
      if Options.Relief /= NONE then
         Append
           (Options_String,
            " -relief " & To_Lower(Relief_Type'Image(Options.Relief)));
      end if;
      Option_Image("repeatdelay", Options.Repeat_Delay);
      Option_Image("repeatiterval", Options.Repeat_Interval);
      Option_Image("takefocus", Options.Take_Focus);
      if Options.State /= NONE then
         Append
           (Options_String,
            " -state " & To_Lower(State_Type'Image(Options.State)));
      end if;
      Option_Image("text", Options.Text);
      Option_Image("textvariable", Options.Text_Variable);
      Option_Image("underline", Options.Underline);
      if Options.Width.Value > -1.0 then
         Append
           (Options_String,
            " -width" & Positive_Float'Image(Options.Width.Value) &
            To_Lower(Pixel_Unit'Image(Options.Width.Value_Unit)));
      end if;
      if Options.Wrap_Length.Value > -1.0 then
         Append
           (Options_String,
            " -wraplength" & Positive_Float'Image(Options.Wrap_Length.Value) &
            To_Lower(Pixel_Unit'Image(Options.Wrap_Length.Value_Unit)));
      end if;
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
