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

-- ****h* Tk/TtkEntry
-- FUNCTION
-- Provides code for manipulate Tk widget ttk::entry
-- SOURCE
package Tk.TtkEntry is
-- ****

   --## rule off REDUCEABLE_SCOPE
   -- ****t* TtkEntry/TtkEntry.Ttk_Entry
   -- FUNCTION
   -- The Tk identifier of the ttk::entry
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   subtype Ttk_Entry is Ttk_Widget;
   -- ****

   -- ****t* TtkEntry/TtkEntry.Entry_State_Type
   -- FUNCTION
   -- Available states of Ttk_Entry widget
   -- OPTIONS
   -- NONE     - Used mostly when setting default state for widget
   -- NORMAL   - The normal state of widget, can be edited
   -- DISABLED - The widget can't be edited and text can't be selected
   -- READONLY - The widget can't be edited but text can be selected
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Entry_State_Type is (NONE, NORMAL, DISABLED, READONLY) with
      Default_Value => NONE;
      -- ****

      -- ****d* TtkEntry/TtkEntry.Default_Entry_State
      -- FUNCTION
      -- The default state of the Ttk_Entry widget
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Entry_State: constant Entry_State_Type := NORMAL;
   -- ****

   -- ****t* TtkEntry/TtkEntry.Validate_Type
   -- FUNCTION
   -- Available types of Ttk_Entry widget text validation
   -- OPTIONS
   -- EMPTY       - Used mostly when setting default validation state for
   --               widget
   -- NONE        - No validation of text
   -- FOCUS       - Validate text when Ttk_Widget receive or loss focus
   -- FOCUSIN     - Validate text when Ttk_Widget receive focus
   -- FOCUSOUT    - Validate text when Ttk_Widget loss focus
   -- KEY         - Validate text before insert or delete it
   -- VALIDATEALL - Validate text for all above conditions
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Validate_Type is
     (EMPTY, NONE, FOCUS, FOCUSIN, FOCUSOUT, KEY, VALIDATEALL) with
      Default_Value => EMPTY;
      -- ****

      -- ****d* TtkEntry/TtkEntry.Default_Validate
      -- FUNCTION
      -- The default validation condition for Ttk_Entry widget
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Validate: constant Validate_Type := EMPTY;
   -- ****

   -- ****s* TtkEntry/TtkEntry.Ttk_Entry_Options
   -- FUNCTION
   -- Data structure for all available options for the Tk ttk::entry
   -- OPTIONS
   -- X_Scroll_Command - Tcl command used to communicate with the horizontal
   --                    scrollbars. When the view of the Ttk_Entry changes, it
   --                    will execute that command with two parameters. The
   --                    first is fraction between 1 and 0 for the first
   --                    visible position in the entry, the second, also
   --                    fraction between 1 and 0 is the last visible position
   --                    in the entry.
   -- Export_Selection - If true, synchronize selection in Ttk_Entry with the
   --                    system selection (deselect other windows selections, etc.)
   -- Invalid_Command  - Tcl command which will be executed when the content of
   --                    Ttk_Entry is invalid
   -- Justify          - Specifies how the text in Ttk_Entry should be justified
   -- Show             - If True, show the content of the Ttk_Entry. If false,
   --                    show the content as bullet or "*".
   -- State            - The state of the Ttk_Entry
   -- Text_Variable    - The name of the Tcl variable which contains the content
   --                    of the Ttk_Entry. When its value change, the content
   --                    will be changed too and vice versa.
   -- Validation       - Set the validation mode for the Ttk_Entry
   -- Validate_Command - Tcl command which will be executed to validate the
   --                    content of the Ttk_Entry. That command must return 1
   --                    for valid content and 0 for invalid.
   -- Width            - The width of Ttk_Entry in characters
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Ttk_Entry_Options is new Ttk_Widget_Options with record
      X_Scroll_Command: Tcl_String;
      Export_Selection: Extended_Boolean;
      Invalid_Command: Tcl_String;
      Justify: Justify_Type;
      Show: Extended_Boolean;
      State: Entry_State_Type;
      Text_Variable: Tcl_String;
      Validation: Validate_Type;
      Validate_Command: Tcl_String;
      Width: Natural := 0;
   end record;
   -- ****

   -- ****t* TtkEntry/TtkEntry.Entry_Index_Type
   -- FUNCTION
   -- Available types of Ttk_Entry indices
   -- OPTIONS
   -- LASTCHARACTER  - The position just after the last character in Ttk_Entry
   -- INSERT         - The current position of the insert cursor in Ttk_Entry
   -- SELECTIONFIRST - The first character in the selection in Ttk_Entry
   -- SELECTIONLAST  - The last character in the selection in Ttk_Entry
   -- NONE           - Used mostly when setting empty position in Ttk_Entry
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Entry_Index_Type is
     (LASTCHARACTER, INSERT, SELECTIONFIRST, SELECTIONLAST, NONE) with
      Default_Value => NONE;
      -- ****

      -- ****d* TtkEntry/TtkEntry.Default_Entry_Index
      -- FUNCTION
      -- The default type of Ttk_Entry indice
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Entry_Index: constant Entry_Index_Type := NONE;
   -- ****

   -- ****t* TtkEntry/TtkEntry.Fraction_Type
   -- FUNCTION
   -- Type used to get or set visible fraction of Ttk_Entry. Value 0 means the
   -- start of the Ttk_Entry on the left, 1.0 end of the Ttk_Entry on the
   -- right.
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Fraction_Type is digits 2 range 0.0 .. 1.0 with
      Default_Value => 0.0;
      -- ****

      -- ****d* TtkEntry/TtkEntry.Default_Fraction
      -- FUNCTION
      -- Default fraciton value for Ttk_Entry (left side of the widget)
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Fraction: constant Fraction_Type := 0.0;
   -- ****

   -- ****t* TtkEntry/TtkEntry.Scroll_Unit_Type
   -- FUNCTION
   -- Types of unit used in setting scrolling position
   -- OPTIONS
   -- UNITS - The value used to scroll is in characters
   -- PAGES - The value used to scroll is in screens
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Scroll_Unit_Type is (UNITS, PAGES) with
      Default_Value => UNITS;
      -- ****

      -- ****d* TtkEntry/TtkEntry.Default_Scroll_Unit
      -- FUNCTION
      -- Default type of unit used in setting scrolling position
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Scroll_Unit: constant Scroll_Unit_Type := UNITS;
   -- ****

   -- ****t* TtkEntry/TtkEntry.Fractions_Array
   -- FUNCTION
   -- Used to get the current view fraction of the Ttk_Entry. The first value
   -- is the fraction of the first visible element in the widget. The second
   -- value is the fraction of the last visible element in the widget.
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Fractions_Array is array(1 .. 2) of Fraction_Type with
      Default_Component_Value => Default_Fraction;
      -- ****

      -- ****d* TtkEntry/TtkEntry.Default_Fractions_Array
      -- FUNCTION
      -- The default or empty array of fractions
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Fractions_Array: constant Fractions_Array := (others => <>);
   -- ****

   -- ****f* TtkEntry/TtkEntry.Create_(function)
   -- FUNCTION
   -- Create a new Tk ttk::entry widget with the selected pathname and options
   -- PARAMETERS
   -- Path_Name   - Tk pathname for the newly created entry
   -- Options     - Options for the newly created entry
   -- Interpreter - Tcl interpreter on which the entry will be created. Can
   --               be empty. Default value is the default Tcl interpreter
   -- RESULT
   -- The Tk identifier of the newly created entry widget
   -- HISTORY
   -- 8.6.0 - Added
   -- EXAMPLE
   -- -- Create the entry with pathname .myentry, with width 15 characters
   -- My_Entry: constant Ttk_Entry := Create(".myentry", (Width => 15, others => <>));
   -- SEE ALSO
   -- TtkEntry.Create_(procedure)
   -- COMMANDS
   -- ttk::entry Path_Name Options
   -- SOURCE
   function Create
     (Path_Name: String; Options: Ttk_Entry_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Entry with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Create'Result /= Null_Widget,
      Test_Case => (Name => "Test_Create_TtkEntry1", Mode => Nominal);
      -- ****

      -- ****f* TtkEntry/TtkEntry.Create_(procedure)
      -- FUNCTION
      -- Create a new Tk ttk::entry widget with the selected pathname and options
      -- PARAMETERS
      -- Entry_Widget - Ttk_Entry identifier which will be returned
      -- Path_Name    - Tk pathname for the newly created entry
      -- Options      - Options for the newly created entry
      -- Interpreter  - Tcl interpreter on which the entry will be created. Can
      --                be empty. Default value is the default Tcl interpreter
      -- OUTPUT
      -- The Entry_Widget parameter as Tk identifier of the newly created entry widget
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Create the entry with pathname .myentry, disabled by default
      -- declare
      --    My_Entry: Ttk_Entry;
      -- begin
      --    Create(My_Entry, ".myentry", (State => DISABLED, others => <>));
      -- end;
      -- SEE ALSO
      -- TtkEntry.Create_(function)
      -- COMMANDS
      -- ttk::entry Path_Name Options
      -- SOURCE
   procedure Create
     (Entry_Widget: out Ttk_Entry; Path_Name: String;
      Options: Ttk_Entry_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Create_TtkEntry2", Mode => Nominal);
      -- ****

      -- ****f* TtkEntry/TtkEntry.Get_Options
      -- FUNCTION
      -- Get all values of Tk options of the selected entry
      -- PARAMETERS
      -- Entry_Widget - Ttk_Entry which options' values will be taken
      -- RESULT
      -- Ttk_Entry_Options record with values of the selected entry options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Get all values of option of ttk::entry with pathname .myentry
      -- My_Entry_Options: constant Ttk_Entry_Options := Get_Options(Get_Widget(".myentry"));
      -- SEE ALSO
      -- TtkEntry.Configure
      -- COMMANDS
      -- Entry_Widget configure
      -- SOURCE
   function Get_Options(Entry_Widget: Ttk_Entry) return Ttk_Entry_Options with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Options_TtkEntry", Mode => Nominal);
      -- ****

      -- ****f* TtkEntry/TtkEntry.Configure
      -- FUNCTION
      -- Set the selected options for the selected ttk::entry
      -- PARAMETERS
      -- Entry_Widget - Ttk_Entry which options will be set
      -- Options      - The record with new values for the entry options
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Disable entry with pathname .myentry
      -- Configure(Get_Widget(".myentry"), (State => DISABLED, others => <>));
      -- SEE ALSO
      -- TtkEntry.Get_Options
      -- COMMANDS
      -- Entry_Widget configure Options
      -- SOURCE
   procedure Configure
     (Entry_Widget: Ttk_Entry; Options: Ttk_Entry_Options) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Configure_TtkEntry", Mode => Nominal);
      -- ****

      -- ****d* TtkEntry/TtkEntry.Default_Ttk_Entry_Options
      -- FUNCTION
      -- The default options for the Ttk_Entry
      -- HISTORY
      -- 8.6.0 - Added
      -- SOURCE
   Default_Ttk_Entry_Options: constant Ttk_Entry_Options :=
     Ttk_Entry_Options'(others => <>);
     -- ****

     -- ****f* TtkEntry/TtkEntry.Get_Bounding_Box_(numeric_index)
     -- FUNCTION
     -- Get the bouding box for the character in Ttk_Entry with the selected
     -- numerical index
     -- PARAMETERS
     -- Entry_Widget - The Ttk_Entry widget which bouding box will be get
     -- Index        - The index or X coordinate of the character in
     --                Entry_Widget.
     -- Is_Index     - If True, Index is numerical index of the character. If
     --                False, Index is X coordinate of the character. Can be
     --                empty. Default value is True.
     -- RESULT
     -- BBox_Data with 4 values. The first two are staring point (x, y) of
     -- the bounding box, the third is width and the fourth is height of the
     -- bounding box.
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
     -- -- Get the bouding box of the second character in Ttk_Entry My_Entry widget
      -- Bounding_Box: constant BBox_Data := Get_Bounding_Box(My_Entry, 1);
     -- SEE ALSO
     -- TtkEntry.Get_Bounding_Box_(entry_index_type)
     -- COMMANDS
     -- Entry_Widget bbox Index
     -- SOURCE
   function Get_Bounding_Box
     (Entry_Widget: Ttk_Entry; Index: Natural; Is_Index: Boolean := True)
      return Bbox_Data with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Bounding_Box", Mode => Nominal);
      -- ****

     -- ****f* TtkEntry/TtkEntry.Get_Bounding_Box_(entry_index_type)
     -- FUNCTION
     -- Get the bouding box for the character in Ttk_Entry with the selected
     -- Entry_Index_Type index
     -- PARAMETERS
     -- Entry_Widget - The Ttk_Entry widget which bouding box will be get
     -- Index        - The index of the character in Entry_Widget.
     -- RESULT
     -- BBox_Data with 4 values. The first two are staring point (x, y) of
     -- the bounding box, the third is width and the fourth is height of the
     -- bounding box.
     -- HISTORY
     -- 8.6.0 - Added
     -- EXAMPLE
     -- -- Get the bouding box of the last character in Ttk_Entry My_Entry widget
      -- Bounding_Box: constant BBox_Data := Get_Bounding_Box(My_Entry, LASTCHARACTER);
     -- SEE ALSO
     -- TtkEntry.Get_Bounding_Box_(numerical_index)
     -- COMMANDS
     -- Entry_Widget bbox Index
     -- SOURCE
   function Get_Bounding_Box
     (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type) return Bbox_Data with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Bounding_Box2", Mode => Nominal);
      -- ****

      -- ****f* TtkEntry/TtkEntry.Delete_(natural_indexes)
      -- FUNCTION
      -- Delete one or more elements from the Ttk_Entry
      -- PARAMETERS
      -- Entry_Widget   - The Ttk_Entry widget in which the characters will be
      --                  deleted
      -- First          - The index or X coordinate of the first character to
      --                  delete
      -- Last           - The index or X coordinate after the last character
      --                  to delete. Can be empty. Default value is 0.
      -- Is_First_Index - If True, the First index is numerical index, otherwise
      --                  it is X coordinate. Can be empty. Default value is
      --                  True.
      -- Is_Last_Index  - If True, the Last index is numerical index, otherwise
      --                  it is X coordinate. Can be empty. Default value is
      --                  True. Means nothing if Last is equal to 0.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Delete the first character in Ttk_Entry My_Entry
      -- Delete(My_Entry, 0);
      -- SEE ALSO
      -- TtkEntry.Delete_(entry_index_type),
      -- TtkEntry.Delete_(numerical_entry_index_type),
      -- TtkEntry.Delete_(entry_index_type_numerical)
      -- COMMANDS
      -- Entry_Widget delete First ?Last?
      -- SOURCE
   procedure Delete
     (Entry_Widget: Ttk_Entry; First: Natural; Last: Natural := 0;
      Is_First_Index, Is_Last_Index: Boolean := True) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Delete", Mode => Nominal);
      -- ****

      -- ****f* TtkEntry/TtkEntry.Delete_(entry_index_type)
      -- FUNCTION
      -- Delete one or more elements from the Ttk_Entry
      -- PARAMETERS
      -- Entry_Widget   - The Ttk_Entry widget in which the characters will be
      --                  deleted
      -- First          - The index of the first character to delete
      -- Last           - The index after the last character to delete. Can be
      --                  empty. Default value is NONE.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Delete the last character in Ttk_Entry My_Entry
      -- Delete(My_Entry, LASTCHARACTER);
      -- SEE ALSO
      -- TtkEntry.Delete_(numerical_indexes),
      -- TtkEntry.Delete_(numerical_entry_index_type),
      -- TtkEntry.Delete_(entry_index_type_numerical)
      -- COMMANDS
      -- Entry_Widget delete First ?Last?
      -- SOURCE
   procedure Delete
     (Entry_Widget: Ttk_Entry; First: Entry_Index_Type;
      Last: Entry_Index_Type := NONE) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Delete2", Mode => Nominal);
      -- ****

      -- ****f* TtkEntry/TtkEntry.Delete_(numerical_entry_index_type)
      -- FUNCTION
      -- Delete one or more elements from the Ttk_Entry
      -- PARAMETERS
      -- Entry_Widget   - The Ttk_Entry widget in which the characters will be
      --                  deleted
      -- First          - The index or X coordinate of the first character to
      --                  delete
      -- Last           - The index after the last character to delete. Can be
      --                  empty. Default value is NONE.
      -- Is_First_Index - If True, the First index is numerical index, otherwise
      --                  it is X coordinate. Can be empty. Default value is
      --                  True.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Delete the whole content of the Ttk_Entry My_Entry
      -- Delete(My_Entry, 0, LASTCHARACTER);
      -- SEE ALSO
      -- TtkEntry.Delete_(numerical_indexes),
      -- TtkEntry.Delete_(entry_index_type),
      -- TtkEntry.Delete_(entry_index_type_numerical)
      -- COMMANDS
      -- Entry_Widget delete First ?Last?
      -- SOURCE
   procedure Delete
     (Entry_Widget: Ttk_Entry; First: Natural; Last: Entry_Index_Type := NONE;
      Is_First_Index: Boolean := True) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Delete3", Mode => Nominal);
      -- ****

      -- ****f* TtkEntry/TtkEntry.Delete_(entry_index_type_numerical)
      -- FUNCTION
      -- Delete one or more elements from the Ttk_Entry
      -- PARAMETERS
      -- Entry_Widget   - The Ttk_Entry widget in which the characters will be
      --                  deleted
      -- First          - The index of the first character to delete
      -- Last           - The index or X coordinate after the last character
      --                  to delete. Can be empty. Default value is 0.
      -- Is_Last_Index  - If True, the Last index is numerical index, otherwise
      --                  it is X coordinate. Can be empty. Default value is
      --                  True. Means nothing if Last is equal to 0.
      -- HISTORY
      -- 8.6.0 - Added
      -- EXAMPLE
      -- -- Delete the last selected character in Ttk_Entry My_Entry
      -- Delete(My_Entry, SELECTIONLAST);
      -- SEE ALSO
      -- TtkEntry.Delete_(numerical_indexes),
      -- TtkEntry.Delete_(entry_index_type),
      -- TtkEntry.Delete_(numerical_entry_index_type),
      -- COMMANDS
      -- Entry_Widget delete First ?Last?
      -- SOURCE
   procedure Delete
     (Entry_Widget: Ttk_Entry; First: Entry_Index_Type; Last: Natural := 0;
      Is_Last_Index: Boolean := True) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Delete4", Mode => Nominal);
      -- ****

   function Get_Text(Entry_Widget: Ttk_Entry) return String with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Text", Mode => Nominal);

   procedure Set_Insert_Cursor
     (Entry_Widget: Ttk_Entry; Index: Natural; Is_Index: Boolean := True) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Set_Insert_Cursor", Mode => Nominal);

   procedure Set_Insert_Cursor
     (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Set_Insert_Cursor2", Mode => Nominal);

   function Get_Index
     (Entry_Widget: Ttk_Entry; Index: Natural) return Natural with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Index", Mode => Nominal);

   function Get_Index
     (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type) return Natural with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Index2", Mode => Nominal);

   procedure Insert_Text
     (Entry_Widget: Ttk_Entry; Index: Natural; Text: Tcl_String;
      Is_Index: Boolean := True) with
      Pre => Entry_Widget /= Null_Widget and Length(Source => Text) > 0,
      Test_Case => (Name => "Test_Insert_Text", Mode => Nominal);

   procedure Insert_Text
     (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type; Text: Tcl_String) with
      Pre => Entry_Widget /= Null_Widget and Length(Source => Text) > 0,
      Test_Case => (Name => "Test_Insert_Text", Mode => Nominal);

   procedure Selection_Clear(Entry_Widget: Ttk_Entry) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Selection_Clear", Mode => Nominal);

   function Selection_Present(Entry_Widget: Ttk_Entry) return Boolean with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Selection_Present", Mode => Nominal);

   procedure Selection_Range
     (Entry_Widget: Ttk_Entry; Start_Index, End_Index: Natural;
      Is_Start_Index, Is_End_Index: Boolean := True) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Selection_Range", Mode => Nominal);

   procedure Selection_Range
     (Entry_Widget: Ttk_Entry; Start_Index, End_Index: Entry_Index_Type) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Selection_Range2", Mode => Nominal);

   procedure Selection_Range
     (Entry_Widget: Ttk_Entry; Start_Index: Natural;
      End_Index: Entry_Index_Type; Is_Start_Index: Boolean := True) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Selection_Range3", Mode => Nominal);

   procedure Selection_Range
     (Entry_Widget: Ttk_Entry; Start_Index: Entry_Index_Type;
      End_Index: Natural; Is_End_Index: Boolean := True) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Selection_Range4", Mode => Nominal);

   function Validate(Entry_Widget: Ttk_Entry) return Boolean with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Validate", Mode => Nominal);

   function X_View(Entry_Widget: Ttk_Entry) return Fractions_Array with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_X_View", Mode => Nominal);

   procedure X_View_Adjust
     (Entry_Widget: Ttk_Entry; Index: Natural; Is_Index: Boolean := True) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_X_View_Adjust", Mode => Nominal);

   procedure X_View_Adjust
     (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_X_View_Adjust2", Mode => Nominal);

   procedure X_View_Move_To
     (Entry_Widget: Ttk_Entry; Fraction: Fraction_Type) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_X_View_Move_To", Mode => Nominal);

   procedure X_View_Scroll
     (Entry_Widget: Ttk_Entry; Number: Integer; What: Scroll_Unit_Type) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_X_View_Scroll", Mode => Nominal);

   --## rule on REDUCEABLE_SCOPE
end Tk.TtkEntry;
