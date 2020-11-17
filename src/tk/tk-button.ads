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
   -- Background           - Normal Background color of the button
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
   -- Foreground           - Normal foreground color of the button
   -- Height               - Height of the button. For images, it is in pixels, for text
   --                        in lines
   -- Highlight_Background - Highlight traversal region background color for the button
   -- Highlight_Color      - Highlight traversal rectangle color for the button
   -- Highlight_Thickness  - The width of highlight traversal rectangle for the button
   -- Image                - Tk image used to display on the button
   -- Justify              - Justification of the button's text
   -- Over_Relief          - Alternative relief for the button when the mouse cursor is
   --                        over the button
   -- PadX                 - Extra space requested for the button in X-direction
   -- PadY                 - Extra space requested for the button in Y-direction
   -- Relief               - 3-D effect desired for the button
   -- Repeat_Delay         - Amount of miliseconds before key or button begins auto-repeat
   --                        on the button
   -- Repeat_Interval      - Amount of miliseconds between auto-repeat
   -- State                - The current state of the button
   -- Text                 - The text displayed on the button
   -- Text_Variable        - The Tcl variable which value will be used the text on the button
   -- Underline            - The index of the character in the button text which will be
   --                        underlined. The index starts from 0
   -- Width                - Width of the button. For images, it is in pixels, for text in
   --                        characters
   -- Wrap_Length          - The maximum length of the text on the button. If text is longer,
   --                        will be wrapped on the next line
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
