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
with System;
with Tcl.Variables;

package body Tk.Wm is

   procedure Aspect
     (Window: Tk_Toplevel;
      Min_Numer, Min_Denom, Max_Numer, Max_Denom: Natural) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm aspect " & Tk_Path_Name(Widgt => Window) &
           Natural'Image(Min_Numer) & Natural'Image(Min_Denom) &
           Natural'Image(Max_Numer) & Natural'Image(Max_Denom),
         Interpreter => Tk_Interp(Widgt => Window));
   end Aspect;

   function Aspect(Window: Tk_Toplevel) return Aspect_Data is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "wm aspect " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter),
           Interpreter => Interpreter);
   begin
      if Result = Empty_Array_List then
         return Empty_Aspect_Data;
      end if;
      return Result_Value: Aspect_Data := Empty_Aspect_Data do
         Result_Value.Min_Numer :=
           Natural'Value(To_Ada_String(Source => Result(1)));
         Result_Value.Min_Denom :=
           Natural'Value(To_Ada_String(Source => Result(2)));
         Result_Value.Max_Numer :=
           Natural'Value(To_Ada_String(Source => Result(3)));
         Result_Value.Max_Denom :=
           Natural'Value(To_Ada_String(Source => Result(4)));
      end return;
   end Aspect;

   function Get_Attributes(Window: Tk_Widget) return Window_Attributes_Data is
      use Tcl.Variables;

      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "wm attributes " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter),
           Interpreter => Interpreter);
      Index: Positive := 1;
      Window_Manager: constant Window_Manager_Types :=
        (if
           Tcl_Get_Var2
             (Var_Name => "tcl_platform", Index_Name => "os",
              Interpreter => Interpreter) =
           "Windows"
         then WINDOWS
         elsif
           Tcl_Get_Var2
             (Var_Name => "tcl_platform", Index_Name => "os",
              Interpreter => Interpreter) =
           "Darwin"
         then MACOSX
         else X_11);
      Window_Attributes: Window_Attributes_Data (Wm_Type => Window_Manager) :=
        Empty_Window_Attributes;
      function Get_Boolean return Extended_Boolean is
      begin
         if To_Ada_String(Source => Result(Index + 1)) = "1" then
            return TRUE;
         end if;
         return FALSE;
      end Get_Boolean;
   begin
      Read_Attributes_Loop :
      while Index < Result'Last loop
         if Result(Index) = "-alpha" then
            Window_Attributes.Alpha :=
              Alpha_Type'Value(To_Ada_String(Source => Result(Index + 1)));
         elsif Result(Index) = "-fullscreen" then
            Window_Attributes.Full_Screen := Get_Boolean;
         elsif Result(Index) = "-topmost" then
            Window_Attributes.Topmost := Get_Boolean;
         elsif Result(Index) = "-type" and Window_Manager = X_11 then
            if To_Ada_String(Source => Result(Index + 1)) = "" then
               Window_Attributes.Window_Type := NONE;
            else
               Window_Attributes.Window_Type :=
                 Window_Types'Value
                   (To_Ada_String(Source => Result(Index + 1)));
            end if;
         elsif Result(Index) = "-zoomed" and Window_Manager = X_11 then
            Window_Attributes.Zoomed := Get_Boolean;
         elsif Result(Index) = "-disabled" and Window_Manager = WINDOWS then
            Window_Attributes.Disabled := Get_Boolean;
         elsif Result(Index) = "-toolwindow" and Window_Manager = WINDOWS then
            Window_Attributes.Tool_Window := Get_Boolean;
         elsif Result(Index) = "-transparentcolor" and
           Window_Manager = WINDOWS then
            Window_Attributes.Transparent_Color := Result(Index + 1);
         elsif Result(Index) = "-modified" and Window_Manager = MACOSX then
            Window_Attributes.Modified := Get_Boolean;
         elsif Result(Index) = "-notify" and Window_Manager = MACOSX then
            Window_Attributes.Notify := Get_Boolean;
         elsif Result(Index) = "-titlepath" and Window_Manager = MACOSX then
            Window_Attributes.Title_Path := Result(Index + 1);
         elsif Result(Index) = "-transparent" and Window_Manager = MACOSX then
            Window_Attributes.Transparent := Get_Boolean;
         end if;
         Index := Index + 2;
      end loop Read_Attributes_Loop;
      return Window_Attributes;
   end Get_Attributes;

   procedure Set_Attributes
     (Window: Tk_Widget; Attributes_Data: Window_Attributes_Data) is
      Values_List: Unbounded_String := Null_Unbounded_String;
      procedure Set_Boolean(Name: String; Value: Extended_Boolean) is
      begin
         case Value is
            when TRUE =>
               Append(Source => Values_List, New_Item => "-" & Name & " 1 ");
            when FALSE =>
               Append(Source => Values_List, New_Item => "-" & Name & " 0 ");
            when NONE =>
               null;
         end case;
      end Set_Boolean;
   begin
      if Attributes_Data.Alpha >= 0.0 then
         Append
           (Source => Values_List,
            New_Item =>
              "-alpha" & Alpha_Type'Image(Attributes_Data.Alpha) & " ");
      end if;
      Set_Boolean(Name => "fullscreen", Value => Attributes_Data.Full_Screen);
      Set_Boolean(Name => "topmost", Value => Attributes_Data.Topmost);
      case Attributes_Data.Wm_Type is
         when X_11 =>
            if Attributes_Data.Window_Type /= NONE then
               Append
                 (Source => Values_List,
                  New_Item =>
                    "-type " &
                    To_Lower
                      (Item =>
                         Window_Types'Image(Attributes_Data.Window_Type)) &
                    " ");
            end if;
            Set_Boolean(Name => "zoomed", Value => Attributes_Data.Zoomed);
         when WINDOWS =>
            Set_Boolean(Name => "disabled", Value => Attributes_Data.Disabled);
            Set_Boolean
              (Name => "toolwindow", Value => Attributes_Data.Tool_Window);
            if To_Ada_String(Source => Attributes_Data.Transparent_Color)'
                Length >
              0 then
               Append
                 (Source => Values_List,
                  New_Item =>
                    "-transparentcolor " &
                    To_Ada_String
                      (Source => Attributes_Data.Transparent_Color) &
                    " ");
            end if;
         when MACOSX =>
            Set_Boolean(Name => "modified", Value => Attributes_Data.Modified);
            Set_Boolean(Name => "notify", Value => Attributes_Data.Notify);
            if To_Ada_String(Source => Attributes_Data.Title_Path)'Length >
              0 then
               Append
                 (Source => Values_List,
                  New_Item =>
                    "-titlepath " &
                    To_Ada_String(Source => Attributes_Data.Title_Path) & " ");
            end if;
            Set_Boolean
              (Name => "transparent", Value => Attributes_Data.Transparent);
      end case;
      Tcl_Eval
        (Tcl_Script =>
           "wm attributes " & Tk_Path_Name(Widgt => Window) & " " &
           To_String(Source => Values_List),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Attributes;

   function Get_Attribute(Window: Tk_Widget; Name: String) return Tcl_String is
   begin
      return To_Tcl_String
          (Source =>
             Tcl_Eval
               (Tcl_Script =>
                  "wm attributes " & Tk_Path_Name(Widgt => Window) & " -" &
                  Name,
                Interpreter => Tk_Interp(Widgt => Window)));
   end Get_Attribute;

   function Get_Attribute
     (Window: Tk_Widget; Name: String) return Extended_Boolean is
   begin
      if Tcl_Eval
          (Tcl_Script =>
             "wm attributes " & Tk_Path_Name(Widgt => Window) & " -" & Name,
           Interpreter => Tk_Interp(Widgt => Window)) =
        "1" then
         return TRUE;
      end if;
      return FALSE;
   end Get_Attribute;

   function Get_Attribute(Window: Tk_Widget; Name: String) return Alpha_Type is
   begin
      return Alpha_Type'Value
          (Tcl_Eval
             (Tcl_Script =>
                "wm attributes " & Tk_Path_Name(Widgt => Window) & " -" & Name,
              Interpreter => Tk_Interp(Widgt => Window)));
   end Get_Attribute;

   function Get_Attribute
     (Window: Tk_Widget; Name: String) return Window_Types is
   begin
      return Window_Types'Value
          (Tcl_Eval
             (Tcl_Script =>
                "wm attributes " & Tk_Path_Name(Widgt => Window) & " -" & Name,
              Interpreter => Tk_Interp(Widgt => Window)));
   end Get_Attribute;

   function Client(Window: Tk_Widget) return String is
   begin
      return Tcl_Eval
          (Tcl_Script => "wm client " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Client;

   procedure Client(Window: Tk_Widget; Name: Tcl_String) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm client " & Tk_Path_Name(Widgt => Window) & " " &
           To_String(Source => Name),
         Interpreter => Tk_Interp(Widgt => Window));
   end Client;

   function Color_Map_Windows(Window: Tk_Widget) return Array_List is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
   begin
      return Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script =>
                  "wm colormapwindows " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter),
           Interpreter => Interpreter);
   end Color_Map_Windows;

   procedure Color_Map_Windows(Window: Tk_Widget; Widgets: Widgets_Array) is
      Windows_List: Unbounded_String := Null_Unbounded_String;
   begin
      Convert_List_To_String_Loop :
      for Widgt of Widgets loop
         Append
           (Source => Windows_List,
            New_Item => " " & Tk_Path_Name(Widgt => Widgt));
      end loop Convert_List_To_String_Loop;
      Tcl_Eval
        (Tcl_Script =>
           "wm colormapwindows " & Tk_Path_Name(Widgt => Window) & " {" &
           To_String(Source => Windows_List) & "}",
         Interpreter => Tk_Interp(Widgt => Window));
   end Color_Map_Windows;

   function Command(Window: Tk_Widget) return Tcl_String is
   begin
      return To_Tcl_String
          (Source =>
             Tcl_Eval
               (Tcl_Script => "wm command " & Tk_Path_Name(Widgt => Window),
                Interpreter => Tk_Interp(Widgt => Window)));
   end Command;

   procedure Command(Window: Tk_Widget; Wm_Command: Tcl_String) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm command " & Tk_Path_Name(Widgt => Window) & " " &
           To_String(Source => Wm_Command),
         Interpreter => Tk_Interp(Widgt => Window));
   end Command;

   procedure Deiconify(Window: Tk_Widget) is
   begin
      Tcl_Eval
        (Tcl_Script => "wm deiconify " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window));
   end Deiconify;

   function Focus_Model(Window: Tk_Widget) return Focus_Model_Types is
   begin
      if Tcl_Eval
          (Tcl_Script => "wm focusmodel " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window)) =
        "passive" then
         return PASSIVE;
      end if;
      return ACTIVE;
   end Focus_Model;

   procedure Focus_Model(Window: Tk_Widget; Model: Focus_Model_Types) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm focusmodel " & Tk_Path_Name(Widgt => Window) & " " &
           To_Lower(Item => Focus_Model_Types'Image(Model)),
         Interpreter => Tk_Interp(Widgt => Window));
   end Focus_Model;

   procedure Forget(Window: Tk_Widget) is
   begin
      Tcl_Eval
        (Tcl_Script => "wm forget " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window));
   end Forget;

   function Frame(Window: Tk_Widget) return Tk_Window is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "wm frame " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   begin
      if Result'Length > 0 then
         return Tk_Window
             (System'To_Address
                (Integer'Value("16#" & Result(3 .. Result'Last) & "#")));
      end if;
      return Null_Window;
   end Frame;

   function Geometry(Window: Tk_Widget) return Window_Geometry is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "wm geometry " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
      Start_Index, End_Index: Positive := 1;
   begin
      return Win_Geometry: Window_Geometry := Empty_Window_Geometry do
         End_Index := Index(Source => Result, Pattern => "x");
         Win_Geometry.Width := Natural'Value(Result(1 .. End_Index - 1));
         Start_Index := End_Index + 1;
         --## rule off ASSIGNMENTS
         End_Index :=
           Index(Source => Result, Pattern => "+", From => Start_Index);
         Win_Geometry.Height :=
           Natural'Value(Result(Start_Index .. End_Index - 1));
         Start_Index := End_Index + 1;
         End_Index :=
           Index(Source => Result, Pattern => "+", From => Start_Index);
         Win_Geometry.X := Natural'Value(Result(Start_Index .. End_Index - 1));
         Start_Index := End_Index + 1;
         --## rule on ASSIGNMENTS
         Win_Geometry.Y := Natural'Value(Result(Start_Index .. Result'Last));
      end return;
   end Geometry;

   procedure Geometry
     (Window: Tk_Widget; Width, Height, X, Y: Extended_Natural := -1) is
      Win_Geometry: Unbounded_String := Null_Unbounded_String;
   begin
      if Width = -1 and Height > -1 then
         raise Tcl_Exception with "Width value not specified";
      end if;
      if Width > -1 and Height = -1 then
         raise Tcl_Exception with "Height value not specified";
      end if;
      if X = -1 and Y > -1 then
         raise Tcl_Exception with "X value not specified";
      end if;
      if X > -1 and Y = -1 then
         raise Tcl_Exception with "Y value not specified";
      end if;
      if Width > -1 and Height > -1 then
         Append
           (Source => Win_Geometry,
            New_Item =>
              "=" &
              Trim(Source => Extended_Natural'Image(Width), Side => Left) &
              "x" &
              Trim(Source => Extended_Natural'Image(Height), Side => Left));
      end if;
      if X > -1 and Y > -1 then
         Append
           (Source => Win_Geometry,
            New_Item =>
              "+" & Trim(Source => Extended_Natural'Image(X), Side => Left) &
              "+" & Trim(Source => Extended_Natural'Image(Y), Side => Left));
      end if;
      Tcl_Eval
        (Tcl_Script =>
           "wm geometry " & Tk_Path_Name(Widgt => Window) & " " &
           To_String(Source => Win_Geometry),
         Interpreter => Tk_Interp(Widgt => Window));
   end Geometry;

   function Grid(Window: Tk_Widget) return Window_Grid_Geometry is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "wm grid " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter),
           Interpreter => Interpreter);
   begin
      if Result'Length = 0 then
         return Empty_Window_Grid_Geometry;
      end if;
      return Win_Grid: Window_Grid_Geometry := Empty_Window_Grid_Geometry do
         Win_Grid.Base_Width :=
           Natural'Value(To_Ada_String(Source => Result(1)));
         Win_Grid.Base_Height :=
           Natural'Value(To_Ada_String(Source => Result(2)));
         Win_Grid.Width_Inc :=
           Natural'Value(To_Ada_String(Source => Result(3)));
         Win_Grid.Height_Inc :=
           Natural'Value(To_Ada_String(Source => Result(4)));
      end return;
   end Grid;

   procedure Grid
     (Window: Tk_Widget;
      Base_Width, Base_Height, Width_Inc, Height_Inc: Positive) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm grid " & Tk_Path_Name(Widgt => Window) &
           Positive'Image(Base_Width) & Positive'Image(Base_Height) &
           Positive'Image(Width_Inc) & Positive'Image(Height_Inc),
         Interpreter => Tk_Interp(Widgt => Window));
   end Grid;

   function Group(Window: Tk_Widget) return String is
   begin
      return Tcl_Eval
          (Tcl_Script => "wm group " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Group;

   procedure Group(Window: Tk_Widget; Path_Name: Tcl_String) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm group " & Tk_Path_Name(Widgt => Window) & " " &
           To_Ada_String(Source => Path_Name),
         Interpreter => Tk_Interp(Widgt => Window));
   end Group;

   function Icon_Bitmap(Window: Tk_Widget) return String is
   begin
      return Tcl_Eval
          (Tcl_Script => "wm iconbitmap " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Icon_Bitmap;

   procedure Icon_Bitmap(Window: Tk_Widget; Bitmap: Tcl_String) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm iconbitmap " & Tk_Path_Name(Widgt => Window) & " " &
           To_Ada_String(Source => Bitmap),
         Interpreter => Tk_Interp(Widgt => Window));
   end Icon_Bitmap;

   procedure Iconify(Window: Tk_Widget) is
   begin
      Tcl_Eval
        (Tcl_Script => "wm iconify " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window));
   end Iconify;

   function Icon_Mask(Window: Tk_Widget) return String is
   begin
      return Tcl_Eval
          (Tcl_Script => "wm iconmask " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Icon_Mask;

   procedure Icon_Mask(Window: Tk_Widget; Bitmap: Tcl_String) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm iconmask " & Tk_Path_Name(Widgt => Window) & " " &
           To_Ada_String(Source => Bitmap),
         Interpreter => Tk_Interp(Widgt => Window));
   end Icon_Mask;

   function Icon_Name(Window: Tk_Widget) return String is
   begin
      return Tcl_Eval
          (Tcl_Script => "wm iconname " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window));
   end Icon_Name;

   procedure Icon_Name(Window: Tk_Widget; New_Name: Tcl_String) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm iconname " & Tk_Path_Name(Widgt => Window) & " " &
           To_Ada_String(Source => New_Name),
         Interpreter => Tk_Interp(Widgt => Window));
   end Icon_Name;

   procedure Icon_Photo
     (Window: Tk_Widget; Images: Array_List; Default: Boolean := False) is
      pragma Unreferenced(Window, Images, Default);
   begin
      null;
   end Icon_Photo;

   function Icon_Position(Window: Tk_Widget) return Window_Position is
      pragma Unreferenced(Window);
   begin
      return Empty_Window_Position;
   end Icon_Position;

   procedure Icon_Position(Window: Tk_Widget; X, Y: Natural) is
      pragma Unreferenced(Window, X, Y);
   begin
      null;
   end Icon_Position;

   function Icon_Window(Window: Tk_Widget) return String is
      pragma Unreferenced(Window);
   begin
      return "";
   end Icon_Window;

   procedure Icon_Window(Window: Tk_Widget; Path_Name: Tcl_String) is
      pragma Unreferenced(Window, Path_Name);
   begin
      null;
   end Icon_Window;

end Tk.Wm;
