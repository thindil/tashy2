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

package Tk.TtkButton is

   subtype Ttk_Button is Ttk_Widget;

   type Ttk_Button_Options is new Ttk_Widget_Options with record
      Compound: Compound_Type;
   end record;

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
   -- Button.Create_(procedure)
   -- COMMANDS
   -- button Path_Name Options
   -- SOURCE
   function Create
     (Path_Name: String; Options: Ttk_Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Button with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Create'Result /= Null_Widget,
      Test_Case => ("Test_Create_TtkButton1", Nominal);
      -- ****

      -- ****f* TtkButton/TtkButton.Create_(procedure)
      -- FUNCTION
      -- Create a new Tk button widget with the selected pathname and options
      -- PARAMETERS
      -- Widget      - Ttk_Button identifier which will be returned
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
      --    My_Button: Ttk_Button;
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
     (Widget: out Ttk_Button; Path_Name: String; Options: Ttk_Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Widget /= Null_Widget,
      Test_Case => ("Test_Create_TtkButton2", Nominal);
      -- ****

      -- ****f* TtkButton/TtkButton.Get_Options
      -- FUNCTION
      -- Get all values of Tk options of the selected button
      -- PARAMETERS
      -- Widget - Ttk_Button which options' values will be taken
      -- RESULT
      -- Ttk_Button_Options record with values of the selected button options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get all values of option of button with pathname .mybutton
      -- My_Button_Options: constant Ttk_Button_Options := Get_Options(Get_Widget(".mybutton"));
      -- SEE ALSO
      -- Button.Configure
      -- COMMANDS
      -- Widget configure
      -- SOURCE
   function Get_Options(Widget: Ttk_Button) return Ttk_Button_Options with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Get_Options_TtkButton", Nominal);
      -- ****

      -- ****f* TtkButton/TtkButton.Configure
      -- FUNCTION
      -- Set the selected options for the selected button
      -- PARAMETERS
      -- Widget  - Ttk_Button which options will be set
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
   procedure Configure(Widget: Ttk_Button; Options: Ttk_Button_Options) with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Configure_TtkButton", Nominal);
      -- ****

      -- ****f* TtkButton/TtkButton.Invoke_(procedure)
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Widget - Ttk_Button which the command will be invoked
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Ttk_Button My_Button
      -- Invoke(My_Button);
      -- SEE ALSO
      -- Button.Invoke_(function_and_string_result), Button.Invoke_(function_and_integer_result),
      -- Button.Invoke_(function_and_float_result)
      -- COMMANDS
      -- Widget invoke
      -- SOURCE
   procedure Invoke(Widget: Ttk_Button) with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Invoke_TtkButton1", Nominal);
      -- ****

      -- ****f* TtkButton/TtkButton.Invoke_(function_and_string_result)
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Widget - Ttk_Button which the command will be invoked
      -- RESULT
      -- The string with the return value of the associated Tcl command.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Ttk_Button My_Button
      -- Result: constant String := Invoke(My_Button);
      -- SEE ALSO
      -- Button.Invoke_(procedure), Button.Invoke_(function_and_integer_result),
      -- Button.Invoke_(function_and_float_result)
      -- COMMANDS
      -- Widget invoke
      -- SOURCE
   function Invoke(Widget: Ttk_Button) return String with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Invoke_TtkButton2", Nominal);
      -- ****

      -- ****f* TtkButton/TtkButton.Invoke_(function_and_integer_result)
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Widget - Ttk_Button which the command will be invoked
      -- RESULT
      -- The integer return value of the associated Tcl command.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Ttk_Button My_Button
      -- Result: constant Integer := Invoke(My_Button);
      -- SEE ALSO
      -- Button.Invoke_(function_and_string_result), Button.Invoke_(procedure),
      -- Button.Invoke_(function_and_float_result)
      -- COMMANDS
      -- Widget invoke
      -- SOURCE
   function Invoke(Widget: Ttk_Button) return Integer is
     (Integer'Value(Invoke(Widget))) with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Invoke_TtkButton3", Nominal);
      -- ****

      -- ****f* TtkButton/TtkButton.Invoke_(function_and_float_result)
      -- FUNCTION
      -- Invoke the Tcl command associated with the selected button. Does
      -- nothing if the button state is disabled.
      -- PARAMETERS
      -- Widget - Ttk_Button which the command will be invoked
      -- RESULT
      -- The float return value of the associated Tcl command.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Invoke the Tcl command of the Ttk_Button My_Button
      -- Result: constant Float := Invoke(My_Button);
      -- SEE ALSO
      -- Button.Invoke_(function_and_string_result), Button.Invoke_(function_and_integer_result),
      -- Button.Invoke_(procedure)
      -- COMMANDS
      -- Widget invoke
      -- SOURCE
   function Invoke(Widget: Ttk_Button) return Float is
     (Float'Value(Invoke(Widget))) with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Invoke_TtkButton4", Nominal);
      -- ****

end Tk.TtkButton;
