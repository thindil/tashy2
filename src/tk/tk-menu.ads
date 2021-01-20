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

with Tcl.Strings; use Tcl.Strings;
with Tk.Widget; use Tk.Widget;

package Tk.Menu is

   subtype Tk_Menu is Tk_Widget;

   type Menu_Types is (NONE, MENUBAR, TEAROFF, NORMAL) with
      Default_Value => NONE;

   type Menu_Options is new Widget_Options with record
      Active_Background: Tcl_String;
      Active_Border_Width: Pixel_Data;
      Active_Foreground: Tcl_String;
      Background: Tcl_String;
      Border_Width: Pixel_Data;
      Disabled_Foreground: Tcl_String;
      Font: Tcl_String;
      Foreground: Tcl_String;
      Relief: Relief_Type;
      Post_Command: Tcl_String;
      Select_Color: Tcl_String;
      Tear_Off: Extended_Boolean;
      Tear_Off_Command: Tcl_String;
      Title: Tcl_String;
      Menu_Type: Menu_Types;
   end record;

   type Menu_Item_Types is
     (CASCADE, CHECKBUTTON, COMMAND, RADIOBUTTON, SEPARATOR);

   type Menu_Item_Options(Item_Type: Menu_Item_Types := COMMAND) is record
      case Item_Type is
         when CASCADE | CHECKBUTTON | COMMAND | RADIOBUTTON =>
            Active_Background: Tcl_String;
            Active_Foreground: Tcl_String;
            Accelerator: Tcl_String;
            Background: Tcl_String;
            Bitmap: Tcl_String;
            Column_Break: Extended_Boolean;
            Command: Tcl_String;
            Compound: Place_Type;
            Font: Tcl_String;
            Foreground: Tcl_String;
            Hide_Margin: Extended_Boolean;
            Image: Tcl_String;
            Label: Tcl_String;
            State: State_Type;
            UnderLine: Extended_Natural;
            case Item_Type is
               when CASCADE =>
                  Menu: Tk_Menu;
               when CHECKBUTTON | RADIOBUTTON =>
                  Indicator_On: Extended_Boolean;
                  Select_Color: Tcl_String;
                  Select_Image: Tcl_String;
                  Variable: Tcl_String;
                  case Item_Type is
                     when CHECKBUTTON =>
                        Off_Value: Tcl_String;
                        On_Value: Tcl_String;
                     when RADIOBUTTON =>
                        Value: Tcl_String;
                     when others =>
                        null;
                  end case;
               when others =>
                  null;
            end case;
         when SEPARATOR =>
            null;
      end case;
   end record;

   function Create
     (Path_Name: String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Menu with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Create'Result /= Null_Widget,
      Test_Case => ("Test_Create_Menu1", Nominal);

   procedure Create
     (Widget: out Tk_Menu; Path_Name: String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Widget /= Null_Widget,
      Test_Case => ("Test_Create_Menu2", Nominal);

   procedure Activate(Menu: Tk_Menu; Index: Tcl_String) with
      Pre => Length(Index) > 0,
      Test_Case => ("Test_Activate_Menu", Nominal);

   procedure Add
     (Menu: Tk_Menu; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options) with
      Pre => Menu /= Null_Widget,
      Test_Case => ("Test_Add_Menu", Nominal);

      -- ****f* Menu/Menu.Get_Options
      -- FUNCTION
      -- Get all values of Tk options of the selected menu
      -- PARAMETERS
      -- Widget - Tk_Menu which options' values will be taken
      -- RESULT
      -- Menu_Options record with values of the selected menu options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get all values of option of menu with pathname .mymenu
      -- My_Menu_Options: constant Menu_Options := Get_Options(Get_Widget(".mymenu"));
      -- SEE ALSO
      -- Menu.Configure
      -- COMMANDS
      -- Widget configure
      -- SOURCE
   function Get_Options(Widget: Tk_Menu) return Menu_Options with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Get_Options_Menu", Nominal);
      -- ****

   procedure Clone
     (Widget: Tk_Menu; New_Path_Name: String;
      Menu_Type: Menu_Types := NONE) with
      Pre => Widget /= Null_Widget and New_Path_Name'Length > 0,
      Test_Case => ("Test_Clone_Menu", Nominal);

      -- ****f* Menu/Menu.Configure
      -- FUNCTION
      -- Set the selected options for the selected menu
      -- PARAMETERS
      -- Widget  - Tk_Menu which options will be set
      -- Options - The record with new values for the menu options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Disable tear off for menu with pathname .mymenu
      -- Configure(Get_Widget(".mymenu"), (Tear_Off => False, others => <>));
      -- SEE ALSO
      -- Menu.Get_Options
      -- COMMANDS
      -- Widget configure Options
      -- SOURCE
   procedure Configure(Widget: Tk_Menu; Options: Menu_Options) with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Configure_Menu", Nominal);
      -- ****

   procedure Delete(Widget: Tk_Menu; Index1: String; Index2: String := "") with
      Pre => Widget /= Null_Widget and Index1'Length > 0,
      Test_Case => ("Test_Delete_Menu", Nominal);

end Tk.Menu;
