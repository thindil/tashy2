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

   --## rule off REDUCEABLE_SCOPE
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
   -- OPTIONS
   -- NONE    - If used in setting the menu type, then the menu type will be
   --           set to default type
   -- MEMUBAR - The menu will be set as the main application menu bar
   -- TEAROFF - The menu will be show as separated window
   -- NORMAL  - The menu will be show as the standard menu
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Menu_Types is (NONE, MENUBAR, TEAROFF, NORMAL) with
      Default_Value => NONE;
      -- ****

      -- ****d* Menu/Menu.Default_Menu_Type
      -- FUNCTION
      -- Default Tk menu type
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Menu_Type: constant Menu_Types := NORMAL;
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
      Active_Background: Tcl_String := Null_Tcl_String;
      Active_Border_Width: Pixel_Data := Empty_Pixel_Data;
      Active_Foreground: Tcl_String := Null_Tcl_String;
      Background: Tcl_String := Null_Tcl_String;
      Border_Width: Pixel_Data := Empty_Pixel_Data;
      Disabled_Foreground: Tcl_String := Null_Tcl_String;
      Font: Tcl_String := Null_Tcl_String;
      Foreground: Tcl_String := Null_Tcl_String;
      Relief: Relief_Type := NONE;
      Post_Command: Tcl_String := Null_Tcl_String;
      Select_Color: Tcl_String := Null_Tcl_String;
      Tear_Off: Extended_Boolean := NONE;
      Tear_Off_Command: Tcl_String := Null_Tcl_String;
      Title: Tcl_String := Null_Tcl_String;
      Menu_Type: Menu_Types := NONE;
   end record;
   -- ****

   -- ****t* Menu/Menu.Menu_Item_Types
   -- FUNCTION
   -- Available types of menu items (entries)
   -- OPTIONS
   -- CASCADE     - The item is a submenu with own entries
   -- CHECKBUTTON - The item is a checkbutton
   -- COMMAND     - The standard menu item
   -- RADIOBUTTON - The item is a radiobutton
   -- SEPARATOR   - The item is a separator line, no command associated with it
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Menu_Item_Types is
     (CASCADE, CHECKBUTTON, COMMAND, RADIOBUTTON, SEPARATOR) with
      Default_Value => COMMAND;
   -- ****

   -- ****d* Menu/Menu.Default_Menu_Item
   -- FUNCTION
   -- Default type for Tk menu item
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Menu_Item: constant Menu_Item_Types := COMMAND;
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
   -- Underline         - Index of the character in Label which will be underlined. Used
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
            Active_Background: Tcl_String := Null_Tcl_String;
            Active_Foreground: Tcl_String := Null_Tcl_String;
            Accelerator: Tcl_String := Null_Tcl_String;
            Background: Tcl_String := Null_Tcl_String;
            Bitmap: Tcl_String := Null_Tcl_String;
            Column_Break: Extended_Boolean := NONE;
            Command: Tcl_String := Null_Tcl_String;
            Compound: Place_Type := EMPTY;
            Font: Tcl_String := Null_Tcl_String;
            Foreground: Tcl_String := Null_Tcl_String;
            Hide_Margin: Extended_Boolean := NONE;
            Image: Tcl_String := Null_Tcl_String;
            Label: Tcl_String := Null_Tcl_String;
            State: State_Type := NONE;
            Underline: Extended_Natural := -1;
            case Item_Type is
               when CASCADE =>
                  Menu: Tk_Menu := Null_Widget;
               when CHECKBUTTON | RADIOBUTTON =>
                  Indicator_On: Extended_Boolean := NONE;
                  Select_Color: Tcl_String := Null_Tcl_String;
                  Select_Image: Tcl_String := Null_Tcl_String;
                  Variable: Tcl_String := Null_Tcl_String;
                  case Item_Type is
                     when CHECKBUTTON =>
                        Off_Value: Tcl_String := Null_Tcl_String;
                        On_Value: Tcl_String := Null_Tcl_String;
                     when RADIOBUTTON =>
                        Value: Tcl_String := Null_Tcl_String;
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

   -- ****d* Menu/Menu.Default_Menu_Item_Options
   -- FUNCTION
   -- Default values for options for Tk menu item
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Menu_Item_Options: constant Menu_Item_Options :=
     Menu_Item_Options'(others => <>);
     -- ****

     -- ****t* Menu/Menu.Menu_Item_Indexes
     -- FUNCTION
     -- Available types of menu entries indexes
     -- OPTIONS
     -- ACTIVE   - The currently active menu entry. If no active entry, then
     --            the same as NONE
     -- MENU_END - The last entry in the menu
     -- LAST     - The last entry in the menu (same as MENU_END)
     -- NONE     - The none entry. Used mostly in resetting active state
     -- HISTORY
     -- 8.6.0 - Added
     -- SOURCE
   type Menu_Item_Indexes is (ACTIVE, MENU_END, LAST, NONE) with
      Default_Value => NONE;
   -- ****

   -- ****d* Menu/Menu.Empty_Menu_Item_Index
   -- FUNCTION
   -- Empty index type for menu item
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Menu_Item_Index: constant Menu_Item_Indexes := NONE;
   -- ****

   -- ****f* Menu/Menu.Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options - Ada Menu_Options to convert
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   function Options_To_String(Options: Menu_Options) return String with
      Test_Case => (Name => "Test_Options_To_String", Mode => Robustness);
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
   -- The Tk identifier of the newly created menu widget or Null_Widget if
   -- the menu cannot be created
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
     (Path_Name: Tk_Path_String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Menu with
      Pre'Class =>
      (Path_Name'Length > 0
       and then
         Path_Name'Length + Options_To_String(Options => Options)'Length <=
         Long_Long_Integer(Natural'Last) - 6) and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Create_Menu1", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Create_(procedure)
      -- FUNCTION
      -- Create a new Tk menu widget with the selected pathname and options
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu identifier which will be returned
      -- Path_Name   - Tk pathname for the newly created menu
      -- Options     - Options for the newly created menu
      -- Interpreter - Tcl interpreter on which the menu will be created. Can
      --               be empty. Default value is the default Tcl interpreter
      -- OUTPUT
      -- The Menu_Widget parameter as Tk identifier of the newly created menu
      -- widget or Null_Widget if the menu cannot be created
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
     (Menu_Widget: out Tk_Menu; Path_Name: Tk_Path_String;
      Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre'Class =>
      (Path_Name'Length > 0
       and then
         Path_Name'Length + Options_To_String(Options => Options)'Length <=
         Long_Long_Integer(Natural'Last) - 6) and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Create_Menu2", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Activate
      -- FUNCTION
      -- Set the selected menu entry as active
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu widget in which the menu entry will be set as active
      -- Menu_Index       - The index of the menu entry to activate
      -- Is_Index    - If True, Menu_Index is numerical index of the menu entry,
      --               otherwise it is Y coordinate of the menu entry
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set active the last element of the menu My_Menu
      -- Activate(My_Menu, LAST);
      -- COMMANDS
      -- Menu_Widget activate Menu_Index
      -- SOURCE
   procedure Activate(Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) with
      Pre => Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0,
      Test_Case => (Name => "Test_Activate_Menu", Mode => Nominal);
   procedure Activate
     (Menu_Widget: Tk_Menu; Menu_Index: Natural;
      Is_Index: Boolean := True) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Activate_Menu2", Mode => Nominal);
   procedure Activate(Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Activate_Menu3", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Add
      -- FUNCTION
      -- Add a new menu entry to the selected menu
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu widget in which the new entry will be added
      -- Options     - The options for the newly added entry
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Add to menu My_Menu entry with label "Quit" and quit from the program on activate
      -- Add(My_Menu, Menu_Item_Options'(Label => To_Tcl_String("Quit"), Command => To_Tcl_String("exit"),
      --                                  others => <>));
      -- COMMANDS
      -- Menu_Widget add Item_Type Options
      -- SEE ALSO
      -- Menu.Insert
      -- SOURCE
   procedure Add(Menu_Widget: Tk_Menu; Options: Menu_Item_Options) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Add_Menu", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Get_Options
      -- FUNCTION
      -- Get all values of Tk options of the selected menu
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu which options' values will be taken
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
      -- Menu_Widget configure
      -- SOURCE
   function Get_Options(Menu_Widget: Tk_Menu) return Menu_Options with
      Pre'Class => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Options_Menu", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Configure
      -- FUNCTION
      -- Set the selected options for the selected menu
      -- PARAMETERS
      -- Menu_Widget  - Tk_Menu which options will be set
      -- Options - The record with new values for the menu options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Disable tear off for menu with pathname .mymenu
      -- Configure(Get_Widget(".mymenu"), (Tear_Off => False, others => <>));
      -- SEE ALSO
      -- Menu.Get_Options
      -- COMMANDS
      -- Menu_Widget configure Options
      -- SOURCE
   procedure Configure(Menu_Widget: Tk_Menu; Options: Menu_Options) with
      Pre'Class => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Configure_Menu", Mode => Nominal);
      -- ****

      -- ****d* Menu/Menu.Default_Menu_Options
      -- FUNCTION
      -- Default Tk menu options values
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Menu_Options: constant Menu_Options := Menu_Options'(others => <>);
   -- ****

   -- ****f* Menu/Menu.Delete
   -- FUNCTION
   -- Delete the selected menu entries from the selected menu
   -- PARAMETERS
   -- Menu_Widget - Tk_Menu from which the menu entries will be deleted
   -- Index1      - The index of the first menu entry to delete
   -- Index2      - The index of the last menu entry to delete. If empty, delete
   --               only the Index1 menu entry. Default value is empty
   -- Is_Index1   - If true, Index1 is numerical index of the menu entry.
   --               Otherwise it is Y coordinate of the menu entry.
   -- Is_Index2   - If true, Index2 is numerical index of the menu entry.
   --               Otherwise it is Y coordinate of the menu entry.
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Delete the last menu entry in My_Menu menu
   -- Delete(My_Menu, To_Tcl_String("end"));
   -- COMMANDS
   -- Menu_Widget delete Index1 ?Index2?
   -- SOURCE
   procedure Delete
     (Menu_Widget: Tk_Menu; Index1: Tcl_String;
      Index2: Tcl_String := To_Tcl_String(Source => "")) with
      Pre => Menu_Widget /= Null_Widget and Length(Source => Index1) > 0,
      Test_Case => (Name => "Test_Delete_Menu", Mode => Nominal);
   procedure Delete
     (Menu_Widget: Tk_Menu; Index1: Natural; Index2: Extended_Natural := -1;
      Is_Index1, Is_Index2: Boolean := True) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Delete_Menu2", Mode => Nominal);
   procedure Delete
     (Menu_Widget: Tk_Menu; Index1: Menu_Item_Indexes;
      Index2: Menu_Item_Indexes := NONE) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Delete_Menu3", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Entry_Get_Options
      -- FUNCTION
      -- Get all options of the selected menu entry in the selected menu
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu from which the options for the selected menu entry
      --               will be get
      -- Menu_Index       - The index of the menu entry which options will be get
      -- Is_Index    - If true, Menu_Index is numerical index of the menu entry.
      --               Otherwise it is Y coordinate of the menu entry
      -- RESULT
      -- Menu_Item_Options record with options of the selected menu entry
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the options of the third menu entry in My_Menu menu
      -- Item_Options: constant Menu_Item_Options := Entry_Get_Options(My_Menu, 2));
      -- COMMANDS
      -- Menu_Widget entryconfigure Menu_Index
      -- SEE ALSO
      -- Menu.Entry_Configure
      -- SOURCE
   function Entry_Get_Options
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String)
      return Menu_Item_Options with
      Pre => Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0,
      Test_Case => (Name => "Test_Entry_Get_Options_Menu", Mode => Nominal);
   function Entry_Get_Options
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return Menu_Item_Options with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Entry_Get_Options_Menu2", Mode => Nominal);
   function Entry_Get_Options
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
      return Menu_Item_Options with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Entry_Get_Options_Menu3", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Entry_Configure
      -- FUNCTION
      -- Set options of the selected menu entry in the selected menu
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu in which the menu entry options will be set
      -- Menu_Index       - The index of the menu entry which options will be set
      -- Options     - The new values of options for the selected menu entry
      -- Is_Index    - If true, Menu_Index is numerical index of the menu entry.
      --               Otherwise it is Y coordinate of the menu entry
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the label for the first menu entry in My_Menu menu to "First element"
      -- Entry_Configure(My_Menu, 0, Menu_Item_Options'(Label => To_Tcl_String("First element")));
      -- COMMANDS
      -- Menu_Widget entryconfigure Menu_Index Options
      -- SEE ALSO
      -- Menu.Entry_Get_Options
      -- SOURCE
   procedure Entry_Configure
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String;
      Options: Menu_Item_Options) with
      Pre => Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0,
      Test_Case => (Name => "Test_Entry_Configure_Menu", Mode => Nominal);
   procedure Entry_Configure
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Options: Menu_Item_Options;
      Is_Index: Boolean := True) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Entry_Configure_Menu2", Mode => Nominal);
   procedure Entry_Configure
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes;
      Options: Menu_Item_Options) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Entry_Configure_Menu3", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Index
      -- FUNCTION
      -- Get the numerical index of the selected menu entry in the selected
      -- menu
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu in which the numerical index of menu entry will be
      --               get
      -- Menu_Index       - The index of the menu entry which numerical index will be get
      -- RESULT
      -- Numerical index of the selected menu entry or -1 if menu entry was
      -- specified as NONE or "none"
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the numerical index of the last menu entry in My_Menu menu
      -- Number: constant Extended_Natural := Index(My_Menu, MENU_END);
      -- COMMANDS
      -- Menu_Widget index Menu_Index
      -- SOURCE
   function Index
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String)
      return Extended_Natural with
      Pre => Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0,
      Test_Case => (Name => "Test_Index_Menu", Mode => Nominal);
   function Index
     (Menu_Widget: Tk_Menu; Menu_Index: Natural) return Extended_Natural with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Index_Menu2", Mode => Nominal);
   function Index
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
      return Extended_Natural with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Index_Menu3", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Insert
      -- FUNCTION
      -- Insert a new menu entry into selected position in the selected menu
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu widget in which the new entry will be inserted
      -- Menu_Index       - The index on which the new menu entry will be inserted
      -- Item_Type   - The type of menu entry to insert
      -- Options     - The options for the newly inserted entry
      -- Is_Index    - If true, Menu_Index is numerical index of the menu entry.
      --               Otherwise it is Y coordinate of the menu entry
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Insert into menu My_Menu entry with label "Quit" and quit from the program on activate on last position
      -- Insert(My_Menu, MENU_END, COMMAND, Menu_Item_Options'(Label => To_Tcl_String("Quit"),
      --                                                       Command => To_Tcl_String("exit"),
      --                                                       others => <>));
      -- COMMANDS
      -- Menu_Widget insert Menu_Index Item_Type Options
      -- SEE ALSO
      -- Menu.Add
      -- SOURCE
   procedure Insert
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options) with
      Pre => Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0,
      Test_Case => (Name => "Test_Insert_Menu", Mode => Nominal);
   procedure Insert
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options; Is_Index: Boolean := True) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Insert_Menu2", Mode => Nominal);
   procedure Insert
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes;
      Item_Type: Menu_Item_Types; Options: Menu_Item_Options) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Insert_Menu3", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Invoke_(procedure)
      -- FUNCTION
      -- Invoke the Tcl command related to the selected menu entry in the
      -- selected menu
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu in which the menu entry command will be invoked
      -- Menu_Index       - The index of the menu entry which command will be invoked
      -- Is_Index    - If true, Menu_Index is numerical index of the menu entry.
      --               Otherwise it is Y coordinate of the menu entry
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the first menu entry in My_Menu menu
      -- Invoke(My_Menu, 0);
      -- COMMANDS
      -- Menu_Widget invoke Menu_Index
      -- SEE ALSO
      -- Menu.Invoke_(function)
      -- SOURCE
   procedure Invoke(Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) with
      Pre => Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0,
      Test_Case => (Name => "Test_Invoke_Menu1", Mode => Nominal);
   procedure Invoke
     (Menu_Widget: Tk_Menu; Menu_Index: Natural;
      Is_Index: Boolean := True) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Invoke_Menu3", Mode => Nominal);
   procedure Invoke(Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Invoke_Menu4", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Invoke_(function)
      -- FUNCTION
      -- Invoke the Tcl command related to the selected menu entry in the
      -- selected menu
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu in which the menu entry command will be invoked
      -- Menu_Index       - The index of the menu entry which command will be invoked
      -- Is_Index    - If true, Menu_Index is numerical index of the menu entry.
      --               Otherwise it is Y coordinate of the menu entry
      -- RESULT
      -- String with value returned by the invoked Tcl command
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the second menu entry in My_Menu menu
      -- Result: constant String := Invoke(My_Menu, 1);
      -- COMMANDS
      -- Menu_Widget invoke Menu_Index
      -- SEE ALSO
      -- Menu.Invoke_(procedure)
      -- SOURCE
   function Invoke
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return String with
      Pre => Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0,
      Test_Case => (Name => "Test_Invoke_Menu2", Mode => Nominal);
   function Invoke
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return String with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Invoke_Menu5", Mode => Nominal);
   function Invoke
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) return String with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Invoke_Menu6", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Post_(procedure)
      -- FUNCTION
      -- Show the selected menu at the selected root-window coordinates
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu to show
      -- X           - X coordinate of root-window where upper left corner of menu
      --               will be
      -- Y           - Y coordinate of root-window where upper left corner of menu
      --               will be
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Show the menu My_Menu at location (10, 24) of root-window
      -- Post(My_Menu, 10, 24);
      -- COMMANDS
      -- Menu_Widget post X Y
      -- SEE ALSO
      -- Menu.Post_(function)
      -- SOURCE
   procedure Post(Menu_Widget: Tk_Menu; X, Y: Natural) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Post_Menu1", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Post_(function)
      -- FUNCTION
      -- Show the selected menu at the selected root-window coordinates and get
      -- the value returned by Post_Command Tcl command of the menu
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu to show
      -- X           - X coordinate of root-window where upper left corner of menu
      --               will be
      -- Y           - Y coordinate of root-window where upper left corner of menu
      --               will be
      -- RESULT
      -- The value returned by the Post_Command Tcl command of the menu. If no
      -- Post_Command specified, return empty String.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Show the menu My_Menu at location (20, 44) of root-window
      -- Result : constant String := Post(My_Menu, 10, 24);
      -- COMMANDS
      -- Menu_Widget post X Y
      -- SEE ALSO
      -- Menu.Post_(procedure), Menu.Unpost
      -- SOURCE
   function Post(Menu_Widget: Tk_Menu; X, Y: Natural) return String with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Post_Menu2", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Post_Cascade
      -- FUNCTION
      -- Post the submenu associated with the selected CASCADE menu entry and
      -- unpost the previous submenu if visible
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu in which the submenu will be show
      -- Menu_Index       - Index of menu entry which submenu will be show
      -- Is_Index    - If true, Menu_Index is numerical index of the menu entry.
      --               Otherwise it is Y coordinate of the menu entry
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Show the submenu of the second item in My_Menu menu
      -- Post_Cascade(My_Menu, 1);
      -- COMMANDS
      -- Menu_Widget postcascade Menu_Index
      -- SOURCE
   procedure Post_Cascade(Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) with
      Pre => Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0,
      Test_Case => (Name => "Test_PostCascade_Menu", Mode => Nominal);
   procedure Post_Cascade
     (Menu_Widget: Tk_Menu; Menu_Index: Natural;
      Is_Index: Boolean := True) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_PostCascade_Menu2", Mode => Nominal);
   procedure Post_Cascade
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_PostCascade_Menu3", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Get_Item_Type
      -- FUNCTION
      -- Get the type of the selected menu entry in the selected menu
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu in which the menu item type will be get
      -- Menu_Index       - The index of the menu entry which type will be get
      -- Is_Index    - If true, Menu_Index is numerical index of the menu entry.
      --               Otherwise it is Y coordinate of the menu entry
      -- RESULT
      -- The type of the selected menu entry
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the type of menu entry with label Quit in My_Menu menu
      -- Item_Type: constant Menu_Item_Types := Get_Item_Type(My_Menu, To_Tcl_String("Quit"));
      -- COMMANDS
      -- Menu_Widget type Menu_Index
      -- SOURCE
   function Get_Item_Type
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Menu_Item_Types with
      Pre => Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0,
      Test_Case => (Name => "Test_Get_Item_Type_Menu", Mode => Nominal);
   function Get_Item_Type
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return Menu_Item_Types with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Item_Type_Menu2", Mode => Nominal);
   function Get_Item_Type
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
      return Menu_Item_Types with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Item_Type_Menu3", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Unpost
      -- FUNCTION
      -- Hide the selected menu
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu to hide
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Hide menu My_Menu
      -- Unpost(My_Menu);
      -- COMMANDS
      -- Menu_Widget unpost
      -- SEE ALSO
      -- Menu.Post
      -- SOURCE
   procedure Unpost(Menu_Widget: Tk_Menu) with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Unpost_Menu", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.X_Position
      -- FUNCTION
      -- Get the X pixel coordinate of top left corner of the selected menu
      -- entry in the selected menu
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu in which coordinate will be get
      -- Menu_Index       - The index of the menu entry which coordinate will be get
      -- Is_Index    - If true, Menu_Index is numerical index of the menu entry.
      --               Otherwise it is Y coordinate of the menu entry
      -- RESULT
      -- X coordinate for the pixel of the top left corner of the selected
      -- menu
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the X coordinate for the first menu entry in My_Menu
      -- X: constant Natural := X_Position(My_Menu, 0);
      -- COMMANDS
      -- Menu_Widget xposition Menu_Index
      -- SEE ALSO
      -- Menu.Y_Position
      -- SOURCE
   function X_Position
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Natural with
      Pre => Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0,
      Test_Case => (Name => "Test_X_Position_Menu", Mode => Nominal);
   function X_Position
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return Natural with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_X_Position_Menu2", Mode => Nominal);
   function X_Position
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) return Natural with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_X_Position_Menu3", Mode => Nominal);
      -- ****

      -- ****f* Menu/Menu.Y_Position
      -- FUNCTION
      -- Get the Y pixel coordinate of top left corner of the selected menu
      -- entry in the selected menu
      -- PARAMETERS
      -- Menu_Widget - Tk_Menu in which coordinate will be get
      -- Menu_Index       - The index of the menu entry which coordinate will be get
      -- Is_Index    - If true, Menu_Index is numerical index of the menu entry.
      --               Otherwise it is Y coordinate of the menu entry
      -- RESULT
      -- Y coordinate for the pixel of the top left corner of the selected
      -- menu
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the Y coordinate for the first menu entry in My_Menu
      -- Y: constant Natural := Y_Position(My_Menu, 0);
      -- COMMANDS
      -- Menu_Widget yposition Menu_Index
      -- SEE ALSO
      -- Menu.X_Position
      -- SOURCE
   function Y_Position
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Natural with
      Pre => Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0,
      Test_Case => (Name => "Test_Y_Position_Menu", Mode => Nominal);
   function Y_Position
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return Natural with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Y_Position_Menu2", Mode => Nominal);
   function Y_Position
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) return Natural with
      Pre => Menu_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Y_Position_Menu3", Mode => Nominal);
      -- ****
      --## rule on REDUCEABLE_SCOPE

end Tk.Menu;
