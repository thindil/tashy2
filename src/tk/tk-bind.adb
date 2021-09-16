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

with Ada.Characters.Handling; use Ada.Characters.Handling;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Tk.Bind is

   function Modifier_Type_Image(Modifier: Modifiers_Type) return String is
      Image: String := To_Lower(Modifiers_Type'Image(Modifier));
   begin
      Image(1) := To_Upper(Image(1));
      if Image(Image'Last - 1) = '_' then
         Image(Image'Last - 1) := '-';
      end if;
      return Image;
   end Modifier_Type_Image;

   function Key_Syms_Type_Image(Key: Key_Syms) return String is
      Image: String := To_Lower(Key_Syms'Image(Key));
      Start_Index: Positive;
   begin
      Image(1) := To_Upper(Image(1));
      if Image(1 .. 3) = "Key" then
         Image(4) := '-';
      elsif Image(1 .. 3) = "Shi" then
         Image(6 .. 7) := "-K";
         Image(10 .. 11) := '-' & To_Upper(Image(11));
      end if;
      case Key is
         when SHIFT_KEY_AE =>
            return "Key-AE";
         when SHIFT_KEY_ENG =>
            return "Key-ENG";
         when SHIFT_KEY_KANA_WO =>
            return "Key-kana_WO";
         when SHIFT_KEY_KANA_A .. SHIFT_KEY_KANA_N =>
            Start_Index := Index(Image, "_", Backward);
            return "Key-kana" & To_Upper(Image(Start_Index .. Image'Last));
         when KEY_ARABIC_COMMA .. KEY_SERBIAN_DZE |
           KEY_CYRILLIC_YU .. KEY_CYRILLIC_HARDSIGN |
           KEY_GREEK_ALPHAACCENT .. KEY_GREEK_OMEGAACCENT =>
            Image(5) := To_Upper(Image(5));
         when SHIFT_KEY_SERBIAN_DJE .. SHIFT_KEY_SERBIAN_DZE |
           SHIFT_KEY_CYRILLIC_YU .. SHIFT_KEY_CYRILLIC_HARDSIGN |
           SHIFT_KEY_GREEK_ALPHA .. SHIFT_KEY_GREEK_OMEGA =>
            Image(11) := To_Upper(Image(11));
            Start_Index := Index(Image, "_", Backward);
            Image(Start_Index .. Image'Last) :=
              To_Upper(Image(Start_Index .. Image'Last));
         when SHIFT_KEY_GREEK_ALPHAACCENT =>
            return "Key-Greek_ALPHAaccent";
         when SHIFT_KEY_GREEK_EPSILONACCENT =>
            return "Key-Greek_EPSILONaccent";
         when SHIFT_KEY_GREEK_ETAACCENT =>
            return "Key-Greek_ETAaccent";
         when SHIFT_KEY_GREEK_IOTAACCENT =>
            return "Key-Greek_IOTAAaccent";
         when SHIFT_KEY_GREEK_IOTADIAERESIS =>
            return "Key-Greek_IOTAdiaeresis";
         when SHIFT_KEY_GREEK_IOTAACCENTDIAERESIS =>
            return "Key-Greek_IOTAaccentdiaeresis";
         when SHIFT_KEY_GREEK_OMICRONACCENT =>
            return "Key-Greek_OMICRONaccent";
         when SHIFT_KEY_GREEK_UPSILONACCENT =>
            return "Key-Greek_UPSILONAaccent";
         when SHIFT_KEY_GREEK_UPSILONDIERESIS =>
            return "Key-Greek_UPSILONdieresis";
         when SHIFT_KEY_GREEK_UPSILONACCENTDIERESIS =>
            return "Key-Greek_UPSILONaccentdieresis";
         when SHIFT_KEY_GREEK_OMEGAACCENT =>
            return "Key-Greek_OMEGAaccent";
         when others =>
            null;
      end case;
      if Image(1 .. 3) = "Shi" then
         return Image(7 .. Image'Last);
      end if;
      return Image;
   end Key_Syms_Type_Image;

   procedure Bind
     (Window: Tk_Widget; Sequence: Modifiers_Type; Script: Tcl_String;
      Append: Boolean := False) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "bind " & Tk_Path_Name(Widgt => Window) & " <" &
           Modifier_Type_Image(Sequence) & "> " &
           (if Append then "+" else "") & To_String(Script),
         Interpreter => Tk_Interp(Widgt => Window));
   end Bind;

   procedure Bind
     (Window: Tk_Widget; Sequence: Modifiers_Array; Script: Tcl_String;
      Append: Boolean := False) is
      Modifier: Unbounded_String := Null_Unbounded_String;
   begin
      for I in Sequence'Range loop
         Modifier := Modifier & Modifier_Type_Image(Sequence(I));
         if I < Sequence'Last then
            Modifier := Modifier & "-";
         end if;
      end loop;
      Tcl_Eval
        (Tcl_Script =>
           "bind " & Tk_Path_Name(Widgt => Window) & " <" &
           To_String(Modifier) & "> " & (if Append then "+" else "") &
           To_String(Script),
         Interpreter => Tk_Interp(Widgt => Window));
   end Bind;

end Tk.Bind;
