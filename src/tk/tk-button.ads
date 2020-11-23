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
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Tk_Button is new Tk_Widget;
   -- ****

   -- ****s* Tk.Button/Button.Button_Options
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
   -- HISTORY
   -- 8.6.0 - Added
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

   -- ****f* Button/Button.Create_(function)
   -- FUNCTION
   -- Create a new Tk button widget with the selected pathname and options
   -- PARAMETERS
   -- Path_Name   - Tk pathname for the newly created button
   -- Options     - Options for the newly created button
   -- Interpreter - Tcl interpreter on which the button will be created. Can
   --               be empty. Default value is the default Tcl interpreter
   -- RESULT
   -- The Tk identifier of the newly created button widget
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Create the button with pathname .mybutton, text Quit and quitting from
   -- -- the program on activate
   -- My_Button: constant Tk_Button := Create(".mybutton", (Text => To_Tcl_String("Quit"),
   --                                  Command => To_Tcl_String("exit"), others => <>));
   -- SEE ALSO
   -- Button.Create_(procedure)
   -- COMMANDS
   -- button Path_Name Options
   -- SOURCE
   function Create
     (Path_Name: String; Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Button with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Create'Result /= Tk_Button(Null_Widget);
      -- ****

      -- ****f* Button/Button.Create_(procedure)
      -- FUNCTION
      -- Create a new Tk button widget with the selected pathname and options
      -- PARAMETERS
      -- Widget      - Tk_Button identifier which will be returned
      -- Path_Name   - Tk pathname for the newly created button
      -- Options     - Options for the newly created button
      -- Interpreter - Tcl interpreter on which the button will be created. Can
      --               be empty. Default value is the default Tcl interpreter
      -- OUTPUT
      -- The Widget parameter as Tk identifier of the newly created button widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Create the button with pathname .mybutton, text Quit and quitting from
      -- -- the program on activate
      -- declare
      --    My_Button: Tk_Button;
      -- begin
      --    Create(My_Button, ".mybutton", (Text => To_Tcl_String("Quit"),
      --           Command => To_Tcl_String("exit"), others => <>));
      -- end;
      -- SEE ALSO
      -- Button.Create_(function)
      -- COMMANDS
      -- button Path_Name Options
      -- SOURCE
   procedure Create
     (Widget: out Tk_Button; Path_Name: String; Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Widget /= Tk_Button(Null_Widget);
      -- ****

      -- ****f* Button/Button.Get_Options
      -- FUNCTION
      -- Get all values of Tk options of the selected button
      -- PARAMETERS
      -- Widget - Tk_Button which options' values will be taken
      -- RESULT
      -- Button_Options record with values of the selected button options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get all values of option of button with pathname .mybutton
      -- My_Button_Options: constant Butt_Options := Get_Options(Get_Widget(".mybutton"));
      -- SEE ALSO
      -- Button.Configure
      -- COMMANDS
      -- Widget configure
      -- SOURCE
   function Get_Options(Widget: Tk_Button) return Button_Options with
      Pre => Widget /= Tk_Button(Null_Widget);
      -- ****

      -- ****f* Button/Button.Configure
      -- FUNCTION
      -- Set the selected options for the selected button
      -- PARAMETERS
      -- Widget  - Tk_Button which options will be set
      -- Options - The record with new values for the button options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Disable button with pathname .mybutton
      -- Configure(Get_Widget(".mybutton"), (State => DISABLED, others => <>));
      -- SEE ALSO
      -- Button.Get_Options
      -- COMMANDS
      -- Widget configure Options
      -- SOURCE
   procedure Configure(Widget: Tk_Button; Options: Button_Options) with
      Pre => Widget /= Tk_Button(Null_Widget);
      -- ****

      -- ****f* Button/Button.Flash
      -- FUNCTION
      -- Flash the button. Does nothing if button state is disabled.
      -- PARAMETERS
      -- Widget - Tk_Button to flash
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Flash the Tk_Button My_Button
      -- Flash(My_Button);
      -- COMMANDS
      -- Widget flash
      -- SOURCE
   procedure Flash(Widget: Tk_Button) with
      Pre => Widget /= Tk_Button(Null_Widget);
      -- ****

      -- ****f* Button/Button.Invoke_(procedure)
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Widget - Tk_Button which the command will be invoked
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Tk_Button My_Button
      -- Invoke(My_Button);
      -- SOURCE
   procedure Invoke(Widget: Tk_Button) with
      Pre => Widget /= Tk_Button(Null_Widget);
      -- ****

      -- ****f* Button/Button.Invoke_(function_and_string_result)
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Widget - Tk_Button which the command will be invoked
      -- RESULT
      -- The string with the return value of the associated Tcl command.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Tk_Button My_Button
      -- Result: constant String := Invoke(My_Button);
      -- SOURCE
   function Invoke(Widget: Tk_Button) return String with
      Pre => Widget /= Tk_Button(Null_Widget);
      -- ****

      -- ****f* Button/Button.Invoke_(function_and_integer_result)
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Widget - Tk_Button which the command will be invoked
      -- RESULT
      -- The integer return value of the associated Tcl command.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Tk_Button My_Button
      -- Result: constant Integer := Invoke(My_Button);
      -- SOURCE
   function Invoke(Widget: Tk_Button) return Integer is
     (Integer'Value(Invoke(Widget))) with
      Pre => Widget /= Tk_Button(Null_Widget);
      -- ****

      -- ****f* Button/Button.Invoke_(function_and_float_result)
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Widget - Tk_Button which the command will be invoked
      -- RESULT
      -- The float return value of the associated Tcl command.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Tk_Button My_Button
      -- Result: constant Float := Invoke(My_Button);
      -- SOURCE
   function Invoke(Widget: Tk_Button) return Float is
     (Float'Value(Invoke(Widget))) with
      Pre => Widget /= Tk_Button(Null_Widget);
      -- ****

end Tk.Button;
