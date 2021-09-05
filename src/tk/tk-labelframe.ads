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

with Tk.Frame; use Tk.Frame;
with Tk.Widget; use Tk.Widget;
with Tcl.Strings; use Tcl.Strings;

-- ****h* Tk/Labelframe
-- FUNCTION
-- Provides code for manipulate Tk widget labelframe
-- SOURCE
package Tk.Labelframe with
   SPARK_Mode
is
   pragma Elaborate_Body;
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****t* Labelframe/Labelframe.Tk_Label_Frame
   -- FUNCTION
   -- The Tk identifier of the labelframe
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Tk_Label_Frame is Tk_Widget;
   -- ****

   -- ****s* Labelframe/Labelframe.Label_Frame_Options
   -- FUNCTION
   -- Data structure for all available options for the Tk labelframe which can
   -- be changed after creation of a widget
   -- OPTIONS
   -- Background           - Normal Background color of the labelframe
   -- Border_Width         - The width of the labelframe's border
   -- Height               - Height of the labelframe.
   -- Highlight_Background - Highlight traversal region background color for
   --                        the labelframe
   -- Highlight_Color      - Highlight traversal rectangle color for the
   --                        labelframe
   -- Highlight_Thickness  - The width of highlight traversal rectangle for the
   --                        labelframe
   -- Label_Anchor         - The direction where to place the label of Tk
   --                        labelframe. Works only when Text option isn't empty
   -- Label_Widget         - Tk_Widget used as a label for Tk labelframe.
   -- Menu                 - Menu widget which will be used as menubar in the
   --                        labelframe
   -- Pad_X                - Extra space requested for the labelframe in
   --                        X-direction
   -- Pad_Y                - Extra space requested for the labelframe in
   --                        Y-direction
   -- Relief               - 3-D effect desired for the labelframe
   -- Text                 - The text which will be displayed in label of Tk
   --                        labelframe
   -- Width                - Width of the labelframe
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Label_Frame_Options is new Frame_Options with record
      Label_Anchor: Anchor_Directions;
      Label_Widget: Tk_Widget := Null_Widget;
      Text: Tcl_String;
   end record;
   -- ****

   -- ****f* Labelframe/Labelframe.Configure
   -- FUNCTION
   -- Set the selected options for the selected labelframe
   -- PARAMETERS
   -- Frame_Widget - Tk_Label_Frame which options will be set
   -- Options      - The record with new values for the labelframe options
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Set background to black for labelframe My_Frame
   -- Configure(My_Frame, (Background => To_Tcl_String("black"), others => <>));
   -- SEE ALSO
   -- Labelframe.Get_Options
   -- COMMANDS
   -- Widget configure Options
   -- SOURCE
   overriding procedure Configure
     (Frame_Widget: Tk_Label_Frame; Options: Label_Frame_Options) with
      Pre'Class => Frame_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Configure_Label_Frame", Mode => Nominal);
      -- ****

   -- ****s* Labelframe/Labelframe.Frame_Create_Options
   -- FUNCTION
   -- Data structure for additional frame widget options which can be set
   -- only during creating a widget
   -- OPTIONS
   -- Class         - The name of the class for the widget
   -- Color_Map     - The name of the color map used by the widget. Can be
   --                 `new` or name of the color map from another widget
   -- Visual        - Type of visual information for the widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Label_Frame_Create_Options is new Label_Frame_Options with record
      Class: Tcl_String;
      Color_Map: Tcl_String;
      Container: Extended_Boolean;
      Visual: Tcl_String;
   end record;
   -- ****

   -- ****f* Labelframe/Labelframe.Create_(function)
   -- FUNCTION
   -- Create a new Tk labelframe widget with the selected pathname and options
   -- PARAMETERS
   -- Path_Name   - Tk pathname for the newly created labelframe
   -- Options     - Options for the newly created labelframe
   -- Interpreter - Tcl interpreter on which the labelframe will be created. Can
   --               be empty. Default value is the default Tcl interpreter
   -- RESULT
   -- The Tk identifier of the newly created labelframe widget
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Create the labelframe with pathname .myframe and black background
   -- My_Frame: constant Tk_Label_Frame := Create(".myframe", (Background => To_Tcl_String("black"),
   --                                                    others => <>));
   -- SEE ALSO
   -- Labelframe.Create_(procedure)
   -- COMMANDS
   -- labelframe Path_Name Options
   -- SOURCE
   function Create
     (Path_Name: Tk_Path_String; Options: Label_Frame_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Label_Frame with
      Pre'Class => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Create'Result /= Null_Widget,
      Test_Case => (Name => "Test_Create_Label_Frame1", Mode => Nominal);
      -- ****

      -- ****f* Labelframe/Labelframe.Create_(procedure)
      -- FUNCTION
      -- Create a new Tk labelframe widget with the selected pathname and options
      -- PARAMETERS
      -- Frame_Widget - Tk_Label_Frame identifier which will be returned
      -- Path_Name    - Tk pathname for the newly created labelframe
      -- Options      - Options for the newly created labelframe
      -- Interpreter  - Tcl interpreter on which the labelframe will be created. Can
      --                be empty. Default value is the default Tcl interpreter
      -- OUTPUT
      -- The Widget parameter as Tk identifier of the newly created labelframe widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Create the labelframe with pathname .myframe
      -- declare
      --    My_Frame: Tk_Label_Frame;
      -- begin
      --    Create(My_Frame, ".myframe", Default_Frame_Create_Options);
      -- end;
      -- SEE ALSO
      -- Labelframe.Create_(function)
      -- COMMANDS
      -- labelframe Path_Name Options
      -- SOURCE
   procedure Create
     (Frame_Widget: out Tk_Label_Frame; Path_Name: Tk_Path_String;
      Options: Label_Frame_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre'Class => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Frame_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Create_Label_Frame2", Mode => Nominal);
   -- ****

   -- ****f* Labelframe/Labelframe.Get_Options
   -- FUNCTION
   -- Get all values of Tk options of the selected labelframe
   -- PARAMETERS
   -- Frame_Widget - Tk_Label_Frame which options' values will be taken
   -- RESULT
   -- Frame_Create_Options record with values of the selected labelframe
   -- options
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get all values of option of labelframe with pathname .myframe
   -- My_Labe_Frame_Options: constant Label_Frame_Create_Options := Get_Options(Get_Widget(".myframe"));
   -- COMMANDS
   -- Widget configure
   -- SOURCE
   function Get_Options
     (Frame_Widget: Tk_Label_Frame) return Label_Frame_Create_Options with
      Pre'Class => Frame_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Options_Label_Frame", Mode => Nominal);
      -- ****

   --## rule on REDUCEABLE_SCOPE
end Tk.Labelframe;
