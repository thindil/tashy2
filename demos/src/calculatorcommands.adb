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
with Tcl.Strings; use Tcl.Strings;
with Tk.TtkButton; use Tk.TtkButton;
with Tk.TtkLabel; use Tk.TtkLabel;
with Tk.Widget; use Tk.Widget;

package body CalculatorCommands is

   function On_Click
     (Unused_Client_Data: System.Address; Interpreter: Tcl_Interpreter;
      Unused_Argc: Positive; Argv: Argv_Pointer.Pointer) return Tcl_Results is
      Button: constant Ttk_Button :=
        Get_Widget
          (Path_Name => Get_Argument(Arguments_Pointer => Argv, Index => 1),
           Interpreter => Interpreter);
      Display_Label: constant Ttk_Label :=
        Get_Widget
          (Path_Name => Get_Argument(Arguments_Pointer => Argv, Index => 2),
           Interpreter => Interpreter);
      Label_Options: Ttk_Label_Options := Get_Options(Label => Display_Label);
      Button_Options: constant Ttk_Button_Options :=
        Get_Options(Button => Button);
      Operators_Set: constant Character_Set := To_Set(Sequence => "*+/-");
      Result: Float := 0.0;
      Start_Index: Positive := 1;
      Sign_Index: Natural := 0;
      Expression: constant String :=
        To_Ada_String(Source => Label_Options.Text);
      Result_String: String(1 .. 30);
   begin
      -- Remove leading zero from the display text but only when number was
      -- pressed
      if not Is_In
          (Element => To_Ada_String(Source => Button_Options.Text)(1),
           Set => Operators_Set)
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
         -- Find the first occurence of mathematical operator
         Sign_Index :=
           Index
             (Source => Expression, Set => Operators_Set, From => Start_Index);
         -- No operator, just copy the whole number to the result
         if Sign_Index = 0 then
            Result := Float'Value(Expression);
         -- Operator found, copy the number before it to the result
         else
            Result := Float'Value(Expression(Start_Index .. Sign_Index - 1));
            Start_Index := Sign_Index + 1;
         end if;
         -- Count the result of the expression entered by the user
         Count_Result_Loop :
         while Sign_Index > 0 or Start_Index < Expression'Last loop
            -- Find the next occurence of a mathematical operator
            Sign_Index :=
              Index
                (Source => Expression, Set => Operators_Set,
                 From => Start_Index);
              -- No operator found, set index to outside of expression's string
              -- so the whole part of the expression will be copied to the
              -- result as number
            if Sign_Index = 0 then
               Sign_Index := Expression'Last + 1;
            end if;
            -- Count the expression, based on the found mathematica symbol
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
   end On_Click;

   function Clear_Display
     (Client_Data: System.Address; Interpreter: Tcl_Interpreter;
      Argc: Positive; Argv: Argv_Pointer.Pointer) return Tcl_Results is
      pragma Unreferenced(Client_Data, Argc);
      Display_Label: constant Ttk_Label :=
        Get_Widget
          (Path_Name => Get_Argument(Arguments_Pointer => Argv, Index => 1),
           Interpreter => Interpreter);
   begin
      Configure
        (Label => Display_Label,
         Options => (Text => To_Tcl_String(Source => "0"), others => <>));
      return TCL_OK;
   end Clear_Display;

end CalculatorCommands;
