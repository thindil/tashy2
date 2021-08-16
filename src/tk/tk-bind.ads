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
      SHIFT_KEY_F, SHIFT_KEY_G, SHIFT_KEY_H, SHIFT_KEY_I, SHIFT_KEY_J,
      SHIFT_KEY_K, SHIFT_KEY_L, SHIFT_KEY_M, SHIFT_KEY_N, SHIFT_KEY_O,
      SHIFT_KEY_P, SHIFT_KEY_Q, SHIFT_KEY_R, SHIFT_KEY_S, SHIFT_KEY_T,
      SHIFT_KEY_U, SHIFT_KEY_V, SHIFT_KEY_W, SHIFT_KEY_X, SHIFT_KEY_Y,
      SHIFT_KEY_Z, KEY_BRACKETLEFT, KEY_BACKSLASH, KEY_BRACKETRIGHT,
      KEY_ASCIICIRCUM, KEY_UNDERSCORE, KEY_QUOTELEFT, KEY_A, KEY_B, KEY_C,
      KEY_D, KEY_E, KEY_F, KEY_G, KEY_H, KEY_I, KEY_J, KEY_K, KEY_L, KEY_M,
      KEY_N, KEY_O, KEY_P, KEY_Q, KEY_R, KEY_S, KEY_T, KEY_U, KEY_V, KEY_W,
      KEY_X, KEY_Y, KEY_Z, KEY_BRACELEFT, KEY_BAR, KEY_BRACERIGHT,
      KEY_ASCIITILDE, KEY_NOBREAKSPACE, KEY_EXCLAMDOWN, KEY_CENT, KEY_STERLING,
      KEY_CURRENCY, KEY_YEN, KEY_BROKENBAR, KEY_SECTION, KEY_DIAERESIS,
      KEY_COPYRIGHT, KEY_ORDFEMININE, KEY_GUILLEMOTLEFT, KEY_NOTSIGN,
      KEY_HYPHEN, KEY_REGISTERED, KEY_MACRON, KEY_DEGREE, KEY_PLUSMINUS,
      KEY_TWOSUPERIOR, KEY_THREESUPERIOR, KEY_ACUTE, KEY_MU, KEY_PARAGRAPH,
      KEY_PERIODCENTERED, KEY_CEDILLA, KEY_ONESUPERIOR, KEY_MASCULINE,
      KEY_GUILLEMOTRIGHT, KEY_ONEQUARTER, KEY_ONEHALF, KEY_THREEQUARTERS,
      KEY_QUESTIONDOWN, SHIFT_KEY_AGRAVE, SHIFT_KEY_AACUTE,
      SHIFT_KEY_ACIRCUMFLEX, SHIFT_KEY_ATILDE, SHIFT_KEY_ADIAERESIS,
      SHIFT_KEY_ARING, SHIFT_KEY_AE, SHIFT_KEY_CCEDILLA, SHIFT_KEY_EGRAVE,
      SHIFT_KEY_EACUTE, SHIFT_KEY_ECIRCUMFLEX, SHIFT_KEY_EDIAERESIS,
      SHIFT_KEY_IGRAVE, SHIFT_KEY_IACUTE, SHIFT_KEY_ICIRCUMFLEX,
      SHIFT_KEY_IDIAERESIS, SHIFT_KEY_ETH, SHIFT_KEY_NTILDE, SHIFT_KEY_OGRAVE,
      SHIFT_KEY_OACUTE, SHIFT_KEY_OCIRCUMFLEX, SHIFT_KEY_OTILDE,
      SHIFT_KEY_ODIAERESIS, KEY_MULTIPLY, SHIFT_KEY_OOBLIQUE, SHIFT_KEY_UGRAVE,
      SHIFT_KEY_UACUTE, SHIFT_KEY_UCIRCUMFLEX, SHIFT_KEY_UDIAERESIS,
      SHIFT_KEY_YACUTE, SHIFT_KEY_THORN, KEY_SSHARP, KEY_AGRAVE, KEY_AACUTE,
      KEY_ACIRCUMFLEX, KEY_ATILDE, KEY_ADIAERESIS, KEY_ARING, KEY_AE,
      KEY_CCEDILLA, KEY_EGRAVE, KEY_EACUTE, KEY_ECIRCUMFLEX, KEY_EDIAERESIS,
      KEY_IGRAVE, KEY_IACUTE, KEY_ICIRCUMFLEX, KEY_IDIAERESIS, KEY_ETH,
      KEY_NTILDE, KEY_OGRAVE, KEY_OACUTE, KEY_OCIRCUMFLEX, KEY_OTILDE,
      KEY_ODIAERESIS, KEY_DIVISION, KEY_OSLASH, KEY_UGRAVE, KEY_UACUTE,
      KEY_UCIRCUMFLEX, KEY_UDIAERESIS, KEY_YACUTE, KEY_THORN);

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
