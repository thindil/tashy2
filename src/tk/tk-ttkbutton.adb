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

with Ada.Strings.Unbounded;

package body Tk.TtkButton is

   -- ****if* TtkButton/TtkButton.Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options - Ada Ttk_Button_Options to convert
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Options_To_String(Options: Ttk_Button_Options) return String is
      -- ****
      use Ada.Strings.Unbounded;
      Options_String: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "class", Value => Options.Class,
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
        (Name => "image", Value => Options.Image,
         Options_String => Options_String);
      Option_Image
        (Name => "state", Value => Options.State,
         Options_String => Options_String);
      Option_Image
        (Name => "style", Value => Options.Style,
         Options_String => Options_String);
      Option_Image
        (Name => "takefocus", Value => Options.Take_Focus,
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
      return To_String(Source => Options_String);
   end Options_To_String;

   function Create
     (Path_Name: String; Options: Ttk_Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Button is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "ttk::button " & Path_Name & " " &
           Options_To_String(Options => Options),
         Interpreter => Interpreter);
      return Get_Widget(Path_Name => Path_Name, Interpreter => Interpreter);
   end Create;

   procedure Create
     (Button: out Ttk_Button; Path_Name: String; Options: Ttk_Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Button :=
        Create
          (Path_Name => Path_Name, Options => Options,
           Interpreter => Interpreter);
   end Create;

   function Get_Options(Button: Ttk_Button) return Ttk_Button_Options is
   begin
      return Options: Ttk_Button_Options := Default_Ttk_Button_Options do
         Options.Class := Option_Value(Widgt => Button, Name => "class");
         Options.Command := Option_Value(Widgt => Button, Name => "command");
         Options.Compound :=
           Option_Value(Ttk_Widgt => Button, Name => "compound");
         Options.Cursor := Option_Value(Widgt => Button, Name => "cursor");
         Options.Default := Option_Value(Widgt => Button, Name => "default");
         Options.Image := Option_Value(Ttk_Widgt => Button, Name => "image");
         Options.State := Option_Value(Ttk_Widgt => Button, Name => "state");
         Options.Style := Option_Value(Widgt => Button, Name => "style");
         Options.Take_Focus :=
           Option_Value(Widgt => Button, Name => "takefocus");
         Options.Text := Option_Value(Widgt => Button, Name => "text");
         Options.Text_Variable :=
           Option_Value(Widgt => Button, Name => "textvariable");
         Options.Underline :=
           Option_Value(Widgt => Button, Name => "underline");
         Options.Width := Option_Value(Widgt => Button, Name => "width");
      end return;
   end Get_Options;

   procedure Configure(Button: Ttk_Button; Options: Ttk_Button_Options) is
   begin
      Execute_Widget_Command
        (Widgt => Button, Command_Name => "configure",
         Options => Options_To_String(Options => Options));
   end Configure;

   procedure Invoke(Button: Ttk_Button) is
   begin
      Execute_Widget_Command(Widgt => Button, Command_Name => "invoke");
   end Invoke;

   function Invoke(Button: Ttk_Button) return String is
   begin
      Invoke(Button => Button);
      return Tcl_Get_Result(Interpreter => Tk_Interp(Widgt => Button));
   end Invoke;

end Tk.TtkButton;
