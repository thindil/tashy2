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

with Ada.Characters.Handling;
with Ada.Strings.Unbounded;

package body Tk.TtkEntry is

   -- ****if* TtkEntry/TtkEntry.Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options - Ada Ttk_Entry_Options to convert
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Options_To_String(Options: Ttk_Entry_Options) return String is
      -- ****
      use Ada.Characters.Handling;
      use Ada.Strings.Unbounded;

      Options_String: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "class", Value => Options.Class,
         Options_String => Options_String);
      Option_Image
        (Name => "cursor", Value => Options.Cursor,
         Options_String => Options_String);
      Option_Image
        (Name => "exportselection", Value => Options.Export_Selection,
         Options_String => Options_String);
      Option_Image
        (Name => "invalidcommand", Value => Options.Invalid_Command,
         Options_String => Options_String);
      Option_Image
        (Name => "justify", Value => Options.Justify,
         Options_String => Options_String);
      Option_Image
        (Name => "show", Value => Options.Show,
         Options_String => Options_String);
      if Options.State /= NONE then
         Append
           (Source => Options_String,
            New_Item =>
              " -state " &
              To_Lower(Item => Entry_State_Type'Image(Options.State)));
      end if;
      Option_Image
        (Name => "style", Value => Options.Style,
         Options_String => Options_String);
      Option_Image
        (Name => "takefocus", Value => Options.Take_Focus,
         Options_String => Options_String);
      Option_Image
        (Name => "textvariable", Value => Options.Text_Variable,
         Options_String => Options_String);
      if Options.Validation /= EMPTY then
         Append
           (Source => Options_String,
            New_Item =>
              " -validate " &
              To_Lower(Item => Validate_Type'Image(Options.Validation)));
      end if;
      Option_Image
        (Name => "validatecommand", Value => Options.Validate_Command,
         Options_String => Options_String);
      Option_Image
        (Name => "width", Value => Options.Width,
         Options_String => Options_String);
      Option_Image
        (Name => "xscrollcommand", Value => Options.X_Scroll_Command,
         Options_String => Options_String);
      return To_String(Source => Options_String);
   end Options_To_String;

   function Create
     (Path_Name: String; Options: Ttk_Entry_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Entry is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "ttk::entry " & Path_Name & " " &
           Options_To_String(Options => Options),
         Interpreter => Interpreter);
      return Get_Widget(Path_Name => Path_Name, Interpreter => Interpreter);
   end Create;

   procedure Create
     (Entry_Widget: out Ttk_Entry; Path_Name: String;
      Options: Ttk_Entry_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      null;
   end Create;

   function Get_Options(Entry_Widget: Ttk_Entry) return Ttk_Entry_Options is
   begin
      return Default_Ttk_Entry_Options;
   end Get_Options;

   procedure Configure(Entry_Widget: Ttk_Entry; Options: Ttk_Entry_Options) is
   begin
      null;
   end Configure;

end Tk.TtkEntry;
