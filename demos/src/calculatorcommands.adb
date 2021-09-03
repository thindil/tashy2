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

with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Text_IO;
with System;
with Tcl; use Tcl;
with Tcl.Commands; use Tcl.Commands;
with Tcl.Strings; use Tcl.Strings;
with Tk.TtkButton; use Tk.TtkButton;
with Tk.TtkLabel; use Tk.TtkLabel;
with Tk.Widget; use Tk.Widget;

package body CalculatorCommands is

   -- ****if* CalculatorCommands/CalculatorCommands.Click_Action
   -- FUNCTION
   -- Update display with the pressed button text or count its expression if
   -- button equal was pressed. It is moved from On_Click function so it can
   -- be checked by SPARK
   -- PARAMETERS
   -- ButtonName  - The Tk path name of the button which was clicked
   -- LabelName   - The Tk path name of the display label
   -- Interpreter - The Tcl interpreter on which the button was clicked
   -- RESULT
   -- This function always return TCL_OK
   -- SOURCE
   function Click_Action
     (ButtonName, LabelName: String; Interpreter: Tcl_Interpreter)
      return Tcl_Results with
      SPARK_Mode
   is
      -- ****
      Button: constant Ttk_Button :=
        Get_Widget(Path_Name => ButtonName, Interpreter => Interpreter);
      Display_Label: constant Ttk_Label :=
        Get_Widget(Path_Name => LabelName, Interpreter => Interpreter);
      Label_Options: Ttk_Label_Options := Get_Options(Label => Display_Label);
      Button_Options: constant Ttk_Button_Options :=
        Get_Options(Button => Button);
      Operators_Set: constant Character_Set := To_Set(Sequence => "*+/-");
      No_Minus_Operators_Set: constant Character_Set :=
        To_Set(Sequence => "*+/");
      Result: Float := 0.0;
      Start_Index: Positive := 1;
      Sign_Index: Natural := 0;
      Expression: constant String :=
        To_Ada_String(Source => Label_Options.Text);
      Result_String: String(1 .. 30);
      Is_Negative: Boolean := False;
   begin
      -- Remove leading zero from the display text but only when number was
      -- pressed
      if not Is_In
          (Element => To_Ada_String(Source => Button_Options.Text)(1),
           Set => No_Minus_Operators_Set)
        and then Label_Options.Text = To_Tcl_String(Source => "0") then
         Label_Options.Text := Null_Tcl_String;
      end if;
      -- Find the last occurence of mathematical operator
      Sign_Index :=
        Index(Source => Expression, Set => Operators_Set, Going => Backward);
      if Button_Options.Text = To_Tcl_String(Source => ".") then
         if Index(Source => Expression, Pattern => ".", Going => Backward) >
           Sign_Index then
            return TCL_OK;
         end if;
         if Label_Options.Text = Null_Tcl_String then
            Label_Options.Text := To_Tcl_String(Source => "0");
         end if;
      end if;
      -- If the user pressed equal button, count value of expression from
      -- the display
      if Button_Options.Text = To_Tcl_String(Source => "=") then
         -- If mathematical operator is the last character, quit, probably the
         -- user pressed the button by accident
         if Sign_Index = Expression'Length then
            return TCL_OK;
         end if;
         -- Count the result of the expression entered by the user
         Count_Result_Loop :
         loop
            -- Find the occurence of a mathematical operator
            Sign_Index :=
              Index
                (Source => Expression, Set => Operators_Set,
                 From => Start_Index);
              -- No operator found, copy the whole text to result and quit
              -- the loop
            if Sign_Index = 0 then
               if Start_Index = 1 then
                  Result := Float'Value(Expression);
                  exit Count_Result_Loop;
               end if;
               Sign_Index := Expression'Last + 1;
            end if;
            -- The operator is a negative number sign, go to end of loop to
            -- find another
            if (Sign_Index = 1 and then Expression(Sign_Index) = '-') or
              Start_Index = Sign_Index then
               Is_Negative := True;
               goto End_Of_Count_Loop;
            end if;
            if Start_Index = 1 then
               Result :=
                 Float'Value(Expression(Start_Index .. Sign_Index - 1));
               goto End_Of_Count_Loop;
            end if;
            -- Get the matematical operator if the number is negative
            if Is_Negative and Start_Index > 2 then
               Start_Index := Start_Index - 1;
            end if;
            Is_Negative := False;
            -- Count the expression, based on the found mathematical symbol
            case Expression(Start_Index - 1) is
               when '+' =>
                  Result :=
                    Result +
                    Float'Value(Expression(Start_Index .. Sign_Index - 1));
               when '-' =>
                  Result :=
                    Result -
                    Float'Value(Expression(Start_Index .. Sign_Index - 1));
               when '*' =>
                  Result :=
                    Result *
                    Float'Value(Expression(Start_Index .. Sign_Index - 1));
               when '/' =>
                  Result :=
                    Result /
                    Float'Value(Expression(Start_Index .. Sign_Index - 1));
               when others =>
                  null;
            end case;
            <<End_Of_Count_Loop>>
            -- Set the start looking index to the new value
            Start_Index := Sign_Index + 1;
            exit Count_Result_Loop when Start_Index > Expression'Last;
         end loop Count_Result_Loop;
         -- Convert the result value to string with maximum 5 zeros
         Put(To => Result_String, Item => Result, Aft => 5, Exp => 0);
         -- Remove trailing zeros from the result string
         Trim
           (Source => Result_String, Left => Null_Set,
            Right => To_Set(Sequence => ".0"));
         -- Set the result string as the display value, remove also all
         -- trailing spaces from it
         Configure
           (Label => Display_Label,
            Options =>
              (Text =>
                 To_Tcl_String
                   (Source => Trim(Source => Result_String, Side => Both)),
               others => <>));
         return TCL_OK;
      end if;
      -- Add the pressed button text (number or operator) to the calculator's
      -- display
      Configure
        (Label => Display_Label,
         Options =>
           (Text => Label_Options.Text & Button_Options.Text, others => <>));
      return TCL_OK;
   end Click_Action;

   -- ****o* CalculatorCommands/CalculatorCommands.On_Click
   -- FUNCTION
   -- Update display with the pressed button text or count its expression if
   -- button equal was pressed
   -- PARAMETERS
   -- Unused_Client_Data - Optional data passed to the function.
   -- Interpreter        - Tcl interpreter on which the command was invoked.
   -- Unused_Argc        - The amount of arguments passed to the command.
   -- Argv               - The array of arguments passed to the command
   -- RESULT
   -- This function always return TCL_OK
   -- COMMANDS
   -- OnClick buttonpath displaypath
   -- Buttonpath is Tk path name for the button which was clicked, displaypath
   -- is the Tk path name for the calculator display widget
   -- SOURCE
   function On_Click
     (Unused_Client_Data: System.Address; Interpreter: Tcl_Interpreter;
      Unused_Argc: Positive; Argv: Argv_Pointer.Pointer)
      return Tcl_Results with
      Convention => C;
      -- ****

   function On_Click
     (Unused_Client_Data: System.Address; Interpreter: Tcl_Interpreter;
      Unused_Argc: Positive; Argv: Argv_Pointer.Pointer) return Tcl_Results is
   begin
      return
        Click_Action
          (Get_Argument(Argv, 1), Get_Argument(Argv, 2), Interpreter);
   end On_Click;

   -- ****if* CalculatorCommands/CalculatorCommands.Clear_Action
   -- FUNCTION
   -- Reset the calculator's display to it inital state. Show just zero
   -- number. It is moved from On_Click function so it can be checked by SPARK
   -- PARAMETERS
   -- LabelName   - The name of display label to clear
   -- Interpreter - The Tcl interpreter on which the button was clicked
   -- RESULT
   -- This function always return TCL_OK
   -- SOURCE
   function Clear_Action
     (LabelName: String; Interpreter: Tcl_Interpreter) return Tcl_Results with
      SPARK_Mode
   is
      Display_Label: constant Ttk_Label :=
        Get_Widget(Path_Name => LabelName, Interpreter => Interpreter);
   begin
      Configure
        (Label => Display_Label,
         Options => (Text => To_Tcl_String(Source => "0"), others => <>));
      return TCL_OK;
   end Clear_Action;

      -- ****o* CalculatorCommands/CalculatorCommands.Clear_Display
      -- FUNCTION
      -- Reset the calculator's display to it inital state. Show just zero
      -- number
      -- Client_Data - Optional data passed to the function. Unused
      -- Interpreter - Tcl interpreter on which the command was invoked.
      -- Argc        - The amount of arguments passed to the command. Unused
      -- Argv        - The array of arguments passed to the command
      -- RESULT
      -- This function always return TCL_OK
      -- COMMANDS
      -- ClearDisplay displaypath
      -- Displaypath is the Tk path name for the calculator's display widget
      -- SOURCE
   function Clear_Display
     (Client_Data: System.Address; Interpreter: Tcl_Interpreter;
      Argc: Positive; Argv: Argv_Pointer.Pointer) return Tcl_Results with
      Convention => C;
      -- ****

   function Clear_Display
     (Client_Data: System.Address; Interpreter: Tcl_Interpreter;
      Argc: Positive; Argv: Argv_Pointer.Pointer) return Tcl_Results is
      pragma Unreferenced(Client_Data, Argc);
   begin
      return
        Clear_Action
          (Get_Argument(Arguments_Pointer => Argv, Index => 1), Interpreter);
   end Clear_Display;

   function Add_Commands return Boolean is
   begin
      if Tcl_Create_Command("OnClick", On_Click'Access) = Null_Tcl_Command then
         Ada.Text_IO.Put_Line(Item => "Failed to add OnClick command");
         return False;
      end if;
      if Tcl_Create_Command("ClearDisplay", Clear_Display'Access) =
        Null_Tcl_Command then
         Ada.Text_IO.Put_Line(Item => "Failed to add ClearDisplay command");
         return False;
      end if;
      return True;
   end Add_Commands;

end CalculatorCommands;
