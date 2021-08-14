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

package Tk.Bind is

   type Modifiers_Type is
     (CONTROL, ALT, SHIFT, LOCK, EXTENDED, BUTTON_1, BUTTON_2, BUTTON_3,
      BUTTON_4, BUTTON_5, MOD1, MOD2, MOD3, MOD4, MOD5, META, DOUBLE, TRIPLE,
      QUADRUPLE);

   type Modifiers_Array is array(Positive range <>) of Modifiers_Type;

   Empty_Modifiers_Array: constant Modifiers_Array(1 .. 0) := (others => <>);

   type Key_Syms is
     (KEY_SPACE, KEY_EXCLAM, KEY_QUOTEDBL, KEY_NUMBERSIGN, KEY_DOLLAR,
      KEY_PERCENT, KEY_AMPERSAND, KEY_QUOTERIGHT, KEY_PARENLEFT,
      KEY_PARENRIGHT, KEY_ASTERISK, KEY_PLUS, KEY_COMMA, KEY_MINUS, KEY_PERIOD,
      KEY_SLASH, KEY_0, KEY_1, KEY_2, KEY_3, KEY_4, KEY_6, KEY_7, KEY_8, KEY_9,
      KEY_COLON, KEY_SEMICOLON, KEY_LESS, KEY_EQUAL, KEY_GREATER, KEY_QUESTION,
      KEY_AT, SHIFT_KEY_A, SHIFT_KEY_B, SHIFT_KEY_C, SHIFT_KEY_D, SHIFT_KEY_E,
      SHIFT_KEY_F, SHIFT_KEY_G);

   function Modifier_Type_Image(Modifier: Modifiers_Type) return String;

   procedure Bind
     (Window: Tk_Widget; Sequence: Modifiers_Type; Script: Tcl_String;
      Append: Boolean := False) with
      Pre => Window /= Null_Widget and Length(Script) > 0,
      Test_Case => (Name => "Test_Bind", Mode => Nominal);

   procedure Bind
     (Window: Tk_Widget; Sequence: Modifiers_Array; Script: Tcl_String;
      Append: Boolean := False) with
      Pre => Window /= Null_Widget and Sequence /= Empty_Modifiers_Array and
      Length(Script) > 0,
      Test_Case => (Name => "Test_Bind2", Mode => Nominal);

end Tk.Bind;
