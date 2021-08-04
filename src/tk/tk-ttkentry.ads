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

   type Entry_State_Type is (NONE, NORMAL, DISABLED, READONLY) with
      Default_Value => NONE;

   Default_Entry_State: constant Entry_State_Type := NORMAL;

   type Validate_Type is
     (EMPTY, NONE, FOCUS, FOCUSIN, FOCUSOUT, KEY, VALIDATEALL) with
      Default_Value => EMPTY;

   Default_Validate: constant Validate_Type := EMPTY;

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

   function Create
     (Path_Name: String; Options: Ttk_Entry_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Entry with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Create'Result /= Null_Widget,
      Test_Case => (Name => "Test_Create_TtkEntry1", Mode => Nominal);

   procedure Create
     (Entry_Widget: out Ttk_Entry; Path_Name: String;
      Options: Ttk_Entry_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) with
      Pre => Path_Name'Length > 0 and Interpreter /= Null_Interpreter,
      Post => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Create_TtkEntry2", Mode => Nominal);

   function Get_Options(Entry_Widget: Ttk_Entry) return Ttk_Entry_Options with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Get_Options_TtkEntry", Mode => Nominal);

   procedure Configure
     (Entry_Widget: Ttk_Entry; Options: Ttk_Entry_Options) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Configure_TtkEntry", Mode => Nominal);

   Default_Ttk_Entry_Options: constant Ttk_Entry_Options :=
     Ttk_Entry_Options'(others => <>);

   type Entry_Index_Type is
     (LAST, INSERT, SELECTIONFIRST, SELECTIONLAST, NONE) with
      Default_Value => NONE;

   function Get_Bounding_Box
     (Entry_Widget: Ttk_Entry; Index: Natural; Is_Index: Boolean := True)
      return Bbox_Data with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Bounding_Box", Mode => Nominal);

   function Get_Bounding_Box
     (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type) return Bbox_Data with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Bounding_Box2", Mode => Nominal);

   procedure Delete
     (Entry_Widget: Ttk_Entry; First: Natural; Last: Natural := 0;
      Is_First_Index, Is_Last_Index: Boolean := True) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Delete", Mode => Nominal);

   procedure Delete
     (Entry_Widget: Ttk_Entry; First: Entry_Index_Type;
      Last: Entry_Index_Type := NONE) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Delete2", Mode => Nominal);

   procedure Delete
     (Entry_Widget: Ttk_Entry; First: Natural; Last: Entry_Index_Type := NONE;
      Is_First_Index: Boolean := True) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Delete3", Mode => Nominal);

   procedure Delete
     (Entry_Widget: Ttk_Entry; First: Entry_Index_Type; Last: Natural := 0;
      Is_Last_Index: Boolean := True) with
      Pre => Entry_Widget /= Null_Widget,
      Test_Case => (Name => "Test_Delete4", Mode => Nominal);

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
      Pre => Entry_Widget /= Null_Widget and Length(Text) > 0,
      Test_Case => (Name => "Test_Insert_Text", Mode => Nominal);

   procedure Insert_Text
     (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type; Text: Tcl_String) with
      Pre => Entry_Widget /= Null_Widget and Length(Text) > 0,
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

   --## rule on REDUCEABLE_SCOPE
end Tk.TtkEntry;
