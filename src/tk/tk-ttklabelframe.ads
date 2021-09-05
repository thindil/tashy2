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

with Tcl.Strings; use Tcl.Strings;
with Tk.Widget; use Tk.Widget;
with Tk.TtkWidget; use Tk.TtkWidget;

-- ****h* Tk/TtkLabelFrame
-- FUNCTION
-- Provides code for manipulate Tk widget ttk::labelframe
-- SOURCE
package Tk.TtkLabelFrame with
   SPARK_Mode
is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****t* TtkLabelFrame/TtkLabelFrame.Tk_Frame
   -- FUNCTION
   -- The Tk identifier of the ttk::labelframe
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Ttk_Label_Frame is Ttk_Widget;
   -- ****

   -- ****s* TtkLabelFrame/TtkLabelFrame.Ttk_Label_Frame_Options
   -- FUNCTION
   -- Data structure for all available options for the Tk ttk::labelframe which can
   -- be changed after creation of a widget
   -- OPTIONS
   -- Border_Width - The width of the ttk::labelframe's border
   -- Height       - Height of the ttk::labelframe.
   -- Label_Anchor - The direction where to place the lable of Tk
   --                ttk::labelframe. Works only when Text option isn't empty
   -- Label_Widget - Tk_Widget used as a label for Tk ttk::labelframe.
   -- Padding      - Amount of extra space to allocate for the ttk::labelframe. If some
   --                elemets are empty then, bottom defaults to top, right defaults
   --                to left, and top defaults to left. Order of the elements:
   --                left, top, right, bottom
   -- Relief       - 3-D effect desired for the ttk::labelframe
   -- Text         - The text which will be displayed in label of Tk
   --                ttk::labelframe
   -- Width        - Width of the ttk::labelframe
   -- Underline    - The index of the character in the ttk::labelframe text
   --                which will be underlined. The index starts from 0
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Ttk_Label_Frame_Options is new Ttk_Widget_Options with record
      Border_Width: Pixel_Data := Empty_Pixel_Data;
      Height: Pixel_Data := Empty_Pixel_Data;
      Label_Anchor: Anchor_Directions := NONE;
      Label_Widget: Tk_Widget := Null_Widget;
      Padding: Padding_Data := Empty_Padding_Data;
      Relief: Relief_Type := NONE;
      Text: Tcl_String := Null_Tcl_String;
      Underline: Extended_Natural := -1;
      Width: Pixel_Data := Empty_Pixel_Data;
   end record;
   -- ****

   -- ****f* TtkLabelFrame/TtkLabelFrame.Configure
   -- FUNCTION
   -- Set the selected options for the selected ttk::labelframe
   -- PARAMETERS
   -- Frame_Widget - Ttk_Label_Frame which options will be set
   -- Options      - The record with new values for the ttk::labelframe options
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Set background to black for ttk::labelframe My_Frame
   -- Configure(My_Frame, (Background => To_Tcl_String("black"), others => <>));
   -- SEE ALSO
   -- Frame.Get_Options
   -- COMMANDS
   -- Widget configure Options
   -- SOURCE
   procedure Configure
     (Frame_Widget: Ttk_Label_Frame; Options: Ttk_Label_Frame_Options) with
      Pre'Class => Frame_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Configure_TtkLabelFrame", Mode => Nominal);
      -- ****

   -- ****f* TtkLabelFrame/TtkLabelFrame.Create_(function)
   -- FUNCTION
   -- Create a new Tk ttk::labelframe widget with the selected pathname and options
   -- PARAMETERS
   -- Path_Name   - Tk pathname for the newly created ttk::labelframe
   -- Options     - Options for the newly created ttk::labelframe
   -- Interpreter - Tcl interpreter on which the ttk::labelframe will be created. Can
   --               be empty. Default value is the default Tcl interpreter
   -- RESULT
   -- The Tk identifier of the newly created ttk::labelframe widget
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Create the ttk::labelframe with pathname .myframe and black background
   -- My_Frame: constant Ttk_Label_Frame := Create(".myframe", (Background => To_Tcl_String("black"),
   --                                                     others => <>));
   -- SEE ALSO
   -- TtkLabelFrame.Create_(procedure)
   -- COMMANDS
   -- ttk::labelframe Path_Name Options
   -- SOURCE
   function Create
     (Path_Name: Tk_Path_String; Options: Ttk_Label_Frame_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Ttk_Label_Frame with
      Pre'Class => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Create'Result /= Null_Widget,
      Test_Case => (Name => "Test_Create_TtkLabelFrame1", Mode => Nominal);
      -- ****

      -- ****f* TtkLabelFrame/TtkLabelFrame.Create_(procedure)
      -- FUNCTION
      -- Create a new Tk ttk::frame widget with the selected pathname and options
      -- PARAMETERS
      -- Frame_Widget    - Ttk_Label_Frame identifier which will be returned
      -- Path_Name       - Tk pathname for the newly created ttk::labelframe
      -- Options         - Options for the newly created ttk::labelframe
      -- Interpreter     - Tcl interpreter on which the ttk::labelframe will be created. Can
      --                   be empty. Default value is the default Tcl interpreter
      -- OUTPUT
      -- The Widget parameter as Tk identifier of the newly created ttk::labelframe widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Create the ttk::labelframe with pathname .myframe
      -- declare
      --    My_Frame: Ttk_Label_Frame;
      -- begin
      --    Create(My_Frame, ".myframe", Default_Ttk_Label_Frame_Create_Options);
      -- end;
      -- SEE ALSO
      -- Ttk_Label_Frame.Create_(function)
      -- COMMANDS
      -- ttk::labelframe Path_Name Options
      -- SOURCE
   procedure Create
     (Frame_Widget: out Ttk_Label_Frame; Path_Name: Tk_Path_String;
      Options: Ttk_Label_Frame_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre'Class => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Frame_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Create_TtkLabelFrame2", Mode => Nominal);
   -- ****

   -- ****f* TtkLabelFrame/TtkLabelFrame.Get_Options
   -- FUNCTION
   -- Get all values of Tk options of the selected ttk::labelframe
   -- PARAMETERS
   -- Frame_Widget - Ttk_Label_Frame which options' values will be taken
   -- RESULT
   -- Ttk_Label_Frame_Options record with values of the selected ttk::labelframe
   -- options
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Get all values of option of ttk::labelframe with pathname .myframe
   -- My_Frame_Options: constant Ttk_Label_Frame_Options := Get_Options(Get_Widget(".myframe"));
   -- COMMANDS
   -- Widget configure
   -- SOURCE
   function Get_Options
     (Frame_Widget: Ttk_Label_Frame) return Ttk_Label_Frame_Options with
      Pre'Class => Frame_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Options_TtkLabelFrame", Mode => Nominal);
      -- ****

      -- ****d* TtkLabelFrame/TtkLabelFrame.Default_Ttk_Label_Frame_Options
      -- FUNCTION
      -- Default options for ttk::labelframe widget
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Ttk_Label_Frame_Options: constant Ttk_Label_Frame_Options :=
     Ttk_Label_Frame_Options'(others => <>);
   -- ****

   --## rule on REDUCEABLE_SCOPE
end Tk.TtkLabelFrame;
