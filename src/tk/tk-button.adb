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
      if Options.Border_Width.Value > -1.0 then
         Append
           (Options_String,
            "-borderwidth" & Float'Image(Options.Border_Width.Value) &
            Pixel_Unit'Image(Options.Border_Width.Value_Unit));
      end if;
      if Length(Options.Command) > 0 then
         Append(Options_String, " -command " & To_String(Options.Command));
      end if;
      if Length(Options.Cursor) > 0 then
         Append(Options_String, "-cursor " & To_String(Options.Cursor));
      end if;
      if Length(Options.Font) > 0 then
         Append(Options_String, " -font " & To_String(Options.Font));
      end if;
      if Length(Options.Image) > 0 then
         Append(Options_String, " -image " & To_String(Options.Command));
      end if;
      if Options.Relief /= NONE then
         Append
           (Options_String,
            " -relief " & To_Lower(Relief_Type'Image(Options.Relief)));
      end if;
      if Length(Options.Take_Focus) > 0 then
         Append
           (Options_String, " -takefocus " & To_String(Options.Take_Focus));
      end if;
      if Length(Options.Text) > 0 then
         Append(Options_String, " -text " & To_String(Options.Text));
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
