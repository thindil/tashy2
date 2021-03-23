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
with Tk.Menu; use Tk.Menu;
with Tk.Widget; use Tk.Widget;

-- ****h* Tk/TopLevel
-- FUNCTION
-- Provides code for manipulate Tk widget toplevel
-- SOURCE
package Tk.TopLevel is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****t* TopLevel/Toplevel.Tk_Button
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
   -- SOURCE
   type Toplevel_Options is new Widget_Options with record
      Background: Tcl_String;
      Border_Width: Pixel_Data;
      Height: Pixel_Data;
      Highlight_Background: Tcl_String;
      Highlight_Color: Tcl_String;
      Highlight_Thickness: Pixel_Data;
      Menu: Tk_Menu := Null_Widget;
      Pad_X: Pixel_Data;
      Pad_Y: Pixel_Data;
      Relief: Relief_Type;
      Width: Pixel_Data;
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
   procedure Configure
     (Toplevel_Widget: Tk_Toplevel; Options: Toplevel_Options) with
      Pre => Toplevel_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Configure_TopLevel", Mode => Nominal);
      -- ****

      -- ****d* TopLevel/TopLevel.Default_Toplevel_Options
      -- FUNCTION
      -- Default options for Toplevel widget
      -- SOURCE
   Default_Toplevel_Options: constant Toplevel_Options :=
     Toplevel_Options'(others => <>);
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
   -- SOURCE
   type Toplevel_Create_Options is new Toplevel_Options with record
      Class: Tcl_String;
      Color_Map: Tcl_String;
      Container: Extended_Boolean;
      Screen: Tcl_String;
      Use_Container: Tk_Window := Null_Window;
      Visual: Tcl_String;
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
   function Create
     (Path_Name: String; Options: Toplevel_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Toplevel with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
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
      --    My_Dialog: Tk_Dialog;
      -- begin
      --    Create(My_Dialog, ".mydialog", TopLevel_Create_Options'(others => <>));
      -- end;
      -- SEE ALSO
      -- TopLevel.Create_(function)
      -- COMMANDS
      -- toplevel Path_Name Options
      -- SOURCE
   procedure Create
     (Toplevel_Widget: out Tk_Toplevel; Path_Name: String;
      Options: Toplevel_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
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
   -- -- Get all values of option of topplevel with pathname .mydialog
   -- My_Dialog_Options: constant TopLevel_Create_Options := Get_Options(Get_Widget(".mydialog"));
   -- COMMANDS
   -- Widget configure
   -- SOURCE
   function Get_Options
     (Toplevel_Widget: Tk_Toplevel) return Toplevel_Create_Options with
      Pre => Toplevel_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Options_TopLevel", Mode => Nominal);
      -- ****

      -- ****d* TopLevel/TopLevel.Default_Toplevel_Create_Options
      -- FUNCTION
      -- Default options used during creating Toplevel widget
      -- SOURCE
   Default_Toplevel_Create_Options: constant Toplevel_Create_Options :=
     Toplevel_Create_Options'(others => <>);
     -- ****
     --## rule on REDUCEABLE_SCOPE

end Tk.TopLevel;
