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
with Tk.Winfo; use Tk.Winfo;

package body Tk.Wm is

   procedure Set_Aspect
     (Window: Tk_Toplevel;
      Min_Numer, Min_Denom, Max_Numer, Max_Denom: Natural) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm aspect " & Tk_Path_Name(Widgt => Window) &
           Natural'Image(Min_Numer) & Natural'Image(Min_Denom) &
           Natural'Image(Max_Numer) & Natural'Image(Max_Denom),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Aspect;

   function Get_Aspect(Window: Tk_Toplevel) return Aspect_Data is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "wm aspect " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter)
               .Result,
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
   end Get_Aspect;

   function Get_Attributes(Window: Tk_Widget) return Window_Attributes_Data is
      use Tcl.Variables;

      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "wm attributes " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter)
               .Result,
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
      function Get_Boolean(Array_Index: Positive) return Extended_Boolean is
      begin
         if To_Ada_String(Source => Result(Array_Index + 1)) = "1" then
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
            Window_Attributes.Full_Screen := Get_Boolean(Array_Index => Index);
         elsif Result(Index) = "-topmost" then
            Window_Attributes.Topmost := Get_Boolean(Array_Index => Index);
         elsif Result(Index) = "-type" and Window_Manager = X_11 then
            if To_Ada_String(Source => Result(Index + 1)) = "" then
               Window_Attributes.Window_Type := NONE;
            else
               Window_Attributes.Window_Type :=
                 Window_Types'Value
                   (To_Ada_String(Source => Result(Index + 1)));
            end if;
         elsif Result(Index) = "-zoomed" and Window_Manager = X_11 then
            Window_Attributes.Zoomed := Get_Boolean(Array_Index => Index);
         elsif Result(Index) = "-disabled" and Window_Manager = WINDOWS then
            Window_Attributes.Disabled := Get_Boolean(Array_Index => Index);
         elsif Result(Index) = "-toolwindow" and Window_Manager = WINDOWS then
            Window_Attributes.Tool_Window := Get_Boolean(Array_Index => Index);
         elsif Result(Index) = "-transparentcolor" and
           Window_Manager = WINDOWS then
            if To_String(Source => Result(Index + 1))(1) /= '#' then
               Window_Attributes.Transparent_Color :=
                 Rgb
                   (Color_Name =>
                      Colors_Names_Value
                        (Image => To_String(Source => Result(Index + 1))),
                    Window => Window);
            elsif To_String(Source => Result(Index + 1))'Length = 10 then
               Window_Attributes.Transparent_Color :=
                 (Red =>
                    Color_Range'Value
                      (To_String(Source => Result(Index + 1))(2 .. 4)) *
                    257,
                  Green =>
                    Color_Range'Value
                      (To_String(Source => Result(Index + 1))(5 .. 7)) *
                    257,
                  Blue =>
                    Color_Range'Value
                      (To_String(Source => Result(Index + 1))(8 .. 10)) *
                    257);
            end if;
         elsif Result(Index) = "-modified" and Window_Manager = MACOSX then
            Window_Attributes.Modified := Get_Boolean(Array_Index => Index);
         elsif Result(Index) = "-notify" and Window_Manager = MACOSX then
            Window_Attributes.Notify := Get_Boolean(Array_Index => Index);
         elsif Result(Index) = "-titlepath" and Window_Manager = MACOSX then
            Window_Attributes.Title_Path := Result(Index + 1);
         elsif Result(Index) = "-transparent" and Window_Manager = MACOSX then
            Window_Attributes.Transparent := Get_Boolean(Array_Index => Index);
         end if;
         Index := Index + 2;
      end loop Read_Attributes_Loop;
      return Window_Attributes;
   end Get_Attributes;

   procedure Set_Attributes
     (Window: Tk_Widget; Attributes_Data: Window_Attributes_Data) is
      Values_List: Unbounded_String := Null_Unbounded_String;
      procedure Set_Boolean
        (Name: String; Value: Extended_Boolean;
         List: in out Unbounded_String) is
      begin
         case Value is
            when TRUE =>
               Append(Source => List, New_Item => "-" & Name & " 1 ");
            when FALSE =>
               Append(Source => List, New_Item => "-" & Name & " 0 ");
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
      Set_Boolean
        (Name => "fullscreen", Value => Attributes_Data.Full_Screen,
         List => Values_List);
      Set_Boolean
        (Name => "topmost", Value => Attributes_Data.Topmost,
         List => Values_List);
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
            Set_Boolean
              (Name => "zoomed", Value => Attributes_Data.Zoomed,
               List => Values_List);
         when WINDOWS =>
            Set_Boolean
              (Name => "disabled", Value => Attributes_Data.Disabled,
               List => Values_List);
            Set_Boolean
              (Name => "toolwindow", Value => Attributes_Data.Tool_Window,
               List => Values_List);
            if Attributes_Data.Transparent_Color /= Empty_Color then
               Option_Image
                 (Name => "transparentcolor",
                  Value => Attributes_Data.Transparent_Color,
                  Options_String => Values_List);
               Append(Source => Values_List, New_Item => " ");
            end if;
         when MACOSX =>
            Set_Boolean
              (Name => "modified", Value => Attributes_Data.Modified,
               List => Values_List);
            Set_Boolean
              (Name => "notify", Value => Attributes_Data.Notify,
               List => Values_List);
            if To_Ada_String(Source => Attributes_Data.Title_Path)'Length >
              0 then
               Append
                 (Source => Values_List,
                  New_Item =>
                    "-titlepath " &
                    To_Ada_String(Source => Attributes_Data.Title_Path) & " ");
            end if;
            Set_Boolean
              (Name => "transparent", Value => Attributes_Data.Transparent,
               List => Values_List);
      end case;
      Tcl_Eval
        (Tcl_Script =>
           "wm attributes " & Tk_Path_Name(Widgt => Window) & " " &
           To_String(Source => Values_List),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Attributes;

   function Get_Attribute
     (Window: Tk_Widget; Name: Window_Atrributes_Type)
      return Extended_Boolean is
   begin
      if Tcl_Eval
          (Tcl_Script =>
             "wm attributes " & Tk_Path_Name(Widgt => Window) & " -" &
             To_Lower(Item => Window_Atrributes_Type'Image(Name)),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result =
        "1" then
         return TRUE;
      end if;
      return FALSE;
   end Get_Attribute;

   function Get_Attribute(Window: Tk_Widget) return Alpha_Type is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script =>
             "wm attributes " & Tk_Path_Name(Widgt => Window) & " -alpha",
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   begin
      if Result'Length = 0 then
         return 1.0;
      end if;
      return Alpha_Type'Value(Result);
   end Get_Attribute;

   function Get_Attribute(Window: Tk_Widget) return Window_Types is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script =>
             "wm attributes " & Tk_Path_Name(Widgt => Window) & " -type",
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   begin
      if Result'Length = 0 then
         return NONE;
      end if;
      return Window_Types'Value(Result);
   end Get_Attribute;

   function Get_Attribute(Window: Tk_Widget) return Color_Type is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script =>
             "wm attributes " & Tk_Path_Name(Widgt => Window) &
             " -transparentcolor",
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   begin
      if Result'Length = 0 then
         return Empty_Color;
      end if;
      if Result(Result'First) /= '#' then
         return
           Rgb
             (Color_Name => Colors_Names_Value(Image => Result),
              Window => Window);
      end if;
      if Result'Length = 10 then
         return Color: Color_Type := Empty_Color do
            Color.Red := Color_Range'Value(Result(2 .. 4)) * 257;
            Color.Green := Color_Range'Value(Result(5 .. 7)) * 257;
            Color.Blue := Color_Range'Value(Result(8 .. 10)) * 257;
         end return;
      end if;
      return Empty_Color;
   end Get_Attribute;

   procedure Set_Client(Window: Tk_Widget; Name: Tcl_String) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm client " & Tk_Path_Name(Widgt => Window) & " " &
           To_String(Source => Name),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Client;

   function Get_Color_Map_Windows(Window: Tk_Widget) return Array_List is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
   begin
      return
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script =>
                  "wm colormapwindows " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   end Get_Color_Map_Windows;

   procedure Set_Color_Map_Windows
     (Window: Tk_Widget; Widgets: Widgets_Array) is
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
   end Set_Color_Map_Windows;

   procedure Set_Command(Window: Tk_Widget; Wm_Command: Tcl_String) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm command " & Tk_Path_Name(Widgt => Window) & " " &
           To_String(Source => Wm_Command),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Command;

   procedure Deiconify(Window: Tk_Widget) is
   begin
      Tcl_Eval
        (Tcl_Script => "wm deiconify " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window));
   end Deiconify;

   function Get_Focus_Model(Window: Tk_Widget) return Focus_Model_Types is
   begin
      if Tcl_Eval
          (Tcl_Script => "wm focusmodel " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result =
        "passive" then
         return PASSIVE;
      end if;
      return ACTIVE;
   end Get_Focus_Model;

   procedure Set_Focus_Model(Window: Tk_Widget; Model: Focus_Model_Types) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm focusmodel " & Tk_Path_Name(Widgt => Window) & " " &
           To_Lower(Item => Focus_Model_Types'Image(Model)),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Focus_Model;

   procedure Forget(Window: Tk_Widget) is
   begin
      Tcl_Eval
        (Tcl_Script => "wm forget " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window));
   end Forget;

   function Get_Frame(Window: Tk_Widget) return Tk_Window is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "wm frame " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   begin
      if Result'Length > 0 then
         return
           Tk_Window
             (System'To_Address
                (Integer'Value("16#" & Result(3 .. Result'Last) & "#")));
      end if;
      return Null_Window;
   end Get_Frame;

   function Get_Geometry(Window: Tk_Widget) return Window_Geometry is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "wm geometry " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
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
   end Get_Geometry;

   procedure Set_Geometry
     (Window: Tk_Widget; Width, Height: Positive; X, Y: Natural) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm geometry " & Tk_Path_Name(Widgt => Window) & " " & "=" &
           Trim(Source => Positive'Image(Width), Side => Left) & "x" &
           Trim(Source => Positive'Image(Height), Side => Left) & "+" &
           Trim(Source => Natural'Image(X), Side => Left) & "+" &
           Trim(Source => Natural'Image(Y), Side => Left),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Geometry;

   procedure Set_Geometry(Window: Tk_Widget; Width, Height: Positive) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm geometry " & Tk_Path_Name(Widgt => Window) & " " & "=" &
           Trim(Source => Positive'Image(Width), Side => Left) & "x" &
           Trim(Source => Positive'Image(Height), Side => Left),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Geometry;

   procedure Set_Geometry_Position(Window: Tk_Widget; X, Y: Natural) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm geometry " & Tk_Path_Name(Widgt => Window) & " " & "+" &
           Trim(Source => Natural'Image(X), Side => Left) & "+" &
           Trim(Source => Natural'Image(Y), Side => Left),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Geometry_Position;

   function Get_Grid(Window: Tk_Widget) return Window_Grid_Geometry is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "wm grid " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter)
               .Result,
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
   end Get_Grid;

   procedure Set_Grid
     (Window: Tk_Widget;
      Base_Width, Base_Height, Width_Inc, Height_Inc: Positive) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm grid " & Tk_Path_Name(Widgt => Window) &
           Positive'Image(Base_Width) & Positive'Image(Base_Height) &
           Positive'Image(Width_Inc) & Positive'Image(Height_Inc),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Grid;

   procedure Set_Group(Window: Tk_Widget; Path_Name: Tcl_String) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm group " & Tk_Path_Name(Widgt => Window) & " " &
           To_Ada_String(Source => Path_Name),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Group;

   procedure Set_Icon_Bitmap(Window: Tk_Widget; Bitmap: Tcl_String) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm iconbitmap " & Tk_Path_Name(Widgt => Window) & " " &
           To_Ada_String(Source => Bitmap),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Icon_Bitmap;

   procedure Iconify(Window: Tk_Widget) is
   begin
      Tcl_Eval
        (Tcl_Script => "wm iconify " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window));
   end Iconify;

   procedure Set_Icon_Mask(Window: Tk_Widget; Bitmap: Tcl_String) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm iconmask " & Tk_Path_Name(Widgt => Window) & " " &
           To_Ada_String(Source => Bitmap),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Icon_Mask;

   procedure Set_Icon_Name(Window: Tk_Widget; New_Name: Tcl_String) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm iconname " & Tk_Path_Name(Widgt => Window) & " " &
           To_Ada_String(Source => New_Name),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Icon_Name;

   procedure Set_Icon_Photo
     (Window: Tk_Widget; Images: Array_List; Default: Boolean := False) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm iconphoto " & Tk_Path_Name(Widgt => Window) & " " &
           (if Default then "-default " else "") & Merge_List(List => Images),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Icon_Photo;

   function Get_Icon_Position(Window: Tk_Widget) return Point_Position is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script =>
                  "wm iconposition " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   begin
      if Result'Length = 0 then
         return Empty_Point_Position;
      end if;
      return Icon_Pos: Point_Position := Empty_Point_Position do
         Icon_Pos.X :=
           Extended_Natural'Value(To_Ada_String(Source => Result(1)));
         Icon_Pos.Y :=
           Extended_Natural'Value(To_Ada_String(Source => Result(2)));
      end return;
   end Get_Icon_Position;

   procedure Set_Icon_Position(Window: Tk_Widget; X, Y: Natural) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm iconposition " & Tk_Path_Name(Widgt => Window) &
           Natural'Image(X) & Natural'Image(Y),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Icon_Position;

   procedure Reset_Icon_Position(Window: Tk_Widget) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm iconposition " & Tk_Path_Name(Widgt => Window) & " {} {}",
         Interpreter => Tk_Interp(Widgt => Window));
   end Reset_Icon_Position;

   function Get_Icon_Window(Window: Tk_Widget) return Tk_Toplevel is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Path_Name: constant String :=
        Tcl_Eval
          (Tcl_Script => "wm iconwindow " & Tk_Path_Name(Widgt => Window),
           Interpreter => Interpreter)
          .Result;
   begin
      if Path_Name'Length = 0 then
         return Null_Widget;
      end if;
      return
        Get_Widget
          (Path_Name =>
             Tcl_Eval
               (Tcl_Script => "wm iconwindow " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   end Get_Icon_Window;

   procedure Set_Icon_Window(Window, New_Icon_Window: Tk_Toplevel) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm iconwindow " & Tk_Path_Name(Widgt => Window) & " " &
           Tk_Path_Name(Widgt => New_Icon_Window),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Icon_Window;

   procedure Manage(Window: Tk_Widget) is
   begin
      Tcl_Eval
        (Tcl_Script => "wm manage " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window));
   end Manage;

   function Get_Max_Size(Window: Tk_Widget) return Window_Size is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "wm maxsize " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   begin
      return Current_Size: Window_Size := Empty_Window_Size do
         Current_Size.Width := Natural'Value(To_String(Source => Result(1)));
         Current_Size.Height := Natural'Value(To_String(Source => Result(2)));
      end return;
   end Get_Max_Size;

   procedure Set_Max_Size(Window: Tk_Widget; Width, Height: Positive) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm maxsize " & Tk_Path_Name(Widgt => Window) &
           Positive'Image(Width) & Positive'Image(Height),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Max_Size;

   function Get_Min_Size(Window: Tk_Widget) return Window_Size is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "wm minsize " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   begin
      return Current_Size: Window_Size := Empty_Window_Size do
         Current_Size.Width := Natural'Value(To_String(Source => Result(1)));
         Current_Size.Height := Natural'Value(To_String(Source => Result(2)));
      end return;
   end Get_Min_Size;

   procedure Set_Min_Size(Window: Tk_Widget; Width, Height: Positive) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm minsize " & Tk_Path_Name(Widgt => Window) &
           Positive'Image(Width) & Positive'Image(Height),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Min_Size;

   procedure Set_Override_Redirect(Window: Tk_Widget; Override: Boolean) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm overrideredirect " & Tk_Path_Name(Widgt => Window) & " " &
           (if Override then "1" else "0"),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Override_Redirect;

   function Get_Position_From(Window: Tk_Widget) return Position_From_Value is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "wm positionfrom " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   begin
      if Result'Length = 0 then
         return Default_Position_From;
      end if;
      return Position_From_Value'Value(Result);
   end Get_Position_From;

   procedure Set_Position_From
     (Window: Tk_Widget; Who: Position_From_Value := Default_Position_From) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm positionfrom " & Tk_Path_Name(Widgt => Window) & " " &
           To_Lower(Item => Position_From_Value'Image(Who)),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Position_From;

   function Get_Protocols(Window: Tk_Widget) return Array_List is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
   begin
      return
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "wm protocol " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   end Get_Protocols;

   procedure Set_Protocol
     (Window: Tk_Widget; Name: String; New_Command: Tcl_String) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm protocol " & Tk_Path_Name(Widgt => Window) & " " & Name & " " &
           To_String(Source => New_Command),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Protocol;

   function Get_Resizable(Window: Tk_Widget) return Resizable_Data is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "wm resizable " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   begin
      return Resizable_Result: Resizable_Data := Default_Resizable_Data do
         Resizable_Result.Width := (if Result(1) = "0" then False else True);
         Resizable_Result.Height := (if Result(2) = "0" then False else True);
      end return;
   end Get_Resizable;

   procedure Set_Resizable(Window: Tk_Widget; Width, Height: Boolean) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm resizable " & Tk_Path_Name(Widgt => Window) & " " &
           (if Width then "1" else "0") & " " & (if Height then "1" else "0"),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Resizable;

   function Get_Size_From(Window: Tk_Widget) return Position_From_Value is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "wm sizefrom " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   begin
      if Result'Length = 0 then
         return Default_Position_From;
      end if;
      return Position_From_Value'Value(Result);
   end Get_Size_From;

   procedure Set_Size_From
     (Window: Tk_Widget; Who: Position_From_Value := Default_Position_From) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm sizefrom " & Tk_Path_Name(Widgt => Window) & " " &
           To_Lower(Item => Position_From_Value'Image(Who)),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Size_From;

   function Get_Stack_Order(Window: Tk_Widget) return Widgets_Array is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result: constant Array_List :=
        Split_List
          (List =>
             Tcl_Eval
               (Tcl_Script => "wm stackorder " & Tk_Path_Name(Widgt => Window),
                Interpreter => Interpreter)
               .Result,
           Interpreter => Interpreter);
   begin
      return
        Widgets: Widgets_Array (Result'Range) := (others => Null_Widget) do
         Set_Widgets_Array_Loop :
         for I in Result'Range loop
            Widgets(I) :=
              Get_Widget
                (Path_Name => To_String(Source => Result(I)),
                 Interpreter => Interpreter);
         end loop Set_Widgets_Array_Loop;
      end return;
   end Get_Stack_Order;

   function Get_State(Window: Tk_Widget) return Window_States is
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "wm state " & Tk_Path_Name(Widgt => Window),
           Interpreter => Tk_Interp(Widgt => Window))
          .Result;
   begin
      if Result'Length = 0 then
         return NORMAL;
      end if;
      return Window_States'Value(Result);
   end Get_State;

   procedure Set_State
     (Window: Tk_Widget; New_State: Window_States := Default_Window_State) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm state " & Tk_Path_Name(Widgt => Window) & " " &
           To_Lower(Item => Window_States'Image(New_State)),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_State;

   procedure Set_Title(Window: Tk_Widget; New_Title: Tcl_String) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm title " & Tk_Path_Name(Widgt => Window) & " " &
           To_String(Source => New_Title),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Title;

   function Get_Transient(Window: Tk_Widget) return Tk_Widget is
      Interpreter: constant Tcl_Interpreter := Tk_Interp(Widgt => Window);
      Result: constant String :=
        Tcl_Eval
          (Tcl_Script => "wm transient " & Tk_Path_Name(Widgt => Window),
           Interpreter => Interpreter)
          .Result;
   begin
      if Result'Length = 0 then
         return Null_Widget;
      end if;
      return Get_Widget(Path_Name => Result, Interpreter => Interpreter);
   end Get_Transient;

   procedure Set_Transient(Window, Master: Tk_Widget) is
   begin
      Tcl_Eval
        (Tcl_Script =>
           "wm transient " & Tk_Path_Name(Widgt => Window) & " " &
           Tk_Path_Name(Widgt => Master),
         Interpreter => Tk_Interp(Widgt => Window));
   end Set_Transient;

   procedure Withdraw(Window: Tk_Widget) is
   begin
      Tcl_Eval
        (Tcl_Script => "wm withdraw " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window));
   end Withdraw;

end Tk.Wm;
