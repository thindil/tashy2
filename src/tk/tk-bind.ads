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
      KEY_ARABIC_HAH, KEY_ARABIC_KHAH, KEY_ARABIC_DAL, KEY_ARABIC_THAL,
      KEY_ARABIC_RA, KEY_ARABIC_ZAIN, KEY_ARABIC_SEEN, KEY_ARABIC_SHEEN,
      KEY_ARABIC_SAD, KEY_ARABIC_DAD, KEY_ARABIC_TAH, KEY_ARABIC_ZAH,
      KEY_ARABIC_AIN, KEY_ARABIC_GHAIN, KEY_ARABIC_TATWEEL, KEY_ARABIC_FEH,
      KEY_ARABIC_QAF, KEY_ARABIC_KAF, KEY_ARABIC_LAM, KEY_ARABIC_MEEM,
      KEY_ARABIC_NOON, KEY_ARABIC_HEH, KEY_ARABIC_WAW, KEY_ARABIC_ALEFMAKSURA,
      KEY_ARABIC_YEH, KEY_ARABIC_FATHATAN, KEY_ARABIC_DAMMATAN,
      KEY_ARABIC_KASRATAN, KEY_ARABIC_FATHA, KEY_ARABIC_DAMMA,
      KEY_ARABIC_KASRA, KEY_ARABIC_SHADDA, KEY_ARABIC_SUKUN, KEY_SERBIAN_DJE,
      KEY_MACEDONIA_GJE, KEY_CYRILLIC_IO, KEY_UKRANIAN_JE, KEY_MACEDONIA_DSE,
      KEY_UKRANIAN_I, KEY_UKRANIAN_YI, KEY_SERBIAN_JE, KEY_SERBIAN_LJE,
      KEY_SERBIAN_NJE, KEY_SERBIAN_TSHE, KEY_MACEDONIA_KJE,
      KEY_BYELORUSSIAN_SHORTU, KEY_SERBIAN_DZE, KEY_NUMEROSIGN,
      SHIFT_KEY_SERBIAN_DJE, SHIFT_KEY_MACEDONIA_GJE, SHIFT_KEY_CYRILLIC_IO,
      SHIFT_KEY_UKRANIAN_JE, SHIFT_KEY_MACEDONIA_DSE, SHIFT_KEY_UKRANIAN_I,
      SHIFT_KEY_UKRANIAN_YI, SHIFT_KEY_SERBIAN_JE, SHIFT_KEY_SERBIAN_LJE,
      SHIFT_KEY_SERBIAN_NJE, SHIFT_KEY_SERBIAN_TSHE, SHIFT_KEY_MACEDONIA_KJE,
      SHIFT_KEY_BYELORUSSIAN_SHORTU, SHIFT_KEY_SERBIAN_DZE, KEY_CYRILLIC_YU,
      KEY_CYRILLIC_A, KEY_CYRILLIC_BE, KEY_CYRILLIC_TSE, KEY_CYRILLIC_DE,
      KEY_CYRILLIC_IE, KEY_CYRILLIC_EF, KEY_CYRILLIC_GHE, KEY_CYRILLIC_HA,
      KEY_CYRILLIC_I, KEY_CYRILLIC_SHORTI, KEY_CYRILLIC_KA, KEY_CYRILLIC_EL,
      KEY_CYRILLIC_EM, KEY_CYRILLIC_EN, KEY_CYRILLIC_O, KEY_CYRILLIC_PE,
      KEY_CYRILLIC_YA, KEY_CYRILLIC_ER, KEY_CYRILLIC_ES, KEY_CYRILLIC_TE,
      KEY_CYRILLIC_U, KEY_CYRILLIC_ZHE, KEY_CYRILLIC_VE, KEY_CYRILLIC_SOFTSIGN,
      KEY_CYRILLIC_YERU, KEY_CYRILLIC_ZE, KEY_CYRILLIC_SHA, KEY_CYRILLIC_E,
      KEY_CYRILLIC_SHCHA, KEY_CYRILLIC_CHE, KEY_CYRILLIC_HARDSIGN,
      SHIFT_KEY_CYRILLIC_YU, SHIFT_KEY_CYRILLIC_A, SHIFT_KEY_CYRILLIC_BE,
      SHIFT_KEY_CYRILLIC_TSE, SHIFT_KEY_CYRILLIC_DE, SHIFT_KEY_CYRILLIC_IE,
      SHIFT_KEY_CYRILLIC_EF, SHIFT_KEY_CYRILLIC_GHE, SHIFT_KEY_CYRILLIC_HA,
      SHIFT_KEY_CYRILLIC_I, SHIFT_KEY_CYRILLIC_SHORTI, SHIFT_KEY_CYRILLIC_KA,
      SHIFT_KEY_CYRILLIC_EL, SHIFT_KEY_CYRILLIC_EM, SHIFT_KEY_CYRILLIC_EN,
      SHIFT_KEY_CYRILLIC_O, SHIFT_KEY_CYRILLIC_PE, SHIFT_KEY_CYRILLIC_YA,
      SHIFT_KEY_CYRILLIC_ER, SHIFT_KEY_CYRILLIC_ES, SHIFT_KEY_CYRILLIC_TE,
      SHIFT_KEY_CYRILLIC_U, SHIFT_KEY_CYRILLIC_ZHE, SHIFT_KEY_CYRILLIC_VE,
      SHIFT_KEY_CYRILLIC_SOFTSIGN, SHIFT_KEY_CYRILLIC_YERU,
      SHIFT_KEY_CYRILLIC_ZE, SHIFT_KEY_CYRILLIC_SHA, SHIFT_KEY_CYRILLIC_E,
      SHIFT_KEY_CYRILLIC_SHCHA, SHIFT_KEY_CYRILLIC_CHE,
      SHIFT_KEY_CYRILLIC_HARDSIGN, SHIFT_KEY_GREEK_ALPHAACCENT,
      SHIFT_KEY_GREEK_EPSILONACCENT, SHIFT_KEY_GREEK_ETAACCENT,
      SHIFT_KEY_GREEK_IOTAACCENT, SHIFT_KEY_GREEK_IOTADIAERESIS,
      SHIFT_KEY_GREEK_IOTAACCENTDIAERESIS, SHIFT_KEY_GREEK_OMICRONACCENT,
      SHIFT_KEY_GREEK_UPSILONACCENT, SHIFT_KEY_GREEK_UPSILONDIERESIS,
      SHIFT_KEY_GREEK_UPSILONACCENTDIERESIS, SHIFT_KEY_GREEK_OMEGAACCENT,
      KEY_GREEK_ALPHAACCENT, KEY_GREEK_EPSILONACCENT, KEY_GREEK_ETAACCENT,
      KEY_GREEK_IOTAACCENT, KEY_GREEK_IOTADIERESIS,
      KEY_GREEK_IOTAACCENTDIERESIS, KEY_GREEK_OMICRONACCENT,
      KEY_GREEK_UPSILONACCENT, KEY_GREEK_UPSILONDIERESIS,
      KEY_GREEK_UPSILONACCENTDIERESIS, KEY_GREEK_OMEGAACCENT,
      SHIFT_KEY_GREEK_ALPHA, SHIFT_KEY_GREEK_BETA, SHIFT_KEY_GREEK_GAMMA,
      SHIFT_KEY_GREEK_DELTA, SHIFT_KEY_GREEK_EPSILON, SHIFT_KEY_GREEK_ZETA,
      SHIFT_KEY_GREEK_ETA, SHIFT_KEY_GREEK_THETA, SHIFT_KEY_GREEK_IOTA,
      SHIFT_KEY_GREEK_KAPPA, SHIFT_KEY_GREEK_LAMBDA, SHIFT_KEY_GREEK_MU,
      SHIFT_KEY_GREEK_NU, SHIFT_KEY_GREEK_XI, SHIFT_KEY_GREEK_OMICRON,
      SHIFT_KEY_GREEK_PI, SHIFT_KEY_GREEK_RHO, SHIFT_KEY_GREEK_SIGMA,
      SHIFT_KEY_GREEK_TAU, SHIFT_KEY_GREEK_UPSILON, SHIFT_KEY_GREEK_PHI,
      SHIFT_KEY_GREEK_CHI, SHIFT_KEY_GREEK_PSI, SHIFT_KEY_GREEK_OMEGA,
      KEY_GREEK_ALPHA, KEY_GREEK_BETA, KEY_GREEK_GAMMA, KEY_GREEK_DELTA,
      KEY_GREEK_EPSILON, KEY_GREEK_ZETA, KEY_GREEK_ETA, KEY_GREEK_THETA,
      KEY_GREEK_IOTA, KEY_GREEK_KAPPA, KEY_GREEK_LAMBDA, KEY_GREEK_MU,
      KEY_GREEK_NU, KEY_GREEK_XI, KEY_GREEK_OMICRON, KEY_GREEK_PI,
      KEY_GREEK_RHO, KEY_GREEK_SIGMA, KEY_GREEK_FINALSMALLSIGMA, KEY_GREEK_TAU,
      KEY_GREEK_UPSILON, KEY_GREEK_PHI, KEY_GREEK_CHI, KEY_GREEK_PSI,
      KEY_GREEK_OMEGA, KEY_LEFTRADICAL, KEY_TOPLEFTRADICAL, KEY_HORIZCONNECTOR,
      KEY_TOPINTEGRAL, KEY_BOTINTEGRAL, KEY_VERTCONNECTOR,
      KEY_TOPLEFTSQBRACKET, KEY_BOTLEFTSQBRACKET, KEY_TOPRIGHTSQBRACKET,
      KEY_BOTRIGHTSQBRACKET, KEY_TOPLEFTPARENS, KEY_BOTLEFTPARENS,
      KEY_TOPRIGHTPARENS, KEY_BOTRIGHTPARENS, KEY_LEFTMIDDLECURLYBRACE,
      KEY_RIGHTMIDDLECURLYBRACE, KEY_TOPLEFTSUMMATION, KEY_BOTLEFTSUMMATION,
      KEY_TOPVERTSUMMATIONCONNECTOR, KEY_BOTVERTSUMMATIONCONNECTOR,
      KEY_TOPRIGHTSUMMATION, KEY_BOTRIGHTSUMMATION, KEY_RIGHTMIDDLESUMMATION,
      KEY_LESSTHANEQUAL, KEY_NOTEQUAL, KEY_GREATERTHANEQUAL, KEY_INTEGRAL,
      KEY_THEREFORE, KEY_VARIATION, KEY_INFINITY, KEY_NABLA, KEY_APPROXIMATE,
      KEY_SIMILAREQUAL, KEY_IFONLYIF, KEY_IMPLIES, KEY_IDENTICAL, KEY_RADICAL,
      KEY_INCLUDEDIN, KEY_INCLUDES, KEY_INTERSECTION, KEY_UNION,
      KEY_LOGICALAND, KEY_LOGICALOR, KEY_PARTIALDERIVATIVE, KEY_FUNCTION,
      KEY_LEFTARROW, KEY_UPARROW, KEY_RIGHTARROW, KEY_DOWNARROW, KEY_BLANK,
      KEY_SOLIDDIAMOND, KEY_CHECKERBOARD, KEY_HT, KEY_FF, KEY_CR, KEY_LF,
      KEY_NL, KEY_VT, KEY_LOWRIGHTCORNER, KEY_UPRIGHTCORNER, KEY_UPLEFTCORNER,
      KEY_LOWLEFTCORNER, KEY_CROSSINGLINES, KEY_HORIZLINESCAN1,
      KEY_HORIZLINESCAN3, KEY_HORIZLINESCAN5, KEY_HORIZLINESCAN7,
      KEY_HORIZLINESCAN9, KEY_LEFTT, KEY_RIGHTT, KEY_BOTT, KEY_TOPT,
      KEY_VERTBAR, KEY_EMSPACE, KEY_ENSPACE, KEY_EM3SPACE, KEY_EM4SPACE,
      KEY_DIGITSPACE, KEY_PUNCTSPACE, KEY_THINSPACE, KEY_HAIRSPACE, KEY_EMDASH,
      KEY_ENDASH, KEY_SIGNIFBLANK, KEY_ELLIPSIS, KEY_DOUBBASELINEDOT,
      KEY_ONETHIRD, KEY_TWOTHIRDS, KEY_ONEFIFTH, KEY_TWOFIFTHS,
      KEY_THREEFIFTHS, KEY_FOURFIFTHS, KEY_ONESIXTH, KEY_FIVESIXTHS,
      KEY_CAREOF, KEY_FIGDASH, KEY_LEFTANGLEBRACKET, KEY_DECIMALPOINT,
      KEY_RIGHTANGLEBRACKET, KEY_MARKER, KEY_ONEEIGHTH, KEY_THREEEIGHTHS,
      KEY_FIVEEIGHTHS, KEY_SEVENEIGHTHS, KEY_TRADEMARK, KEY_SIGNATUREMARK,
      KEY_TRADEMARKINCIRCLE, KEY_LEFTOPENTRIANGLE, KEY_RIGHTOPENTRIANGLE,
      KEY_EMOPENCIRCLE, KEY_EMOPENRECTANGLE, KEY_LEFTSINGLEQUOTEMARK,
      KEY_RIGHTSINGLEQUOTEMARK, KEY_LEFTDOUBLEQUOTEMARK,
      KEY_RIGHTDOUBLEQUOTEMARK, KEY_PRESCRIPTION, KEY_MINUTES, KEY_SECONDS,
      KEY_LATINCROSS, KEY_HEXAGRAM, KEY_FILLEDRECTBULLET,
      KEY_FILLEDLEFTTRIBULLET, KEY_FILLEDRIGHTTRIBULLET, KEY_EMFILLEDCIRCLE,
      KEY_EMFILLEDRECT, KEY_ENOPENCIRCBULLET, KEY_ENOPENSQUAREBULLET,
      KEY_OPENRECTBULLET, KEY_OPENTRIBULLETUP, KEY_OPENTRIBULLETDOWN,
      KEY_OPENSTAR, KEY_ENFILLEDCIRCBULLET, KEY_ENFILLEDSQBULLET,
      KEY_FILLEDTRIBULLETUP, KEY_FILLEDTRIBULLETDOWN, KEY_LEFTPOINTER,
      KEY_RIGHTPOINTER, KEY_CLUB, KEY_DIAMOND, KEY_HEART, KEY_MALTESECROSS,
      KEY_DAGGER, KEY_DOUBLEDAGGER, KEY_CHECKMARK, KEY_BALLOTCROSS,
      KEY_MUSICALSHARP, KEY_MUSICALFLAT, KEY_MALESYMBOL, KEY_FEMALESYMBOL,
      KEY_TELEPHONE, KEY_TELEPHONERECORDER, KEY_PHONOGRAPHCOPYRIGHT, KEY_CARET,
      KEY_SINGLELOWQUOTEMARK, KEY_DOUBLELOWQUOTEMARK, KEY_CURSOR,
      KEY_LEFTCARET, KEY_RIGHTCARET, KEY_DOWNCARET, KEY_UPCARET, KEY_OVERBAR,
      KEY_DOWNTACK, KEY_UPSHOE, KEY_DOWNSTILE, KEY_UNDERBAR, KEY_JOT, KEY_QUAD,
      KEY_UPTACK, KEY_CIRCLE, KEY_UPSTILE, KEY_DOWNSHOE, KEY_RIGHTSHOE,
      KEY_LEFTSHOE, KEY_LEFTTACK, KEY_RIGHTTACK);

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
