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
with Tk.Frame; use Tk.Frame;
with Tk.Menu; use Tk.Menu;
with Tk.Widget; use Tk.Widget;

-- ****h* Tk/TopLevel
-- FUNCTION
-- Provides code for manipulate Tk widget toplevel
-- SOURCE
package Tk.TopLevel is
   pragma Elaborate_Body;
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****t* TopLevel/Toplevel.Tk_Toplevel
   -- FUNCTION
   -- The Tk identifier of the toplevel
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Tk_Toplevel is Tk_Widget;
   -- ****

   -- ****s* TopLevel/TopLevel.TopLevel_Options
   -- FUNCTION
   -- Data structure for all available options for the Tk toplevel which can
   -- be changed after creation of a widget
   -- OPTIONS
   -- Background           - Normal Background color of the toplevel
   -- Border_Width         - The width of the toplevel's border
   -- Height               - Height of the toplevel.
   -- Highlight_Background - Highlight traversal region background color for
   --                        the toplevel
   -- Highlight_Color      - Highlight traversal rectangle color for the
   --                        toplevel
   -- Highlight_Thickness  - The width of highlight traversal rectangle for the
   --                        toplevel
   -- Menu                 - Menu widget which will be used as menubar in the
   --                        toplevel
   -- Pad_X                - Extra space requested for the toplevel in X-direction
   -- Pad_Y                - Extra space requested for the toplevel in Y-direction
   -- Relief               - 3-D effect desired for the toplevel
   -- Width                - Width of the toplevel
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Toplevel_Options is new Frame_Options with record
      Menu: Tk_Menu := Null_Widget;
   end record;
   -- ****

   -- ****f* TopLevel/TopLevel.Configure
   -- FUNCTION
   -- Set the selected options for the selected toplevel
   -- PARAMETERS
   -- Toplevel_Widget - Tk_Toplevel which options will be set
   -- Options         - The record with new values for the button options
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Set background to black for toplevel My_Dialog
   -- Configure(My_Dialog, (Background => To_Tcl_String("black"), others => <>));
   -- SEE ALSO
   -- TopLevel.Get_Options
   -- COMMANDS
   -- Widget configure Options
   -- SOURCE
   overriding procedure Configure
     (Toplevel_Widget: Tk_Toplevel; Options: Toplevel_Options) with
      Pre'Class => Toplevel_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Configure_TopLevel", Mode => Nominal);
      -- ****

   -- ****s* TopLevel/TopLevel.TopLevel_Create_Options
   -- FUNCTION
   -- Data structure for additional toplevel widget options which can be set
   -- only during creating a widget
   -- OPTIONS
   -- Class         - The name of the class for the widget
   -- Color_Map     - The name of the color map used by the widget. Can be
   --                 `new` or name of the color map from another widget
   -- Container     - If true, the widget will be used as container for another
   --                 embedded application
   -- Screen        - The name of the screen on which the widget will be placed
   -- Use_Container - Tk_Window which will be used as container for the widget
   -- Visual        - Type of visual information for the widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Toplevel_Create_Options is new Frame_Create_Options with record
      Menu: Tk_Menu := Null_Widget;
      Screen: Tcl_String := Null_Tcl_String;
      Use_Container: Tk_Window := Null_Window;
   end record;
   -- ****

   -- ****f* TopLevel/TopLevel.Create_(function)
   -- FUNCTION
   -- Create a new Tk toplevel widget with the selected pathname and options
   -- PARAMETERS
   -- Path_Name   - Tk pathname for the newly created toplevel
   -- Options     - Options for the newly created toplevel
   -- Interpreter - Tcl interpreter on which the toplevel will be created. Can
   --               be empty. Default value is the default Tcl interpreter
   -- RESULT
   -- The Tk identifier of the newly created toplevel widget
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Create the toplevel with pathname .mydialog and black background
   -- My_Dialog: constant Tk_TopLevel := Create(".mydialog", (Background => To_Tcl_String("black"),
   --                                                         others => <>));
   -- SEE ALSO
   -- TopLevel.Create_(procedure)
   -- COMMANDS
   -- toplevel Path_Name Options
   -- SOURCE
   overriding function Create
     (Path_Name: Tk_Path_String; Options: Toplevel_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Toplevel with
      Pre'Class => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Create'Result /= Null_Widget,
      Test_Case => (Name => "Test_Create_TopLevel1", Mode => Nominal);
      -- ****

      -- ****f* TopLevel/TopLevel.Create_(procedure)
      -- FUNCTION
      -- Create a new Tk toplevel widget with the selected pathname and options
      -- PARAMETERS
      -- Toplevel_Widget - Tk_Toplevel identifier which will be returned
      -- Path_Name       - Tk pathname for the newly created toplevel
      -- Options         - Options for the newly created toplevel
      -- Interpreter     - Tcl interpreter on which the toplelve will be created. Can
      --                   be empty. Default value is the default Tcl interpreter
      -- OUTPUT
      -- The Widget parameter as Tk identifier of the newly created toplevel widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Create the toplevel with pathname .mydialog
      -- declare
      --    My_Dialog: Tk_Toplevel;
      -- begin
      --    Create(My_Dialog, ".mydialog", Default_Toplevel_Create_Options);
      -- end;
      -- SEE ALSO
      -- TopLevel.Create_(function)
      -- COMMANDS
      -- toplevel Path_Name Options
      -- SOURCE
   overriding procedure Create
     (Toplevel_Widget: out Tk_Toplevel; Path_Name: Tk_Path_String;
      Options: Toplevel_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre'Class => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Toplevel_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Create_TopLevel2", Mode => Nominal);
   -- ****

   -- ****f* TopLevel/TopLevel.Get_Options
   -- FUNCTION
   -- Get all values of Tk options of the selected toplevel
   -- PARAMETERS
   -- Toplevel_Widget - Tk_Toplevel which options' values will be taken
   -- RESULT
   -- TopLevel_Create_Options record with values of the selected toplevel
   -- options
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get all values of option of toplevel with pathname .mydialog
   -- My_Dialog_Options: constant TopLevel_Create_Options := Get_Options(Get_Widget(".mydialog"));
   -- COMMANDS
   -- Widget configure
   -- SOURCE
   overriding function Get_Options
     (Toplevel_Widget: Tk_Toplevel) return Toplevel_Create_Options with
      Pre'Class => Toplevel_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Options_TopLevel", Mode => Nominal);
      -- ****

      -- ****d* TopLevel/TopLevel.Default_Toplevel_Create_Options
      -- FUNCTION
      -- Default options used during creating Toplevel widget
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Toplevel_Create_Options: constant Toplevel_Create_Options :=
     Toplevel_Create_Options'(others => <>);
     -- ****
     --## rule on REDUCEABLE_SCOPE

end Tk.TopLevel;
