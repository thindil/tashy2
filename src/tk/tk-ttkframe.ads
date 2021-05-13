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
with Tk.TtkWidget; use Tk.TtkWidget;

-- ****h* Tk/TtkFrame
-- FUNCTION
-- Provides code for manipulate Tk widget ttk::frame
-- SOURCE
package Tk.TtkFrame is

   --## rule off REDUCEABLE_SCOPE
   -- ****t* TtkFrame/TtkFrame.Tk_Frame
   -- FUNCTION
   -- The Tk identifier of the frame
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Ttk_Frame is Ttk_Widget;
   -- ****

   -- ****s* TtkFrame/TtkFrame.Ttk_Frame_Options
   -- FUNCTION
   -- Data structure for all available options for the Tk ttk::frame which can
   -- be changed after creation of a widget
   -- OPTIONS
   -- Border_Width - The width of the ttk::frame's border
   -- Height       - Height of the ttk::frame.
   -- Padding      - Amount of extra space to allocate for the frame. If some
   --                elemets are empty then, bottom defaults to top, right defaults
   --                to left, and top defaults to left. Order of the elements:
   --                left, top, right, bottom
   -- Relief       - 3-D effect desired for the frame
   -- Width        - Width of the frame
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Ttk_Frame_Options is new Ttk_Widget_Options with record
      Border_Width: Pixel_Data;
      Height: Pixel_Data;
      Padding: Padding_Data;
      Relief: Relief_Type;
      Width: Pixel_Data;
   end record;
   -- ****

   -- ****f* TtkFrame/TtkFrame.Configure
   -- FUNCTION
   -- Set the selected options for the selected ttk::frame
   -- PARAMETERS
   -- Frame_Widget - Ttk_Frame which options will be set
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
   procedure Configure
     (Frame_Widget: Ttk_Frame;
      Options: Ttk_Frame_Options) with
      Pre => Frame_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Configure_Frame", Mode => Nominal);
      -- ****

   -- ****f* TtkFrame/TtkFrame.Create_(function)
   -- FUNCTION
   -- Create a new Tk ttk::frame widget with the selected pathname and options
   -- PARAMETERS
   -- Path_Name   - Tk pathname for the newly created ttk::frame
   -- Options     - Options for the newly created ttk::frame
   -- Interpreter - Tcl interpreter on which the frame will be created. Can
   --               be empty. Default value is the default Tcl interpreter
   -- RESULT
   -- The Tk identifier of the newly created ttk::frame widget
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Create the ttk::frame with pathname .myframe and black background
   -- My_Frame: constant Ttk_Frame := Create(".myframe", (Background => To_Tcl_String("black"),
   --                                                     others => <>));
   -- SEE ALSO
   -- TtkFrame.Create_(procedure)
   -- COMMANDS
   -- frame Path_Name Options
   -- SOURCE
   function Create
     (Path_Name: String;
      Options: Ttk_Frame_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Frame with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Create'Result /= Null_Widget,
      Test_Case => (Name => "Test_Create_Frame1", Mode => Nominal);
      -- ****

      -- ****f* TtkFrame/TtkFrame.Create_(procedure)
      -- FUNCTION
      -- Create a new Tk ttk:frame widget with the selected pathname and options
      -- PARAMETERS
      -- Frame_Widget    - Ttk_Frame identifier which will be returned
      -- Path_Name       - Tk pathname for the newly created ttk::frame
      -- Options         - Options for the newly created ttk::frame
      -- Interpreter     - Tcl interpreter on which the toplelve will be created. Can
      --                   be empty. Default value is the default Tcl interpreter
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
     (Frame_Widget: out Ttk_Frame;
      Path_Name: String;
      Options: Ttk_Frame_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Frame_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Create_Frame2", Mode => Nominal);
   -- ****

   -- ****f* TtkFrame/TtkFrame.Get_Options
   -- FUNCTION
   -- Get all values of Tk options of the selected ttk::frame
   -- PARAMETERS
   -- Frame_Widget - Ttk_Frame which options' values will be taken
   -- RESULT
   -- Ttk_Frame_Options record with values of the selected ttk::frame
   -- options
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get all values of option of ttk::frame with pathname .myframe
   -- My_Frame_Options: constant Ttk_Frame_Options := Get_Options(Get_Widget(".myframe"));
   -- COMMANDS
   -- Widget configure
   -- SOURCE
   function Get_Options(Frame_Widget: Ttk_Frame) return Ttk_Frame_Options with
      Pre => Frame_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Options_Frame", Mode => Nominal);
      -- ****

      -- ****d* TtkFrame/TtkFrame.Default_Ttk_Frame_Options
      -- FUNCTION
      -- Default options for ttk::frame widget
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Ttk_Frame_Options: constant Ttk_Frame_Options :=
     Ttk_Frame_Options'(others => <>);
   -- ****

   --## rule on REDUCEABLE_SCOPE
end Tk.TtkFrame;
