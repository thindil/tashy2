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

with Tk.Widget; use Tk.Widget;
with Tcl.Strings; use Tcl.Strings;

-- ****h* Tk/Frame
-- FUNCTION
-- Provides code for manipulate Tk widget frame
-- SOURCE
package Tk.Frame with
   SPARK_Mode
is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****t* Frame/Frame.Tk_Frame
   -- FUNCTION
   -- The Tk identifier of the frame
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Tk_Frame is Tk_Widget;
   -- ****

   -- ****s* Frame/Frame.Frame_Options
   -- FUNCTION
   -- Data structure for all available options for the Tk frame which can
   -- be changed after creation of a widget
   -- OPTIONS
   -- Background           - Normal Background color of the frame
   -- Border_Width         - The width of the frame's border
   -- Height               - Height of the frame.
   -- Highlight_Background - Highlight traversal region background color for
   --                        the frame
   -- Highlight_Color      - Highlight traversal rectangle color for the
   --                        frame
   -- Highlight_Thickness  - The width of highlight traversal rectangle for the
   --                        frame
   -- Menu                 - Menu widget which will be used as menubar in the
   --                        frame
   -- Pad_X                - Extra space requested for the frame in X-direction
   -- Pad_Y                - Extra space requested for the frame in Y-direction
   -- Relief               - 3-D effect desired for the frame
   -- Width                - Width of the frame
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Frame_Options is new Widget_Options with record
      Background: Tcl_String := Null_Tcl_String;
      Border_Width: Pixel_Data := Empty_Pixel_Data;
      Height: Pixel_Data := Empty_Pixel_Data;
      Highlight_Background: Tcl_String := Null_Tcl_String;
      Highlight_Color: Tcl_String := Null_Tcl_String;
      Highlight_Thickness: Pixel_Data := Empty_Pixel_Data;
      Pad_X: Pixel_Data := Empty_Pixel_Data;
      Pad_Y: Pixel_Data := Empty_Pixel_Data;
      Relief: Relief_Type := NONE;
      Width: Pixel_Data := Empty_Pixel_Data;
   end record;
   -- ****

   -- ****f* Frame/Frame.Configure
   -- FUNCTION
   -- Set the selected options for the selected frame
   -- PARAMETERS
   -- Frame_Widget - Tk_Frame which options will be set
   -- Options      - The record with new values for the frame options
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Set background to black for frame My_Frame
   -- Configure(My_Frame, (Background => To_Tcl_String("black"), others => <>));
   -- SEE ALSO
   -- Frame.Get_Options
   -- COMMANDS
   -- Widget configure Options
   -- SOURCE
   procedure Configure(Frame_Widget: Tk_Frame; Options: Frame_Options) with
      Pre'Class => Frame_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Configure_Frame", Mode => Nominal);
      -- ****

      -- ****d* Frame/Frame.Default_Frame_Options
      -- FUNCTION
      -- Default options for frame widget
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Frame_Options: constant Frame_Options :=
     Frame_Options'(others => <>);
   -- ****

   -- ****s* Frame/Frame.Frame_Create_Options
   -- FUNCTION
   -- Data structure for additional frame widget options which can be set
   -- only during creating a widget
   -- OPTIONS
   -- Class         - The name of the class for the widget
   -- Color_Map     - The name of the color map used by the widget. Can be
   --                 `new` or name of the color map from another widget
   -- Container     - If true, the widget will be used as container for another
   --                 embedded application
   -- Visual        - Type of visual information for the widget
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Frame_Create_Options is new Frame_Options with record
      Class: Tcl_String := Null_Tcl_String;
      Color_Map: Tcl_String := Null_Tcl_String;
      Container: Extended_Boolean := NONE;
      Visual: Tcl_String := Null_Tcl_String;
   end record;
   -- ****

   -- ****f* Frame/Frame.Create_(function)
   -- FUNCTION
   -- Create a new Tk frame widget with the selected pathname and options
   -- PARAMETERS
   -- Path_Name   - Tk pathname for the newly created frame
   -- Options     - Options for the newly created frame
   -- Interpreter - Tcl interpreter on which the frame will be created. Can
   --               be empty. Default value is the default Tcl interpreter
   -- RESULT
   -- The Tk identifier of the newly created frame widget
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Create the frame with pathname .myframe and black background
   -- My_Frame: constant Tk_Frame := Create(".myframe", (Background => To_Tcl_String("black"),
   --                                                    others => <>));
   -- SEE ALSO
   -- Frame.Create_(procedure)
   -- COMMANDS
   -- frame Path_Name Options
   -- SOURCE
   function Create
     (Path_Name: Tk_Path_String; Options: Frame_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Frame with
      Pre'Class => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Create'Result /= Null_Widget,
      Test_Case => (Name => "Test_Create_Frame1", Mode => Nominal);
      -- ****

      -- ****f* Frame/Frame.Create_(procedure)
      -- FUNCTION
      -- Create a new Tk frame widget with the selected pathname and options
      -- PARAMETERS
      -- Frame_Widget - Tk_Frame identifier which will be returned
      -- Path_Name    - Tk pathname for the newly created frame
      -- Options      - Options for the newly created frame
      -- Interpreter  - Tcl interpreter on which the toplelve will be created. Can
      --                be empty. Default value is the default Tcl interpreter
      -- OUTPUT
      -- The Widget parameter as Tk identifier of the newly created frame widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Create the frame with pathname .myframe
      -- declare
      --    My_Frame: Tk_Frame;
      -- begin
      --    Create(My_Frame, ".myframe", Default_Frame_Create_Options);
      -- end;
      -- SEE ALSO
      -- Frame.Create_(function)
      -- COMMANDS
      -- frame Path_Name Options
      -- SOURCE
   procedure Create
     (Frame_Widget: out Tk_Frame; Path_Name: Tk_Path_String;
      Options: Frame_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre'Class => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Frame_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Create_Frame2", Mode => Nominal);
   -- ****

   -- ****f* Frame/Frame.Get_Options
   -- FUNCTION
   -- Get all values of Tk options of the selected frame
   -- PARAMETERS
   -- Frame_Widget - Tk_Frame which options' values will be taken
   -- RESULT
   -- Frame_Create_Options record with values of the selected frame
   -- options
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get all values of option of frame with pathname .myframe
   -- My_Frame_Options: constant Frame_Create_Options := Get_Options(Get_Widget(".myframe"));
   -- COMMANDS
   -- Widget configure
   -- SOURCE
   function Get_Options
     (Frame_Widget: Tk_Frame) return Frame_Create_Options with
      Pre'Class => Frame_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Options_Frame", Mode => Nominal);
      -- ****

      -- ****d* Frame/Frame.Default_Frame_Create_Options
      -- FUNCTION
      -- Default options used during creating Frame widget
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Frame_Create_Options: constant Frame_Create_Options :=
     Frame_Create_Options'(others => <>);
     -- ****
   --## rule on REDUCEABLE_SCOPE
end Tk.Frame;
