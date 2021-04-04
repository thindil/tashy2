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
with Tk.Widget; use Tk.Widget;

package Tk.Wm is

   type Window_Manager_Types is (X11, WINDOWS, MACOSX);

   type Alpha_Type is digits 2 range -1.0 .. 1.0;

   Default_Alpha: constant Alpha_Type := 1.0;

   type Window_Types is
     (DESKTOP, DOCK, TOOLBAR, MENU, UTILITY, SPLASH, DIALOG, DROPDOWN_MENU,
      POPUP_MENU, TOOLTIP, NOTIFICATION, COMBO, DND, NORMAL);

   Default_Window_Type: constant Window_Types := NORMAL;

   type Window_Attributes_Data(WM_Type: Window_Manager_Types := X11) is record
      Alpha: Alpha_Type;
      Full_Screen: Extended_Boolean;
      Topmost: Extended_Boolean;
      case WM_Type is
         when X11 =>
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

   Default_Window_Attributes: constant Window_Attributes_Data :=
     Window_Attributes_Data'(others => <>);

   type Focus_Model_Types is (ACTIVE, PASSIVE);

   Default_Focus_Model: constant Focus_Model_Types := ACTIVE;

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

   procedure Aspect
     (Window: Tk_Widget;
      Min_Numer, Min_Denom, Max_Numer, Max_Denom: Natural) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Aspect", Mode => Nominal);

   function Aspect(Window: Tk_Widget) return Bbox_Array with
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

   function Get_Attribute
     (Window: Tk_Widget; Name: String) return Tcl_String with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Wm_Get_Attribute", Mode => Nominal);

   function Get_Attribute
     (Window: Tk_Widget; Name: String) return Extended_Boolean with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Wm_Get_Attribute2", Mode => Nominal);

   function Get_Attribute
     (Window: Tk_Widget; Name: String) return Alpha_Type with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Wm_Get_Attribute3", Mode => Nominal);

   function Get_Attribute
     (Window: Tk_Widget; Name: String) return Window_Types with
      Pre => Window /= Null_Widget and Name'Length > 0,
      Test_Case => (Name => "Test_Wm_Get_Attribute4", Mode => Nominal);

   function Client(Window: Tk_Widget) return String with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Client", Mode => Nominal);

   procedure Client(Window: Tk_Widget; Name: Tcl_String) with
      Pre => Window /= Null_Widget and Length(Name) > 0,
      Test_Case => (Name => "Test_Wm_Client2", Mode => Nominal);

   function Color_Map_Windows(Window: Tk_Widget) return Array_List with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Color_Map_Windows", Mode => Nominal);

   procedure Color_Map_Windows(Window: Tk_Widget; Windows: Widgets_Array) with
      Pre => Window /= Null_Widget and Windows /= Empty_Widgets_Array,
      Test_Case => (Name => "Test_Wm_Color_Map_Windows2", Mode => Nominal);

   function Command(Window: Tk_Widget) return Tcl_String with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Command", Mode => Nominal);

   procedure Command(Window: Tk_Widget; Command: Tcl_String) with
      Pre => Window /= Null_Widget and Length(Command) > 0,
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
      Base_Width, Base_Height, Width_Inc, Height_Inc: Extended_Natural :=
        -1) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Grid2", Mode => Nominal);

   function Group(Window: Tk_Widget) return String with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Group", Mode => Nominal);

   procedure Group(Window: Tk_Widget; Path_Name: Tcl_String) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Group2", Mode => Nominal);

   function Icon_Bitmap(Window: Tk_Widget) return String with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Bitmap", Mode => Nominal);

   procedure Icon_Bitmap(Window: Tk_Widget; Bitmap: Tcl_String) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Bitmap2", Mode => Nominal);

   procedure Iconify(Window: Tk_Widget) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Iconify", Mode => Nominal);

   function Icon_Mask(Window: Tk_Widget) return String with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Mask", Mode => Nominal);

   procedure Icon_Mask(Window: Tk_Widget; Bitmap: Tcl_String) with
      Pre => Window /= Null_Widget,
      Test_Case => (Name => "Test_Wm_Icon_Mask2", Mode => Nominal);

end Tk.Wm;
