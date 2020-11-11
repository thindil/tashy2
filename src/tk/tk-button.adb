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
   begin
      if Length(Options.Active_Foreground) > 0 then
         Append
           (Options_String,
            " -activeforeground " & To_String(Options.Active_Foreground));
      end if;
      if Length(Options.Active_Background) > 0 then
         Append
           (Options_String,
            " -activebackground " & To_String(Options.Active_Background));
      end if;
      if Options.Anchor /= NONE then
         Append
           (Options_String,
            " -anchor " & To_Lower(Directions_Type'Image(Options.Anchor)));
      end if;
      if Length(Options.Bitmap) > 0 then
         Append(Options_String, " -bitmap " & To_String(Options.Bitmap));
      end if;
      if Options.Border_Width.Value > -1.0 then
         Append
           (Options_String,
            "-borderwidth" & Positive_Float'Image(Options.Border_Width.Value) &
            To_Lower(Pixel_Unit'Image(Options.Border_Width.Value_Unit)));
      end if;
      if Length(Options.Command) > 0 then
         Append(Options_String, " -command " & To_String(Options.Command));
      end if;
      if Options.Compound /= EMPTY then
         Append
           (Options_String,
            " -compound " & To_Lower(Place_Type'Image(Options.Compound)));
      end if;
      if Length(Options.Cursor) > 0 then
         Append(Options_String, "-cursor " & To_String(Options.Cursor));
      end if;
      if Options.Default /= NONE then
         Append
           (Options_String,
            " -default " & To_Lower(State_Type'Image(Options.Default)));
      end if;
      if Length(Options.Disabled_Foreground) > 0 then
         Append
           (Options_String,
            "-disabledforeground " & To_String(Options.Disabled_Foreground));
      end if;
      if Length(Options.Font) > 0 then
         Append(Options_String, " -font " & To_String(Options.Font));
      end if;
      if Length(Options.Foreground) > 0 then
         Append
           (Options_String, " -foreground " & To_String(Options.Foreground));
      end if;
      if Options.Height > -1 then
         Append
           (Options_String,
            " -height" & Extended_Natural'Image(Options.Height));
      end if;
      if Length(Options.Highlight_Background) > 0 then
         Append
           (Options_String,
            " -highlightbackground " &
            To_String(Options.Highlight_Background));
      end if;
      if Length(Options.Highlight_Color) > 0 then
         Append
           (Options_String,
            " -highlightcolor " & To_String(Options.Highlight_Color));
      end if;
      if Options.Highlight_Thickness.Value > -1.0 then
         Append
           (Options_String,
            "-highlightthickness" &
            Positive_Float'Image(Options.Highlight_Thickness.Value) &
            To_Lower
              (Pixel_Unit'Image(Options.Highlight_Thickness.Value_Unit)));
      end if;
      if Length(Options.Image) > 0 then
         Append(Options_String, " -image " & To_String(Options.Command));
      end if;
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
      if Options.PadX > -1 then
         Append
           (Options_String, " -padx" & Extended_Natural'Image(Options.PadX));
      end if;
      if Options.PadY > -1 then
         Append
           (Options_String, " -pady" & Extended_Natural'Image(Options.PadY));
      end if;
      if Options.Relief /= NONE then
         Append
           (Options_String,
            " -relief " & To_Lower(Relief_Type'Image(Options.Relief)));
      end if;
      if Options.Repeat_Delay > -1 then
         Append
           (Options_String,
            " -repeatdelay" & Extended_Natural'Image(Options.Repeat_Delay));
      end if;
      if Options.Repeat_Interval > -1 then
         Append
           (Options_String,
            " -repeatinterval" &
            Extended_Natural'Image(Options.Repeat_Interval));
      end if;
      if Length(Options.Take_Focus) > 0 then
         Append
           (Options_String, " -takefocus " & To_String(Options.Take_Focus));
      end if;
      if Options.State /= NONE then
         Append
           (Options_String,
            " -state " & To_Lower(State_Type'Image(Options.State)));
      end if;
      if Length(Options.Text) > 0 then
         Append(Options_String, " -text " & To_String(Options.Text));
      end if;
      if Length(Options.Text_Variable) > 0 then
         Append
           (Options_String,
            " -textvariable " & To_String(Options.Text_Variable));
      end if;
      if Options.Underline > -1 then
         Append
           (Options_String,
            " -underline" & Extended_Natural'Image(Options.Underline));
      end if;
      if Options.Width > -1 then
         Append
           (Options_String, " -width" & Extended_Natural'Image(Options.Width));
      end if;
      if Options.Wrap_Length > -1 then
         Append
           (Options_String,
            " -wraplength" & Extended_Natural'Image(Options.Wrap_Length));
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
