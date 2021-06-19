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

with Tcl.Lists; use Tcl.Lists;
with Tcl.Strings; use Tcl.Strings;
with Tk.TopLevel; use Tk.TopLevel;
with Tk.Widget; use Tk.Widget;

-- ****h* Tk/Wm
-- FUNCTION
-- Provide bindings for Tk command wm (communication with the window manager)
-- SOURCE
package Tk.Wm is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****t* Wm/Wm.Window_Manager_Types
   -- FUNCTION
   -- Type of current window manager
   -- OPTIONS
   -- X_11    - Used on the most Unix systems like Linux, BSD, etc
   -- WINDOWS - Microsoft Windows
   -- MACOSX  - Apple Mac OS X
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Window_Manager_Types is (X_11, WINDOWS, MACOSX) with
      Default_Value => X_11;
   -- ****

   -- ****d* Wm/Wm.Default_Window_Manager
   -- FUNCTION
   -- Default window manager
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Window_Manager: constant Window_Manager_Types := X_11;
   -- ****

   -- ****t* Wm/Wm.Alpha_Type
   -- FUNCTION
   -- Type used to set alpha value for the selected Tk widget. Values below
   -- 0.0 are interpreted as empty value. 0.0 means full transparency.
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Alpha_Type is digits 2 range -1.0 .. 1.0 with
      Default_Value => 1.0;
      -- ****

      -- ****d* Wm/Wm.Default_Alpha
      -- FUNCTION
      -- Default alpha value for Tk widget (not transparent)
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Alpha: constant Alpha_Type := 1.0;
   -- ****

   -- ****t* Wm/Wm.Window_Types
   -- FUNCTION
   -- Available types of widget. Used only on X11 and may be not supported by
   -- all windows managers there
   -- OPTIONS
   -- DESKTOP       - Desktop window
   -- DOCK          - Dock/panel window
   -- TOOLBAR       - Toolbar window that should acting on behalf of another
   --                 window (transient to it)
   -- MENU          - Torn-off menu that should acting on behalf of another
   --                 window (transient to it)
   -- UTILITY       - Utility window (example: palette, toolbox) that should
   --                 acting on behalf of another window (transient to it)
   -- SPLASH        - Splash screen, displayed during application start up
   -- DIALOG        - Dialog window that should acting on behalf of another
   --                 window (transient to it)
   -- DROPDOWN_MENU - Menu summoned from a menu bar, which should be also
   --                 override-redirected
   -- POPUP_MENU    - Popup menu, which should be also override-redirected
   -- TOOLTIP       - Tooltip window, which should be also override-redirected
   -- NOTIFICATION  - Notification window, provides information about some
   --                 events, which should be also override-redirected
   -- COMBO         - Drop-down list of a combobox widget which should be also
   --                 override-redirected
   -- DND           - Widget represents something being dragged, which should
   --                 be also override-redirected
   -- NORMAL        - Widget without special intepretation
   -- NONE          - Used mostly to reset the current type of the widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Window_Types is
     (DESKTOP, DOCK, TOOLBAR, MENU, UTILITY, SPLASH, DIALOG, DROPDOWN_MENU,
      POPUP_MENU, TOOLTIP, NOTIFICATION, COMBO, DND, NORMAL, NONE) with
      Default_Value => NONE;
      -- ****

      -- ****d* Wm/Wm.Default_Window_Type
      -- FUNCTION
      -- Default type of Tk widget (no type)
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Window_Type: constant Window_Types := NONE;
   -- ****

   -- ****s* Wm/Wm.Window_Attributes_Data
   -- FUNCTION
   -- Data structure used to set or get Tk widget attributes. Depends on
   -- currently used window manager.
   -- PARAMETERS
   -- Alpha             - Alpha transparency value for the selected Tk widget
   --                     from 0.0 (full transparent) to 1.0 (opaque). Any
   --                     value below 0.0 will be ignored
   -- Full_Screen       - The widget takes the whole screen
   -- Topmost           - The widget is displayed above all other windows
   -- Window_Type       - The type of widget (X11 only)
   -- Zoomed            - The widget is maximized (X11 only)
   -- Disabled          - The widget is in the disabled state (Windows only)
   -- Tool_Window       - The widget is tool window (Windows only)
   -- Transparent_Color - The color used for the widget transparency (Windows
   --                     only)
   -- Modified          - The widget is in the modified state (Mac OS X only)
   -- Notify            - The widget notification state (Mac OS X only)
   -- Title_Path        - The path to the widget proxy icon (Mac OS X only)
   -- Transparent       - Makes the widget content are transparent (Mac OS X
   --                     only)
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Window_Attributes_Data
     (Wm_Type: Window_Manager_Types := Default_Window_Manager) is record
      Alpha: Alpha_Type;
      Full_Screen: Extended_Boolean;
      Topmost: Extended_Boolean;
      case Wm_Type is
         when X_11 =>
            Window_Type: Window_Types;
            Zoomed: Extended_Boolean;
         when WINDOWS =>
            Disabled: Extended_Boolean;
            Tool_Window: Extended_Boolean;
            Transparent_Color: Tcl_String;
         when MACOSX =>
            Modified: Extended_Boolean;
            Notify: Extended_Boolean;
            Title_Path: Tcl_String;
            Transparent: Extended_Boolean;
      end case;
   end record;
   -- ****

   -- ****d* Wm/Wm.Empty_Window_Attributes
   -- FUNCTION
   -- Empty attributes for Tk widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Window_Attributes: constant Window_Attributes_Data := (others => <>);
   -- ****

   -- ****t* Wm/Wm.Focus_Model_Types
   -- FUNCTION
   -- Types of Tk widget focus models. Active means that widget will take
   -- focus even from the other applications.
   -- OPTIONS
   -- ACTIVE  - The widget will claim the input focus for self and its
   --           descendants even if other applications have it.
   -- PASSIVE - The widget will not claim the input focus from other
   --           applications.
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Focus_Model_Types is (ACTIVE, PASSIVE) with
      Default_Value => PASSIVE;
   -- ****

   -- ****d* Wm/Wm.Default_Focus_Model
   -- FUNCTION
   -- Default focus model for Tk widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Focus_Model: constant Focus_Model_Types := PASSIVE;
   -- ****

   -- ****s* Wm/Wm.Window_Geometry
   -- FUNCTION
   -- Data structure used in setting the Tk widget geometry
   -- PARAMETERS
   -- Width  - The width in pixels of Tk widget
   -- Height - The height in pixels of Tk widget
   -- X      - The X coordinate on the screen of Tk widget
   -- Y      - The Y coordinate on the screen of Tk widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Window_Geometry is record
      Width: Natural;
      Height: Natural;
      X: Natural;
      Y: Natural;
   end record;
   -- ****

   -- ****d* Wm/Wm.Empty_Window_Geometry
   -- FUNCTION
   -- Empty values for Tk widget geometry
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Window_Geometry: constant Window_Geometry :=
     Window_Geometry'(others => 0);
     -- ****

     -- ****s* Wm/Wm.Window_Grid_Geometry
     -- FUNCTION
     -- Data structure used in setting the Tk widget grid geometry
     -- PARAMETERS
     -- Base_Width  - Number of grid units corresponding to the Tk widget
     --               width in pixels
     -- Base_Height - Number of grid units corresponding to the Tk widget
     --               height in pixels
     -- Width_Inc   - Number of pixels in one width grid unit
     -- Height_Inc  - Number of pixels in one height grid unit
     -- HISTORY
     -- 8.6.0 - Added
     -- SOURCE
   type Window_Grid_Geometry is record
      Base_Width: Natural;
      Base_Height: Natural;
      Width_Inc: Natural;
      Height_Inc: Natural;
   end record;
   -- ****

   -- ****d* Tk.Wm/Empty_Window_Grid_Geometry
   -- FUNCTION
   -- Empty values for Tk widget grid geometry
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Window_Grid_Geometry: constant Window_Grid_Geometry :=
     Window_Grid_Geometry'(others => 0);
     -- ****

     -- ****s* Wm/Wm.Aspect_Data
     -- FUNCTION
     -- Data structure used to set the Tk widget aspects ratios
     -- PARAMETERS
     -- Min_Numer - The minimum number for width/height for couting aspect
     --             ratios of Tk widget
     -- Min_Denom - The minumum denom for width/height for couting aspect
     --             ratios of Tk widget
     -- Max_Numer - The maximum number for width/height for couting aspect
     --             ratios of Tk widget
     -- Max_Denom - The maximum denom for width/height for couting aspect
     --             ratios of Tk widget
     -- HISTORY
     -- 8.6.0 - Added
     -- SOURCE
   type Aspect_Data is record
      Min_Numer: Natural;
      Min_Denom: Natural;
      Max_Numer: Natural;
      Max_Denom: Natural;
   end record;
   -- ****

   -- ****d* Wm/Wm.Empty_Aspect_Data
   -- FUNCTION
   -- Empty values for aspect ratios of Tk widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Aspect_Data: constant Aspect_Data := (others => 0);
   -- ****

   -- ****s* Tk.Wm/Window_Size
   -- FUNCTION
   -- Data structure used to manipulate maximum and minimum size of the Tk
   -- widget
   -- PARAMETERS
   -- Width  - For gridded windows, width size in grid units for the selected
   --          Tk widget. Otherwise, size in pixels.
   -- Height - For gridded windows, height size in grid units for the selected
   --          Tk widget. Otherwise, size in pixels.
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Window_Size is record
      Width: Natural;
      Height: Natural;
   end record;
   -- ****

   -- ****d* Wm/Wm.Empty_Window_Size
   -- FUNCTION
   -- Empty values for the Tk widget size
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Window_Size: constant Window_Size := (others => 0);
   -- ****

   -- ****t* Wm/Wm.Position_From_Value
   -- FUNCTION
   -- Type used to set source of position and size.
   -- OPTIONS
   -- USER    - Position or size was requested by the user
   -- PROGRAM - Position or size was requested by the program
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Position_From_Value is (USER, PROGRAM) with
      Default_Value => PROGRAM;
   -- ****

   -- ****d* Wm/Wm.Default_Position_From
   -- FUNCTION
   -- Default value for Position_From type
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Position_From: constant Position_From_Value := PROGRAM;
   -- ****

   -- ****s* Wm/Wm.Resizable_Data
   -- FUNCTION
   -- Data structure used to manipulate the Tk widget resizability by the user
   -- PARAMETERS
   -- Width  - The Tk widget is resizable horizontaly
   -- Height - The Tk widget is resizable vertically
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Resizable_Data is record
      Width: Boolean;
      Height: Boolean;
   end record;
   -- ****

   -- ****d* Wm/Wm.Default_Resizable_Data
   -- FUNCTION
   -- Default value for Tk widget resizability
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Resizable_Data: constant Resizable_Data := (others => True);
   -- ****

   -- ****t* Tk.Wm/Window_States
   -- FUNCTION
   -- Types of the Tk widget states. ZOOMED is avaliable only on Window and
   -- Mac OS X
   -- OPTIONS
   -- NORMAL    - Standard state of the widget
   -- ICONIC    - The widget was iconified
   -- WITHDRAWN - The widget was withdrawed
   -- ICON      - The widget is used as icon for another widget. Cannot be set
   -- ZOOMED    - Availble only on Windows and Mac OS X. The widget was
   --             maximized
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Window_States is (NORMAL, ICONIC, WITHDRAWN, ICON, ZOOMED) with
      Default_Value => NORMAL;
   -- ****

   -- ****d* Wm/Wm.Default_Window_State
   -- FUNCTION
   -- The default state for the Tk widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Default_Window_State: constant Window_States := NORMAL;
   -- ****

   -- ****f* Wm/Wm.Set_Aspect
   -- FUNCTION
   -- Set the aspect ratio for the selected Tk_Toplevel widget
   -- PARAMETERS
   -- Window    - Tk_Toplevel which aspect ratio will be set
   -- Min_Numer - The minimum number for width/height for couting aspect
   --             ratios of Tk_Toplevel
   -- Min_Denom - The minumum denom for width/height for couting aspect
   --             ratios of Tk_Toplevel
   -- Max_Numer - The maximum number for width/height for couting aspect
   --             ratios of Tk_Toplevel
   -- Max_Denom - The maximum denom for width/height for couting aspect
   --             ratios of Tk_Toplevel
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Set the aspect ratio for the main Tk window to 10 10 20 20
   -- Set_Aspect(Get_Main_Window, 10, 10, 20, 20);
   -- SEE ALSO
   -- Wm.Get_Aspect
   -- COMMANDS
   -- wm aspect Window Min_Numer Min_Denom Max_Numer Max_Denom
   -- SOURCE
   procedure Set_Aspect
     (Window: Tk_Toplevel;
      Min_Numer, Min_Denom, Max_Numer, Max_Denom: Natural) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Aspect", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Aspect
      -- FUNCTION
      -- Get the aspect ratio for the selected Tk_Toplevel widget
      -- PARAMETERS
      -- Window - Tk_Toplevel which aspect ratio will be get
      -- RESULT
      -- Aspect_Data record with current aspect ratio for the selected
      -- Tk_Toplevel
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the aspect ratio for the main Tk window
      -- Aspect_Ratio: constant Aspect_Data := Get_Aspect(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Aspect
      -- COMMANDS
      -- wm aspect Window
      -- SOURCE
   function Get_Aspect(Window: Tk_Toplevel) return Aspect_Data with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Aspect2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Attributes
      -- FUNCTION
      -- Get the platform dependent attributes for the selected Tk widget
      -- PARAMETERS
      -- Window - Tk_Widget which parameters will be get
      -- RESULT
      -- Window_Attributes_Data record with platform dependent attributes of
      -- the selected Tk_Widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the attributes of main Tk window on Linux
      -- Window_Attributes: constant Window_Attributes_Data(X_11) := Get_Attributes(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Attributes
      -- COMMANDS
      -- wm attributes Window
      -- SOURCE
   function Get_Attributes
     (Window: Tk_Widget) return Window_Attributes_Data with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Get_Attributes", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Attributes
      -- FUNCTION
      -- Set the platform dependent attributes for the selected Tk widget
      -- PARAMETERS
      -- Window          - Tk_Widget which parameters will be set
      -- Attributes_Data - The parameters to set
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the Tk main window on Linux as full screen window
      -- Set_Attributes(Get_Main_Window, (Full_Screen => True, others => <>));
      -- SEE ALSO
      -- Wm.Get_Attributes
      -- COMMANDS
      -- wm attributes Window Atributes_Data
      -- SOURCE
   procedure Set_Attributes
     (Window: Tk_Widget; Attributes_Data: Window_Attributes_Data) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Set_Attributes", Mode => Nominal);
      -- ****

      -- ****f* Tk.Wm/Get_Attribute
      -- FUNCTION
      -- Get the selected attribute as a selected type of the selected Tk_Widget.
      -- It is mostly used in Wm.Get_Attributes and Wm.Set_Attributes
      -- subprograms, which generally should be prefered to manipulate widgets
      -- attributes.
      -- Window - The Tk_Widget which attribute will be get
      -- Name   - The name of the attribute to get
      -- RESULT
      -- The value of the selected attribute of the selected Tk_Widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the transparent color on Windows for the main Tk window
      -- Transparent_Color: constant Tcl_String := Get_Attribute(Get_Main_Window, "transparentcolor");
      -- COMMANDS
      -- wm attributes Window Name
      -- SOURCE
   function Get_Attribute(Window: Tk_Widget; Name: String) return Tcl_String is
     (To_Tcl_String
        (Source =>
           Tcl_Eval
             (Tcl_Script =>
                "wm attributes " & Tk_Path_Name(Widgt => Window) & " -" & Name,
              Interpreter => Tk_Interp(Widgt => Window)))) with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Wm_Get_Attribute", Mode => Nominal);
   function Get_Attribute
     (Window: Tk_Widget; Name: String) return Extended_Boolean with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Wm_Get_Attribute2", Mode => Nominal);
   function Get_Attribute(Window: Tk_Widget; Name: String) return Alpha_Type is
     (Alpha_Type'Value
        (Tcl_Eval
           (Tcl_Script =>
              "wm attributes " & Tk_Path_Name(Widgt => Window) & " -" & Name,
            Interpreter => Tk_Interp(Widgt => Window)))) with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Wm_Get_Attribute3", Mode => Nominal);
   function Get_Attribute
     (Window: Tk_Widget; Name: String) return Window_Types is
     (Window_Types'Value
        (Tcl_Eval
           (Tcl_Script =>
              "wm attributes " & Tk_Path_Name(Widgt => Window) & " -" & Name,
            Interpreter => Tk_Interp(Widgt => Window)))) with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Wm_Get_Attribute4", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Client
      -- FUNCTION
      -- Get the value of Window property WM_CLIENT_MACHINE
      -- PARAMETERS
      -- Window - Tk_Widget which the property will be get
      -- RESULT
      -- String with value of the property
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the property for the Tk main window
      -- Client_Machine: constant String := Get_Client(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Client
      -- COMMANDS
      -- wm client Window
      -- SOURCE
   function Get_Client(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "wm client " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Client", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Client
      -- FUNCTION
      -- Set the value of Window property WM_CLIENT_MACHINE
      -- PARAMETERS
      -- Window - Tk_Widget which the property will be set
      -- Name   - The host on which the application is executing
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the property for the Tk main window to Localhost
      -- Set_Client(Get_Main_Window, To_Tcl_String("Localhost"));
      -- SEE ALSO
      -- Wm.Get_Client
      -- COMMANDS
      -- wm client Window Name
      -- SOURCE
   procedure Set_Client(Window: Tk_Widget; Name: Tcl_String) with
      Pre => Window /= Null_Widget and Length(Source => Name) > 0,
      Test_Case => (Name => "Test_Wm_Client2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Color_Map_Windows
      -- FUNCTION
      -- Get the list of Tk widgets which have different color maps than their
      -- parents (property WM_COLORMAP_WINDOWS)
      -- PARAMETERS
      -- Window - Tk_Widget which the list of the Tk widgets will be get
      -- RESULT
      -- Array_List with the names of Tk widgets which have different color
      -- maps than their parents
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the list of widgets for the Tk main window
      -- Different_Colors: constant Array_List := Get_Color_Map_Windows(Get_Main_Window);
      -- SEE ALSO
      -- Set_Color_Map_Windows
      -- COMMANDS
      -- wm colormapwindows Window
      -- SOURCE
   function Get_Color_Map_Windows(Window: Tk_Widget) return Array_List with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Color_Map_Windows", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Color_Map_Windows
      -- FUNCTION
      -- Set the list of Tk widgets which have different color maps than their
      -- parents (property WM_COLORMAP_WINDOWS)
      -- PARAMETERS
      -- Window  - Tk_Widget which the list of the Tk widgets will be set
      -- Widgets - The list of Tk widgets to set
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the list of widgets to My_Label and My_Button for the Tk main window
      -- Set_Color_Map_Windows(Get_Main_Window, (MyLabel, My_Button));
      -- SEE ALSO
      -- Get_Color_Map_Windows
      -- COMMANDS
      -- wm colormapwindows Window Widgets
      -- SOURCE
   procedure Set_Color_Map_Windows
     (Window: Tk_Widget; Widgets: Widgets_Array) with
      Pre => Window /= Null_Widget and Widgets /= Empty_Widgets_Array,
      Test_Case => (Name => "Test_Wm_Color_Map_Windows2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Command
      -- FUNCTION
      -- Get the value of the Tk_Widget property WM_COMMAND
      -- PARAMETERS
      -- Window - Tk_Widget which the property will be get
      -- RESULT
      -- Tcl_String with the value of the property for the selected Tk_Widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the property for the Tk main window
      -- Wm_Command: constant Tcl_String := Get_Command(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Command
      -- COMMANDS
      -- wm command Window
      -- SOURCE
   function Get_Command(Window: Tk_Widget) return Tcl_String is
     (To_Tcl_String
        (Source =>
           Tcl_Eval
             (Tcl_Script => "wm command " & Tk_Path_Name(Widgt => Window),
              Interpreter => Tk_Interp(Widgt => Window)))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Command", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Command
      -- FUNCTION
      -- Set the value of the Tk_Widget property WM_COMMAND
      -- PARAMETERS
      -- Window     - Tk_Widget which the property will be set
      -- Wm_Command - The command which will be set
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the property for the Tk main window
      -- Set_Command(Get_Main_Window, To_Tcl_String("puts hello"));
      -- SEE ALSO
      -- Wm.Set_Command
      -- COMMANDS
      -- wm command Window Wm_Command
      -- SOURCE
   procedure Set_Command(Window: Tk_Widget; Wm_Command: Tcl_String) with
      Pre => Window /= Null_Widget and Length(Source => Wm_Command) > 0,
      Test_Case => (Name => "Test_Wm_Command2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Deiconify
      -- FUNCTION
      -- Arrange the selected Tk_Widget to be displayed in normal
      -- (non-iconified) form.
      -- PARAMETERS
      -- Window - Tk_Widget to deiconify
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Deicoinify the main Tk window
      -- Deiconify(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Iconify
      -- COMMANDS
      -- wm deiconify Window
      -- SOURCE
   procedure Deiconify(Window: Tk_Widget) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Deiconify", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Focus_Model
      -- FUNCTION
      -- Get the focus model for the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which focus model will be get
      -- RESULT
      -- The current focus model of the selected Tk_Widget.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the focus model for the Tk main window
      -- Focus: constant Focus_Model_Types := Get_Focus_Model(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Focus_Model
      -- COMMANDS
      -- wm focusmodel Window
      -- SOURCE
   function Get_Focus_Model(Window: Tk_Widget) return Focus_Model_Types with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Focus_Model", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Focus_Model
      -- FUNCTION
      -- Set the focus model for the selected Tk_Widget
      -- PARAMETERS
      -- Window - The Tk_Widget which the focus model will be set
      -- Model  - The new value for the focus model
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the focus model of the Tk main window to ACTIVE
      -- Set_Focus_Model(Get_Main_Window, ACTIVE);
      -- SEE ALSO
      -- Wm.Get_Focus_Model
      -- COMMANDS
      -- wm focusmodel Window Model
      -- SOURCE
   procedure Set_Focus_Model(Window: Tk_Widget; Model: Focus_Model_Types) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Focus_Model2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Forget
      -- FUNCTION
      -- Unmap the selected Tk_Widget from the screen. It will be no longer
      -- managed by the windows manager
      -- PARAMETERS
      -- Window - Tk_Widget to forget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Unmap the main Tk window
      -- Forget(Get_Main_Window);
      -- COMMANDS
      -- wm forget Window
      -- SOURCE
   procedure Forget(Window: Tk_Widget) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Forget", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Frame
      -- FUNCTION
      -- Get the parent frame for the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which parent frame will be get
      -- RESULT
      -- If Window was reparented to the other frame by windows manager,
      -- returns that frame Tk_Window identifier. Otherwise return the
      -- Window Tk_Window identifier
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the parent frame for Tk main window
      -- Parent_Frame: constant Tk_Window := Get_Frame(Get_Main_Window);
      -- COMMANDS
      -- wm frame Window
      -- SOURCE
   function Get_Frame(Window: Tk_Widget) return Tk_Window with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Frame", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Geometry
      -- FUNCTION
      -- Get the current geometry of the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which geometry will be get
      -- RESULT
      -- Window_Geometry record with the current geometry of the Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the geometry of the Tk main window
      -- Widget_Geometry: constant Window_Geometry := Geometry(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Geometry
      -- COMMANDS
      -- wm geometry Window
      -- SOURCE
   function Get_Geometry(Window: Tk_Widget) return Window_Geometry with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Geometry", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Geometry
      -- FUNCTION
      -- Set the new geometry for the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which geometry will be set
      -- Width  - The new width for the Window. Must be set with Height together.
      -- Height - The new height for the Window Must be set with Width together.
      -- X      - The new X coordinate for top left corner of the Window. Must
      --          be set with Y together.
      -- Y      - The new X coordinate for top left corner of the Window. Must
      --          be set with Y together.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the main Tk window geometry to 800x600 and at top left corner of the screen
      -- Geometry(Get_Main_Window, 800, 600, 0, 0);
      -- SEE ALSO
      -- Wm.Set_Geometry
      -- COMMANDS
      -- wm geometry Window ?=WidthxHeight??+X+Y?
      -- SOURCE
   procedure Set_Geometry
     (Window: Tk_Widget; Width, Height, X, Y: Extended_Natural := -1) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Geometry2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Grid
      -- FUNCTION
      -- Get the current setting of the selected Tk_Widget as gridded window
      -- PARAMTERS
      -- Window -  Tk_Widget which grid setting will be get
      -- RESULT
      -- Window_Grid_Geometry record with current setting of Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the setting for the Tk main window
      -- Grid_Setting: constant Window_Grid_Geometry := Get_Grid(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Grid
      -- COMMANDS
      -- wm grid Window
      -- SOURCE
   function Get_Grid(Window: Tk_Widget) return Window_Grid_Geometry with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Grid", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Grid
      -- FUNCTION
      -- Set the selected Tk_Widget as a gridded window or change it gridded
      -- setting
      -- PARAMETERS
      -- Window      - Tk_Widget which will be set as gridded window
      -- Base_Width  - The amount of grid units corresponding to the pixels
      --               width dimension
      -- Base_Height - The amount of grid units corresponding to the pixels
      --               height dimension
      -- Width_Inc   - The amount of pixels in horizontal grid unit
      -- Height_Inc  - The amount of pixels in vertical grid unit
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the Tk main window as gridded window with base values 10, 10 and amount of pixels to 5, 5
      -- Set_Grid(Get_Main_Window, 10, 10, 5, 5);
      -- SEE ALSO
      -- Wm.Set_Grid
      -- COMMANDS
      -- wm grid Window Base_Width Base_Height Width_Inc Height_Inc
      -- SOURCE
   procedure Set_Grid
     (Window: Tk_Widget;
      Base_Width, Base_Height, Width_Inc, Height_Inc: Positive) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Grid2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Group
      -- FUNCTION
      -- Get the path name of the leader window in the group of windows to
      -- which the selected Tk_Widget belongs
      -- PARAMETERS
      -- Window - Tk_Widget which leader's group windows name will be get
      -- RESULT
      -- The Tk path name of the leader window of the group windows to
      -- which the Window belongs or empty string if Window isn't in a group
      -- of windows.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the name of the leader window for Tk main window
      -- Leader_Path: constant String := Get_Group(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Group
      -- COMMANDS
      -- wm group Window
      -- SOURCE
   function Get_Group(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "wm group " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Group", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Group
      -- FUNCTION
      -- Set the path name of the leader window in the group of windows to
      -- which the selected Tk_Widget belongs
      -- PARAMETERS
      -- Window    - Tk_Widget which leader's group windows name will be set
      -- Path_Name - The name of the leader's window to set
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the name of the leader window for Tk main window to ".mydialog"
      -- Set_Group(Get_Main_Window, To_Tcl_String(".mydialog"));
      -- SEE ALSO
      -- Wm.Get_Group
      -- COMMANDS
      -- wm group Window Path_Name
      -- SOURCE
   procedure Set_Group(Window: Tk_Widget; Path_Name: Tcl_String) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Group2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Icon_Bitmap
      -- FUNCTION
      -- Get the name of the bitmap which is used as an icon for the selected
      -- Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which bitmap icon will be get
      -- RESULT
      -- The String with name of the bitmap which is set as an icon for Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the name of a bitmap which is set as the icon for Tk main window
      -- Bitmap_Name: constant String := Get_Icon_Bitmap(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Icon_Bitmap
      -- COMMANDS
      -- wm iconbitmap Window
      -- SOURCE
   function Get_Icon_Bitmap(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "wm iconbitmap " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Bitmap", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Icon_Bitmap
      -- FUNCTION
      -- Set the name of the bitmap which is used as an icon for the selected
      -- Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which bitmap icon will be set
      -- Bitmap - The name of Tk bitmap which will be set as the icon
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the icon for Tk main window from Tk bitmap warning
      -- Icon_Bitmap(Get_Main_Window, To_Tcl_String("warning"));
      -- SEE ALSO
      -- Wm.Get_Icon_Bitmap
      -- COMMANDS
      -- wm iconbitmap Window Bitmap
      -- SOURCE
   procedure Set_Icon_Bitmap(Window: Tk_Widget; Bitmap: Tcl_String) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Bitmap2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Iconify
      -- FUNCTION
      -- Iconify the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which will be iconified
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Iconify Tk main window
      -- Iconify(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Deiconify
      -- COMMANDS
      -- wm iconify Window
      -- SOURCE
   procedure Iconify(Window: Tk_Widget) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Iconify", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Icon_Mask
      -- FUNCTION
      -- Get the name of bitmap used as mask for the selected Tk_Widget icon
      -- PARAMETERS
      -- Window - Tk_Widget which bitmap mask will be taken
      -- RESULT
      -- String with name of the current bitmap used a mask for the Window
      -- icon
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the mask for the Tk main window
      -- Mask_Name: constant String := Get_Icon_Mask(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Icon_Mask
      -- COMMANDS
      -- wm iconmask Window
      -- SOURCE
   function Get_Icon_Mask(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "wm iconmask " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Mask", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Icon_Mask
      -- FUNCTION
      -- Set the selected bitmap as a mask for the selected Tk_Widget icon
      -- PARAMETERS
      -- Window - Tk_Widget which bitmap mask will be set
      -- Bitmap - The name of bitmap to set as the mask
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the warning bitmap as mask for the Tk main window
      -- Set_Icon_Mask(Get_Main_Window, To_Tcl_String("warning"));
      -- SEE ALSO
      -- Wm.Get_Icon_Mask
      -- COMMANDS
      -- wm iconmask Window Bitmap
      -- SOURCE
   procedure Set_Icon_Mask(Window: Tk_Widget; Bitmap: Tcl_String) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Mask2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Icon_Name
      -- FUNCTION
      -- Get the name of the icon of the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which icon's name will be get
      -- RESULT
      -- String with the name of the icon of the Window or empty String if
      -- the Window doesn't have set any icon.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the name of icon for the Tk main window
      -- Name_Of_Icon: constant String := Get_Icon_Name(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Icon_Name
      -- COMMANDS
      -- wm iconname Window
      -- SOURCE
   function Get_Icon_Name(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "wm iconname " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Name", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Icon_Name
      -- FUNCTION
      -- Get the name of the icon of the selected Tk_Widget
      -- PARAMETERS
      -- Window   - Tk_Widget which icon's name will be set
      -- New_Name - The name of the icon which will be set
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the name of icon for the Tk main window to myicon
      -- Set_Icon_Name(Get_Main_Window, To_Tcl_String("myicon"));
      -- SEE ALSO
      -- Wm.Get_Icon_Name
      -- COMMANDS
      -- wm iconname Window New_Name
      -- SOURCE
   procedure Set_Icon_Name(Window: Tk_Widget; New_Name: Tcl_String) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Name2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Icon_Photo
      -- FUNCTION
      -- Set the titlebar icons for the selected Tk_Widget
      -- PARAMETERS
      -- Window  - Tk_Widget which titlebar icons will be set
      -- Images  - The array of the Tk icons which will be set
      -- Default - If True, use the selected Images as icons also for future
      --           toplevel widgets. Can be empty. Default value is False.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set titlebar icons for the Tk main window to myicon and mybigicon
      -- Set_Icon_Photo(Get_Main_Window, (To_Tcl_String("myicon"), To_Tcl_String("mybigicon")));
      -- COMMANDS
      -- wm iconphoto Window ?-default? Images
      -- SOURCE
   procedure Set_Icon_Photo
     (Window: Tk_Widget; Images: Array_List; Default: Boolean := False) with
      Pre => Window /= Null_Widget and Images'Length > 0,
      Test_Case => (Name => "Test_Wm_Icon_Photo", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Icon_Position
      -- FUNCTION
      -- Get the position of the icon for the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which icon's position will be get
      -- RESULT
      -- Point_Position record with the current position of the Window's icon
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the position of the Tk main window icon
      -- Position: constant Point_Position := Get_Icon_Position(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Icon_Position
      -- COMMANDS
      -- wm iconposition Window
      -- SOURCE
   function Get_Icon_Position(Window: Tk_Widget) return Point_Position with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Position", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Icon_Position
      -- FUNCTION
      -- Set the position of the icon for the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which icon's position will be set
      -- X      - New X coordinate of the Window icon
      -- Y      - New Y coordinate of the Window icon
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the position of the Tk main window icon to pixel coordinates 20, 20
      -- Icon_Position(Get_Main_Window, 20, 20);
      -- SEE ALSO
      -- Wm.Get_Icon_Position
      -- COMMANDS
      -- wm iconposition Window X Y
      -- SOURCE
   procedure Set_Icon_Position(Window: Tk_Widget; X, Y: Extended_Natural) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Position2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Icon_Window
      -- FUNCTION
      -- Get the Tk_Toplevel which is set as the current icon window for the
      -- selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which icon window will be get
      -- RESULT
      -- Tk_Toplevel widget which is icon window of Window or Null_Widget if
      -- is not set
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the icon window for the Tk main window
      -- Icon: constant Tk_Toplevel := Get_Icon_Window(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Icon_Window
      -- COMMANDS
      -- wm iconwindow Window
      -- SOURCE
   function Get_Icon_Window(Window: Tk_Widget) return Tk_Toplevel with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Window", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Icon_Window
      -- FUNCTION
      -- Set the Tk_Toplevel as the current icon window for the selected
      -- Tk_Widget
      -- PARAMETERS
      -- Window          - Tk_Widget which icon window will be set
      -- New_Icon_Window - Tk_Toplevel which will be set as new icon window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set My_Icon_Window as the icon window for the Tk main window
      -- Set_Icon_Window(Get_Main_Window, My_Icon_Window);
      -- SEE ALSO
      -- Wm.Get_Icon_Window
      -- COMMANDS
      -- wm iconwindow Window New_Icon_Window
      -- SOURCE
   procedure Set_Icon_Window(Window, New_Icon_Window: Tk_Toplevel) with
      Pre => Window /= Null_Widget and New_Icon_Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Window2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Manage
      -- FUNCTION
      -- Made the selected Tk_Widget as stand alone toplevel window
      -- PARAMETERS
      -- Window - Tk_Widget which will become a stand alone toplevel window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set My_Dialog Tk_Frame as stand alone window
      -- Manage(My_Dialog);
      -- COMMANDS
      -- wm manage Window
      -- SOURCE
   procedure Manage(Window: Tk_Widget) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Manage", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Max_Size
      -- FUNCTION
      -- Get the maximum allowed size for the selected Tk_Widget. For gridded
      -- windows it will be in grid unit, for others in pixels
      -- PARAMETERS
      -- Window - Tk_Widget which maximum allowed size will be get
      -- RESULT
      -- Window_Size record with information about maximum allowed size for
      -- the Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the maximum allowed size of Tk main window
      -- Allowed_Size: constant Window_Size := Get_Max_Size(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Max_Size
      -- COMMANDS
      -- wm maxsize Window
      -- SOURCE
   function Get_Max_Size(Window: Tk_Widget) return Window_Size with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Max_Size", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Max_Size
      -- FUNCTION
      -- Set the maximum allowed size for the selected Tk_Widget. For gridded
      -- windows it will be in grid unit, for others in pixels
      -- PARAMETERS
      -- Window - Tk_Widget which maximum allowed size will be set
      -- Width  - The new maximum width for the selected Tk_Widget
      -- Height - The new maximum height for the selected Tk_Widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the maximum allowed size of Tk main window to 100, 120
      -- Set_Max_Size(Get_Main_Window, 100, 120);
      -- SEE ALSO
      -- Wm.Get_Max_Size
      -- COMMANDS
      -- wm maxsize Window Width Height
      -- SOURCE
   procedure Set_Max_Size(Window: Tk_Widget; Width, Height: Positive) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Max_Size2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Min_Size
      -- FUNCTION
      -- Get the minumum allowed size for the selected Tk_Widget. For gridded
      -- windows it will be in grid unit, for others in pixels
      -- PARAMETERS
      -- Window - Tk_Widget which minimum allowed size will be get
      -- RESULT
      -- Window_Size record with information about minimum allowed size for
      -- the Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the minimum allowed size of Tk main window
      -- Minimum_Size: constant Window_Size := Get_Min_Size(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Min_Size
      -- COMMANDS
      -- wm minsize Window
      -- SOURCE
   function Get_Min_Size(Window: Tk_Widget) return Window_Size with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Min_Size", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Min_Size
      -- FUNCTION
      -- Set the minimum allowed size for the selected Tk_Widget. For gridded
      -- windows it will be in grid unit, for others in pixels
      -- PARAMETERS
      -- Window - Tk_Widget which minimum allowed size will be set
      -- Width  - The new minimum width for the selected Tk_Widget
      -- Height - The new minimum height for the selected Tk_Widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the minimum allowed size of Tk main window to 200, 240
      -- Set_Min_Size(Get_Main_Window, 200, 240);
      -- SEE ALSO
      -- Wm.Get_Min_Size
      -- COMMANDS
      -- wm minsize Window Width Height
      -- SOURCE
   procedure Set_Min_Size(Window: Tk_Widget; Width, Height: Positive) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Min_Size2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Override_Redirect
      -- FUNCTION
      -- Get the value of flag overrideredirect for the selected Tk_Widget.
      -- PARAMETERS
      -- Window - Tk_Widget which value of flag will be taken
      -- RESULT
      -- True if the Window is ignored by the window manager, otherwise False.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the flag value for the Tk main window
      -- Is_Ignored: constant Boolean := Get_Override_Redirect(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Override_Redirect
      -- COMMANDS
      -- wm overrideredirect Window
      -- SOURCE
   function Get_Override_Redirect(Window: Tk_Widget) return Boolean is
     (Tcl_Eval
        (Tcl_Script => "wm overrideredirect " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Override_Redirect", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Override_Redirect
      -- FUNCTION
      -- Set the value of flag overrideredirect for the selected Tk_Widget.
      -- PARAMETERS
      -- Window - Tk_Widget which value of flag will be set
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the flag value for the Tk main window to be ignored
      -- Set_Override_Redirect(Get_Main_Window, True);
      -- SEE ALSO
      -- Wm.Get_Override_Redirect
      -- COMMANDS
      -- wm overrideredirect Window Override
      -- SOURCE
   procedure Set_Override_Redirect(Window: Tk_Widget; Override: Boolean) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Override_Redirect", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Position_From
      -- FUNCTION
      -- Get the information who requested the current position for the
      -- selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which position requester will be get
      -- RESULT
      -- If PROGRAM, then the current position of Window was requested by the
      -- program, if USER then user requested the position.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the requester for the position of Tk main window
      -- Requester: constant Position_From_Value := Get_Position_From(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Position_From
      -- COMMANDS
      -- wm positionfrom Window
      -- SOURCE
   function Get_Position_From
     (Window: Tk_Widget) return Position_From_Value with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Position_From", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Position_From
      -- FUNCTION
      -- Get the information who requested the current position for the
      -- selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which position requester will be set
      -- Who    - The new requester for the current Window's position. Can be
      --          PROGRAM or USER
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the requester for the position of Tk main window to requested by the user
      -- Set_Position_From(Get_Main_Window, USER);
      -- SEE ALSO
      -- Wm.Get_Position_From
      -- COMMANDS
      -- wm positionfrom Window Who
      -- SOURCE
   procedure Set_Position_From
     (Window: Tk_Widget;
      Who: Position_From_Value := Default_Position_From) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Position_From2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Protocols
      -- FUNCTION
      -- Get the list of all specified window manager protocols for the
      -- selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which specified window manager protocols will
      --          be get
      -- RESULT
      -- Array_List with all specified window manager protocols. If nothing
      -- was specified, return empty list.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the protocols for the Tk main window
      -- Protocols: constant Array_List := Get_Protocols(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Get_Protocol, Wm.Set_Protocol
      -- COMMANDS
      -- wm protocol Window
      -- SOURCE
   function Get_Protocols(Window: Tk_Widget) return Array_List with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Protocol", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Protocol
      -- FUNCTION
      -- Get the value of the specified window manager protocol for the
      -- selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which specified window manager protocol will
      --          be get
      -- Name   - The name of the window manager protocol value to get
      -- RESULT
      -- String with the value of specified window manager protocol. If it
      -- wasn't specified, return empty string.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the value of WM_DELETE_WINDOW for the Tk main window
      -- Value: constant String := Get_Protocol(Get_Main_Window, "WM_DELETE_WINDOW");
      -- SEE ALSO
      -- Wm.Get_Protocols, Wm.Set_Protocol
      -- COMMANDS
      -- wm protocol Window Name
      -- SOURCE
   function Get_Protocol(Window: Tk_Widget; Name: String) return String is
     (Tcl_Eval
        (Tcl_Script =>
           "wm protocol " & Tk_Path_Name(Widgt => Window) & " " & Name,
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Wm_Protocol2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Protocol
      -- FUNCTION
      -- Set the value of the specified window manager protocol for the
      -- selected Tk_Widget
      -- PARAMETERS
      -- Window      - Tk_Widget which specified window manager protocol will
      --               be set
      -- Name        - The name of the window manager protocol value to set
      -- New_Command - The new Tcl command which will be associated with the
      --               selected window manager protocol
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the value of WM_DELETE_WINDOW to Tcl command exit for the Tk main window
      -- Set_Protocol(Get_Main_Window, "WM_DELETE_WINDOW", To_Tcl_String("exit"));
      -- SEE ALSO
      -- Wm.Get_Protocols, Wm.Get_Protocol
      -- COMMANDS
      -- wm protocol Window Name New_Command
      -- SOURCE
   procedure Set_Protocol
     (Window: Tk_Widget; Name: String; New_Command: Tcl_String) with
      Pre => Window /= Null_Widget and Name'Length > 0 and
      Length(Source => New_Command) > 0,
      Test_Case => (Name => "Test_Wm_Protocol3", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Resizable
      -- FUNCTION
      -- Get the information if the selected Tk_Widget can be resized by the
      -- user
      -- PARAMETERS
      -- Window - Tk_Widget which resizable ability will be get
      -- RESULT
      -- Resizable_Data record with information about resizable ability by
      -- the user. If Height is True, the user can resize Window vertically,
      -- if Width is True, the user can resize Window horizontally
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the resizable ability for the Tk main window
      -- Is_Resizable: constant Resizable_Data := Get_Resizable(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Resizable
      -- COMMANDS
      -- wm resizable Window
      -- SOURCE
   function Get_Resizable(Window: Tk_Widget) return Resizable_Data with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Resizable", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Resizable
      -- FUNCTION
      -- Set the information if the selected Tk_Widget can be resized by the
      -- user
      -- PARAMETERS
      -- Window - Tk_Widget which resizable ability will be set
      -- Width  - If True, the user can resize Window horizontally
      -- Height - If True, the user can resize Window vertically
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Block the resizable ability for the Tk main window
      -- Set_Resizable(Get_Main_Window, False, False);
      -- SEE ALSO
      -- Wm.Get_Resizable
      -- COMMANDS
      -- wm resizable Window Width Height
      -- SOURCE
   procedure Set_Resizable(Window: Tk_Widget; Width, Height: Boolean) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Resizable2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Size_From
      -- FUNCTION
      -- Get the information who requested the current size for the selected
      -- Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which size requester will be get
      -- RESULT
      -- If PROGRAM, then the current size of Window was requested by the
      -- program, if USER then user requested the size.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the requester for the size of Tk main window
      -- Requester: constant Position_From_Value := Get_Size_From(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Size_From
      -- COMMANDS
      -- wm sizefrom Window
      -- SOURCE
   function Get_Size_From(Window: Tk_Widget) return Position_From_Value with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Size_From", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Size_From
      -- FUNCTION
      -- Get the information who requested the current size for the selected
      -- Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which size requester will be set
      -- Who    - The new requester for the current Window's size. Can be
      --          PROGRAM or USER
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the requester for the size of Tk main window to requested by the user
      -- Size_From(Get_Main_Window, USER);
      -- SEE ALSO
      -- Wm.Get_Size_From
      -- COMMANDS
      -- wm sizefrom Window Who
      -- SOURCE
   procedure Set_Size_From
     (Window: Tk_Widget;
      Who: Position_From_Value := Default_Position_From) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Size_From2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Stack_Order
      -- FUNCTION
      -- Get the stacking order from the lowest to highest of children of the
      -- selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which stacking order will be get
      -- RESULT
      -- Widgets_Array with children widgets (including Window as the first)
      -- in stacking order
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the stacking order of Tk main window
      -- Stacking_Order: constant Widgets_Array := Get_Stack_Order(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Get_Stack_Order_Above
      -- COMMANDS
      -- wm stackorder Window
      -- SOURCE
   function Get_Stack_Order(Window: Tk_Widget) return Widgets_Array with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Stack_Order", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Stack_Order_Above
      -- FUNCTION
      -- Check if the selected Tk_Widget is above or below the other Tk_Widget
      -- in stacking order
      -- PARAMETERS
      -- Window         - Tk_Widget which position in stacking order will be
      --                  check
      -- Second_Window  - Tk_Widget which will be reference to check for
      --                  stacking order
      -- Above          - If true, check if Window is above Second_Window.
      --                  Otherwise check if Window is below. Default value is
      --                  True.
      -- RESULT
      -- True if Window is above (or below if Above was False) the Second_Window
      -- otherwise False
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Check if Tk main window is above My_Dialog in stacking order
      -- Is_Above: constant Boolean := Get_Stack_Order_Above(Get_Main_Window, My_Dialog);
      -- SEE ALSO
      -- Wm.Get_Stack_Order
      -- COMMANDS
      -- wm stackorder Window isabove Second_Window (when Above is True)
      -- wm stackorder Window isbelow Second_Window (when Above is False)
      -- SOURCE
   function Get_Stack_Order_Above
     (Window, Second_Window: Tk_Widget; Above: Boolean := True)
      return Boolean is
     (Tcl_Eval
        (Tcl_Script =>
           "wm stackorder " & Tk_Path_Name(Widgt => Window) & " " &
           (if Above then "isabove" else "isbelow") & " " &
           Tk_Path_Name(Widgt => Second_Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget and Second_Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Stack_Order2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_State
      -- FUNCTION
      -- Get the current state of the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which state will be get
      -- RESULT
      -- Window_States with current state of the Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the current state of Tk main window
      -- Current_State: constant Window_States := Get_State(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_State
      -- COMMANDS
      -- wm state Window
      -- SOURCE
   function Get_State(Window: Tk_Widget) return Window_States is
     (Window_States'Value
        (Tcl_Eval
           (Tcl_Script => "wm state " & Tk_Path_Name(Widgt => Window),
            Interpreter => Tk_Interp(Widgt => Window)))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_State", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_State
      -- FUNCTION
      -- Set the current state of the selected Tk_Widget
      -- PARAMETERS
      -- Window    - Tk_Widget which state will be set
      -- New_State - The new state for the Window. Can be empty. Default value
      --             is Default_Window_State
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the current state of Tk main window to withdrawn state
      -- Set_State(Get_Main_Window, WITHDRAWN);
      -- SEE ALSO
      -- Wm.Get_State
      -- COMMANDS
      -- wm state Window New_State
      -- SOURCE
   procedure Set_State
     (Window: Tk_Widget; New_State: Window_States := Default_Window_State) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_State2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Title
      -- FUNCTION
      -- Get the current title of the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which the title will be get
      -- RESULT
      -- Tcl_String with the current title of the Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the current title of Tk main window
      -- Window_Title: constant Tcl_String := Get_Title(Get_Main_Window);
      -- SEE ALSO
      -- Wm.Set_Title
      -- COMMANDS
      -- wm title Window
      -- SOURCE
   function Get_Title(Window: Tk_Widget) return Tcl_String is
     (To_Tcl_String
        (Source =>
           Tcl_Eval
             (Tcl_Script => "wm title " & Tk_Path_Name(Widgt => Window),
              Interpreter => Tk_Interp(Widgt => Window)))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Title", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Title
      -- FUNCTION
      -- Set the current title of the selected Tk_Widget
      -- PARAMETERS
      -- Window    - Tk_Widget which the title will be set
      -- New_Title - The new title for the Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the current title of Tk main window to "My window"
      -- Set_Title(Get_Main_Window, To_Tcl_String("My window"));
      -- SEE ALSO
      -- Wm.Get_Title
      -- COMMANDS
      -- wm title Window New_Title
      -- SOURCE
   procedure Set_Title(Window: Tk_Widget; New_Title: Tcl_String) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Title2", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Get_Transient
      -- FUNCTION
      -- Get the Tk_Widget for which the selected Tk_Widget is transient
      -- PARAMETERS
      -- Window - Tk_Widget which transient value will be get
      -- RESULT
      -- Tk_Widget which is the master for the Window or Null_Widget if
      -- Window don't have any
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get the transient window for the My_Menu Tk_Menu
      -- Master: constant Tk_Widget := Get_Transient(My_Menu);
      -- SEE ALSO
      -- Wm.Set_Transient
      -- COMMANDS
      -- wm transient Window
      -- SOURCE
   function Get_Transient(Window: Tk_Widget) return Tk_Widget with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Transient", Mode => Nominal);
      -- ****

      -- ****f* Wm/Wm.Set_Transient
      -- FUNCTION
      -- Set the Tk_Widget for which the selected Tk_Widget as transient
      -- PARAMETERS
      -- Window - Tk_Widget which transient value will be set
      -- Master - Tk_Widget which will be used as master for the Window
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Set the Tk main window as transient window for the My_Menu Tk_Menu
      -- Set_Transient(My_Menu, Get_Main_Window);
      -- SEE ALSO
      -- Wm.Get_Transient
      -- COMMANDS
      -- wm transient Window Master
      -- SOURCE
   procedure Set_Transient(Window, Master: Tk_Widget) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Transient2", Mode => Nominal);
      -- ****

      -- ****f* Tk.Wm/Withdraw
      -- FUNCTION
      -- Withdraw from the screen and unmap the selected Tk_Widget
      -- PARAMETERS
      -- Window - Tk_Widget which will be withdrawn
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Withdraw the Tk main window
      -- Withdraw(Get_Main_Window);
      -- COMMANDS
      -- wm withdraw Window
      -- SOURCE
   procedure Withdraw(Window: Tk_Widget) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Withdraw", Mode => Nominal);
      -- ****

   --## rule on REDUCEABLE_SCOPE
end Tk.Wm;
