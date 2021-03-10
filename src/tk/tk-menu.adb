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

with Ada.Characters.Handling; use Ada.Characters.Handling;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
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
     (Menu_Widget: out Tk_Menu; Path_Name: String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Menu_Widget := Create(Path_Name, Options, Interpreter);
   end Create;

   procedure Activate(Menu_Widget: Tk_Menu; Index: Tcl_String) is
   begin
      Execute_Widget_Command(Menu_Widget, "activate", To_Ada_String(Index));
   end Activate;

   procedure Activate
     (Menu_Widget: Tk_Menu; Index: Natural; Is_Index: Boolean := True) is
   begin
      if Is_Index then
         Execute_Widget_Command
           (Menu_Widget, "activate", Trim(Natural'Image(Index), Left));
      else
         Execute_Widget_Command
           (Menu_Widget, "activate", "@" & Trim(Natural'Image(Index), Left));
      end if;
   end Activate;

   procedure Activate(Menu_Widget: Tk_Menu; Index: Menu_Item_Indexes) is
   begin
      Execute_Widget_Command
        (Menu_Widget, "activate", To_Lower(Menu_Item_Indexes'Image(Index)));
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
      Option_Image("state", Options.State, Options_String);
      Option_Image("underline", Options.Underline, Options_String);
      if Item_Type in CHECKBUTTON | RADIOBUTTON then
         Option_Image("indicatoron", Options.Indicator_On, Options_String);
         Option_Image("selectcolor", Options.Select_Color, Options_String);
         Option_Image("selectimage", Options.Select_Image, Options_String);
         Option_Image("variable", Options.Variable, Options_String);
      end if;
      if Item_Type = CHECKBUTTON then
         Option_Image("offvalue", Options.Off_Value, Options_String);
         Option_Image("onvalue", Options.On_Value, Options_String);
      end if;
      if Item_Type = RADIOBUTTON then
         Option_Image("value", Options.Value, Options_String);
      end if;
      if Item_Type = CASCADE and then Options.Menu /= Null_Widget then
         Append(Options_String, " -menu " & Tk_PathName(Options.Menu));
      end if;
      return To_String(Options_String);
   end Item_Options_To_String;

   procedure Add
     (Menu_Widget: Tk_Menu; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options) is
   begin
      Execute_Widget_Command
        (Menu_Widget, "add",
         To_Lower(Menu_Item_Types'Image(Item_Type)) & " " &
         Item_Options_To_String(Options, Item_Type));
   end Add;

   function Get_Options(Menu_Widget: Tk_Menu) return Menu_Options is
   begin
      return Options: Menu_Options do
         Options.Active_Background :=
           Option_Value(Menu_Widget, "activebackground");
         Options.Active_Border_Width :=
           Option_Value(Menu_Widget, "activeborderwidth");
         Options.Active_Foreground :=
           Option_Value(Menu_Widget, "activeforeground");
         Options.Background := Option_Value(Menu_Widget, "background");
         Options.Border_Width := Option_Value(Menu_Widget, "borderwidth");
         Options.Cursor := Option_Value(Menu_Widget, "cursor");
         Options.Disabled_Foreground :=
           Option_Value(Menu_Widget, "disabledforeground");
         Options.Font := Option_Value(Menu_Widget, "font");
         Options.Foreground := Option_Value(Menu_Widget, "foreground");
         Options.Relief := Option_Value(Menu_Widget, "relief");
         Options.Post_Command := Option_Value(Menu_Widget, "postcommand");
         Options.Select_Color := Option_Value(Menu_Widget, "selectcolor");
         Options.Take_Focus := Option_Value(Menu_Widget, "takefocus");
         Options.Tear_Off := Option_Value(Menu_Widget, "tearoff");
         Options.Tear_Off_Command :=
           Option_Value(Menu_Widget, "tearoffcommand");
         Options.Title := Option_Value(Menu_Widget, "title");
         Execute_Widget_Command(Menu_Widget, "cget", "-type");
         Options.Menu_Type :=
           Menu_Types'Value(Tcl_Get_Result(Tk_Interp(Menu_Widget)));
      end return;
   end Get_Options;

   function Clone
     (Menu_Widget: Tk_Menu; New_Path_Name: String;
      Menu_Type: Menu_Types := NONE) return Tk_Menu is
   begin
      if Menu_Type /= NONE then
         Execute_Widget_Command
           (Menu_Widget, "clone",
            New_Path_Name & " " & To_Lower(Menu_Types'Image(Menu_Type)));
      else
         Execute_Widget_Command(Menu_Widget, "clone", New_Path_Name);
      end if;
      return Tk_Menu(Get_Widget(New_Path_Name, Tk_Interp(Menu_Widget)));
   end Clone;

   procedure Configure(Menu_Widget: Tk_Menu; Options: Menu_Options) is
   begin
      Execute_Widget_Command
        (Menu_Widget, "configure", Options_To_String(Options));
   end Configure;

   procedure Delete
     (Menu_Widget: Tk_Menu; Index1: Tcl_String;
      Index2: Tcl_String := To_Tcl_String("")) is
   begin
      Execute_Widget_Command
        (Menu_Widget, "delete",
         To_Ada_String(Index1) & " " & To_Ada_String(Index2));
   end Delete;

   procedure Delete
     (Menu_Widget: Tk_Menu; Index1: Natural; Index2: Extended_Natural := -1;
      Is_Index1, Is_Index2: Boolean := True) is
      NewIndex1: constant String :=
        (if Is_Index1 then Trim(Natural'Image(Index1), Left)
         else "@" & Trim(Natural'Image(Index1), Left));
      NewIndex2: constant String :=
        (if Is_Index2 then Trim(Extended_Natural'Image(Index2), Left)
         else "@" & Trim(Extended_Natural'Image(Index2), Left));
   begin

      if Index2 > -1 then
         Execute_Widget_Command
           (Menu_Widget, "delete", NewIndex1 & " " & NewIndex2);
      else
         Execute_Widget_Command(Menu_Widget, "delete", NewIndex1);
      end if;
   end Delete;

   procedure Delete
     (Menu_Widget: Tk_Menu; Index1: Menu_Item_Indexes;
      Index2: Menu_Item_Indexes := NONE) is
   begin
      if Index2 /= NONE then
         Execute_Widget_Command
           (Menu_Widget, "delete",
            To_Lower(Menu_Item_Indexes'Image(Index1)) & " " &
            To_Lower(Menu_Item_Indexes'Image(Index2)));
      else
         Execute_Widget_Command
           (Menu_Widget, "delete", To_Lower(Menu_Item_Indexes'Image(Index1)));
      end if;
   end Delete;

   function Entry_Get_Options
     (Menu_Widget: Tk_Menu; Index: Tcl_String) return Menu_Item_Options is
      Item_Type: Menu_Item_Types;
      function Item_Value(Name: String) return Tcl_String is
      begin
         Execute_Widget_Command
           (Menu_Widget, "entrycget", To_Ada_String(Index) & " -" & Name);
         return To_Tcl_String(Tcl_Get_Result(Tk_Interp(Menu_Widget)));
      end Item_Value;
      function Item_Value(Name: String) return Extended_Boolean is
      begin
         Execute_Widget_Command
           (Menu_Widget, "entrycget", To_Ada_String(Index) & " -" & Name);
         if Tcl_Get_Result = 1 then
            return TRUE;
         end if;
         return FALSE;
      end Item_Value;
   begin
      return Options: Menu_Item_Options do
         Execute_Widget_Command(Menu_Widget, "type", To_Ada_String(Index));
         Item_Type :=
           Menu_Item_Types'Value(Tcl_Get_Result(Tk_Interp(Menu_Widget)));
         Options.Active_Background := Item_Value("activebackground");
         Options.Active_Foreground := Item_Value("activeforeground");
         Options.Accelerator := Item_Value("accelerator");
         Options.Background := Item_Value("background");
         Options.Bitmap := Item_Value("bitmap");
         Options.Column_Break := Item_Value("columnbreak");
         Options.Command := Item_Value("command");
         Execute_Widget_Command
           (Menu_Widget, "entrycget", To_Ada_String(Index) & " -compound");
         Options.Compound :=
           Place_Type'Value(Tcl_Get_Result(Tk_Interp(Menu_Widget)));
         Options.Font := Item_Value("font");
         Options.Foreground := Item_Value("foreground");
         Options.Hide_Margin := Item_Value("hidemargin");
         Options.Image := Item_Value("image");
         Options.Label := Item_Value("label");
         Execute_Widget_Command
           (Menu_Widget, "entrycget", To_Ada_String(Index) & " -state");
         Options.State :=
           State_Type'Value(Tcl_Get_Result(Tk_Interp(Menu_Widget)));
         Execute_Widget_Command
           (Menu_Widget, "entrycget", To_Ada_String(Index) & " -underline");
         Options.Underline :=
           Extended_Natural(Integer'(Tcl_Get_Result(Tk_Interp(Menu_Widget))));
         case Item_Type is
            when CASCADE =>
               Execute_Widget_Command
                 (Menu_Widget, "entrycget", To_Ada_String(Index) & " -menu");
               Options.Menu :=
                 Get_Widget
                   (Tcl_Get_Result(Tk_Interp(Menu_Widget)),
                    Tk_Interp(Menu_Widget));
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

   function Entry_Get_Options
     (Menu_Widget: Tk_Menu; Index: Natural; Is_Index: Boolean := True)
      return Menu_Item_Options is
      New_Index: constant Tcl_String :=
        (if Is_Index then To_Tcl_String(Trim(Natural'Image(Index), Left))
         else To_Tcl_String("@" & Trim(Natural'Image(Index), Left)));
   begin
      return Entry_Get_Options(Menu_Widget, New_Index);
   end Entry_Get_Options;

   function Entry_Get_Options
     (Menu_Widget: Tk_Menu; Index: Menu_Item_Indexes)
      return Menu_Item_Options is
   begin
      return Entry_Get_Options
          (Menu_Widget,
           To_Tcl_String(To_Lower(Menu_Item_Indexes'Image(Index))));
   end Entry_Get_Options;

   procedure Entry_Configure
     (Menu_Widget: Tk_Menu; Index: Tcl_String; Options: Menu_Item_Options) is
   begin
      Execute_Widget_Command(Menu_Widget, "type", To_Ada_String(Index));
      Execute_Widget_Command
        (Menu_Widget, "entryconfigure",
         To_Ada_String(Index) & " " &
         Item_Options_To_String
           (Options,
            Menu_Item_Types'Value(Tcl_Get_Result(Tk_Interp(Menu_Widget)))));
   end Entry_Configure;

   procedure Entry_Configure
     (Menu_Widget: Tk_Menu; Index: Natural; Options: Menu_Item_Options;
      Is_Index: Boolean := True) is
      New_Index: constant String :=
        (if Is_Index then Trim(Natural'Image(Index), Left)
         else "@" & Trim(Natural'Image(Index), Left));
   begin
      Execute_Widget_Command(Menu_Widget, "type", New_Index);
      Execute_Widget_Command
        (Menu_Widget, "entryconfigure",
         New_Index & " " &
         Item_Options_To_String
           (Options,
            Menu_Item_Types'Value(Tcl_Get_Result(Tk_Interp(Menu_Widget)))));
   end Entry_Configure;

   procedure Entry_Configure
     (Menu_Widget: Tk_Menu; Index: Menu_Item_Indexes;
      Options: Menu_Item_Options) is
   begin
      Execute_Widget_Command
        (Menu_Widget, "type", To_Lower(Menu_Item_Indexes'Image(Index)));
      Execute_Widget_Command
        (Menu_Widget, "entryconfigure",
         To_Lower(Menu_Item_Indexes'Image(Index)) & " " &
         Item_Options_To_String
           (Options,
            Menu_Item_Types'Value(Tcl_Get_Result(Tk_Interp(Menu_Widget)))));
   end Entry_Configure;

   function Index
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Extended_Natural is
   begin
      Execute_Widget_Command(Menu_Widget, "index", To_Ada_String(Menu_Index));
      if Tcl_Get_Result(Tk_Interp(Menu_Widget)) = "none" then
         return -1;
      end if;
      return Extended_Natural
          (Integer'(Tcl_Get_Result(Tk_Interp(Menu_Widget))));
   end Index;

   function Index
     (Menu_Widget: Tk_Menu; Menu_Index: Natural) return Extended_Natural is
   begin
      Execute_Widget_Command
        (Menu_Widget, "index", "@" & Trim(Natural'Image(Menu_Index), Left));
      if Tcl_Get_Result(Tk_Interp(Menu_Widget)) = "none" then
         return -1;
      end if;
      return Extended_Natural
          (Integer'(Tcl_Get_Result(Tk_Interp(Menu_Widget))));
   end Index;

   function Index
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
      return Extended_Natural is
   begin
      Execute_Widget_Command
        (Menu_Widget, "index", To_Lower(Menu_Item_Indexes'Image(Menu_Index)));
      if Tcl_Get_Result(Tk_Interp(Menu_Widget)) = "none" then
         return -1;
      end if;
      return Extended_Natural
          (Integer'(Tcl_Get_Result(Tk_Interp(Menu_Widget))));
   end Index;

   procedure Insert
     (Menu_Widget: Tk_Menu; Index: Tcl_String; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options) is
   begin
      Execute_Widget_Command
        (Menu_Widget, "insert",
         To_Ada_String(Index) & " " &
         To_Lower(Menu_Item_Types'Image(Item_Type)) & " " &
         Item_Options_To_String(Options, Item_Type));
   end Insert;

   procedure Insert
     (Menu_Widget: Tk_Menu; Index: Natural; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options; Is_Index: Boolean := True) is
      New_Index: constant String :=
        (if Is_Index then Trim(Natural'Image(Index), Left)
         else "@" & Trim(Natural'Image(Index), Left));
   begin
      Execute_Widget_Command
        (Menu_Widget, "insert",
         New_Index & " " & To_Lower(Menu_Item_Types'Image(Item_Type)) & " " &
         Item_Options_To_String(Options, Item_Type));
   end Insert;

   procedure Insert
     (Menu_Widget: Tk_Menu; Index: Menu_Item_Indexes;
      Item_Type: Menu_Item_Types; Options: Menu_Item_Options) is
   begin
      Execute_Widget_Command
        (Menu_Widget, "insert",
         To_Lower(Menu_Item_Indexes'Image(Index)) & " " &
         To_Lower(Menu_Item_Types'Image(Item_Type)) & " " &
         Item_Options_To_String(Options, Item_Type));
   end Insert;

   procedure Invoke(Menu_Widget: Tk_Menu; Index: Tcl_String) is
   begin
      Execute_Widget_Command(Menu_Widget, "invoke", To_Ada_String(Index));
   end Invoke;

   procedure Invoke
     (Menu_Widget: Tk_Menu; Index: Natural; Is_Index: Boolean := True) is
      New_Index: constant String :=
        (if Is_Index then Trim(Natural'Image(Index), Left)
         else "@" & Trim(Natural'Image(Index), Left));
   begin
      Execute_Widget_Command(Menu_Widget, "invoke", New_Index);
   end Invoke;

   procedure Invoke(Menu_Widget: Tk_Menu; Index: Menu_Item_Indexes) is
   begin
      Execute_Widget_Command
        (Menu_Widget, "invoke", To_Lower(Menu_Item_Indexes'Image(Index)));
   end Invoke;

   function Invoke(Menu_Widget: Tk_Menu; Index: Tcl_String) return String is
   begin
      Invoke(Menu_Widget, Index);
      return Tcl_Get_Result(Tk_Interp(Menu_Widget));
   end Invoke;

   function Invoke
     (Menu_Widget: Tk_Menu; Index: Natural; Is_Index: Boolean := True)
      return String is
   begin
      Invoke(Menu_Widget, Index, Is_Index);
      return Tcl_Get_Result(Tk_Interp(Menu_Widget));
   end Invoke;

   function Invoke
     (Menu_Widget: Tk_Menu; Index: Menu_Item_Indexes) return String is
   begin
      Invoke(Menu_Widget, Index);
      return Tcl_Get_Result(Tk_Interp(Menu_Widget));
   end Invoke;

   procedure Post(Menu_Widget: Tk_Menu; X, Y: Natural) is
   begin
      Execute_Widget_Command
        (Menu_Widget, "post", Trim(Natural'Image(X), Left) & Natural'Image(Y));
   end Post;

   function Post(Menu_Widget: Tk_Menu; X, Y: Natural) return String is
   begin
      Post(Menu_Widget, X, Y);
      return Tcl_Get_Result(Tk_Interp(Menu_Widget));
   end Post;

   procedure PostCascade(Menu_Widget: Tk_Menu; Index: Tcl_String) is
   begin
      Execute_Widget_Command(Menu_Widget, "postcascade", To_Ada_String(Index));
   end PostCascade;

   procedure PostCascade
     (Menu_Widget: Tk_Menu; Index: Natural; Is_Index: Boolean := True) is
      New_Index: constant String :=
        (if Is_Index then Trim(Natural'Image(Index), Left)
         else "@" & Trim(Natural'Image(Index), Left));
   begin
      Execute_Widget_Command(Menu_Widget, "postcascade", New_Index);
   end PostCascade;

   procedure PostCascade(Menu_Widget: Tk_Menu; Index: Menu_Item_Indexes) is
   begin
      Execute_Widget_Command
        (Menu_Widget, "postcascade", To_Lower(Menu_Item_Indexes'Image(Index)));
   end PostCascade;

   function Get_Item_Type
     (Menu_Widget: Tk_Menu; Index: Tcl_String) return Menu_Item_Types is
   begin
      Execute_Widget_Command(Menu_Widget, "type", To_Ada_String(Index));
      return Menu_Item_Types'Value(Tcl_Get_Result(Tk_Interp(Menu_Widget)));
   end Get_Item_Type;

   function Get_Item_Type
     (Menu_Widget: Tk_Menu; Index: Natural; Is_Index: Boolean := True)
      return Menu_Item_Types is
      New_Index: constant String :=
        (if Is_Index then Trim(Natural'Image(Index), Left)
         else "@" & Trim(Natural'Image(Index), Left));
   begin
      Execute_Widget_Command(Menu_Widget, "type", New_Index);
      return Menu_Item_Types'Value(Tcl_Get_Result(Tk_Interp(Menu_Widget)));
   end Get_Item_Type;

   function Get_Item_Type
     (Menu_Widget: Tk_Menu; Index: Menu_Item_Indexes) return Menu_Item_Types is
   begin
      Execute_Widget_Command
        (Menu_Widget, "type", To_Lower(Menu_Item_Indexes'Image(Index)));
      return Menu_Item_Types'Value(Tcl_Get_Result(Tk_Interp(Menu_Widget)));
   end Get_Item_Type;

   procedure Unpost(Menu_Widget: Tk_Menu) is
   begin
      Execute_Widget_Command(Menu_Widget, "unpost");
   end Unpost;

   function X_Position
     (Menu_Widget: Tk_Menu; Index: Tcl_String) return Natural is
   begin
      Execute_Widget_Command(Menu_Widget, "xposition", To_Ada_String(Index));
      return Tcl_Get_Result(Tk_Interp(Menu_Widget));
   end X_Position;

   function X_Position
     (Menu_Widget: Tk_Menu; Index: Natural; Is_Index: Boolean := True)
      return Natural is
      New_Index: constant String :=
        (if Is_Index then Trim(Natural'Image(Index), Left)
         else "@" & Trim(Natural'Image(Index), Left));
   begin
      Execute_Widget_Command(Menu_Widget, "xposition", New_Index);
      return Tcl_Get_Result(Tk_Interp(Menu_Widget));
   end X_Position;

   function X_Position
     (Menu_Widget: Tk_Menu; Index: Menu_Item_Indexes) return Natural is
   begin
      Execute_Widget_Command
        (Menu_Widget, "xposition", To_Lower(Menu_Item_Indexes'Image(Index)));
      return Tcl_Get_Result(Tk_Interp(Menu_Widget));
   end X_Position;

   function Y_Position
     (Menu_Widget: Tk_Menu; Index: Tcl_String) return Natural is
   begin
      Execute_Widget_Command(Menu_Widget, "yposition", To_Ada_String(Index));
      return Tcl_Get_Result(Tk_Interp(Menu_Widget));
   end Y_Position;

   function Y_Position
     (Menu_Widget: Tk_Menu; Index: Natural; Is_Index: Boolean := True)
      return Natural is
      New_Index: constant String :=
        (if Is_Index then Trim(Natural'Image(Index), Left)
         else "@" & Trim(Natural'Image(Index), Left));
   begin
      Execute_Widget_Command(Menu_Widget, "yposition", New_Index);
      return Tcl_Get_Result(Tk_Interp(Menu_Widget));
   end Y_Position;

   function Y_Position
     (Menu_Widget: Tk_Menu; Index: Menu_Item_Indexes) return Natural is
   begin
      Execute_Widget_Command
        (Menu_Widget, "yposition", To_Lower(Menu_Item_Indexes'Image(Index)));
      return Tcl_Get_Result(Tk_Interp(Menu_Widget));
   end Y_Position;

end Tk.Menu;
