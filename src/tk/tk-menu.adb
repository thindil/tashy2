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

   -- ****if* Menu/Menu.Get_Result
   -- FUNCTION
   -- Used to get Integer result from the last Tcl command
   -- PARAMETERS
   -- Interpreter - Tcl interpreter from which result will be get
   -- RESULT
   -- Integer value for the last Tcl command
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Get_Result is new Generic_Scalar_Tcl_Get_Result
     (Result_Type => Integer);
   -- ****

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
      Options_String: Unbounded_String := Null_Unbounded_String;
   begin
      Option_Image
        (Name => "activebackground", Value => Options.Active_Background,
         Options_String => Options_String);
      Option_Image
        (Name => "activeborderwidth", Value => Options.Active_Border_Width,
         Options_String => Options_String);
      Option_Image
        (Name => "activeforeground", Value => Options.Active_Foreground,
         Options_String => Options_String);
      Option_Image
        (Name => "background", Value => Options.Background,
         Options_String => Options_String);
      Option_Image
        (Name => "borderwidth", Value => Options.Border_Width,
         Options_String => Options_String);
      Option_Image
        (Name => "cursor", Value => Options.Cursor,
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
        (Name => "relief", Value => Options.Relief,
         Options_String => Options_String);
      Option_Image
        (Name => "postcommand", Value => Options.Post_Command,
         Options_String => Options_String);
      Option_Image
        (Name => "selectcolor", Value => Options.Select_Color,
         Options_String => Options_String);
      Option_Image
        (Name => "takefocus", Value => Options.Take_Focus,
         Options_String => Options_String);
      Option_Image
        (Name => "tearoff", Value => Options.Tear_Off,
         Options_String => Options_String);
      Option_Image
        (Name => "tearoffcommand", Value => Options.Tear_Off_Command,
         Options_String => Options_String);
      Option_Image
        (Name => "title", Value => Options.Title,
         Options_String => Options_String);
      if Options.Menu_Type /= NONE then
         Append
           (Source => Options_String,
            New_Item =>
              " -type " &
              To_Lower(Item => Menu_Types'Image(Options.Menu_Type)));
      end if;
      return To_String(Source => Options_String);
   end Options_To_String;

   function Create
     (Path_Name: Tk_Path_String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Menu is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "menu " & Path_Name & " " & Options_To_String(Options => Options),
         Interpreter => Interpreter);
      return Get_Widget(Path_Name => Path_Name, Interpreter => Interpreter);
   end Create;

   procedure Create
     (Menu_Widget: out Tk_Menu; Path_Name: Tk_Path_String;
      Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      Menu_Widget :=
        Create
          (Path_Name => Path_Name, Options => Options,
           Interpreter => Interpreter);
   end Create;

   procedure Activate(Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "activate",
         Options => To_Ada_String(Source => Menu_Index));
   end Activate;

   procedure Activate
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "activate",
         Options =>
           (if Is_Index then "" else "@") &
           Trim(Source => Natural'Image(Menu_Index), Side => Left));
   end Activate;

   procedure Activate(Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "activate",
         Options => To_Lower(Item => Menu_Item_Indexes'Image(Menu_Index)));
   end Activate;

   -- ****if* Menu/Menu.Item_Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options   - Ada Menu_Item_Options to convert
   -- Item_Type - The type of menu item to add
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Item_Options_To_String
     (Options: Menu_Item_Options; Item_Type: Menu_Item_Types) return String is
      -- ****
      Options_String: Unbounded_String := Null_Unbounded_String;
   begin
      if Item_Type = SEPARATOR then
         return "";
      end if;
      Option_Image
        (Name => "activebackground", Value => Options.Active_Background,
         Options_String => Options_String);
      Option_Image
        (Name => "activeforeground", Value => Options.Active_Foreground,
         Options_String => Options_String);
      Option_Image
        (Name => "accelerator", Value => Options.Accelerator,
         Options_String => Options_String);
      Option_Image
        (Name => "background", Value => Options.Background,
         Options_String => Options_String);
      Option_Image
        (Name => "bitmap", Value => Options.Bitmap,
         Options_String => Options_String);
      Option_Image
        (Name => "columnbreak", Value => Options.Column_Break,
         Options_String => Options_String);
      Option_Image
        (Name => "command", Value => Options.Command,
         Options_String => Options_String);
      Option_Image
        (Name => "compound", Value => Options.Compound,
         Options_String => Options_String);
      Option_Image
        (Name => "font", Value => Options.Font,
         Options_String => Options_String);
      Option_Image
        (Name => "foreground", Value => Options.Foreground,
         Options_String => Options_String);
      Option_Image
        (Name => "hidemargin", Value => Options.Hide_Margin,
         Options_String => Options_String);
      Option_Image
        (Name => "image", Value => Options.Image,
         Options_String => Options_String);
      Option_Image
        (Name => "label", Value => Options.Label,
         Options_String => Options_String);
      Option_Image
        (Name => "state", Value => Options.State,
         Options_String => Options_String);
      Option_Image
        (Name => "underline", Value => Options.Underline,
         Options_String => Options_String);
      if Item_Type in CHECKBUTTON | RADIOBUTTON then
         Option_Image
           (Name => "indicatoron", Value => Options.Indicator_On,
            Options_String => Options_String);
         Option_Image
           (Name => "selectcolor", Value => Options.Select_Color,
            Options_String => Options_String);
         Option_Image
           (Name => "selectimage", Value => Options.Select_Image,
            Options_String => Options_String);
         Option_Image
           (Name => "variable", Value => Options.Variable,
            Options_String => Options_String);
      end if;
      if Item_Type = CHECKBUTTON then
         Option_Image
           (Name => "offvalue", Value => Options.Off_Value,
            Options_String => Options_String);
         Option_Image
           (Name => "onvalue", Value => Options.On_Value,
            Options_String => Options_String);
      end if;
      if Item_Type = RADIOBUTTON then
         Option_Image
           (Name => "value", Value => Options.Value,
            Options_String => Options_String);
      end if;
      if Item_Type = CASCADE and then Options.Menu /= Null_Widget then
         Append
           (Source => Options_String,
            New_Item => " -menu " & Tk_Path_Name(Widgt => Options.Menu));
      end if;
      return To_String(Source => Options_String);
   end Item_Options_To_String;

   procedure Add(Menu_Widget: Tk_Menu; Options: Menu_Item_Options) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "add",
         Options =>
           To_Lower(Item => Menu_Item_Types'Image(Options.Item_Type)) & " " &
           Item_Options_To_String
             (Options => Options, Item_Type => Options.Item_Type));
   end Add;

   function Get_Options(Menu_Widget: Tk_Menu) return Menu_Options is
   begin
      return Options: Menu_Options := Default_Menu_Options do
         Options.Active_Background :=
           Option_Value(Widgt => Menu_Widget, Name => "activebackground");
         Options.Active_Border_Width :=
           Option_Value(Widgt => Menu_Widget, Name => "activeborderwidth");
         Options.Active_Foreground :=
           Option_Value(Widgt => Menu_Widget, Name => "activeforeground");
         Options.Background :=
           Option_Value(Widgt => Menu_Widget, Name => "background");
         Options.Border_Width :=
           Option_Value(Widgt => Menu_Widget, Name => "borderwidth");
         Options.Cursor :=
           Option_Value(Widgt => Menu_Widget, Name => "cursor");
         Options.Disabled_Foreground :=
           Option_Value(Widgt => Menu_Widget, Name => "disabledforeground");
         Options.Font := Option_Value(Widgt => Menu_Widget, Name => "font");
         Options.Foreground :=
           Option_Value(Widgt => Menu_Widget, Name => "foreground");
         Options.Relief :=
           Option_Value(Widgt => Menu_Widget, Name => "relief");
         Options.Post_Command :=
           Option_Value(Widgt => Menu_Widget, Name => "postcommand");
         Options.Select_Color :=
           Option_Value(Widgt => Menu_Widget, Name => "selectcolor");
         Options.Take_Focus :=
           Option_Value(Widgt => Menu_Widget, Name => "takefocus");
         Options.Tear_Off :=
           Option_Value(Widgt => Menu_Widget, Name => "tearoff");
         Options.Tear_Off_Command :=
           Option_Value(Widgt => Menu_Widget, Name => "tearoffcommand");
         Options.Title := Option_Value(Widgt => Menu_Widget, Name => "title");
         Execute_Widget_Command
           (Widgt => Menu_Widget, Command_Name => "cget", Options => "-type");
         Options.Menu_Type :=
           Menu_Types'Value
             (Tcl_Get_Result(Interpreter => Tk_Interp(Widgt => Menu_Widget)));
      end return;
   end Get_Options;

   function Clone
     (Menu_Widget: Tk_Menu; New_Path_Name: Tk_Path_String;
      Menu_Type: Menu_Types := NONE) return Tk_Menu is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "clone",
         Options =>
           New_Path_Name &
           (if Menu_Type = NONE then ""
            else To_Lower(Item => Menu_Types'Image(Menu_Type))));
      return
        Tk_Menu
          (Get_Widget
             (Path_Name => New_Path_Name,
              Interpreter => Tk_Interp(Widgt => Menu_Widget)));
   end Clone;

   procedure Configure(Menu_Widget: Tk_Menu; Options: Menu_Options) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "configure",
         Options => Options_To_String(Options => Options));
   end Configure;

   procedure Delete
     (Menu_Widget: Tk_Menu; Index1: Tcl_String;
      Index2: Tcl_String := To_Tcl_String(Source => "")) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "delete",
         Options =>
           To_Ada_String(Source => Index1) & " " &
           To_Ada_String(Source => Index2));
   end Delete;

   procedure Delete
     (Menu_Widget: Tk_Menu; Index1: Natural; Index2: Extended_Natural := -1;
      Is_Index1, Is_Index2: Boolean := True) is
      New_Index1: constant String :=
        (if Is_Index1 then Trim(Source => Natural'Image(Index1), Side => Left)
         else "@" & Trim(Source => Natural'Image(Index1), Side => Left));
      New_Index2: constant String :=
        (if Is_Index2 then
           Trim(Source => Extended_Natural'Image(Index2), Side => Left)
         else "@" &
           Trim(Source => Extended_Natural'Image(Index2), Side => Left));
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "delete",
         Options =>
           New_Index1 & (if Index2 > -1 then " " & New_Index2 else ""));
   end Delete;

   procedure Delete
     (Menu_Widget: Tk_Menu; Index1: Menu_Item_Indexes;
      Index2: Menu_Item_Indexes := NONE) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "delete",
         Options =>
           To_Lower(Item => Menu_Item_Indexes'Image(Index1)) &
           (if Index2 = NONE then ""
            else " " & To_Lower(Item => Menu_Item_Indexes'Image(Index2))));
   end Delete;

   function Entry_Get_Options
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Menu_Item_Options is
      Item_Type: Menu_Item_Types := Default_Menu_Item;
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Menu_Widget);
      function Item_Value(Name: String) return Tcl_String is
      begin
         return
           To_Tcl_String
             (Source =>
                Execute_Widget_Command
                  (Widgt => Menu_Widget, Command_Name => "entrycget",
                   Options =>
                     To_Ada_String(Source => Menu_Index) & " -" & Name)
                  .Result);
      end Item_Value;
      function Item_Value(Name: String) return Extended_Boolean is
      begin
         Execute_Widget_Command
           (Widgt => Menu_Widget, Command_Name => "entrycget",
            Options => To_Ada_String(Source => Menu_Index) & " -" & Name);
         if Get_Result(Interpreter => Interpreter) = 1 then
            return TRUE;
         end if;
         return FALSE;
      end Item_Value;
   begin
      return Options: Menu_Item_Options := Default_Menu_Item_Options do
         Execute_Widget_Command
           (Widgt => Menu_Widget, Command_Name => "type",
            Options => To_Ada_String(Source => Menu_Index));
         Item_Type :=
           Menu_Item_Types'Value(Tcl_Get_Result(Interpreter => Interpreter));
         Options.Active_Background := Item_Value(Name => "activebackground");
         Options.Active_Foreground := Item_Value(Name => "activeforeground");
         Options.Accelerator := Item_Value(Name => "accelerator");
         Options.Background := Item_Value(Name => "background");
         Options.Bitmap := Item_Value(Name => "bitmap");
         Options.Column_Break := Item_Value(Name => "columnbreak");
         Options.Command := Item_Value(Name => "command");
         Options.Compound :=
           Place_Type'Value
             (Execute_Widget_Command
                (Widgt => Menu_Widget, Command_Name => "entrycget",
                 Options => To_Ada_String(Source => Menu_Index) & " -compound")
                .Result);
         Options.Font := Item_Value(Name => "font");
         Options.Foreground := Item_Value(Name => "foreground");
         Options.Hide_Margin := Item_Value(Name => "hidemargin");
         Options.Image := Item_Value(Name => "image");
         Options.Label := Item_Value(Name => "label");
         Options.State :=
           State_Type'Value
             (Execute_Widget_Command
                (Widgt => Menu_Widget, Command_Name => "entrycget",
                 Options => To_Ada_String(Source => Menu_Index) & " -state")
                .Result);
         Options.Underline :=
           Extended_Natural'Value
             (Execute_Widget_Command
                (Widgt => Menu_Widget, Command_Name => "entrycget",
                 Options =>
                   To_Ada_String(Source => Menu_Index) & " -underline")
                .Result);
         case Item_Type is
            when CASCADE =>
               Options.Menu :=
                 Get_Widget
                   (Path_Name =>
                      Execute_Widget_Command
                        (Widgt => Menu_Widget, Command_Name => "entrycget",
                         Options =>
                           To_Ada_String(Source => Menu_Index) & " -menu")
                        .Result,
                    Interpreter => Interpreter);
            when CHECKBUTTON | RADIOBUTTON =>
               Options.Indicator_On := Item_Value(Name => "inditatoron");
               Options.Select_Color := Item_Value(Name => "selectcolor");
               Options.Select_Image := Item_Value(Name => "selectimage");
               case Item_Type is
                  when CHECKBUTTON =>
                     Options.Off_Value := Item_Value(Name => "offvalue");
                     Options.On_Value := Item_Value(Name => "onvalue");
                  when RADIOBUTTON =>
                     Options.Value := Item_Value(Name => "value");
                  when others =>
                     null;
               end case;
            when others =>
               null;
         end case;
      end return;
   end Entry_Get_Options;

   function Entry_Get_Options
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return Menu_Item_Options is
      New_Index: constant Tcl_String :=
        (if Is_Index then
           To_Tcl_String
             (Source =>
                Trim(Source => Natural'Image(Menu_Index), Side => Left))
         else To_Tcl_String
             (Source =>
                "@" &
                Trim(Source => Natural'Image(Menu_Index), Side => Left)));
   begin
      return
        Entry_Get_Options(Menu_Widget => Menu_Widget, Menu_Index => New_Index);
   end Entry_Get_Options;

   function Entry_Get_Options
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
      return Menu_Item_Options is
   begin
      return
        Entry_Get_Options
          (Menu_Widget => Menu_Widget,
           Menu_Index =>
             To_Tcl_String
               (Source =>
                  To_Lower(Item => Menu_Item_Indexes'Image(Menu_Index))));
   end Entry_Get_Options;

   procedure Entry_Configure
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String;
      Options: Menu_Item_Options) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "entryconfigure",
         Options =>
           To_Ada_String(Source => Menu_Index) & " " &
           Item_Options_To_String
             (Options => Options,
              Item_Type =>
                Menu_Item_Types'Value
                  (Execute_Widget_Command
                     (Widgt => Menu_Widget, Command_Name => "type",
                      Options => To_Ada_String(Source => Menu_Index))
                     .Result)));
   end Entry_Configure;

   procedure Entry_Configure
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Options: Menu_Item_Options;
      Is_Index: Boolean := True) is
      New_Index: constant String :=
        (if Is_Index then
           Trim(Source => Natural'Image(Menu_Index), Side => Left)
         else "@" & Trim(Source => Natural'Image(Menu_Index), Side => Left));
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "entryconfigure",
         Options =>
           New_Index & " " &
           Item_Options_To_String
             (Options => Options,
              Item_Type =>
                Menu_Item_Types'Value
                  (Execute_Widget_Command
                     (Widgt => Menu_Widget, Command_Name => "type",
                      Options => New_Index)
                     .Result)));
   end Entry_Configure;

   procedure Entry_Configure
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes;
      Options: Menu_Item_Options) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "entryconfigure",
         Options =>
           To_Lower(Item => Menu_Item_Indexes'Image(Menu_Index)) & " " &
           Item_Options_To_String
             (Options => Options,
              Item_Type =>
                Menu_Item_Types'Value
                  (Execute_Widget_Command
                     (Widgt => Menu_Widget, Command_Name => "type",
                      Options =>
                        To_Lower(Item => Menu_Item_Indexes'Image(Menu_Index)))
                     .Result)));
   end Entry_Configure;

   function Index
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Extended_Natural is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Menu_Widget);
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "index",
         Options => To_Ada_String(Source => Menu_Index));
      if Tcl_Get_Result(Interpreter => Interpreter) = "none" then
         return -1;
      end if;
      return Extended_Natural(Get_Result(Interpreter => Interpreter));
   end Index;

   function Index
     (Menu_Widget: Tk_Menu; Menu_Index: Natural) return Extended_Natural is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Menu_Widget);
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "index",
         Options =>
           "@" & Trim(Source => Natural'Image(Menu_Index), Side => Left));
      if Tcl_Get_Result(Interpreter => Interpreter) = "none" then
         return -1;
      end if;
      return Extended_Natural(Get_Result(Interpreter => Interpreter));
   end Index;

   function Index
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
      return Extended_Natural is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Menu_Widget);
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "index",
         Options => To_Lower(Item => Menu_Item_Indexes'Image(Menu_Index)));
      if Tcl_Get_Result(Interpreter => Interpreter) = "none" then
         return -1;
      end if;
      return Extended_Natural(Get_Result(Interpreter => Interpreter));
   end Index;

   procedure Insert
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "insert",
         Options =>
           To_Ada_String(Source => Menu_Index) & " " &
           To_Lower(Item => Menu_Item_Types'Image(Item_Type)) & " " &
           Item_Options_To_String(Options => Options, Item_Type => Item_Type));
   end Insert;

   procedure Insert
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options; Is_Index: Boolean := True) is
      New_Index: constant String :=
        (if Is_Index then
           Trim(Source => Natural'Image(Menu_Index), Side => Left)
         else "@" & Trim(Source => Natural'Image(Menu_Index), Side => Left));
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "insert",
         Options =>
           New_Index & " " &
           To_Lower(Item => Menu_Item_Types'Image(Item_Type)) & " " &
           Item_Options_To_String(Options => Options, Item_Type => Item_Type));
   end Insert;

   procedure Insert
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes;
      Item_Type: Menu_Item_Types; Options: Menu_Item_Options) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "insert",
         Options =>
           To_Lower(Item => Menu_Item_Indexes'Image(Menu_Index)) & " " &
           To_Lower(Item => Menu_Item_Types'Image(Item_Type)) & " " &
           Item_Options_To_String(Options => Options, Item_Type => Item_Type));
   end Insert;

   procedure Invoke(Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "invoke",
         Options => To_Ada_String(Source => Menu_Index));
   end Invoke;

   procedure Invoke
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True) is
      New_Index: constant String :=
        (if Is_Index then
           Trim(Source => Natural'Image(Menu_Index), Side => Left)
         else "@" & Trim(Source => Natural'Image(Menu_Index), Side => Left));
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "invoke", Options => New_Index);
   end Invoke;

   procedure Invoke(Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "invoke",
         Options => To_Lower(Item => Menu_Item_Indexes'Image(Menu_Index)));
   end Invoke;

   function Invoke
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return String is
   begin
      Invoke(Menu_Widget => Menu_Widget, Menu_Index => Menu_Index);
      return Tcl_Get_Result(Interpreter => Tk_Interp(Widgt => Menu_Widget));
   end Invoke;

   function Invoke
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return String is
   begin
      Invoke
        (Menu_Widget => Menu_Widget, Menu_Index => Menu_Index,
         Is_Index => Is_Index);
      return Tcl_Get_Result(Interpreter => Tk_Interp(Widgt => Menu_Widget));
   end Invoke;

   function Invoke
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) return String is
   begin
      Invoke(Menu_Widget => Menu_Widget, Menu_Index => Menu_Index);
      return Tcl_Get_Result(Interpreter => Tk_Interp(Widgt => Menu_Widget));
   end Invoke;

   procedure Post(Menu_Widget: Tk_Menu; X, Y: Natural) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "post",
         Options =>
           Trim(Source => Natural'Image(X), Side => Left) & Natural'Image(Y));
   end Post;

   function Post(Menu_Widget: Tk_Menu; X, Y: Natural) return String is
   begin
      Post(Menu_Widget => Menu_Widget, X => X, Y => Y);
      return Tcl_Get_Result(Interpreter => Tk_Interp(Widgt => Menu_Widget));
   end Post;

   procedure Post_Cascade(Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "postcascade",
         Options => To_Ada_String(Source => Menu_Index));
   end Post_Cascade;

   procedure Post_Cascade
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True) is
      New_Index: constant String :=
        (if Is_Index then
           Trim(Source => Natural'Image(Menu_Index), Side => Left)
         else "@" & Trim(Source => Natural'Image(Menu_Index), Side => Left));
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "postcascade",
         Options => New_Index);
   end Post_Cascade;

   procedure Post_Cascade
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) is
   begin
      Execute_Widget_Command
        (Widgt => Menu_Widget, Command_Name => "postcascade",
         Options => To_Lower(Item => Menu_Item_Indexes'Image(Menu_Index)));
   end Post_Cascade;

   function Get_Item_Type
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Menu_Item_Types is
   begin
      return
        Menu_Item_Types'Value
          (Execute_Widget_Command
             (Widgt => Menu_Widget, Command_Name => "type",
              Options => To_Ada_String(Source => Menu_Index))
             .Result);
   end Get_Item_Type;

   function Get_Item_Type
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return Menu_Item_Types is
      New_Index: constant String :=
        (if Is_Index then
           Trim(Source => Natural'Image(Menu_Index), Side => Left)
         else "@" & Trim(Source => Natural'Image(Menu_Index), Side => Left));
   begin
      return
        Menu_Item_Types'Value
          (Execute_Widget_Command
             (Widgt => Menu_Widget, Command_Name => "type",
              Options => New_Index)
             .Result);
   end Get_Item_Type;

   function Get_Item_Type
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
      return Menu_Item_Types is
   begin
      return
        Menu_Item_Types'Value
          (Execute_Widget_Command
             (Widgt => Menu_Widget, Command_Name => "type",
              Options => To_Lower(Item => Menu_Item_Indexes'Image(Menu_Index)))
             .Result);
   end Get_Item_Type;

   procedure Unpost(Menu_Widget: Tk_Menu) is
   begin
      Execute_Widget_Command(Widgt => Menu_Widget, Command_Name => "unpost");
   end Unpost;

   function X_Position
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Natural is
   begin
      return
        Natural'Value
          (Execute_Widget_Command
             (Widgt => Menu_Widget, Command_Name => "xposition",
              Options => To_Ada_String(Source => Menu_Index))
             .Result);
   end X_Position;

   function X_Position
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return Natural is
      New_Index: constant String :=
        (if Is_Index then
           Trim(Source => Natural'Image(Menu_Index), Side => Left)
         else "@" & Trim(Source => Natural'Image(Menu_Index), Side => Left));
   begin
      return
        Natural'Value
          (Execute_Widget_Command
             (Widgt => Menu_Widget, Command_Name => "xposition",
              Options => New_Index)
             .Result);
   end X_Position;

   function X_Position
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) return Natural is
   begin
      return
        Natural'Value
          (Execute_Widget_Command
             (Widgt => Menu_Widget, Command_Name => "xposition",
              Options => To_Lower(Item => Menu_Item_Indexes'Image(Menu_Index)))
             .Result);
   end X_Position;

   function Y_Position
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Natural is
   begin
      return
        Natural'Value
          (Execute_Widget_Command
             (Widgt => Menu_Widget, Command_Name => "yposition",
              Options => To_Ada_String(Source => Menu_Index))
             .Result);
   end Y_Position;

   function Y_Position
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return Natural is
      New_Index: constant String :=
        (if Is_Index then
           Trim(Source => Natural'Image(Menu_Index), Side => Left)
         else "@" & Trim(Source => Natural'Image(Menu_Index), Side => Left));
   begin
      return
        Natural'Value
          (Execute_Widget_Command
             (Widgt => Menu_Widget, Command_Name => "yposition",
              Options => New_Index)
             .Result);
   end Y_Position;

   function Y_Position
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) return Natural is
   begin
      return
        Natural'Value
          (Execute_Widget_Command
             (Widgt => Menu_Widget, Command_Name => "yposition",
              Options => To_Lower(Item => Menu_Item_Indexes'Image(Menu_Index)))
             .Result);
   end Y_Position;

end Tk.Menu;
