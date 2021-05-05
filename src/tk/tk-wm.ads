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

with Tcl.Lists; use Tcl.Lists;
with Tcl.Strings; use Tcl.Strings;
with Tk.TopLevel; use Tk.TopLevel;
with Tk.Widget; use Tk.Widget;

package Tk.Wm is

   --## rule off REDUCEABLE_SCOPE
   type Window_Manager_Types is (X_11, WINDOWS, MACOSX);

   Default_Window_Manager: constant Window_Manager_Types := X_11;

   type Alpha_Type is digits 2 range -1.0 .. 1.0 with
      Default_Value => 1.0;

   Default_Alpha: constant Alpha_Type := 1.0;

   type Window_Types is
     (DESKTOP, DOCK, TOOLBAR, MENU, UTILITY, SPLASH, DIALOG, DROPDOWN_MENU,
      POPUP_MENU, TOOLTIP, NOTIFICATION, COMBO, DND, NORMAL, NONE) with
      Default_Value => NONE;

   Default_Window_Type: constant Window_Types := NONE;

   type Window_Attributes_Data
     (Wm_Type: Window_Manager_Types := Default_Window_Manager) is record
      Alpha: Alpha_Type;
      Full_Screen: Extended_Boolean;
      Topmost: Extended_Boolean;
      case Wm_Type is
         when X_11 =>
            Window_Type: Window_Types;
            Zoomed: Extended_Boolean;
         when WINDOWS =>
            Disabled: Extended_Boolean;
            Tool_Window: Extended_Boolean;
            Transparent_Color: Tcl_String;
         when MACOSX =>
            Modified: Extended_Boolean;
            Notify: Extended_Boolean;
            Title_Path: Tcl_String;
            Transparent: Extended_Boolean;
      end case;
   end record;

   Empty_Window_Attributes: constant Window_Attributes_Data := (others => <>);

   type Focus_Model_Types is (ACTIVE, PASSIVE);

   Default_Focus_Model: constant Focus_Model_Types := PASSIVE;

   type Window_Geometry is record
      Width: Natural;
      Height: Natural;
      X: Natural;
      Y: Natural;
   end record;

   Empty_Window_Geometry: constant Window_Geometry :=
     Window_Geometry'(others => <>);

   type Window_Grid_Geometry is record
      Base_Width: Natural;
      Base_Height: Natural;
      Width_Inc: Natural;
      Height_Inc: Natural;
   end record;

   Empty_Window_Grid_Geometry: constant Window_Grid_Geometry :=
     Window_Grid_Geometry'(others => <>);

   type Window_Position is record
      X: Natural;
      Y: Natural;
   end record;

   Empty_Window_Position: constant Window_Position :=
     Window_Position'(others => <>);

   type Aspect_Data is record
      Min_Numer: Natural;
      Min_Denom: Natural;
      Max_Numer: Natural;
      Max_Denom: Natural;
   end record;

   Empty_Aspect_Data: constant Aspect_Data := (others => <>);

   type Window_Size is record
      Width: Natural;
      Height: Natural;
   end record;

   Empty_Window_Size: constant Window_Size := (others => <>);

   type Position_From_Value is (USER, PROGRAM);

   Default_Position_From: constant Position_From_Value := PROGRAM;

   type Resizable_Data is record
      Width: Boolean;
      Height: Boolean;
   end record;

   Default_Resizable_Data: constant Resizable_Data := (others => <>);

   type Window_States is (NORMAL, ICONIC, WITHDRAWN, ICON, ZOOMED);

   Default_Window_State: constant Window_States := NORMAL;

   procedure Aspect
     (Window: Tk_Toplevel;
      Min_Numer, Min_Denom, Max_Numer, Max_Denom: Natural) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Aspect", Mode => Nominal);

   function Aspect(Window: Tk_Toplevel) return Aspect_Data with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Aspect2", Mode => Nominal);

   function Get_Attributes
     (Window: Tk_Widget) return Window_Attributes_Data with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Get_Attributes", Mode => Nominal);

   procedure Set_Attributes
     (Window: Tk_Widget; Attributes_Data: Window_Attributes_Data) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Set_Attributes", Mode => Nominal);

   function Get_Attribute(Window: Tk_Widget; Name: String) return Tcl_String is
     (To_Tcl_String
        (Source =>
           Tcl_Eval
             (Tcl_Script =>
                "wm attributes " & Tk_Path_Name(Widgt => Window) & " -" & Name,
              Interpreter => Tk_Interp(Widgt => Window)))) with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Wm_Get_Attribute", Mode => Nominal);

   function Get_Attribute
     (Window: Tk_Widget; Name: String) return Extended_Boolean with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Wm_Get_Attribute2", Mode => Nominal);

   function Get_Attribute(Window: Tk_Widget; Name: String) return Alpha_Type is
     (Alpha_Type'Value
        (Tcl_Eval
           (Tcl_Script =>
              "wm attributes " & Tk_Path_Name(Widgt => Window) & " -" & Name,
            Interpreter => Tk_Interp(Widgt => Window)))) with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Wm_Get_Attribute3", Mode => Nominal);

   function Get_Attribute
     (Window: Tk_Widget; Name: String) return Window_Types is
     (Window_Types'Value
        (Tcl_Eval
           (Tcl_Script =>
              "wm attributes " & Tk_Path_Name(Widgt => Window) & " -" & Name,
            Interpreter => Tk_Interp(Widgt => Window)))) with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Wm_Get_Attribute4", Mode => Nominal);

   function Client(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "wm client " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Client", Mode => Nominal);

   procedure Client(Window: Tk_Widget; Name: Tcl_String) with
      Pre => Window /= Null_Widget and Length(Source => Name) > 0,
      Test_Case => (Name => "Test_Wm_Client2", Mode => Nominal);

   function Color_Map_Windows(Window: Tk_Widget) return Array_List with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Color_Map_Windows", Mode => Nominal);

   procedure Color_Map_Windows(Window: Tk_Widget; Widgets: Widgets_Array) with
      Pre => Window /= Null_Widget and Widgets /= Empty_Widgets_Array,
      Test_Case => (Name => "Test_Wm_Color_Map_Windows2", Mode => Nominal);

   function Command(Window: Tk_Widget) return Tcl_String is
     (To_Tcl_String
        (Source =>
           Tcl_Eval
             (Tcl_Script => "wm command " & Tk_Path_Name(Widgt => Window),
              Interpreter => Tk_Interp(Widgt => Window)))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Command", Mode => Nominal);

   procedure Command(Window: Tk_Widget; Wm_Command: Tcl_String) with
      Pre => Window /= Null_Widget and Length(Source => Wm_Command) > 0,
      Test_Case => (Name => "Test_Wm_Command2", Mode => Nominal);

   procedure Deiconify(Window: Tk_Widget) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Deiconify", Mode => Nominal);

   function Focus_Model(Window: Tk_Widget) return Focus_Model_Types with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Focus_Model", Mode => Nominal);

   procedure Focus_Model(Window: Tk_Widget; Model: Focus_Model_Types) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Focus_Model2", Mode => Nominal);

   procedure Forget(Window: Tk_Widget) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Forget", Mode => Nominal);

   function Frame(Window: Tk_Widget) return Tk_Window with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Frame", Mode => Nominal);

   function Geometry(Window: Tk_Widget) return Window_Geometry with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Geometry", Mode => Nominal);

   procedure Geometry
     (Window: Tk_Widget; Width, Height, X, Y: Extended_Natural := -1) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Geometry2", Mode => Nominal);

   function Grid(Window: Tk_Widget) return Window_Grid_Geometry with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Grid", Mode => Nominal);

   procedure Grid
     (Window: Tk_Widget;
      Base_Width, Base_Height, Width_Inc, Height_Inc: Positive) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Grid2", Mode => Nominal);

   function Group(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "wm group " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Group", Mode => Nominal);

   procedure Group(Window: Tk_Widget; Path_Name: Tcl_String) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Group2", Mode => Nominal);

   function Icon_Bitmap(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "wm iconbitmap " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Bitmap", Mode => Nominal);

   procedure Icon_Bitmap(Window: Tk_Widget; Bitmap: Tcl_String) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Bitmap2", Mode => Nominal);

   procedure Iconify(Window: Tk_Widget) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Iconify", Mode => Nominal);

   function Icon_Mask(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "wm iconmask " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Mask", Mode => Nominal);

   procedure Icon_Mask(Window: Tk_Widget; Bitmap: Tcl_String) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Mask2", Mode => Nominal);

   function Icon_Name(Window: Tk_Widget) return String is
     (Tcl_Eval
        (Tcl_Script => "wm iconname " & Tk_Path_Name(Widgt => Window),
         Interpreter => Tk_Interp(Widgt => Window))) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Name", Mode => Nominal);

   procedure Icon_Name(Window: Tk_Widget; New_Name: Tcl_String) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Name2", Mode => Nominal);

   procedure Icon_Photo
     (Window: Tk_Widget; Images: Array_List; Default: Boolean := False) with
      Pre => Window /= Null_Widget and Images'Length > 0,
      Test_Case => (Name => "Test_Wm_Icon_Photo", Mode => Nominal);

   function Icon_Position(Window: Tk_Widget) return Window_Position with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Position", Mode => Nominal);

   procedure Icon_Position(Window: Tk_Widget; X, Y: Extended_Natural) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Position2", Mode => Nominal);

   function Icon_Window(Window: Tk_Widget) return Tk_Toplevel with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Window", Mode => Nominal);

   procedure Icon_Window(Window, New_Icon_Window: Tk_Toplevel) with
      Pre => Window /= Null_Widget and New_Icon_Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Window2", Mode => Nominal);

   procedure Manage(Window: Tk_Widget) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Manage", Mode => Nominal);

   function Max_Size(Window: Tk_Widget) return Window_Size with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Max_Size", Mode => Nominal);

   procedure Max_Size(Window: Tk_Widget; New_Size: Window_Size) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Max_Size2", Mode => Nominal);

   function Min_Size(Window: Tk_Widget) return Window_Size with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Min_Size", Mode => Nominal);

   procedure Min_Size(Window: Tk_Widget; New_Size: Window_Size) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Min_Size2", Mode => Nominal);

   function Override_Redirect(Window: Tk_Widget) return Boolean with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Override_Redirect", Mode => Nominal);

   procedure Override_Redirect(Window: Tk_Widget; Override: Boolean) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Override_Redirect", Mode => Nominal);

   function Position_From(Window: Tk_Widget) return Position_From_Value with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Position_From", Mode => Nominal);

   procedure Position_From
     (Window: Tk_Widget;
      Who: Position_From_Value := Default_Position_From) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Position_From2", Mode => Nominal);

   function Protocol(Window: Tk_Widget) return Array_List with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Protocol", Mode => Nominal);

   function Protocol(Window: Tk_Widget; Name: String) return String with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Wm_Protocol2", Mode => Nominal);

   procedure Protocol
     (Window: Tk_Widget; Name: String; Command: Tcl_String) with
      Pre => Window /= Null_Widget and Name'Length > 0 and Length(Command) > 0,
      Test_Case => (Name => "Test_Wm_Protocol3", Mode => Nominal);

   function Resizable(Window: Tk_Widget) return Resizable_Data with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Resizable", Mode => Nominal);

   procedure Resizable(Window: Tk_Widget; Width, Height: Boolean) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Resizable2", Mode => Nominal);

   function Size_From(Window: Tk_Widget) return Position_From_Value with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Size_From", Mode => Nominal);

   procedure Size_From
     (Window: Tk_Widget;
      Who: Position_From_Value := Default_Position_From) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Size_From2", Mode => Nominal);

   function Stack_Order(Window: Tk_Widget) return Widgets_Array with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Stack_Order", Mode => Nominal);

   function Stack_Order
     (Window, Second_Window: Tk_Widget; Above: Boolean := True)
      return Boolean with
      Pre => Window /= Null_Widget and Second_Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Stack_Order2", Mode => Nominal);

   function State(Window: Tk_Widget) return Window_States with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_State", Mode => Nominal);

   procedure State
     (Window: Tk_Widget; New_State: Window_States := Default_Window_State) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_State2", Mode => Nominal);

   function Title(Window: Tk_Widget) return Tcl_String with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Title", Mode => Nominal);

   procedure Title(Window: Tk_Widget; New_Title: Tcl_String) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Title2", Mode => Nominal);

   function Transient(Window: Tk_Widget) return Tk_Widget with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Transient", Mode => Nominal);

   procedure Transient(Window, Master: Tk_Widget) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Transient2", Mode => Nominal);

   procedure Withdraw(Window: Tk_Widget) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Withdraw", Mode => Nominal);

   --## rule on REDUCEABLE_SCOPE
end Tk.Wm;
