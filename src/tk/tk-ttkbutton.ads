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

-- ****h* Tk/TtkButton
-- FUNCTION
-- Provides code for manipulate Tk widget ttk::button
-- SOURCE
package Tk.TtkButton is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****t* TtkButton/TtkButton.Ttk_Button
   -- FUNCTION
   -- The Tk identifier of the ttk::button
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Ttk_Button is Ttk_Widget;
   -- ****

   -- ****s* TtkButton/TtkButton.Ttk_Button_Options
   -- FUNCTION
   -- Data structure for all available options for the Tk ttk::button
   -- OPTIONS
   -- Command       - The Tcl command which will be executed when the button
   --                 was pressed
   -- Compound      - Specifies if the button should display image and text in
   --                 the same time. If yes (other value than NONE or EMPTY),
   --                 then mean position of image related to the text
   -- Default       - Specifies the state for the default button (activated
   --                 when the user press Enter)
   -- Image         - Tk image used to display on the button. Default option
   --                 mean image used when other state's images are not
   --                 specified
   -- State         - The current state of the button
   -- Text          - The text displayed on the button
   -- Text_Variable - The Tcl variable which value will be used for the text
   --                 on the button
   -- Underline     - The index of the character in the button text which will be
   --                 underlined. The index starts from 0
   -- Width         - Width of the button. If greater than 0, allocate that
   --                 much space for the button, if less than zero, it is
   --                 minimum width, if zero, use natural width
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Ttk_Button_Options is new Ttk_Widget_Options with record
      Command: Tcl_String := Null_Tcl_String;
      Compound: Compound_Type := EMPTY;
      Default: State_Type := NONE;
      Image: Ttk_Image_Option := Default_Ttk_Image_Option;
      State: Disabled_State_Type := NONE;
      Text: Tcl_String := Null_Tcl_String;
      Text_Variable: Tcl_String := Null_Tcl_String;
      Underline: Extended_Natural := -1;
      Width: Integer := 0;
   end record;
   -- ****

   -- ****f* TtkButton/TtkButton.Create_(function)
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
   -- My_Button: constant Ttk_Button := Create(".mybutton", (Text => To_Tcl_String("Quit"),
   --                                  Command => To_Tcl_String("exit"), others => <>));
   -- SEE ALSO
   -- TtkButton.Create_(procedure)
   -- COMMANDS
   -- ttk::button Path_Name Options
   -- SOURCE
   function Create
     (Path_Name: Tk_Path_String; Options: Ttk_Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Button with
      Pre'Class => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Create'Result /= Null_Widget,
      Test_Case => (Name => "Test_Create_TtkButton1", Mode => Nominal);
      -- ****

      -- ****f* TtkButton/TtkButton.Create_(procedure)
      -- FUNCTION
      -- Create a new Tk button widget with the selected pathname and options
      -- PARAMETERS
      -- Button      - Ttk_Button identifier which will be returned
      -- Path_Name   - Tk pathname for the newly created button
      -- Options     - Options for the newly created button
      -- Interpreter - Tcl interpreter on which the button will be created. Can
      --               be empty. Default value is the default Tcl interpreter
      -- OUTPUT
      -- The Button parameter as Tk identifier of the newly created button widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Create the button with pathname .mybutton, text Quit and quitting from
      -- -- the program on activate
      -- declare
      --    My_Button: Ttk_Button;
      -- begin
      --    Create(My_Button, ".mybutton", (Text => To_Tcl_String("Quit"),
      --           Command => To_Tcl_String("exit"), others => <>));
      -- end;
      -- SEE ALSO
      -- TtkButton.Create_(function)
      -- COMMANDS
      -- ttk::button Path_Name Options
      -- SOURCE
   procedure Create
     (Button: out Ttk_Button; Path_Name: Tk_Path_String;
      Options: Ttk_Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre'Class => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Button /= Null_Widget,
      Test_Case => (Name => "Test_Create_TtkButton2", Mode => Nominal);
      -- ****

      -- ****f* TtkButton/TtkButton.Get_Options
      -- FUNCTION
      -- Get all values of Tk options of the selected button
      -- PARAMETERS
      -- Button - Ttk_Button which options' values will be taken
      -- RESULT
      -- Ttk_Button_Options record with values of the selected button options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get all values of option of button with pathname .mybutton
      -- My_Button_Options: constant Ttk_Button_Options := Get_Options(Get_Widget(".mybutton"));
      -- SEE ALSO
      -- TtkButton.Configure
      -- COMMANDS
      -- Button configure
      -- SOURCE
   function Get_Options(Button: Ttk_Button) return Ttk_Button_Options with
      Pre'Class => Button /= Null_Widget,
      Test_Case => (Name => "Test_Get_Options_TtkButton", Mode => Nominal);
      -- ****

      -- ****f* TtkButton/TtkButton.Configure
      -- FUNCTION
      -- Set the selected options for the selected button
      -- PARAMETERS
      -- Button  - Ttk_Button which options will be set
      -- Options - The record with new values for the button options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Disable button with pathname .mybutton
      -- Configure(Get_Widget(".mybutton"), (State => DISABLED, others => <>));
      -- SEE ALSO
      -- TtkButton.Get_Options
      -- COMMANDS
      -- Button configure Options
      -- SOURCE
   procedure Configure(Button: Ttk_Button; Options: Ttk_Button_Options) with
      Pre'Class => Button /= Null_Widget,
      Test_Case => (Name => "Test_Configure_TtkButton", Mode => Nominal);
      -- ****

      -- ****d* TtkButton/TtkButton.Default_Ttk_Button_Options
      -- FUNCTION
      -- The default options for the Ttk_Button
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Ttk_Button_Options: constant Ttk_Button_Options :=
     Ttk_Button_Options'(others => <>);
   -- ****

      -- ****f* TtkButton/TtkButton.Invoke_(procedure)
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Button - Ttk_Button which the command will be invoked
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Ttk_Button My_Button
      -- Invoke(My_Button);
      -- SEE ALSO
      -- TtkButton.Invoke_(function_and_string_result), TtkButton.Invoke_(function_and_integer_result),
      -- TtkButton.Invoke_(function_and_float_result)
      -- COMMANDS
      -- Button invoke
      -- SOURCE
   procedure Invoke(Button: Ttk_Button) with
      Pre => Button /= Null_Widget,
      Test_Case => (Name => "Test_Invoke_TtkButton1", Mode => Nominal);
      -- ****

      -- ****f* TtkButton/TtkButton.Invoke_(function)
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Button - Ttk_Button which the command will be invoked
      -- RESULT
      -- The string with the return value of the associated Tcl command.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Ttk_Button My_Button
      -- Result: constant String := Invoke(My_Button);
      -- SEE ALSO
      -- TtkButton.Invoke_(procedure)
      -- COMMANDS
      -- Button invoke
      -- SOURCE
   function Invoke(Button: Ttk_Button) return String with
      Pre => Button /= Null_Widget,
      Test_Case => (Name => "Test_Invoke_TtkButton2", Mode => Nominal);
      -- ****

      -- ****f* TtkButton/TtkButton.Generic_Scalar_Invoke_Button
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Button - Ttk_Button which the command will be invoked
      -- RESULT
      -- Scalar type result with the value of associated Tcl command.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Ttk_Button My_Button
      -- function Integer_Invoke is new Generic_Scalar_Invoke_Button(Integer);
      -- Result: constant Integer := Integer_Invoke(My_Button);
      -- SEE ALSO
      -- TtkButton.Invoke_(function), TtkButton.Generic_Float_Invoke_Button,
      -- COMMANDS
      -- Button invoke
      -- SOURCE
   generic
      type Result_Type is (<>);
   function Generic_Scalar_Invoke_Button
     (Button: Ttk_Button) return Result_Type;
      -- ****

      -- ****f* TtkButton/TtkButton.Generic_Float_Invoke_Button
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Button - Ttk_Button which the command will be invoked
      -- RESULT
      -- Float type result with the value of associated Tcl command.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Ttk_Button My_Button
      -- function Float_Invoke is new Generic_Float_Invoke_Button(Float);
      -- Result: constant Float := Float_Invoke(My_Button);
      -- SEE ALSO
      -- TtkButton.Invoke_(function), TtkButton.Generic_Scalar_Invoke_Button,
      -- COMMANDS
      -- Button invoke
      -- SOURCE
   generic
      type Result_Type is digits <>;
   function Generic_Float_Invoke_Button(Button: Ttk_Button) return Result_Type;
      -- ****
      --## rule on REDUCEABLE_SCOPE

end Tk.TtkButton;
