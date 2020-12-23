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

with Tcl.Strings; use Tcl.Strings;
with Tk.Menu; use Tk.Menu;
with Tk.Widget; use Tk.Widget;

-- ****h* Tk/TopLevel
-- FUNCTION
-- Provides code for manipulate Tk widget toplevel
-- SOURCE
package Tk.TopLevel is
-- ****

   -- ****t* TopLevel/TopLevel.Tk_Button
   -- FUNCTION
   -- The Tk indetifier of the toplevel
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Tk_TopLevel is Tk_Widget;
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
   -- PadX                 - Extra space requested for the toplevel in X-direction
   -- PadY                 - Extra space requested for the toplevel in Y-direction
   -- Relief               - 3-D effect desired for the toplevel
   -- Width                - Width of the toplevel
   -- SOURCE
   type TopLevel_Options is new Widget_Options with record
      Background: Tcl_String;
      Border_Width: Pixel_Data;
      Height: Pixel_Data;
      Highlight_Background: Tcl_String;
      Highlight_Color: Tcl_String;
      Highlight_Thickness: Pixel_Data;
      Menu: Tk_Menu := Null_Widget;
      PadX: Pixel_Data;
      PadY: Pixel_Data;
      Relief: Relief_Type;
      Width: Pixel_Data;
   end record;
   -- ****

   -- ****f* TopLevel/TopLevel.Configure
   -- FUNCTION
   -- Set the selected options for the selected toplevel
   -- PARAMETERS
   -- Widget  - Tk_Toplevel which options will be set
   -- Options - The record with new values for the button options
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
   procedure Configure(Widget: Tk_TopLevel; Options: TopLevel_Options);
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
   type TopLevel_Create_Options is new TopLevel_Options with record
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
     (Path_Name: String; Options: TopLevel_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_TopLevel;
      -- ****

      -- ****f* TopLevel/TopLevel.Create_(procedure)
      -- FUNCTION
      -- Create a new Tk toplevel widget with the selected pathname and options
      -- PARAMETERS
      -- Widget      - Tk_TopLevel identifier which will be returned
      -- Path_Name   - Tk pathname for the newly created toplevel
      -- Options     - Options for the newly created toplevel
      -- Interpreter - Tcl interpreter on which the toplelve will be created. Can
      --               be empty. Default value is the default Tcl interpreter
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
     (Widget: out Tk_TopLevel; Path_Name: String;
      Options: TopLevel_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter);
   -- ****

   function Get_Options(Widget: Tk_TopLevel) return TopLevel_Create_Options;

end Tk.TopLevel;
