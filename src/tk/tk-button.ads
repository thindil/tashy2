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
with Tk.Widget; use Tk.Widget;

-- ****h* Tk/Button
-- FUNCTION
-- Provides code for manipulate Tk widget button
-- SOURCE
package Tk.Button is
-- ****

   -- ****t* Button/Button.Tk_Button
   -- FUNCTION
   -- The Tk indetifier of the button
   -- SOURCE
   type Tk_Button is new Tk_Widget;
   -- ****

   -- ****s* Tk.Button/Button_Options
   -- FUNCTION
   -- Data structure for all available options for the Tk button
   -- OPTIONS
   -- Active_Background    - Background color when button is active (mouse is
   --                        over the button)
   -- Active_Foreground    - Foreground color when button is active
   -- Anchor               - The direction in which a button text or image is
   --                        positioned. For example, NW means display in top-left
   --                        corner of the button
   -- Bitmap               - The name of the bitmap to display on button
   -- Border_Width         - The width of the button's border
   -- Command              - The Tcl command which will be executed when the
   --                        button was pressed
   -- Compound             - Specifies if the button should display image and text
   --                        in the same time. If yes (other value than NONE or EMPTY),
   --                        then mean position of image related to the text
   -- Default              - Specifies the state for the default ring
   -- Disabled_Foreground  - Foreground color when the button is disabled
   -- Font                 - The Tk font which will be used to draw text on the button
   -- Foreground           -
   -- Height               -
   -- Highlight_Background -
   -- Highlight_Color      -
   -- Highlight_Thickness  -
   -- Image                -
   -- Justify              -
   -- Over_Relief          -
   -- PadX                 -
   -- PadY                 -
   -- Relief               -
   -- Repeat_Delay         -
   -- Repeat_Interval      -
   -- State                -
   -- Text                 -
   -- Text_Variable        -
   -- Underline            -
   -- Width                -
   -- Wrap_Length          -
   -- SOURCE
   type Button_Options is new Widget_Options with record
      Active_Background: Tcl_String;
      Active_Foreground: Tcl_String;
      Anchor: Directions_Type;
      Background: Tcl_String;
      Bitmap: Tcl_String;
      Border_Width: Pixel_Data;
      Command: Tcl_String;
      Compound: Place_Type;
      Default: State_Type;
      Disabled_Foreground: Tcl_String;
      Font: Tcl_String;
      Foreground: Tcl_String;
      Height: Pixel_Data;
      Highlight_Background: Tcl_String;
      Highlight_Color: Tcl_String;
      Highlight_Thickness: Pixel_Data;
      Image: Tcl_String;
      Justify: Justify_Type;
      Over_Relief: Relief_Type;
      PadX: Pixel_Data;
      PadY: Pixel_Data;
      Relief: Relief_Type;
      Repeat_Delay: Extended_Natural;
      Repeat_Interval: Extended_Natural;
      State: State_Type;
      Text: Tcl_String;
      Text_Variable: Tcl_String;
      Underline: Extended_Natural;
      Width: Pixel_Data;
      Wrap_Length: Pixel_Data;
   end record;
   -- ****

   function Create
     (Path_Name: String; Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Button;

   procedure Create
     (Widget: out Tk_Button; Path_Name: String; Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter);

   function Get_Options(Widget: Tk_Button) return Button_Options;

   procedure Configure(Widget: Tk_Button; Options: Button_Options);

end Tk.Button;
