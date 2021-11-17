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
with Tk.Colors; use Tk.Colors;
with Tk.Widget; use Tk.Widget;

-- ****h* Tk/Button
-- FUNCTION
-- Provides code for manipulate Tk widget button
-- SOURCE
package Tk.Button is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****t* Button/Button.Tk_Button
   -- FUNCTION
   -- The Tk identifier of the button
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Tk_Button is Tk_Widget;
   -- ****

   -- ****s* Button/Button.Button_Options
   -- FUNCTION
   -- Data structure for all available options for the Tk button
   -- OPTIONS
   -- Active_Background    - Background color when button is active (mouse is
   --                        over the button)
   -- Active_Foreground    - Foreground color when button is active
   -- Anchor               - The direction in which a button text or image is
   --                        positioned. For example, NW means display in top-left
   --                        corner of the button
   -- Background           - Normal background color of the button
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
   -- Pad_X                - Extra space requested for the button in X-direction
   -- Pad_Y                - Extra space requested for the button in Y-direction
   -- Relief               - 3-D effect desired for the button
   -- Repeat_Delay         - Amount of miliseconds before key or button begins auto-repeat
   --                        on the button
   -- Repeat_Interval      - Amount of miliseconds between auto-repeat
   -- State                - The current state of the button
   -- Text                 - The text displayed on the button
   -- Text_Variable        - The Tcl variable which value will be used as the text on the
   --                        button
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
      Active_Background: Color_Type := Empty_Color;
      Active_Foreground: Color_Type := Empty_Color;
      Anchor: Directions_Type := NONE;
      Background: Color_Type := Empty_Color;
      Bitmap: Tcl_String := Null_Tcl_String;
      Border_Width: Pixel_Data := Empty_Pixel_Data;
      Command: Tcl_String := Null_Tcl_String;
      Compound: Place_Type := EMPTY;
      Default: State_Type := NONE;
      Disabled_Foreground: Color_Type := Empty_Color;
      Font: Tcl_String := Null_Tcl_String;
      Foreground: Color_Type := Empty_Color;
      Height: Pixel_Data := Empty_Pixel_Data;
      Highlight_Background: Color_Type := Empty_Color;
      Highlight_Color: Color_Type := Empty_Color;
      Highlight_Thickness: Pixel_Data := Empty_Pixel_Data;
      Image: Tcl_String := Null_Tcl_String;
      Justify: Justify_Type := NONE;
      Over_Relief: Relief_Type := NONE;
      Pad_X: Pixel_Data := Empty_Pixel_Data;
      Pad_Y: Pixel_Data := Empty_Pixel_Data;
      Relief: Relief_Type := NONE;
      Repeat_Delay: Extended_Natural := -1;
      Repeat_Interval: Extended_Natural := -1;
      State: State_Type := NONE;
      Text: Tcl_String := Null_Tcl_String;
      Text_Variable: Tcl_String := Null_Tcl_String;
      Underline: Extended_Natural := -1;
      Width: Pixel_Data := Empty_Pixel_Data;
      Wrap_Length: Pixel_Data := Empty_Pixel_Data;
   end record;
   -- ****

   -- ****f* Button/Button.Options_To_String
   -- FUNCTION
   -- Convert Ada structure to Tcl command
   -- PARAMETERS
   -- Options - Ada Button_Options to convert
   -- RESULT
   -- String with Tcl command options
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Convert Button_Options to String
   -- Options_String: constant String :=
   --    Options_To_String(Button_Options'(Text => To_Tcl_String("Click me"), others => <>));
   -- SOURCE
   function Options_To_String(Options: Button_Options) return String with
      Test_Case => (Name => "Test_Options_To_String", Mode => Robustness);
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
   -- The Tk identifier of the newly created button widget or Null_Widget if
   -- the button cannot be created
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
     (Path_Name: Tk_Path_String; Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Button with
      Pre'Class =>
      (Path_Name'Length > 0
       and then
         Path_Name'Length + Options_To_String(Options => Options)'Length <=
         Long_Long_Integer(Natural'Last) - 8) and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Create_Button1", Mode => Nominal);
      -- ****

      -- ****f* Button/Button.Create_(procedure)
      -- FUNCTION
      -- Create a new Tk button widget with the selected pathname and options
      -- PARAMETERS
      -- Button_Widget - Tk_Button identifier which will be returned
      -- Path_Name     - Tk pathname for the newly created button
      -- Options       - Options for the newly created button
      -- Interpreter   - Tcl interpreter on which the button will be created. Can
      --                 be empty. Default value is the default Tcl interpreter
      -- OUTPUT
      -- The Button_Widget parameter as Tk identifier of the newly created button
      -- widget or Null_Widget if the button cannot be created
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
     (Button_Widget: out Tk_Button; Path_Name: Tk_Path_String;
      Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre'Class =>
      (Path_Name'Length > 0
       and then
         Path_Name'Length + Options_To_String(Options => Options)'Length <=
         Long_Long_Integer(Natural'Last) - 8) and
      Interpreter /= Null_Interpreter,
      Test_Case => (Name => "Test_Create_Button2", Mode => Nominal);
      -- ****

      -- ****f* Button/Button.Get_Options
      -- FUNCTION
      -- Get all values of Tk options of the selected button
      -- PARAMETERS
      -- Button_Widget - Tk_Button which options' values will be taken
      -- RESULT
      -- Button_Options record with values of the selected button options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get all values of option of button with pathname .mybutton
      -- My_Button_Options: constant Button_Options := Get_Options(Get_Widget(".mybutton"));
      -- SEE ALSO
      -- Button.Configure
      -- COMMANDS
      -- Button_Widget configure
      -- SOURCE
   function Get_Options(Button_Widget: Tk_Button) return Button_Options with
      Pre'Class => Button_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Options_Button", Mode => Nominal);
      -- ****

      -- ****f* Button/Button.Configure
      -- FUNCTION
      -- Set the selected options for the selected button
      -- PARAMETERS
      -- Button_Widget  - Tk_Button which options will be set
      -- Options        - The record with new values for the button options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Disable button with pathname .mybutton
      -- Configure(Get_Widget(".mybutton"), (State => DISABLED, others => <>));
      -- SEE ALSO
      -- Button.Get_Options
      -- COMMANDS
      -- Button_Widget configure Options
      -- SOURCE
   procedure Configure(Button_Widget: Tk_Button; Options: Button_Options) with
      Pre'Class => Button_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Configure_Button", Mode => Nominal);
      -- ****

      -- ****d* Button/Button.Default_Button_Options
      -- FUNCTION
      -- Default values for Button widget options
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Button_Options: constant Button_Options :=
     Button_Options'(others => <>);
   -- ****

      -- ****f* Button/Button.Flash
      -- FUNCTION
      -- Flash the button. Does nothing if button state is disabled.
      -- PARAMETERS
      -- Button_Widget - Tk_Button to flash
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Flash the Tk_Button My_Button
      -- Flash(My_Button);
      -- COMMANDS
      -- Button_Widget flash
      -- SOURCE
   procedure Flash(Button_Widget: Tk_Button) with
      Pre => Button_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Flash_Button", Mode => Nominal);
      -- ****

      -- ****f* Button/Button.Invoke_(procedure)
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Button_Widget - Tk_Button which the command will be invoked
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Tk_Button My_Button
      -- Invoke(My_Button);
      -- SEE ALSO
      -- Button.Invoke_(function_and_string_result), Button.Invoke_(function_and_integer_result),
      -- Button.Invoke_(function_and_float_result)
      -- COMMANDS
      -- Button_Widget invoke
      -- SOURCE
   procedure Invoke(Button_Widget: Tk_Button) with
      Pre => Button_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Invoke_Button1", Mode => Nominal);
      -- ****

      -- ****f* Button/Button.Invoke_(function)
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Button_Widget - Tk_Button which the command will be invoked
      -- RESULT
      -- The string with the return value of the associated Tcl command.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Tk_Button My_Button
      -- Result: constant String := Invoke(My_Button);
      -- SEE ALSO
      -- Button.Invoke_(procedure), Button.Invoke_(function_and_integer_result),
      -- Button.Invoke_(function_and_float_result)
      -- COMMANDS
      -- Button_Widget invoke
      -- SOURCE
   function Invoke(Button_Widget: Tk_Button) return String with
      Pre => Button_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Invoke_Button2", Mode => Nominal);
      -- ****

      -- ****f* Button/Button.Generic_Scalar_Invoke_Button
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Button_Widget - Tk_Button which the command will be invoked
      -- RESULT
      -- Scalar type result with the value of associated Tcl command.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Tk_Button My_Button
      -- function Integer_Invoke is new Generic_Scalar_Invoke_Button(Integer);
      -- Result: constant Integer := Integer_Invoke(My_Button);
      -- SEE ALSO
      -- Button.Invoke_(function), Button.Generic_Float_Invoke_Button,
      -- COMMANDS
      -- Button_Widget invoke
      -- SOURCE
   generic
      type Result_Type is (<>);
   function Generic_Scalar_Invoke_Button
     (Button_Widget: Tk_Button) return Result_Type;
      -- ****

      -- ****f* Button/Button.Generic_Float_Invoke_Button
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Button_Widget - Tk_Button which the command will be invoked
      -- RESULT
      -- Float type result with the value of associated Tcl command.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Tk_Button My_Button
      -- function Float_Invoke is new Generic_Float_Invoke_Button(Float);
      -- Result: constant Float := Float_Invoke(My_Button);
      -- SEE ALSO
      -- Button.Invoke_(function), Button.Generic_Scalar_Invoke_Button,
      -- COMMANDS
      -- Button_Widget invoke
      -- SOURCE
   generic
      type Result_Type is digits <>;
   function Generic_Float_Invoke_Button
     (Button_Widget: Tk_Button) return Result_Type;
      -- ****
      --## rule on REDUCEABLE_SCOPE

end Tk.Button;
