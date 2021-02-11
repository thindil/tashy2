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
   -- Data structure for all available options for the Tk ttk::label
   -- OPTIONS
   -- Anchor        - Specifies how the text in the label is positioned relative
   --                 to the inner margins
   -- Background    - The background color of the label
   -- Command       - The Tcl command which will be executed when the label
   --                 was pressed
   -- Compound      - Specifies if the label should display image and text in
   --                 the same time. If yes (other value than NONE or EMPTY),
   --                 then mean position of image related to the text
   -- Default       - Specifies the state for the default label (activated
   --                 when the user press Enter)
   -- Font          - The Tk font which will be used to draw text on the label
   -- Foreground    - The foreground color of the label
   -- Image         - Tk image used to display on the label. Default option
   --                 mean image used when other state's images are not
   --                 specified
   -- Justify       - If there are multiple lines of text, specify how the lines
   --                 are laid out relative to one another.
   -- Padding       - Amount of extra space to allocate for the label. If some
   --                 elemets are empty then, bottom defaults to top, right defaults
   --                 to left, and top defaults to left. Order of the elements:
   --                 left, top, right, bottom
   -- Relief        - 3-D effect desired for the label
   -- State         - The current state of the label
   -- Text          - The text displayed on the label
   -- Text_Variable - The Tcl variable which value will be used for the text
   --                 on the label
   -- Underline     - The index of the character in the label text which will be
   --                 underlined. The index starts from 0
   -- Width         - Width of the label. If greater than 0, allocate that
   --                 much space for the label, if less than zero, it is
   --                 minimum width, if zero, use natural width
   -- Wrap_Length   - Maximum line lenght in pixels. If equal to zero, then automatic
   --                 wrapping is not performed, otherwise the text is split into
   --                 lines such that no line is longer than the specified value.
   -- SOURCE
   type Ttk_Label_Options is new Ttk_Widget_Options with record
      Anchor: Directions_Type;
      Background: Tcl_String;
      Command: Tcl_String;
      Compound: Compound_Type;
      Default: State_Type;
      Font: Tcl_String;
      Foreground: Tcl_String;
      Image: Ttk_Image_Option;
      Justify: Justify_Type;
      Padding: Padding_Array;
      Relief: Relief_Type;
      State: Disabled_State_Type;
      Text: Tcl_String;
      Text_Variable: Tcl_String;
      Underline: Extended_Natural;
      Width: Integer;
      Wrap_Length: Extended_Natural;
   end record;
   -- ****

   -- ****f* TtkLabel/TtkLabel.Create_(function)
   -- FUNCTION
   -- Create a new Tk label widget with the selected pathname and options
   -- PARAMETERS
   -- Path_Name   - Tk pathname for the newly created label
   -- Options     - Options for the newly created label
   -- Interpreter - Tcl interpreter on which the label will be created. Can
   --               be empty. Default value is the default Tcl interpreter
   -- RESULT
   -- The Tk identifier of the newly created label widget
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Create the label with pathname .mylabel, text Quit and quitting from
   -- -- the program on activate
   -- My_Label: constant Ttk_Label := Create(".mylabel", (Text => To_Tcl_String("Quit"),
   --                                  Command => To_Tcl_String("exit"), others => <>));
   -- SEE ALSO
   -- TtkLabel.Create_(procedure)
   -- COMMANDS
   -- ttk::label Path_Name Options
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
      -- Create a new Tk label widget with the selected pathname and options
      -- PARAMETERS
      -- Widget      - Ttk_Label identifier which will be returned
      -- Path_Name   - Tk pathname for the newly created label
      -- Options     - Options for the newly created label
      -- Interpreter - Tcl interpreter on which the label will be created. Can
      --               be empty. Default value is the default Tcl interpreter
      -- OUTPUT
      -- The Widget parameter as Tk identifier of the newly created label widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Create the label with pathname .mylabel, text Quit and quitting from
      -- -- the program on activate
      -- declare
      --    My_Label: Ttk_Label;
      -- begin
      --    Create(My_Label, ".mylabel", (Text => To_Tcl_String("Quit"),
      --           Command => To_Tcl_String("exit"), others => <>));
      -- end;
      -- SEE ALSO
      -- TtkLabel.Create_(function)
      -- COMMANDS
      -- ttk::label Path_Name Options
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
      -- Get all values of Tk options of the selected label
      -- PARAMETERS
      -- Widget - Ttk_Label which options' values will be taken
      -- RESULT
      -- Ttk_Label_Options record with values of the selected label options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get all values of option of label with pathname .mylabel
      -- My_Label_Options: constant Ttk_Label_Options := Get_Options(Get_Widget(".mylabel"));
      -- SEE ALSO
      -- TtkLabel.Configure
      -- COMMANDS
      -- Widget configure
      -- SOURCE
   function Get_Options(Widget: Ttk_Label) return Ttk_Label_Options with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Get_Options_TtkLabel", Nominal);
      -- ****

      -- ****f* TtkLabel/TtkLabel.Configure
      -- FUNCTION
      -- Set the selected options for the selected label
      -- PARAMETERS
      -- Widget  - Ttk_Label which options will be set
      -- Options - The record with new values for the label options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Disable label with pathname .mylabel
      -- Configure(Get_Widget(".mylabel"), (State => DISABLED, others => <>));
      -- SEE ALSO
      -- TtkLabel.Get_Options
      -- COMMANDS
      -- Widget configure Options
      -- SOURCE
   procedure Configure(Widget: Ttk_Label; Options: Ttk_Label_Options) with
      Pre => Widget /= Null_Widget,
      Test_Case => ("Test_Configure_TtkLabel", Nominal);
      -- ****

end Tk.TtkLabel;
