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
      KEY_UCIRCUMFLEX, KEY_UDIAERESIS, KEY_YACUTE, KEY_THORN, KEY_YDIAERESIS,
      SHIFT_KEY_AOGONEK, KEY_BREVE, SHIFT_KEY_LSTROKE, SHIFT_KEY_LCARON,
      SHIFT_KEY_SACUTE, SHIFT_KEY_SCARON, SHIFT_KEY_SCEDILLA, SHIFT_KEY_TCARON,
      SHIFT_KEY_ZACUTE, SHIFT_KEY_ZCARON, SHIFT_KEY_ZABOVEDOT, KEY_AOGONEK,
      KEY_OGONEK, KEY_LSTROKE, KEY_LCARON, KEY_SACUTE, KEY_CARON, KEY_SCARON,
      KEY_SCEDILLA, KEY_TCARON, KEY_ZACUTE, KEY_DOUBLEACUTE, KEY_ZCARON,
      KEY_ZABOVEDOT, SHIFT_KEY_RACUTE, SHIFT_KEY_ABREVE, SHIFT_KEY_CACUTE,
      SHIFT_KEY_CCARON, SHIFT_KEY_EOGONEK, SHIFT_KEY_ECARON, SHIFT_KEY_DCARON,
      SHIFT_KEY_NACUTE, SHIFT_KEY_NCARON, SHIFT_KEY_ODOUBLEACUTE,
      SHIFT_KEY_RCARON, SHIFT_KEY_URING, SHIFT_KEY_UDOUBLEACUTE,
      SHIFT_KEY_TCEDILLA, KEY_RACUTE, KEY_ABREVE, KEY_CACUTE, KEY_CCARON,
      KEY_EOGONEK, KEY_ECARON, KEY_DCARON, KEY_NACUTE, KEY_NCARON,
      KEY_ODOUBLEACUTE, KEY_RCARON, KEY_URING, KEY_UDOUBLEACUTE, KEY_TCEDILLA,
      KEY_ABOVEDOT, SHIFT_KEY_HSTROKE, SHIFT_KEY_HCIRCUMFLEX,
      SHIFT_KEY_IABOVEDOT, SHIFT_KEY_GBREVE, SHIFT_KEY_JCIRCUMFLEX,
      KEY_HSTROKE, KEY_HCIRCUMFLEX, KEY_IDOTLESS, KEY_GBREVE, KEY_JCIRCUMFLEX,
      SHIFT_KEY_CABOVEDOT, SHIFT_KEY_CCIRCUMFLEX, SHIFT_KEY_GABOVEDOT,
      SHIFT_KEY_GCIRCUMFLEX, SHIFT_KEY_UBREVE, SHIFT_KEY_SCIRCUMFLEX,
      KEY_CABOVEDOT, KEY_CCIRCUMFLEX, KEY_GABOVEDOT, KEY_GCIRCUMFLEX,
      KEY_UBREVE, KEY_SCIRCUMFLEX, KEY_KAPPA, SHIFT_KEY_RCEDILLA,
      SHIFT_KEY_ITILDE, SHIFT_KEY_LCEDILLA, SHIFT_KEY_EMACRON,
      SHIFT_KEY_GCEDILLA, SHIFT_KEY_TSLASH, KEY_RCEDILLA, KEY_ITILDE,
      KEY_LCEDILLA, KEY_EMACRON, KEY_GACUTE, KEY_TSLASH, SHIFT_KEY_ENG,
      KEY_ENG, SHIFT_KEY_AMACRON, SHIFT_KEY_IOGONEK, SHIFT_KEY_EABOVEDOT,
      SHIFT_KEY_IMACRON, SHIFT_KEY_NCEDILLA, SHIFT_KEY_OMACRON,
      SHIFT_KEY_KCEDILLA, SHIFT_KEY_UOGONEK, SHIFT_KEY_UTILDE,
      SHIFT_KEY_UMACRON, KEY_AMACRON, KEY_IOGONEK, KEY_EABOVEDOT, KEY_IMACRON,
      KEY_NCEDILLA, KEY_OMACRON, KEY_KCEDILLA, KEY_UOGONEK, KEY_UTILDE,
      KEY_UMACRON, KEY_OVERLINE, KEY_KANA_FULLSTOP, KEY_KANA_OPENINGBRACKET,
      KEY_KANA_CLOSINGBRACKET, KEY_KANA_COMMA, KEY_KANA_MIDDLEDOT,
      SHIFT_KEY_KANA_WO, KEY_KANA_A, KEY_KANA_I, KEY_KANA_U, KEY_KANA_E,
      KEY_KANA_O, KEY_KANA_YA, KEY_KANA_YU, KEY_KANA_YO, KEY_KANA_TU,
      KEY_PROLONGEDSOUND, SHIFT_KEY_KANA_A, SHIFT_KEY_KANA_I, SHIFT_KEY_KANA_U,
      SHIFT_KEY_KANA_E, SHIFT_KEY_KANA_O, SHIFT_KEY_KANA_KA, SHIFT_KEY_KANA_KI,
      SHIFT_KEY_KANA_KU, SHIFT_KEY_KANA_KE, SHIFT_KEY_KANA_KO,
      SHIFT_KEY_KANA_SA, SHIFT_KEY_KANA_SHI, SHIFT_KEY_KANA_SU,
      SHIFT_KEY_KANA_SE, SHIFT_KEY_KANA_SO, SHIFT_KEY_KANA_TA,
      SHIFT_KEY_KANA_TI, SHIFT_KEY_KANA_TU, SHIFT_KEY_KANA_TE,
      SHIFT_KEY_KANA_TO, SHIFT_KEY_KANA_NA, SHIFT_KEY_KANA_NI,
      SHIFT_KEY_KANA_NU, SHIFT_KEY_KANA_NE, SHIFT_KEY_KANA_NO,
      SHIFT_KEY_KANA_HA, SHIFT_KEY_KANA_HI, SHIFT_KEY_KANA_HU,
      SHIFT_KEY_KANA_HE, SHIFT_KEY_KANA_HO, SHIFT_KEY_KANA_MA,
      SHIFT_KEY_KANA_MI, SHIFT_KEY_KANA_MU, SHIFT_KEY_KANA_ME,
      SHIFT_KEY_KANA_MO, SHIFT_KEY_KANA_YA, SHIFT_KEY_KANA_YU,
      SHIFT_KEY_KANA_YO, SHIFT_KEY_KANA_RA, SHIFT_KEY_KANA_RI,
      SHIFT_KEY_KANA_RU, SHIFT_KEY_KANA_RE, SHIFT_KEY_KANA_RO,
      SHIFT_KEY_KANA_WA, SHIFT_KEY_KANA_N, KEY_VOICEDSOUND,
      KEY_SEMIVOICEDSOUND, KEY_ARABIC_COMMA, KEY_ARABIC_SEMICOLON,
      KEY_ARABIC_QUESTION_MARK, KEY_ARABIC_HAMZA, KEY_ARABIC_MADDAONALEF,
      KEY_ARABIC_HAMZAONALEF, KEY_ARABIC_HAMZAONWAW, KEY_ARABIC_HAMZAUNDERALEF,
      KEY_ARABIC_HAMZAONYEH, KEY_ARABIC_ALEF, KEY_ARABIC_BEH,
      KEY_ARABIC_TEHMARBUTA, KEY_ARABIC_TEH, KEY_ARABIC_THEH, KEY_ARABIC_JEEM,
      KEY_ARABIC_HAH, KEY_ARABIC_KHAH, KEY_ARABIC_DAL, KEY_ARABIC_THAL);

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
