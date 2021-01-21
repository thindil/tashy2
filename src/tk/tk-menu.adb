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

package body Tk.Menu is

   -- ****if* Menu/Menu.Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options - Ada Menu_Options to convert
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Options_To_String(Options: Menu_Options) return String is
      -- ****
      Options_String: Unbounded_String;
   begin
      Option_Image
        ("activebackground", Options.Active_Background, Options_String);
      Option_Image
        ("activeborderwidth", Options.Active_Border_Width, Options_String);
      Option_Image
        ("activeforeground", Options.Active_Foreground, Options_String);
      Option_Image("background", Options.Background, Options_String);
      Option_Image("borderwidth", Options.Border_Width, Options_String);
      Option_Image("cursor", Options.Cursor, Options_String);
      Option_Image
        ("disabledforeground", Options.Disabled_Foreground, Options_String);
      Option_Image("font", Options.Font, Options_String);
      Option_Image("foreground", Options.Foreground, Options_String);
      Option_Image("relief", Options.Relief, Options_String);
      Option_Image("postcommand", Options.Post_Command, Options_String);
      Option_Image("selectcolor", Options.Select_Color, Options_String);
      Option_Image("takefocus", Options.Take_Focus, Options_String);
      Option_Image("tearoff", Options.Tear_Off, Options_String);
      Option_Image("tearoffcommand", Options.Tear_Off_Command, Options_String);
      Option_Image("title", Options.Title, Options_String);
      if Options.Menu_Type /= NONE then
         Append
           (Options_String,
            " -type " & To_Lower(Menu_Types'Image(Options.Menu_Type)));
      end if;
      return To_String(Options_String);
   end Options_To_String;

   function Create
     (Path_Name: String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Menu is
   begin
      Tcl_Eval
        ("menu " & Path_Name & " " & Options_To_String(Options), Interpreter);
      return Get_Widget(Path_Name, Interpreter);
   end Create;

   procedure Create
     (Widget: out Tk_Menu; Path_Name: String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Widget := Create(Path_Name, Options, Interpreter);
   end Create;

   procedure Activate(Menu: Tk_Menu; Index: Tcl_String) is
   begin
      Execute_Widget_Command(Menu, "activate", To_Ada_String(Index));
   end Activate;

   -- ****if* Menu/Menu.Item_Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options - Ada Menu_Item_Options to convert
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Item_Options_To_String
     (Options: Menu_Item_Options; Item_Type: Menu_Item_Types) return String is
      -- ****
      Options_String: Unbounded_String;
   begin
      if Item_Type = SEPARATOR then
         return "";
      end if;
      Option_Image
        ("activebackground", Options.Active_Background, Options_String);
      Option_Image
        ("activeforeground", Options.Active_Foreground, Options_String);
      Option_Image("accelerator", Options.Accelerator, Options_String);
      Option_Image("background", Options.Background, Options_String);
      Option_Image("bitmap", Options.Bitmap, Options_String);
      Option_Image("columnbreak", Options.Column_Break, Options_String);
      Option_Image("command", Options.Command, Options_String);
      Option_Image("compound", Options.Compound, Options_String);
      Option_Image("font", Options.Font, Options_String);
      Option_Image("foreground", Options.Foreground, Options_String);
      Option_Image("hidemargin", Options.Hide_Margin, Options_String);
      Option_Image("image", Options.Image, Options_String);
      Option_Image("label", Options.Label, Options_String);
      Option_Image("selectcolor", Options.Select_Color, Options_String);
      Option_Image("state", Options.State, Options_String);
      Option_Image("underline", Options.UnderLine, Options_String);
      return To_String(Options_String);
   end Item_Options_To_String;

   procedure Add
     (Widget: Tk_Menu; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options) is
   begin
      Execute_Widget_Command
        (Widget, "add",
         To_Lower(Menu_Item_Types'Image(Item_Type)) & " " &
         Item_Options_To_String(Options, Item_Type));
   end Add;

   function Get_Options(Widget: Tk_Menu) return Menu_Options is
   begin
      return Options: Menu_Options do
         Options.Active_Background := Option_Value(Widget, "activebackground");
         Options.Active_Border_Width :=
           Option_Value(Widget, "activeborderwidth");
         Options.Active_Foreground := Option_Value(Widget, "activeforeground");
         Options.Background := Option_Value(Widget, "background");
         Options.Border_Width := Option_Value(Widget, "borderwidth");
         Options.Cursor := Option_Value(Widget, "cursor");
         Options.Disabled_Foreground :=
           Option_Value(Widget, "disabledforeground");
         Options.Font := Option_Value(Widget, "font");
         Options.Foreground := Option_Value(Widget, "foreground");
         Options.Relief := Option_Value(Widget, "relief");
         Options.Post_Command := Option_Value(Widget, "postcommand");
         Options.Select_Color := Option_Value(Widget, "selectcolor");
         Options.Take_Focus := Option_Value(Widget, "takefocus");
         Options.Tear_Off := Option_Value(Widget, "tearoff");
         Options.Tear_Off_Command := Option_Value(Widget, "tearoffcommand");
         Options.Title := Option_Value(Widget, "title");
         Execute_Widget_Command(Widget, "cget", "-type");
         Options.Menu_Type :=
           Menu_Types'Value(Tcl_GetResult(Tk_Interp(Widget)));
      end return;
   end Get_Options;

   procedure Clone
     (Widget: Tk_Menu; New_Path_Name: String; Menu_Type: Menu_Types := NONE) is
   begin
      Execute_Widget_Command
        (Widget, "clone",
         New_Path_Name & " " & To_Lower(Menu_Types'Image(Menu_Type)));
   end Clone;

   procedure Configure(Widget: Tk_Menu; Options: Menu_Options) is
   begin
      Execute_Widget_Command(Widget, "configure", Options_To_String(Options));
   end Configure;

   procedure Delete(Widget: Tk_Menu; Index1: String; Index2: String := "") is
   begin
      Execute_Widget_Command(Widget, "delete", Index1 & " " & Index2);
   end Delete;

   function Entry_Get_Options
     (Widget: Tk_Menu; Index: String) return Menu_Item_Options is
      Item_Type: Menu_Item_Types;
      function Item_Value(Name: String) return Tcl_String is
      begin
         Execute_Widget_Command(Widget, "entrycget", Index & " -" & Name);
         return To_Tcl_String(Tcl_GetResult(Tk_Interp(Widget)));
      end Item_Value;
      function Item_Value(Name: String) return Extended_Boolean is
      begin
         Execute_Widget_Command(Widget, "entrycget", Index & " -" & Name);
         if Tcl_GetResult = 1 then
            return TRUE;
         end if;
         return FALSE;
      end Item_Value;
   begin
      return Options: Menu_Item_Options do
         Execute_Widget_Command(Widget, "type", Index);
         Item_Type := Menu_Item_Types'Value(Tcl_GetResult(Tk_Interp(Widget)));
         Options.Active_Background := Item_Value("activebackground");
         Options.Active_Foreground := Item_Value("activeforeground");
         Options.Accelerator := Item_Value("accelerator");
         Options.Background := Item_Value("background");
         Options.Bitmap := Item_Value("bitmap");
         Options.Column_Break := Item_Value("columnbreak");
         Options.Command := Item_Value("command");
         Execute_Widget_Command(Widget, "entrycget", Index & " -compound");
         Options.Compound :=
           Place_Type'Value(Tcl_GetResult(Tk_Interp(Widget)));
         Options.Font := Item_Value("font");
         Options.Foreground := Item_Value("foreground");
         Options.Hide_Margin := Item_Value("hidemargin");
         Options.Image := Item_Value("image");
         Options.Label := Item_Value("label");
         Execute_Widget_Command(Widget, "entrycget", Index & " -state");
         Options.State := State_Type'Value(Tcl_GetResult(Tk_Interp(Widget)));
         Execute_Widget_Command(Widget, "entrycget", Index & " -underline");
         Options.UnderLine :=
           Extended_Natural(Integer'(Tcl_GetResult(Tk_Interp(Widget))));
         case Item_Type is
            when CASCADE =>
               Execute_Widget_Command(Widget, "entrycget", Index & " -menu");
               Options.Menu :=
                 Get_Widget
                   (Tcl_GetResult(Tk_Interp(Widget)), Tk_Interp(Widget));
            when CHECKBUTTON | RADIOBUTTON =>
               Options.Indicator_On := Item_Value("inditatoron");
               Options.Select_Color := Item_Value("selectcolor");
               Options.Select_Image := Item_Value("selectimage");
               case Item_Type is
                  when CHECKBUTTON =>
                     Options.Off_Value := Item_Value("offvalue");
                     Options.On_Value := Item_Value("onvalue");
                  when RADIOBUTTON =>
                     Options.Value := Item_Value("value");
                  when others =>
                     null;
               end case;
            when others =>
               null;
         end case;
      end return;
   end Entry_Get_Options;

   procedure Entry_Configure
     (Widget: Tk_Menu; Index: String; Options: Menu_Item_Options) is
   begin
      Execute_Widget_Command(Widget, "type", Index);
      Execute_Widget_Command
        (Widget, "entryconfigure",
         Index & " " &
         Item_Options_To_String
           (Options, Menu_Item_Types'Value(Tcl_GetResult(Tk_Interp(Widget)))));
   end Entry_Configure;

   function Index(Widget: Tk_Menu; Index: String) return Extended_Natural is
   begin
      Execute_Widget_Command(Widget, "index", Index);
      if Tcl_GetResult(Tk_Interp(Widget)) = "none" then
         return -1;
      end if;
      return Extended_Natural(Integer'(Tcl_GetResult(Tk_Interp(Widget))));
   end Index;

   procedure Insert
     (Widget: Tk_Menu; Index: String; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options) is
   begin
      Execute_Widget_Command
        (Widget, "add",
         Index & " " & To_Lower(Menu_Item_Types'Image(Item_Type)) & " " &
         Item_Options_To_String(Options, Item_Type));
   end Insert;

   procedure Invoke(Widget: Tk_Menu; Index: String) is
   begin
      Execute_Widget_Command(Widget, "invoke", Index);
   end Invoke;

   function Invoke(Widget: Tk_Menu; Index: String) return String is
   begin
      Invoke(Widget, Index);
      return Tcl_GetResult(Tk_Interp(Widget));
   end Invoke;

end Tk.Menu;
