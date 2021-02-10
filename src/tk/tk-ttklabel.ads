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

-- ****h* Tk/TtkLabel
-- FUNCTION
-- Provides code for manipulate Tk widget ttk::label
-- SOURCE
package Tk.TtkLabel is
-- ****

   -- ****t* TtkLabel/TtkLabel.Ttk_Label
   -- FUNCTION
   -- The Tk identifier of the ttk::label
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Ttk_Label is Ttk_Widget;
   -- ****

   -- ****s* TtkLabel/TtkLabel.Ttk_Label_Options
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
   -- SOURCE
   type Ttk_Label_Options is new Ttk_Widget_Options with record
      Command: Tcl_String;
      Compound: Compound_Type;
      Default: State_Type;
      Image: Ttk_Image_Option;
      State: Disabled_State_Type;
      Text: Tcl_String;
      Text_Variable: Tcl_String;
      Underline: Extended_Natural;
      Width: Integer;
   end record;
   -- ****

   -- ****f* TtkLabel/TtkLabel.Create_(function)
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
   -- My_Button: constant Ttk_Label := Create(".mybutton", (Text => To_Tcl_String("Quit"),
   --                                  Command => To_Tcl_String("exit"), others => <>));
   -- SEE ALSO
   -- Button.Create_(procedure)
   -- COMMANDS
   -- button Path_Name Options
   -- SOURCE
   function Create
     (Path_Name: String; Options: Ttk_Label_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Label with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Create'Result /= Null_Widget,
      Test_Case => ("Test_Create_TtkLabel1", Nominal);
      -- ****

      -- ****f* TtkLabel/TtkLabel.Create_(procedure)
      -- FUNCTION
      -- Create a new Tk button widget with the selected pathname and options
      -- PARAMETERS
      -- Widget      - Ttk_Label identifier which will be returned
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
      --    My_Button: Ttk_Label;
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
     (Widget: out Ttk_Label; Path_Name: String; Options: Ttk_Label_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Widget /= Null_Widget,
      Test_Case => ("Test_Create_TtkLabel2", Nominal);
      -- ****

      -- ****f* TtkLabel/TtkLabel.Get_Options
      -- FUNCTION
      -- Get all values of Tk options of the selected button
      -- PARAMETERS
      -- Widget - Ttk_Label which options' values will be taken
      -- RESULT
      -- Ttk_Label_Options record with values of the selected button options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get all values of option of button with pathname .mybutton
      -- My_Button_Options: constant Ttk_Label_Options := Get_Options(Get_Widget(".mybutton"));
      -- SEE ALSO
      -- Button.Configure
      -- COMMANDS
      -- Widget configure
      -- SOURCE
   function Get_Options(Widget: Ttk_Label) return Ttk_Label_Options with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Get_Options_TtkLabel", Nominal);
      -- ****

      -- ****f* TtkLabel/TtkLabel.Configure
      -- FUNCTION
      -- Set the selected options for the selected button
      -- PARAMETERS
      -- Widget  - Ttk_Label which options will be set
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
   procedure Configure(Widget: Ttk_Label; Options: Ttk_Label_Options) with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Configure_TtkLabel", Nominal);
      -- ****

end Tk.TtkLabel;
