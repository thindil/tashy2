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

package Tk.Colors is

   --## rule off REDUCEABLE_SCOPE
   --## rule off NAMING_CONVENTION
   type Colors_Names is
     (ALICE_BLUE, ANTIQUE_WHITE, ANTIQUE_WHITE1, ANTIQUE_WHITE2,
      ANTIQUE_WHITE3, ANTIQUE_WHITE4, AQUA, AQUAMARINE, AQUAMARINE1,
      AQUAMARINE2, AQUAMARINE3, AQUAMARINE4, AZURE, AZURE1, AZURE2, AZURE3,
      AZURE4, BEIGE, BISQUE, BISQUE1, BISQUE2, BISQUE3, BISQUE4, BLACK,
      BLANCHED_ALMOND, BLUE, BLUE_VIOLET, BLUE1, BLUE2, BLUE3, BLUE4, BROWN,
      BROWN1, BROWN2, BROWN3, BROWN4, BURLYWOOD, BURLYWOOD1, BURLYWOOD2,
      BURLYWOOD3, BURLYWOOD4, CADET_BLUE, CADET_BLUE1, CADET_BLUE2,
      CADET_BLUE3, CADET_BLUE4, CHARTREUSE, CHARTREUSE1, CHARTREUSE2,
      CHARTREUSE3, CHARTREUSE4, CHOCOLATE, CHOCOLATE1, CHOCOLATE2, CHOCOLATE3,
      CHOCOLATE4, CORAL, CORAL1, CORAL2, CORAL3, CORAL4, CORNFLOWER_BLUE,
      CORNSILK, CORNSILK1, CORNSILK2, CORNSILK3, CORNSILK4, CRYMSON, CYAN,
      CYAN1, CYAN2, CYAN3, CYAN4, DARK_BLUE, DARK_CYAN, DARK_GOLDENROD,
      DARK_GOLDENROD1, DARK_GOLDENROD2, DARK_GOLDENROD3, DARK_GOLDENROD4,
      DARK_GRAY, DARK_GREEN, DARK_GREY, DARK_MAGENTA, DARK_OLIVE_GREEN,
      DARK_OLIVE_GREEN1, DARK_OLIVE_GREEN2, DARK_OLIVE_GREEN3,
      DARK_OLIVE_GREEN4, DARK_ORANGE, DARK_ORANGE1, DARK_ORANGE2, DARK_ORANGE3,
      DARK_ORANGE4, DARK_ORCHID, DARK_ORCHID1, DARK_ORCHID2, DARK_ORCHID3,
      DARK_ORCHID4, DARK_RED, DARK_SALMON, DARK_SEA_GREEN, DARK_SEA_GREEN1,
      DARK_SEA_GREEN2, DARK_SEA_GREEN3, DARK_SEA_GREEN4, DARK_SLATE_BLUE,
      DARK_SLATE_GRAY, DARK_SLATE_GRAY1, DARK_SLATE_GRAY2, DARK_SLATE_GRAY3,
      DARK_SLATE_GRAY4, DARK_SLATE_GREY, DARK_TURQUOISE, DARK_VIOLET,
      DEEP_PINK, DEEP_PINK1, DEEP_PINK2, DEEP_PINK3, DEEP_PINK4, DEEP_SKY_BLUE,
      DEEP_SKY_BLUE1, DEEP_SKY_BLUE2, DEEP_SKY_BLUE3, DEEP_SKY_BLUE4, DIM_GRAY,
      DIM_GREY, DODGER_BLUE, DODGER_BLUE1, DODGER_BLUE2, DODGER_BLUE3,
      DODGER_BLUE4, FIREBRICK, FIREBRICK1, FIREBRICK2, FIREBRICK3, FIREBRICK4,
      FLORAL_WHITE, FOREST_GREEN, FUCHSIA, GAINSBORO, GHOST_WHITE, GOLD, GOLD1,
      GOLD2, GOLD3, GOLD4, GOLDENROD, GOLDENROD1, GOLDENROD2, GOLDENROD3,
      GOLDENROD4, GRAY, GRAY0, GRAY1, GRAY2, GRAY3, GRAY4, GRAY5, GRAY6, GRAY7,
      GRAY8, GRAY9, GRAY10, GRAY11, GRAY12, GRAY13, GRAY14, GRAY15, GRAY16,
      GRAY17, GRAY18, GRAY19, GRAY20, GRAY21, GRAY22, GRAY23, GRAY24, GRAY25,
      GRAY26, GRAY27, GRAY28, GRAY29, GRAY30, GRAY31, GRAY32, GRAY33, GRAY34,
      GRAY35, GRAY36, GRAY37, GRAY38, GRAY39, GRAY40, GRAY41, GRAY42, GRAY43,
      GRAY44, GRAY45, GRAY46, GRAY47, GRAY48, GRAY49, GRAY50, GRAY51, GRAY52,
      GRAY53, GRAY54, GRAY55, GRAY56, GRAY57, GRAY58, GRAY59, GRAY60, GRAY61,
      GRAY62, GRAY63, GRAY64, GRAY65, GRAY66, GRAY67, GRAY68, GRAY69, GRAY70,
      GRAY71, GRAY72, GRAY73, GRAY74, GRAY75, GRAY76, GRAY77, GRAY78, GRAY79,
      GRAY80, GRAY81, GRAY82, GRAY83, GRAY84, GRAY85, GRAY86, GRAY87, GRAY88,
      GRAY89, GRAY90, GRAY91, GRAY92, GRAY93, GRAY94, GRAY95, GRAY96, GRAY97,
      GRAY98, GRAY99, GRAY100, GREEN, GREEN_YELLOW, GREEN1, GREEN2, GREEN3,
      GREEN4, GREY, GREY0, GREY1, GREY2, GREY3, GREY4, GREY5, GREY6, GREY7,
      GREY8, GREY9, GREY10, GREY11, GREY12, GREY13, GREY14, GREY15, GREY16,
      GREY17, GREY18, GREY19, GREY20, GREY21, GREY22, GREY23, GREY24, GREY25,
      GREY26, GREY27, GREY28, GREY29, GREY30, GREY31, GREY32, GREY33, GREY34,
      GREY35, GREY36, GREY37, GREY38, GREY39, GREY40, GREY41, GREY42, GREY43,
      GREY44, GREY45, GREY46, GREY47, GREY48, GREY49, GREY50, GREY51, GREY52,
      GREY53, GREY54, GREY55, GREY56, GREY57, GREY58, GREY59, GREY60, GREY61,
      GREY62, GREY63, GREY64, GREY65, GREY66, GREY67, GREY68, GREY69, GREY70,
      GREY71, GREY72, GREY73, GREY74, GREY75, GREY76, GREY77, GREY78, GREY79,
      GREY80, GREY81, GREY82, GREY83, GREY84, GREY85, GREY86, GREY87, GREY88,
      GREY89, GREY90, GREY91, GREY92, GREY93, GREY94, GREY95, GREY96, GREY97,
      GREY98, GREY99, GREY100, HONEYDEW, HONEYDEW1, HONEYDEW2, HONEYDEW3,
      HONEYDEW4, HOT_PINK, HOT_PINK1, HOT_PINK2, HOT_PINK3, HOT_PINK4,
      INDIAN_RED, INDIAN_RED1, INDIAN_RED2, INDIAN_RED3, INDIAN_RED4, INDIGO,
      IVORY, IVORY1, IVORY2, IVORY3, IVORY4, KHAKI, KHAKI1, KHAKI2, KHAKI3,
      KHAKI4, LAVENDER_BLUSH, LAVENDER_BLUSH1, LAVENDER_BLUSH2,
      LAVENDER_BLUSH3, LAVENDER_BLUSH4, LAWN_GREEN, LEMON_CHIFFON,
      LEMON_CHIFFON1, LEMON_CHIFFON2, LEMON_CHIFFON3, LEMON_CHIFFON4,
      LIGHT_BLUE, LIGHT_BLUE1, LIGHT_BLUE2, LIGHT_BLUE3, LIGHT_BLUE4,
      LIGHT_CORAL, LIGHT_CYAN, LIGHT_CYAN1, LIGHT_CYAN2, LIGHT_CYAN3,
      LIGHT_CYAN4, LIGHT_GOLDENROD, LIGHT_GOLDENROD1, LIGHT_GOLDENROD2,
      LIGHT_GOLDENROD3, LIGHT_GOLDENROD4, LIGHT_GOLDENROD_YELLOW, LIGHT_GRAY,
      LIGHT_GREEN, LIGHT_GREY, LIGHT_PINK, LIGHT_PINK1, LIGHT_PINK2,
      LIGHT_PINK3, LIGHT_PINK4, LIGHT_SALMON, LIGHT_SALMON1, LIGHT_SALMON2,
      LIGHT_SALMON3, LIGHT_SALMON4, LIGHT_SEA_GREEN, LIGHT_SKY_BLUE,
      LIGHT_SKY_BLUE1, LIGHT_SKY_BLUE2, LIGHT_SKY_BLUE3, LIGHT_SKY_BLUE4,
      LIGHT_SLATE_BLUE, LIGHT_SLATE_GRAY, LIGHT_SLATE_GREY, LIGHT_STEEL_BLUE,
      LIGHT_STEEL_BLUE1, LIGHT_STEEL_BLUE2, LIGHT_STEEL_BLUE3,
      LIGHT_STEEL_BLUE4, LIGHT_YELLOW, LIGHT_YELLOW1, LIGHT_YELLOW2,
      LIGHT_YELLOW3, LIGHT_YELLOW4, LIME, LIME_GREEN, LINEN, MAGENTA, MAGENTA1,
      MAGENTA2, MAGENTA3, MAGENTA4, MAROON, MAROON1, MAROON2, MAROON3, MAROON4,
      MEDIUM_AQUAMARINE, MEDIUM_BLUE, MEDIUM_ORCHID, MEDIUM_ORCHID1,
      MEDIUM_ORCHID2, MEDIUM_ORCHID3, MEDIUM_ORCHID4, MEDIUM_PURPLE,
      MEDIUM_PURPLE1, MEDIUM_PURPLE2, MEDIUM_PURPLE3, MEDIUM_PURPLE4,
      MEDIUM_SEA_GREEN, MEDIUM_SLATE_BLUE, MEDIUM_SPRING_GREEN,
      MEDIUM_TURQUOISE, MEDIUM_VIOLET_RED, MIDNIGHT_BLUE, MINT_CREAM,
      MISTY_ROSE, MISTY_ROSE1, MISTY_ROSE2, MISTY_ROSE3, MISTY_ROSE4, MOCCASIN,
      NAVAJO_WHITE, NAVAJO_WHITE1, NAVAJO_WHITE2, NAVAJO_WHITE3, NAVAJO_WHITE4,
      NAVY, NAVY_BLUE, OLD_LACE, OLIVE, OLIVE_DRAB, OLIVE_DRAB1, OLIVE_DRAB2,
      OLIVE_DRAB3, OLIVE_DRAB4, ORANGE, ORANGE1, ORANGE2, ORANGE3, ORANGE4,
      ORANGE_RED, ORANGE_RED1, ORANGE_RED2, ORANGE_RED3, ORANGE_RED4, ORCHID,
      ORCHID1, ORCHID2, ORCHID3, ORCHID4, PALE_GOLDENROD, PALE_GREEN,
      PALE_GREEN1, PALE_GREEN2, PALE_GREEN3, PALE_GREEN4, PALE_TURQUOISE,
      PALE_TURQUOISE1, PALE_TURQUOISE2, PALE_TURQUOISE3, PALE_TURQUOISE4,
      PALE_VIOLET_RED, PALE_VIOLET_RED1, PALE_VIOLET_RED2, PALE_VIOLET_RED3,
      PALE_VIOLET_RED4, PAPAYA_WHIP, PEACH_PUFF, PEACH_PUFF1, PEACH_PUFF2,
      PEACH_PUFF3, PEACH_PUFF4, PERU, PINK, PINK1, PINK2, PINK3, PINK4, PLUM,
      PLUM1, PLUM2, PLUM3, PLUM4, POWDER_BLUE, PURPLE, PURPLE1, PURPLE2,
      PURPLE3, PURPLE4, RED, RED1, RED2, RED3, RED4, ROSY_BROWN, ROSY_BROWN1,
      ROSY_BROWN2, ROSY_BROWN3, ROSY_BROWN4, ROYAL_BLUE, ROYAL_BLUE1,
      ROYAL_BLUE2, ROYAL_BLUE3, ROYAL_BLUE4, SADDLE_BROWN, SALMON, SALMON1,
      SALMON2, SALMON3, SALMON4, SANDY_BROWN, SEA_GREEN, SEA_GREEN1,
      SEA_GREEN2, SEA_GREEN3, SEA_GREEN4, SEASHELL, SEASHELL1, SEASHELL2,
      SEASHELL3, SEASHELL4, SIENNA, SIENNA1, SIENNA2, SIENNA3, SIENNA4, SILVER,
      SKY_BLUE, SKY_BLUE1, SKY_BLUE2, SKY_BLUE3, SKY_BLUE4, SLATE_BLUE,
      SLATE_BLUE1, SLATE_BLUE2, SLATE_BLUE3, SLATE_BLUE4, SLATE_GRAY,
      SLATE_GRAY1, SLATE_GRAY2, SLATE_GRAY3, SLATE_GRAY4, SLATE_GREY, SNOW,
      SNOW1, SNOW2, SNOW3, SNOW4, SPRING_GREEN, SPRING_GREEN1, SPRING_GREEN2,
      SPRING_GREEN3, SPRING_GREEN4, STEEL_BLUE, STEEL_BLUE1, STEEL_BLUE2,
      STEEL_BLUE3, STEEL_BLUE4, TAN, TAN1, TAN2, TAN3, TAN4, TEAL, THISTLE,
      THISTLE1, THISTLE2, THISTLE3, THISTLE4, TOMATO, TOMATO1, TOMATO2,
      TOMATO3, TOMATO4, TURQUOISE, TURQUOISE1, TURQUOISE2, TURQUOISE3,
      TURQUOISE4, VIOLET, VIOLET_RED, VIOLET_RED1, VIOLET_RED2, VIOLET_RED3,
      VIOLET_RED4, WHEAT, WHEAT1, WHEAT2, WHEAT3, WHEAT4, WHITE, WHITE_SMOKE,
      YELLOW, YELLOW_GREEN, YELLOW1, YELLOW2, YELLOW3, YELLOW4);
   --## rule on NAMING_CONVENTION

   -- ****t* Colors/Colors.Color_Range
   -- FUNCTION
   -- Type used to set the colors values
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Color_Range is new Integer range -1 .. 255 with
      Default_Value => 0;
   -- ****

      -- ****d* Colors/Colors.Default_Color_Value
      -- FUNCTION
      -- Default value for the amount of the selected color
      -- SOURCE
   Default_Color_Value: constant Color_Range := 0;
   -- ****

   -- ****s* Colors/Color_Type
   -- FUNCTION
   -- Data structure for setting the colors values
   -- OPTIONS
   -- Red   - The amount of red color in the image
   -- Green - The amount of green color in the image
   -- Blue  - The amount of blue color in the image
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   type Color_Type is record
      Red: Color_Range;
      Green: Color_Range;
      Blue: Color_Range;
   end record;
   -- ****

   -- ****d* Colors/Colors.Empty_Color
   -- FUNCTION
   -- Empty color, used mostly to set default values for colors
   -- image
   -- HISTORY
   -- 8.6.0 - Added
   -- SOURCE
   Empty_Color: constant Color_Type := (Red => -1, Green => -1, Blue => -1);
   -- ****

   --## rule on REDUCEABLE_SCOPE

end Tk.Colors;
