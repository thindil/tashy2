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

-- ****h* Tk/Menu
-- FUNCTION
-- Provides code for manipulate Tk widget menu
-- SOURCE
package Tk.Menu is
-- ****

   -- ****t* Menu/Menu.Tk_Menu
   -- FUNCTION
   -- The Tk identifier of the menu
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Tk_Menu is Tk_Widget;
   -- ****

   -- ****t* Menu/Menu.Menu_Types
   -- FUNCTION
   -- The types of menu
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Menu_Types is (NONE, MENUBAR, TEAROFF, NORMAL) with
      Default_Value => NONE;
      -- ****

      -- ****s* Menu/Menu.Menu_Options
      -- FUNCTION
      -- Data structure for all available options for the Tk menu
      -- OPTIONS
      -- Active_Background   - Background color when menu is active (mouse is
      --                       over the menu)
      -- Active_Border_Width - The width of border drawed around active menu
      -- Active_Foreground   - Foreground color when menu is active
      -- Background          - Normal background color of the menu
      -- Border_Width        - The width of the menu's border
      -- Disabled_Foreground - Foreground color when the menu is disabled
      -- Font                - The Tk font which will be used to draw text on the menu
      -- Foreground          - Normal foreground color of the menu
      -- Relief              - 3-D effect desired for the menu
      -- Post_Command        - The Tcl command executed before the menu is posted
      -- Tear_Off            - If true, the menu can be torn off, otherwise this option
      --                       is disabled
      -- Tear_Off_Command    - The Tcl command executed when the menu will be torn off
      -- Title               - The title of the torn off menu
      -- Menu_Type           - The type of the menu. It can be set only during creation.
      --                       Later even if this option is changed, the menu behavior is
      --                       not.
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
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
   -- ****

   -- ****t* Menu/Menu.Menu_Item_Types
   -- FUNCTION
   -- Available types of menu items (entries)
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Menu_Item_Types is
     (CASCADE, CHECKBUTTON, COMMAND, RADIOBUTTON, SEPARATOR);
   -- ****

   -- ****s* Menu/Menu.Menu_Item_Options
   -- FUNCTION
   -- Data structure for all available options for the Tk menu entries (items).
   -- Available options depends on Item_Type of menu item.
   -- OPTIONS
   -- Item_Type         - Type of item which options will be get or set. SEPARATOR
   --                     menu item don't have any options.
   -- Active_Background - Background color when menu entry is active (mouse is
   --                     over the menu)
   -- Active_Foreground - Foreground color when menu entry is active
   -- Accelerator       - Text which will be show on the right side of the menu entry.
   --                     The most often it is keyboard shortcut for the entry.
   -- Background        - Normal background color of the menu entry
   -- Bitmap            - Specifies bitmap to display instead of text on the menu entry
   -- Column_Break      - If True, the menu entry appears on at the top of new column in
   --                     menu. Otherwise it appears below the previous menu entry.
   -- Command           - The Tcl command to execute when the menu entry is invoked
   -- Compound          - Specifies if menu entry should display image and text and if
   --                     so, where image will be placed relative to text
   -- Font              - The Tk font which will be used for the menu entry
   -- Foreground        - Normal foreground color of the menu entry
   -- Hide_Margin       - If False, draw standard margin around the menu entry. Otherwise
   --                     margins are hidden
   -- Image             - Specifies Tk image to show on the menu entry
   -- Label             - Specifies text which will be displayed on the menu entry
   -- State             - The state of the menu entry. Disabled menu entries cannot be
   --                     invoked.
   -- UnderLine         - Index of the character in Label which will be underlined. Used
   --                     mostly to indicate keyboard shortcut for the menu entry.
   -- Menu              - The submenu of the menu entry. Available only for CASCADE
   --                     Item_Type.
   -- Indicator_On      - If True, show the menu entry indicator. Available only for
   --                     RADIOBUTTON and CHECKBUTTON Item_Type.
   -- Select_Color      - The color of indicator when the menu entry is selected. Available
   --                     only for RADIOBUTTON and CHECKBUTTON Item_Type.
   -- Select_Image      - The image displayed when the menu entry is selected. Available
   --                     only for RADIOBUTTON and CHECKBUTTON Item_Type.
   -- Variable          - The name of Tcl global variable which will be set when the menu
   --                     entry is selected. Available only for RADIOBUTTON and CHECKBUTTON
   --                     Item_Type
   -- Off_Value         - The value of the associated Variable when the menu entry is not
   --                     selected. Available only for CHECKBUTTON Item_Type.
   -- On_Value          - The value of the associated Variable when the menu entry is
   --                     selected. Available only for CHECKBUTTON Item_Type.
   -- Value             -  The value of the associated Variable when the menu entry is
   --                     selected. Available only for RADIOBUTTON Item_Type.
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
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
   -- ****

   -- ****f* Menu/Menu.Create_(function)
   -- FUNCTION
   -- Create a new Tk menu widget with the selected pathname and options
   -- PARAMETERS
   -- Path_Name   - Tk pathname for the newly created menu
   -- Options     - Options for the newly created menu
   -- Interpreter - Tcl interpreter on which the menu will be created. Can
   --               be empty. Default value is the default Tcl interpreter
   -- RESULT
   -- The Tk identifier of the newly created menu widget
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Create the menu with pathname .mymenu with disabled tear off option
   -- My_Menu: constant Tk_Menu := Create(".mymenu", Menu_Options'(Tear_Off => False, others => <>));
   -- SEE ALSO
   -- Menu.Create_(procedure)
   -- COMMANDS
   -- menu Path_Name Options
   -- SOURCE
   function Create
     (Path_Name: String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Menu with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Create'Result /= Null_Widget,
      Test_Case => ("Test_Create_Menu1", Nominal);
      -- ****

      -- ****f* Menu/Menu.Create_(procedure)
      -- FUNCTION
      -- Create a new Tk menu widget with the selected pathname and options
      -- PARAMETERS
      -- Widget      - Tk_Menu identifier which will be returned
      -- Path_Name   - Tk pathname for the newly created menu
      -- Options     - Options for the newly created menu
      -- Interpreter - Tcl interpreter on which the menu will be created. Can
      --               be empty. Default value is the default Tcl interpreter
      -- OUTPUT
      -- The Widget parameter as Tk identifier of the newly created menu widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Create the menu with pathname .mymenu with disabled tear off option
      -- declare
      --    My_Menu: Tk_Menu;
      -- begin
      --    Create(My_Menu, ".mymenu", Menu_Options'(Tear_Off => False, others => <>));
      -- end;
      -- SEE ALSO
      -- Menu.Create_(function)
      -- COMMANDS
      -- menu Path_Name Options
      -- SOURCE
   procedure Create
     (Widget: out Tk_Menu; Path_Name: String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Widget /= Null_Widget,
      Test_Case => ("Test_Create_Menu2", Nominal);
      -- ****

      -- ****f* Menu/Menu.Activate
      -- FUNCTION
      -- Set the selected menu entry as active
      -- PARAMETERS
      -- Widget - Tk_Menu widget in which the menu entry will be set as active
      -- Index  - The index of the menu entry to activate
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set active the last element of the menu My_Menu
      -- Activate(My_Menu, To_Tcl_String("end"));
      -- COMMANDS
      -- Widget activate Index
      -- SOURCE
   procedure Activate(Widget: Tk_Menu; Index: Tcl_String) with
      Pre => Widget /= Null_Widget and Length(Index) > 0,
      Test_Case => ("Test_Activate_Menu", Nominal);
      -- ****

      -- ****f* Menu/Menu.Add
      -- FUNCTION
      -- Add a new menu entry to the selected menu
      -- PARAMETERS
      -- Widget    - Tk_Menu widget in which the new entry will be added
      -- Item_Type - The type of menu entry to add
      -- Options   - The options for the newly added entry
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Add to menu My_Menu entry with label "Quit" and quit from the program on activate
      -- Add(My_Menu, COMMAND, Menu_Item_Options'(Label => To_Tcl_String("Quit"), Command => To_Tcl_String("exit"),
      --                                          others => <>));
      -- COMMANDS
      -- Widget add Item_Type Options
      -- SOURCE
   procedure Add
     (Widget: Tk_Menu; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options) with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Add_Menu", Nominal);
      -- ****

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

      -- ****f* Menu/Menu.Clone
      -- FUNCTION
      -- Clone the selected menu
      -- PARAMETERS
      -- Widget        - Tk_Menu which will be cloned
      -- New_Path_Name - The Tk path for the newly created menu
      -- Menu_Type     - The type of the newly created menu. If empty, the
      --                 cloned menu will have that same type as original.
      -- RESULT
      -- The Tk identifier of the newly created menu
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Clone menu My_Menu to menu named .myclonedmenu with that same type
      -- My_Cloned_Menu: constant Tk_Menu := Clone(My_Menu, ".myclonedmenu");
      -- COMMANDS
      -- Widget clone New_Path_Name ?Menu_Type?
      -- SOURCE
   function Clone
     (Widget: Tk_Menu; New_Path_Name: String; Menu_Type: Menu_Types := NONE)
      return Tk_Menu with
      Pre => Widget /= Null_Widget and New_Path_Name'Length > 0,
      Test_Case => ("Test_Clone_Menu", Nominal);
      -- ****

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

   function Entry_Get_Options
     (Widget: Tk_Menu; Index: String) return Menu_Item_Options with
      Pre => Widget /= Null_Widget and Index'Length > 0,
      Test_Case => ("Test_Entry_Get_Options_Menu", Nominal);

   procedure Entry_Configure
     (Widget: Tk_Menu; Index: String; Options: Menu_Item_Options) with
      Pre => Widget /= Null_Widget and Index'Length > 0,
      Test_Case => ("Test_Entry_Configure_Menu", Nominal);

   function Index(Widget: Tk_Menu; Index: String) return Extended_Natural with
      Pre => Widget /= Null_Widget and Index'Length > 0,
      Test_Case => ("Test_Index_Menu", Nominal);

   procedure Insert
     (Widget: Tk_Menu; Index: String; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options) with
      Pre => Widget /= Null_Widget and Index'Length > 0,
      Test_Case => ("Test_Insert_Menu", Nominal);

   procedure Invoke(Widget: Tk_Menu; Index: String) with
      Pre => Widget /= Null_Widget and Index'Length > 0,
      Test_Case => ("Test_Invoke_Menu1", Nominal);

   function Invoke(Widget: Tk_Menu; Index: String) return String with
      Pre => Widget /= Null_Widget and Index'Length > 0,
      Test_Case => ("Test_Invoke_Menu2", Nominal);

   procedure Post(Widget: Tk_Menu; X, Y: Natural) with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Post_Menu1", Nominal);

   function Post(Widget: Tk_Menu; X, Y: Natural) return String with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Post_Menu2", Nominal);

   procedure PostCascade(Widget: Tk_Menu; Index: String) with
      Pre => Widget /= Null_Widget and Index'Length > 0,
      Test_Case => ("Test_PostCascade_Menu", Nominal);

   function Get_Item_Type
     (Widget: Tk_Menu; Index: String) return Menu_Item_Types with
      Pre => Widget /= Null_Widget and Index'Length > 0,
      Test_Case => ("Test_Get_Item_Type_Menu", Nominal);

   procedure Unpost(Widget: Tk_Menu) with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Unpost_Menu", Nominal);

   function X_Position(Widget: Tk_Menu; Index: String) return Natural with
      Pre => Widget /= Null_Widget and Index'Length > 0,
      Test_Case => ("Test_X_Position_Menu", Nominal);

   function Y_Position(Widget: Tk_Menu; Index: String) return Natural with
      Pre => Widget /= Null_Widget and Index'Length > 0,
      Test_Case => ("Test_Y_Position_Menu", Nominal);

end Tk.Menu;
