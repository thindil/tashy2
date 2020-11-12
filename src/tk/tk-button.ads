-- Copyright (c) 2020 Bartek thindil Jasicki <thindil@laeran.pl>
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

package Tk.Button is

   type Tk_Button is new Tk_Widget;

   type Button_Options is new Widget_Options with record
      Active_Background: Tcl_String;
      Active_Foreground: Tcl_String;
      Anchor: Directions_Type;
      Bitmap: Tcl_String;
      Border_Width: Pixel_Data;
      Command: Tcl_String;
      Compound: Place_Type;
      Default: State_Type;
      Disabled_Foreground: Tcl_String;
      Font: Tcl_String;
      Foreground: Tcl_String;
      Height: Pixel_Data;
      Highlight_Background: Tcl_String;
      Highlight_Color: Tcl_String;
      Highlight_Thickness: Pixel_Data;
      Image: Tcl_String;
      Justify: Justify_Type;
      Over_Relief: Relief_Type;
      PadX: Pixel_Data;
      PadY: Pixel_Data;
      Relief: Relief_Type;
      Repeat_Delay: Extended_Natural;
      Repeat_Interval: Extended_Natural;
      State: State_Type;
      Text: Tcl_String;
      Text_Variable: Tcl_String;
      Underline: Extended_Natural;
      Width: Pixel_Data;
      Wrap_Length: Pixel_Data;
   end record;

   function Create
     (Path_Name: String; Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Button;

   procedure Create
     (Widget: out Tk_Button; Path_Name: String; Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter);

   function Get_Options(Widget: Tk_Button) return Button_Options;

   procedure Configure(Widget: Tk_Button; Options: Button_Options);

end Tk.Button;
