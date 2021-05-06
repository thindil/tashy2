--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Wm.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Ada.Environment_Variables; use Ada.Environment_Variables;
with Tcl.Variables; use Tcl.Variables;
with Tk.Button; use Tk.Button;
with Tk.Frame; use Tk.Frame;
with Tk.Grid; use Tk.Grid;
with Tk.MainWindow; use Tk.MainWindow;
with Tk.TopLevel; use Tk.TopLevel;

--  begin read only
--  end read only
package body Tk.Wm.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Aspect_a5b4d0_4b5997
     (Window: Tk_Toplevel;
      Min_Numer, Min_Denom, Max_Numer, Max_Denom: Natural) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Aspect test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Aspect
        (Window, Min_Numer, Min_Denom, Max_Numer, Max_Denom);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Aspect test commitment violated");
      end;
   end Wrap_Test_Aspect_a5b4d0_4b5997;
--  end read only

--  begin read only
   procedure Test_1_Aspect_test_wm_aspect(Gnattest_T: in out Test);
   procedure Test_Aspect_a5b4d0_4b5997(Gnattest_T: in out Test) renames
     Test_1_Aspect_test_wm_aspect;
--  id:2.2/a5b4d0bd0c5bfd55/Aspect/1/0/test_wm_aspect/
   procedure Test_1_Aspect_test_wm_aspect(Gnattest_T: in out Test) is
      procedure Aspect
        (Window: Tk_Toplevel;
         Min_Numer, Min_Denom, Max_Numer, Max_Denom: Natural) renames
        Wrap_Test_Aspect_a5b4d0_4b5997;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Aspect(Get_Main_Window, 10, 10, 20, 20);
      Assert
        (Aspect(Get_Main_Window).Min_Numer = 10,
         "Failed to set aspect for the selected widget.");

--  begin read only
   end Test_1_Aspect_test_wm_aspect;
--  end read only

--  begin read only
   function Wrap_Test_Aspect_d213ed_d6b574
     (Window: Tk_Toplevel) return Aspect_Data is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Aspect2 test requirement violated");
      end;
      declare
         Test_Aspect_d213ed_d6b574_Result: constant Aspect_Data :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Aspect(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Aspect2 test commitment violated");
         end;
         return Test_Aspect_d213ed_d6b574_Result;
      end;
   end Wrap_Test_Aspect_d213ed_d6b574;
--  end read only

--  begin read only
   procedure Test_2_Aspect_test_wm_aspect2(Gnattest_T: in out Test);
   procedure Test_Aspect_d213ed_d6b574(Gnattest_T: in out Test) renames
     Test_2_Aspect_test_wm_aspect2;
--  id:2.2/d213edf401f929ff/Aspect/0/0/test_wm_aspect2/
   procedure Test_2_Aspect_test_wm_aspect2(Gnattest_T: in out Test) is
      function Aspect(Window: Tk_Toplevel) return Aspect_Data renames
        Wrap_Test_Aspect_d213ed_d6b574;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Aspect(Get_Main_Window, 20, 20, 30, 30);
      Assert
        (Aspect(Get_Main_Window).Min_Denom = 20,
         "Failed to get aspect for the selected widget.");

--  begin read only
   end Test_2_Aspect_test_wm_aspect2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Attributes_0c5f59_7e1726
     (Window: Tk_Widget) return Window_Attributes_Data is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Get_Attributes test requirement violated");
      end;
      declare
         Test_Get_Attributes_0c5f59_7e1726_Result: constant Window_Attributes_Data :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Attributes(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Get_Attributes test commitment violated");
         end;
         return Test_Get_Attributes_0c5f59_7e1726_Result;
      end;
   end Wrap_Test_Get_Attributes_0c5f59_7e1726;
--  end read only

--  begin read only
   procedure Test_Get_Attributes_test_wm_get_attributes
     (Gnattest_T: in out Test);
   procedure Test_Get_Attributes_0c5f59_7e1726(Gnattest_T: in out Test) renames
     Test_Get_Attributes_test_wm_get_attributes;
--  id:2.2/0c5f59e3145d7736/Get_Attributes/1/0/test_wm_get_attributes/
   procedure Test_Get_Attributes_test_wm_get_attributes
     (Gnattest_T: in out Test) is
      function Get_Attributes
        (Window: Tk_Widget) return Window_Attributes_Data renames
        Wrap_Test_Get_Attributes_0c5f59_7e1726;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Window_Manager: constant Window_Manager_Types :=
        (if
           Tcl_Get_Var2(Var_Name => "tcl_platform", Index_Name => "os") =
           "Windows"
         then WINDOWS
         elsif
           Tcl_Get_Var2(Var_Name => "tcl_platform", Index_Name => "os") =
           "Darwin"
         then MACOSX
         else X_11);
      Attributes: Window_Attributes_Data (Window_Manager) :=
        (Alpha => 0.5, others => <>);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Attributes(Get_Main_Window, Attributes);
      Assert
        (Get_Attributes(Get_Main_Window).Alpha = 0.5,
         "Failed to get alpha attribute for the main window");
      if Window_Manager = X_11 then
         Attributes.Window_Type := DESKTOP;
         Set_Attributes(Get_Main_Window, Attributes);
         Assert
           (Get_Attributes(Get_Main_Window).Window_Type = DESKTOP,
            "Failed to get window type attribute for the main window in X11 window manager");
      end if;

--  begin read only
   end Test_Get_Attributes_test_wm_get_attributes;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Attributes_58cf2d_d28502
     (Window: Tk_Widget; Attributes_Data: Window_Attributes_Data) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Set_Attributes test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Attributes
        (Window, Attributes_Data);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Set_Attributes test commitment violated");
      end;
   end Wrap_Test_Set_Attributes_58cf2d_d28502;
--  end read only

--  begin read only
   procedure Test_Set_Attributes_test_wm_set_attributes
     (Gnattest_T: in out Test);
   procedure Test_Set_Attributes_58cf2d_d28502(Gnattest_T: in out Test) renames
     Test_Set_Attributes_test_wm_set_attributes;
--  id:2.2/58cf2dc484de7f83/Set_Attributes/1/0/test_wm_set_attributes/
   procedure Test_Set_Attributes_test_wm_set_attributes
     (Gnattest_T: in out Test) is
      procedure Set_Attributes
        (Window: Tk_Widget; Attributes_Data: Window_Attributes_Data) renames
        Wrap_Test_Set_Attributes_58cf2d_d28502;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Window_Manager: constant Window_Manager_Types :=
        (if
           Tcl_Get_Var2(Var_Name => "tcl_platform", Index_Name => "os") =
           "Windows"
         then WINDOWS
         elsif
           Tcl_Get_Var2(Var_Name => "tcl_platform", Index_Name => "os") =
           "Darwin"
         then MACOSX
         else X_11);
      Attributes: Window_Attributes_Data (Window_Manager) :=
        (Alpha => 0.3, others => <>);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Attributes(Get_Main_Window, Attributes);
      Assert
        (Get_Attributes(Get_Main_Window).Alpha = 0.3,
         "Failed to set alpha attribute for the main window");
      if Window_Manager = X_11 then
         Attributes.Window_Type := DOCK;
         Set_Attributes(Get_Main_Window, Attributes);
         Assert
           (Get_Attributes(Get_Main_Window).Window_Type = DOCK,
            "Failed to set window type attribute for the main window in X11 window manager");
      end if;

--  begin read only
   end Test_Set_Attributes_test_wm_set_attributes;
--  end read only

--  begin read only
   function Wrap_Test_Get_Attribute_278e4a_747c75
     (Window: Tk_Widget; Name: String) return Tcl_String is
   begin
      begin
         pragma Assert(Window /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Get_Attribute test requirement violated");
      end;
      declare
         Test_Get_Attribute_278e4a_747c75_Result: constant Tcl_String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Attribute
             (Window, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Get_Attribute test commitment violated");
         end;
         return Test_Get_Attribute_278e4a_747c75_Result;
      end;
   end Wrap_Test_Get_Attribute_278e4a_747c75;
--  end read only

--  begin read only
   procedure Test_1_Get_Attribute_test_wm_get_attribute
     (Gnattest_T: in out Test);
   procedure Test_Get_Attribute_278e4a_747c75(Gnattest_T: in out Test) renames
     Test_1_Get_Attribute_test_wm_get_attribute;
--  id:2.2/278e4a69996ed047/Get_Attribute/1/0/test_wm_get_attribute/
   procedure Test_1_Get_Attribute_test_wm_get_attribute
     (Gnattest_T: in out Test) is
      function Get_Attribute
        (Window: Tk_Widget; Name: String) return Tcl_String renames
        Wrap_Test_Get_Attribute_278e4a_747c75;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Attribute(Get_Main_Window, "alpha") = To_Tcl_String("0.3"),
         "Failed to get widget attribute as Tcl_String");

--  begin read only
   end Test_1_Get_Attribute_test_wm_get_attribute;
--  end read only

--  begin read only
   function Wrap_Test_Get_Attribute_c2eb34_2dc50d
     (Window: Tk_Widget; Name: String) return Extended_Boolean is
   begin
      begin
         pragma Assert(Window /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Get_Attribute2 test requirement violated");
      end;
      declare
         Test_Get_Attribute_c2eb34_2dc50d_Result: constant Extended_Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Attribute
             (Window, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Get_Attribute2 test commitment violated");
         end;
         return Test_Get_Attribute_c2eb34_2dc50d_Result;
      end;
   end Wrap_Test_Get_Attribute_c2eb34_2dc50d;
--  end read only

--  begin read only
   procedure Test_2_Get_Attribute_test_wm_get_attribute2
     (Gnattest_T: in out Test);
   procedure Test_Get_Attribute_c2eb34_2dc50d(Gnattest_T: in out Test) renames
     Test_2_Get_Attribute_test_wm_get_attribute2;
--  id:2.2/c2eb34bc8a089909/Get_Attribute/0/0/test_wm_get_attribute2/
   procedure Test_2_Get_Attribute_test_wm_get_attribute2
     (Gnattest_T: in out Test) is
      function Get_Attribute
        (Window: Tk_Widget; Name: String) return Extended_Boolean renames
        Wrap_Test_Get_Attribute_c2eb34_2dc50d;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Attribute(Get_Main_Window, "fullscreen") = FALSE,
         "Failed to get widget attribute as Extended_Boolean");

--  begin read only
   end Test_2_Get_Attribute_test_wm_get_attribute2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Attribute_bcffd5_2122fe
     (Window: Tk_Widget; Name: String) return Alpha_Type is
   begin
      begin
         pragma Assert(Window /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Get_Attribute3 test requirement violated");
      end;
      declare
         Test_Get_Attribute_bcffd5_2122fe_Result: constant Alpha_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Attribute
             (Window, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Get_Attribute3 test commitment violated");
         end;
         return Test_Get_Attribute_bcffd5_2122fe_Result;
      end;
   end Wrap_Test_Get_Attribute_bcffd5_2122fe;
--  end read only

--  begin read only
   procedure Test_3_Get_Attribute_test_wm_get_attribute3
     (Gnattest_T: in out Test);
   procedure Test_Get_Attribute_bcffd5_2122fe(Gnattest_T: in out Test) renames
     Test_3_Get_Attribute_test_wm_get_attribute3;
--  id:2.2/bcffd51657631dd6/Get_Attribute/0/0/test_wm_get_attribute3/
   procedure Test_3_Get_Attribute_test_wm_get_attribute3
     (Gnattest_T: in out Test) is
      function Get_Attribute
        (Window: Tk_Widget; Name: String) return Alpha_Type renames
        Wrap_Test_Get_Attribute_bcffd5_2122fe;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Attribute(Get_Main_Window, "alpha") = 0.3,
         "Failed to get widget attribute as Alpha_Type");

--  begin read only
   end Test_3_Get_Attribute_test_wm_get_attribute3;
--  end read only

--  begin read only
   function Wrap_Test_Get_Attribute_731b81_56b1b4
     (Window: Tk_Widget; Name: String) return Window_Types is
   begin
      begin
         pragma Assert(Window /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Get_Attribute4 test requirement violated");
      end;
      declare
         Test_Get_Attribute_731b81_56b1b4_Result: constant Window_Types :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Attribute
             (Window, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Get_Attribute4 test commitment violated");
         end;
         return Test_Get_Attribute_731b81_56b1b4_Result;
      end;
   end Wrap_Test_Get_Attribute_731b81_56b1b4;
--  end read only

--  begin read only
   procedure Test_4_Get_Attribute_test_wm_get_attribute4
     (Gnattest_T: in out Test);
   procedure Test_Get_Attribute_731b81_56b1b4(Gnattest_T: in out Test) renames
     Test_4_Get_Attribute_test_wm_get_attribute4;
--  id:2.2/731b81dfb4e254bd/Get_Attribute/0/0/test_wm_get_attribute4/
   procedure Test_4_Get_Attribute_test_wm_get_attribute4
     (Gnattest_T: in out Test) is
      function Get_Attribute
        (Window: Tk_Widget; Name: String) return Window_Types renames
        Wrap_Test_Get_Attribute_731b81_56b1b4;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Window_Manager: constant Window_Manager_Types :=
        (if
           Tcl_Get_Var2(Var_Name => "tcl_platform", Index_Name => "os") =
           "Windows"
         then WINDOWS
         elsif
           Tcl_Get_Var2(Var_Name => "tcl_platform", Index_Name => "os") =
           "Darwin"
         then MACOSX
         else X_11);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      if Window_Manager /= X_11 then
         Assert(True, "This option is available only on X11 window manager");
         return;
      end if;
      Assert
        (Get_Attributes(Get_Main_Window).Window_Type = DOCK,
         "Failed to get window type attribute for the main window");

--  begin read only
   end Test_4_Get_Attribute_test_wm_get_attribute4;
--  end read only

--  begin read only
   function Wrap_Test_Client_fda74e_991856(Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Client test requirement violated");
      end;
      declare
         Test_Client_fda74e_991856_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Client(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Client test commitment violated");
         end;
         return Test_Client_fda74e_991856_Result;
      end;
   end Wrap_Test_Client_fda74e_991856;
--  end read only

--  begin read only
   procedure Test_1_Client_test_wm_client(Gnattest_T: in out Test);
   procedure Test_Client_fda74e_991856(Gnattest_T: in out Test) renames
     Test_1_Client_test_wm_client;
--  id:2.2/fda74eda7a2c4a96/Client/1/0/test_wm_client/
   procedure Test_1_Client_test_wm_client(Gnattest_T: in out Test) is
      function Client(Window: Tk_Widget) return String renames
        Wrap_Test_Client_fda74e_991856;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Client(Get_Main_Window) = "",
         "Failed to get client name for main window.");

--  begin read only
   end Test_1_Client_test_wm_client;
--  end read only

--  begin read only
   procedure Wrap_Test_Client_563118_d2f7a7
     (Window: Tk_Widget; Name: Tcl_String) is
   begin
      begin
         pragma Assert(Window /= Null_Widget and Length(Source => Name) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Client2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Client(Window, Name);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Client2 test commitment violated");
      end;
   end Wrap_Test_Client_563118_d2f7a7;
--  end read only

--  begin read only
   procedure Test_2_Client_test_wm_client2(Gnattest_T: in out Test);
   procedure Test_Client_563118_d2f7a7(Gnattest_T: in out Test) renames
     Test_2_Client_test_wm_client2;
--  id:2.2/563118a630e4082c/Client/0/0/test_wm_client2/
   procedure Test_2_Client_test_wm_client2(Gnattest_T: in out Test) is
      procedure Client(Window: Tk_Widget; Name: Tcl_String) renames
        Wrap_Test_Client_563118_d2f7a7;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Client(Get_Main_Window, To_Tcl_String("test"));
      Assert
        (Client(Get_Main_Window) = "test",
         "Failed to set the client name for main window.");

--  begin read only
   end Test_2_Client_test_wm_client2;
--  end read only

--  begin read only
   function Wrap_Test_Color_Map_Windows_4e073e_798c45
     (Window: Tk_Widget) return Array_List is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Color_Map_Windows test requirement violated");
      end;
      declare
         Test_Color_Map_Windows_4e073e_798c45_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Color_Map_Windows
             (Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Color_Map_Windows test commitment violated");
         end;
         return Test_Color_Map_Windows_4e073e_798c45_Result;
      end;
   end Wrap_Test_Color_Map_Windows_4e073e_798c45;
--  end read only

--  begin read only
   procedure Test_1_Color_Map_Windows_test_wm_color_map_windows
     (Gnattest_T: in out Test);
   procedure Test_Color_Map_Windows_4e073e_798c45
     (Gnattest_T: in out Test) renames
     Test_1_Color_Map_Windows_test_wm_color_map_windows;
--  id:2.2/4e073e342386674a/Color_Map_Windows/1/0/test_wm_color_map_windows/
   procedure Test_1_Color_Map_Windows_test_wm_color_map_windows
     (Gnattest_T: in out Test) is
      function Color_Map_Windows(Window: Tk_Widget) return Array_List renames
        Wrap_Test_Color_Map_Windows_4e073e_798c45;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Color_Map_Windows(Get_Main_Window) = Empty_Array_List,
         "Failed to get color map windows for main window.");

--  begin read only
   end Test_1_Color_Map_Windows_test_wm_color_map_windows;
--  end read only

--  begin read only
   procedure Wrap_Test_Color_Map_Windows_81bc98_93136d
     (Window: Tk_Widget; Widgets: Widgets_Array) is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget and Widgets /= Empty_Widgets_Array);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Color_Map_Windows2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Color_Map_Windows
        (Window, Widgets);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Color_Map_Windows2 test commitment violated");
      end;
   end Wrap_Test_Color_Map_Windows_81bc98_93136d;
--  end read only

--  begin read only
   procedure Test_2_Color_Map_Windows_test_wm_color_map_windows2
     (Gnattest_T: in out Test);
   procedure Test_Color_Map_Windows_81bc98_93136d
     (Gnattest_T: in out Test) renames
     Test_2_Color_Map_Windows_test_wm_color_map_windows2;
--  id:2.2/81bc988c26eb22cd/Color_Map_Windows/0/0/test_wm_color_map_windows2/
   procedure Test_2_Color_Map_Windows_test_wm_color_map_windows2
     (Gnattest_T: in out Test) is
      procedure Color_Map_Windows
        (Window: Tk_Widget; Widgets: Widgets_Array) renames
        Wrap_Test_Color_Map_Windows_81bc98_93136d;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button, Button2: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".test", Default_Button_Options);
      Add(Button);
      Create(Button2, ".test2", Default_Button_Options);
      Add(Button2);
      Color_Map_Windows(Get_Main_Window, (1 => Button, 2 => Button2));
      Assert
        (Color_Map_Windows(Get_Main_Window)'Length = 2,
         "Failed to get list of color map windows for main window.");
      Destroy(Button);
      Destroy(Button2);

--  begin read only
   end Test_2_Color_Map_Windows_test_wm_color_map_windows2;
--  end read only

--  begin read only
   function Wrap_Test_Command_769e81_cb0619
     (Window: Tk_Widget) return Tcl_String is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Command test requirement violated");
      end;
      declare
         Test_Command_769e81_cb0619_Result: constant Tcl_String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Command(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Command test commitment violated");
         end;
         return Test_Command_769e81_cb0619_Result;
      end;
   end Wrap_Test_Command_769e81_cb0619;
--  end read only

--  begin read only
   procedure Test_1_Command_test_wm_command(Gnattest_T: in out Test);
   procedure Test_Command_769e81_cb0619(Gnattest_T: in out Test) renames
     Test_1_Command_test_wm_command;
--  id:2.2/769e81a2f1ab775e/Command/1/0/test_wm_command/
   procedure Test_1_Command_test_wm_command(Gnattest_T: in out Test) is
      function Command(Window: Tk_Widget) return Tcl_String renames
        Wrap_Test_Command_769e81_cb0619;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (To_Ada_String(Command(Get_Main_Window))'Length = 0,
         "Failed to get WM_COMMAND property for main window.");

--  begin read only
   end Test_1_Command_test_wm_command;
--  end read only

--  begin read only
   procedure Wrap_Test_Command_7808c4_7c33cf
     (Window: Tk_Widget; Wm_Command: Tcl_String) is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget and Length(Source => Wm_Command) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Command2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Command(Window, Wm_Command);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Command2 test commitment violated");
      end;
   end Wrap_Test_Command_7808c4_7c33cf;
--  end read only

--  begin read only
   procedure Test_2_Command_test_wm_command2(Gnattest_T: in out Test);
   procedure Test_Command_7808c4_7c33cf(Gnattest_T: in out Test) renames
     Test_2_Command_test_wm_command2;
--  id:2.2/7808c4f1398ab62c/Command/0/0/test_wm_command2/
   procedure Test_2_Command_test_wm_command2(Gnattest_T: in out Test) is
      procedure Command(Window: Tk_Widget; Wm_Command: Tcl_String) renames
        Wrap_Test_Command_7808c4_7c33cf;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Command(Get_Main_Window, To_Tcl_String("my command"));
      Assert
        (To_Ada_String(Command(Get_Main_Window)) = "my command",
         "Failed to set WM_COMMAND property for main window.");

--  begin read only
   end Test_2_Command_test_wm_command2;
--  end read only

--  begin read only
   procedure Wrap_Test_Deiconify_46ab19_2f30b1(Window: Tk_Widget) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Deiconify test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Deiconify(Window);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Deiconify test commitment violated");
      end;
   end Wrap_Test_Deiconify_46ab19_2f30b1;
--  end read only

--  begin read only
   procedure Test_Deiconify_test_wm_deiconify(Gnattest_T: in out Test);
   procedure Test_Deiconify_46ab19_2f30b1(Gnattest_T: in out Test) renames
     Test_Deiconify_test_wm_deiconify;
--  id:2.2/46ab19bd383b155f/Deiconify/1/0/test_wm_deiconify/
   procedure Test_Deiconify_test_wm_deiconify(Gnattest_T: in out Test) is
      procedure Deiconify(Window: Tk_Widget) renames
        Wrap_Test_Deiconify_46ab19_2f30b1;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Deiconify(Get_Main_Window);
      Assert(True, "This test can only crash.");

--  begin read only
   end Test_Deiconify_test_wm_deiconify;
--  end read only

--  begin read only
   function Wrap_Test_Focus_Model_e88243_857661
     (Window: Tk_Widget) return Focus_Model_Types is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Focus_Model test requirement violated");
      end;
      declare
         Test_Focus_Model_e88243_857661_Result: constant Focus_Model_Types :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Focus_Model(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Focus_Model test commitment violated");
         end;
         return Test_Focus_Model_e88243_857661_Result;
      end;
   end Wrap_Test_Focus_Model_e88243_857661;
--  end read only

--  begin read only
   procedure Test_1_Focus_Model_test_wm_focus_model(Gnattest_T: in out Test);
   procedure Test_Focus_Model_e88243_857661(Gnattest_T: in out Test) renames
     Test_1_Focus_Model_test_wm_focus_model;
--  id:2.2/e882432ac45f0c64/Focus_Model/1/0/test_wm_focus_model/
   procedure Test_1_Focus_Model_test_wm_focus_model(Gnattest_T: in out Test) is
      function Focus_Model(Window: Tk_Widget) return Focus_Model_Types renames
        Wrap_Test_Focus_Model_e88243_857661;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Focus_Model(Get_Main_Window) = PASSIVE,
         "Failed to get default focus model for main window.");

--  begin read only
   end Test_1_Focus_Model_test_wm_focus_model;
--  end read only

--  begin read only
   procedure Wrap_Test_Focus_Model_93cac7_9f50c8
     (Window: Tk_Widget; Model: Focus_Model_Types) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Focus_Model2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Focus_Model(Window, Model);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Focus_Model2 test commitment violated");
      end;
   end Wrap_Test_Focus_Model_93cac7_9f50c8;
--  end read only

--  begin read only
   procedure Test_2_Focus_Model_test_wm_focus_model2(Gnattest_T: in out Test);
   procedure Test_Focus_Model_93cac7_9f50c8(Gnattest_T: in out Test) renames
     Test_2_Focus_Model_test_wm_focus_model2;
--  id:2.2/93cac7f252e54aa6/Focus_Model/0/0/test_wm_focus_model2/
   procedure Test_2_Focus_Model_test_wm_focus_model2
     (Gnattest_T: in out Test) is
      procedure Focus_Model
        (Window: Tk_Widget; Model: Focus_Model_Types) renames
        Wrap_Test_Focus_Model_93cac7_9f50c8;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Focus_Model(Get_Main_Window, ACTIVE);
      Assert
        (Focus_Model(Get_Main_Window) = ACTIVE,
         "Failed to set default focus model for main window.");
      Focus_Model(Get_Main_Window, PASSIVE);

--  begin read only
   end Test_2_Focus_Model_test_wm_focus_model2;
--  end read only

--  begin read only
   procedure Wrap_Test_Forget_7f8bc2_846bd1(Window: Tk_Widget) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Forget test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Forget(Window);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Forget test commitment violated");
      end;
   end Wrap_Test_Forget_7f8bc2_846bd1;
--  end read only

--  begin read only
   procedure Test_Forget_test_wm_forget(Gnattest_T: in out Test);
   procedure Test_Forget_7f8bc2_846bd1(Gnattest_T: in out Test) renames
     Test_Forget_test_wm_forget;
--  id:2.2/7f8bc223a819d0d3/Forget/1/0/test_wm_forget/
   procedure Test_Forget_test_wm_forget(Gnattest_T: in out Test) is
      procedure Forget(Window: Tk_Widget) renames
        Wrap_Test_Forget_7f8bc2_846bd1;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".test", Default_Button_Options);
      Forget(Button);
      Assert(True, "This test can only crash.");
      Destroy(Button);

--  begin read only
   end Test_Forget_test_wm_forget;
--  end read only

--  begin read only
   function Wrap_Test_Frame_5d04b9_b86ec4
     (Window: Tk_Widget) return Tk_Window is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Frame test requirement violated");
      end;
      declare
         Test_Frame_5d04b9_b86ec4_Result: constant Tk_Window :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Frame(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Frame test commitment violated");
         end;
         return Test_Frame_5d04b9_b86ec4_Result;
      end;
   end Wrap_Test_Frame_5d04b9_b86ec4;
--  end read only

--  begin read only
   procedure Test_Frame_test_wm_frame(Gnattest_T: in out Test);
   procedure Test_Frame_5d04b9_b86ec4(Gnattest_T: in out Test) renames
     Test_Frame_test_wm_frame;
--  id:2.2/5d04b96316e1b554/Frame/1/0/test_wm_frame/
   procedure Test_Frame_test_wm_frame(Gnattest_T: in out Test) is
      function Frame(Window: Tk_Widget) return Tk_Window renames
        Wrap_Test_Frame_5d04b9_b86ec4;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Frame_Window: Tk_Toplevel;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Frame_Window, ".test", Default_Toplevel_Create_Options);
      Assert
        (Frame(Frame_Window) = Tk_Window_Id(Frame_Window),
         "Failed to get frame for Tk toplevel.");
      Destroy(Frame_Window);

--  begin read only
   end Test_Frame_test_wm_frame;
--  end read only

--  begin read only
   function Wrap_Test_Geometry_ba948b_4f4f37
     (Window: Tk_Widget) return Window_Geometry is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Geometry test requirement violated");
      end;
      declare
         Test_Geometry_ba948b_4f4f37_Result: constant Window_Geometry :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Geometry(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Geometry test commitment violated");
         end;
         return Test_Geometry_ba948b_4f4f37_Result;
      end;
   end Wrap_Test_Geometry_ba948b_4f4f37;
--  end read only

--  begin read only
   procedure Test_1_Geometry_test_wm_geometry(Gnattest_T: in out Test);
   procedure Test_Geometry_ba948b_4f4f37(Gnattest_T: in out Test) renames
     Test_1_Geometry_test_wm_geometry;
--  id:2.2/ba948bb004a8b879/Geometry/1/0/test_wm_geometry/
   procedure Test_1_Geometry_test_wm_geometry(Gnattest_T: in out Test) is
      function Geometry(Window: Tk_Widget) return Window_Geometry renames
        Wrap_Test_Geometry_ba948b_4f4f37;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Geometry(Get_Main_Window).Width > 0,
         "Failed to get height of the Tk main window.");

--  begin read only
   end Test_1_Geometry_test_wm_geometry;
--  end read only

--  begin read only
   procedure Wrap_Test_Geometry_d2a7fd_9bd66a
     (Window: Tk_Widget; Width, Height, X, Y: Extended_Natural := -1) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Geometry2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Geometry
        (Window, Width, Height, X, Y);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Geometry2 test commitment violated");
      end;
   end Wrap_Test_Geometry_d2a7fd_9bd66a;
--  end read only

--  begin read only
   procedure Test_2_Geometry_test_wm_geometry2(Gnattest_T: in out Test);
   procedure Test_Geometry_d2a7fd_9bd66a(Gnattest_T: in out Test) renames
     Test_2_Geometry_test_wm_geometry2;
--  id:2.2/d2a7fd27c35a0b1b/Geometry/0/0/test_wm_geometry2/
   procedure Test_2_Geometry_test_wm_geometry2(Gnattest_T: in out Test) is
      procedure Geometry
        (Window: Tk_Widget;
         Width, Height, X, Y: Extended_Natural := -1) renames
        Wrap_Test_Geometry_d2a7fd_9bd66a;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Geometry(Get_Main_Window, -1, -1, 10, 12);
      Assert
        (Geometry(Get_Main_Window).X = 10,
         "Failed to set geometry for Tk main window.");

--  begin read only
   end Test_2_Geometry_test_wm_geometry2;
--  end read only

--  begin read only
   function Wrap_Test_Grid_200f57_fc763d
     (Window: Tk_Widget) return Window_Grid_Geometry is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Grid test requirement violated");
      end;
      declare
         Test_Grid_200f57_fc763d_Result: constant Window_Grid_Geometry :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Grid(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Grid test commitment violated");
         end;
         return Test_Grid_200f57_fc763d_Result;
      end;
   end Wrap_Test_Grid_200f57_fc763d;
--  end read only

--  begin read only
   procedure Test_1_Grid_test_wm_grid(Gnattest_T: in out Test);
   procedure Test_Grid_200f57_fc763d(Gnattest_T: in out Test) renames
     Test_1_Grid_test_wm_grid;
--  id:2.2/200f578fdf4b8766/Grid/1/0/test_wm_grid/
   procedure Test_1_Grid_test_wm_grid(Gnattest_T: in out Test) is
      function Grid(Window: Tk_Widget) return Window_Grid_Geometry renames
        Wrap_Test_Grid_200f57_fc763d;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Grid(Get_Main_Window) = Empty_Window_Grid_Geometry,
         "Failed to get grid geometry for Tk main window.");

--  begin read only
   end Test_1_Grid_test_wm_grid;
--  end read only

--  begin read only
   procedure Wrap_Test_Grid_2fb8dc_1fe5bc
     (Window: Tk_Widget;
      Base_Width, Base_Height, Width_Inc, Height_Inc: Positive) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Grid2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Grid
        (Window, Base_Width, Base_Height, Width_Inc, Height_Inc);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Grid2 test commitment violated");
      end;
   end Wrap_Test_Grid_2fb8dc_1fe5bc;
--  end read only

--  begin read only
   procedure Test_2_Grid_test_wm_grid2(Gnattest_T: in out Test);
   procedure Test_Grid_2fb8dc_1fe5bc(Gnattest_T: in out Test) renames
     Test_2_Grid_test_wm_grid2;
--  id:2.2/2fb8dca433bc9116/Grid/0/0/test_wm_grid2/
   procedure Test_2_Grid_test_wm_grid2(Gnattest_T: in out Test) is
      procedure Grid
        (Window: Tk_Widget;
         Base_Width, Base_Height, Width_Inc, Height_Inc: Positive) renames
        Wrap_Test_Grid_2fb8dc_1fe5bc;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Grid(Get_Main_Window, 10, 10, 10, 10);
      Assert
        (Grid(Get_Main_Window).Base_Width = 10,
         "Failed to set grid geometry for Tk main window.");

--  begin read only
   end Test_2_Grid_test_wm_grid2;
--  end read only

--  begin read only
   function Wrap_Test_Group_928167_42ff38(Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Group test requirement violated");
      end;
      declare
         Test_Group_928167_42ff38_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Group(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Group test commitment violated");
         end;
         return Test_Group_928167_42ff38_Result;
      end;
   end Wrap_Test_Group_928167_42ff38;
--  end read only

--  begin read only
   procedure Test_1_Group_test_wm_group(Gnattest_T: in out Test);
   procedure Test_Group_928167_42ff38(Gnattest_T: in out Test) renames
     Test_1_Group_test_wm_group;
--  id:2.2/928167c7fa4c57eb/Group/1/0/test_wm_group/
   procedure Test_1_Group_test_wm_group(Gnattest_T: in out Test) is
      function Group(Window: Tk_Widget) return String renames
        Wrap_Test_Group_928167_42ff38;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Group(Get_Main_Window)'Length = 0,
         "Failed to get group of Tk main window.");

--  begin read only
   end Test_1_Group_test_wm_group;
--  end read only

--  begin read only
   procedure Wrap_Test_Group_fe3a0f_95a2e7
     (Window: Tk_Widget; Path_Name: Tcl_String) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Group2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Group(Window, Path_Name);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Group2 test commitment violated");
      end;
   end Wrap_Test_Group_fe3a0f_95a2e7;
--  end read only

--  begin read only
   procedure Test_2_Group_test_wm_group2(Gnattest_T: in out Test);
   procedure Test_Group_fe3a0f_95a2e7(Gnattest_T: in out Test) renames
     Test_2_Group_test_wm_group2;
--  id:2.2/fe3a0fc6d8be4b4e/Group/0/0/test_wm_group2/
   procedure Test_2_Group_test_wm_group2(Gnattest_T: in out Test) is
      procedure Group(Window: Tk_Widget; Path_Name: Tcl_String) renames
        Wrap_Test_Group_fe3a0f_95a2e7;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Group(Get_Main_Window, To_Tcl_String("."));
      Assert
        (Group(Get_Main_Window) = ".",
         "Failed to set group for the Tk main window.");

--  begin read only
   end Test_2_Group_test_wm_group2;
--  end read only

--  begin read only
   function Wrap_Test_Icon_Bitmap_51d509_127eea
     (Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Icon_Bitmap test requirement violated");
      end;
      declare
         Test_Icon_Bitmap_51d509_127eea_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Icon_Bitmap(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Bitmap test commitment violated");
         end;
         return Test_Icon_Bitmap_51d509_127eea_Result;
      end;
   end Wrap_Test_Icon_Bitmap_51d509_127eea;
--  end read only

--  begin read only
   procedure Test_1_Icon_Bitmap_test_wm_icon_bitmap(Gnattest_T: in out Test);
   procedure Test_Icon_Bitmap_51d509_127eea(Gnattest_T: in out Test) renames
     Test_1_Icon_Bitmap_test_wm_icon_bitmap;
--  id:2.2/51d509d88d1ce89d/Icon_Bitmap/1/0/test_wm_icon_bitmap/
   procedure Test_1_Icon_Bitmap_test_wm_icon_bitmap(Gnattest_T: in out Test) is
      function Icon_Bitmap(Window: Tk_Widget) return String renames
        Wrap_Test_Icon_Bitmap_51d509_127eea;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Icon_Bitmap(Get_Main_Window)'Length = 0,
         "Failed to get bitmap icon name for Tk main window.");

--  begin read only
   end Test_1_Icon_Bitmap_test_wm_icon_bitmap;
--  end read only

--  begin read only
   procedure Wrap_Test_Icon_Bitmap_93e489_31ebac
     (Window: Tk_Widget; Bitmap: Tcl_String) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Icon_Bitmap2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Icon_Bitmap(Window, Bitmap);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Bitmap2 test commitment violated");
      end;
   end Wrap_Test_Icon_Bitmap_93e489_31ebac;
--  end read only

--  begin read only
   procedure Test_2_Icon_Bitmap_test_wm_icon_bitmap2(Gnattest_T: in out Test);
   procedure Test_Icon_Bitmap_93e489_31ebac(Gnattest_T: in out Test) renames
     Test_2_Icon_Bitmap_test_wm_icon_bitmap2;
--  id:2.2/93e4891aaf3cd7e7/Icon_Bitmap/0/0/test_wm_icon_bitmap2/
   procedure Test_2_Icon_Bitmap_test_wm_icon_bitmap2
     (Gnattest_T: in out Test) is
      procedure Icon_Bitmap(Window: Tk_Widget; Bitmap: Tcl_String) renames
        Wrap_Test_Icon_Bitmap_93e489_31ebac;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Icon_Bitmap(Get_Main_Window, To_Tcl_String("info"));
      Assert
        (Icon_Bitmap(Get_Main_Window) = "info",
         "Failed to set icon bitmap for Tk main window.");

--  begin read only
   end Test_2_Icon_Bitmap_test_wm_icon_bitmap2;
--  end read only

--  begin read only
   procedure Wrap_Test_Iconify_b7aad2_844804(Window: Tk_Widget) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Iconify test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Iconify(Window);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Iconify test commitment violated");
      end;
   end Wrap_Test_Iconify_b7aad2_844804;
--  end read only

--  begin read only
   procedure Test_Iconify_test_wm_iconify(Gnattest_T: in out Test);
   procedure Test_Iconify_b7aad2_844804(Gnattest_T: in out Test) renames
     Test_Iconify_test_wm_iconify;
--  id:2.2/b7aad2fa62e9e5ad/Iconify/1/0/test_wm_iconify/
   procedure Test_Iconify_test_wm_iconify(Gnattest_T: in out Test) is
      procedure Iconify(Window: Tk_Widget) renames
        Wrap_Test_Iconify_b7aad2_844804;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Iconify(Get_Main_Window);
      Deiconify(Get_Main_Window);
      Assert(True, "This test can only crash.");

--  begin read only
   end Test_Iconify_test_wm_iconify;
--  end read only

--  begin read only
   function Wrap_Test_Icon_Mask_001121_818a6a
     (Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Icon_Mask test requirement violated");
      end;
      declare
         Test_Icon_Mask_001121_818a6a_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Icon_Mask(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Mask test commitment violated");
         end;
         return Test_Icon_Mask_001121_818a6a_Result;
      end;
   end Wrap_Test_Icon_Mask_001121_818a6a;
--  end read only

--  begin read only
   procedure Test_1_Icon_Mask_test_wm_icon_mask(Gnattest_T: in out Test);
   procedure Test_Icon_Mask_001121_818a6a(Gnattest_T: in out Test) renames
     Test_1_Icon_Mask_test_wm_icon_mask;
--  id:2.2/001121641610cf65/Icon_Mask/1/0/test_wm_icon_mask/
   procedure Test_1_Icon_Mask_test_wm_icon_mask(Gnattest_T: in out Test) is
      function Icon_Mask(Window: Tk_Widget) return String renames
        Wrap_Test_Icon_Mask_001121_818a6a;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Icon_Mask(Get_Main_Window)'Length = 0,
         "Failed to get icon mask for the Tk main window.");

--  begin read only
   end Test_1_Icon_Mask_test_wm_icon_mask;
--  end read only

--  begin read only
   procedure Wrap_Test_Icon_Mask_66e29a_b2153c
     (Window: Tk_Widget; Bitmap: Tcl_String) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Icon_Mask2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Icon_Mask(Window, Bitmap);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Mask2 test commitment violated");
      end;
   end Wrap_Test_Icon_Mask_66e29a_b2153c;
--  end read only

--  begin read only
   procedure Test_2_Icon_Mask_test_wm_icon_mask2(Gnattest_T: in out Test);
   procedure Test_Icon_Mask_66e29a_b2153c(Gnattest_T: in out Test) renames
     Test_2_Icon_Mask_test_wm_icon_mask2;
--  id:2.2/66e29abd9f996cc6/Icon_Mask/0/0/test_wm_icon_mask2/
   procedure Test_2_Icon_Mask_test_wm_icon_mask2(Gnattest_T: in out Test) is
      procedure Icon_Mask(Window: Tk_Widget; Bitmap: Tcl_String) renames
        Wrap_Test_Icon_Mask_66e29a_b2153c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Icon_Mask(Get_Main_Window, To_Tcl_String("error"));
      Assert
        (Icon_Mask(Get_Main_Window) = "error",
         "Failed to set icon mask for the Tk main window.");

--  begin read only
   end Test_2_Icon_Mask_test_wm_icon_mask2;
--  end read only

--  begin read only
   function Wrap_Test_Icon_Name_4b1072_55536b
     (Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Icon_Name test requirement violated");
      end;
      declare
         Test_Icon_Name_4b1072_55536b_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Icon_Name(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Name test commitment violated");
         end;
         return Test_Icon_Name_4b1072_55536b_Result;
      end;
   end Wrap_Test_Icon_Name_4b1072_55536b;
--  end read only

--  begin read only
   procedure Test_1_Icon_Name_test_wm_icon_name(Gnattest_T: in out Test);
   procedure Test_Icon_Name_4b1072_55536b(Gnattest_T: in out Test) renames
     Test_1_Icon_Name_test_wm_icon_name;
--  id:2.2/4b10726b4bbc5562/Icon_Name/1/0/test_wm_icon_name/
   procedure Test_1_Icon_Name_test_wm_icon_name(Gnattest_T: in out Test) is
      function Icon_Name(Window: Tk_Widget) return String renames
        Wrap_Test_Icon_Name_4b1072_55536b;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Icon_Name(Get_Main_Window)'Length = 0,
         "Failed to get icon name for the Tk main window.");

--  begin read only
   end Test_1_Icon_Name_test_wm_icon_name;
--  end read only

--  begin read only
   procedure Wrap_Test_Icon_Name_5bfbf7_3f7273
     (Window: Tk_Widget; New_Name: Tcl_String) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Icon_Name2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Icon_Name(Window, New_Name);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Name2 test commitment violated");
      end;
   end Wrap_Test_Icon_Name_5bfbf7_3f7273;
--  end read only

--  begin read only
   procedure Test_2_Icon_Name_test_wm_icon_name2(Gnattest_T: in out Test);
   procedure Test_Icon_Name_5bfbf7_3f7273(Gnattest_T: in out Test) renames
     Test_2_Icon_Name_test_wm_icon_name2;
--  id:2.2/5bfbf7fbde925267/Icon_Name/0/0/test_wm_icon_name2/
   procedure Test_2_Icon_Name_test_wm_icon_name2(Gnattest_T: in out Test) is
      procedure Icon_Name(Window: Tk_Widget; New_Name: Tcl_String) renames
        Wrap_Test_Icon_Name_5bfbf7_3f7273;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Icon_Name(Get_Main_Window, To_Tcl_String("test"));
      Assert
        (Icon_Name(Get_Main_Window) = "test",
         "Failed to set icon name for the Tk main window.");

--  begin read only
   end Test_2_Icon_Name_test_wm_icon_name2;
--  end read only

--  begin read only
   procedure Wrap_Test_Icon_Photo_69d087_a0feb6
     (Window: Tk_Widget; Images: Array_List; Default: Boolean := False) is
   begin
      begin
         pragma Assert(Window /= Null_Widget and Images'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Icon_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Icon_Photo
        (Window, Images, Default);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Photo test commitment violated");
      end;
   end Wrap_Test_Icon_Photo_69d087_a0feb6;
--  end read only

--  begin read only
   procedure Test_Icon_Photo_test_wm_icon_photo(Gnattest_T: in out Test);
   procedure Test_Icon_Photo_69d087_a0feb6(Gnattest_T: in out Test) renames
     Test_Icon_Photo_test_wm_icon_photo;
--  id:2.2/69d0876f3964fa43/Icon_Photo/1/0/test_wm_icon_photo/
   procedure Test_Icon_Photo_test_wm_icon_photo(Gnattest_T: in out Test) is
      procedure Icon_Photo
        (Window: Tk_Widget; Images: Array_List;
         Default: Boolean := False) renames
        Wrap_Test_Icon_Photo_69d087_a0feb6;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Icon_Photo(Get_Main_Window, Array_List'(1 => To_Tcl_String("image14")));
      Assert(True, "This test can only crash.");

--  begin read only
   end Test_Icon_Photo_test_wm_icon_photo;
--  end read only

--  begin read only
   function Wrap_Test_Icon_Position_1b8212_0e4e31
     (Window: Tk_Widget) return Window_Position is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Icon_Position test requirement violated");
      end;
      declare
         Test_Icon_Position_1b8212_0e4e31_Result: constant Window_Position :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Icon_Position(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Position test commitment violated");
         end;
         return Test_Icon_Position_1b8212_0e4e31_Result;
      end;
   end Wrap_Test_Icon_Position_1b8212_0e4e31;
--  end read only

--  begin read only
   procedure Test_1_Icon_Position_test_wm_icon_position
     (Gnattest_T: in out Test);
   procedure Test_Icon_Position_1b8212_0e4e31(Gnattest_T: in out Test) renames
     Test_1_Icon_Position_test_wm_icon_position;
--  id:2.2/1b8212c5114573a8/Icon_Position/1/0/test_wm_icon_position/
   procedure Test_1_Icon_Position_test_wm_icon_position
     (Gnattest_T: in out Test) is
      function Icon_Position(Window: Tk_Widget) return Window_Position renames
        Wrap_Test_Icon_Position_1b8212_0e4e31;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Icon_Position(Get_Main_Window, 10, 11);
      Assert
        (Icon_Position(Get_Main_Window).X = 10,
         "Failed to get icon position for main window.");

--  begin read only
   end Test_1_Icon_Position_test_wm_icon_position;
--  end read only

--  begin read only
   procedure Wrap_Test_Icon_Position_965e91_ebaaaa
     (Window: Tk_Widget; X, Y: Extended_Natural) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Icon_Position2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Icon_Position(Window, X, Y);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Position2 test commitment violated");
      end;
   end Wrap_Test_Icon_Position_965e91_ebaaaa;
--  end read only

--  begin read only
   procedure Test_2_Icon_Position_test_wm_icon_position2
     (Gnattest_T: in out Test);
   procedure Test_Icon_Position_965e91_ebaaaa(Gnattest_T: in out Test) renames
     Test_2_Icon_Position_test_wm_icon_position2;
--  id:2.2/965e91a0816b60dc/Icon_Position/0/0/test_wm_icon_position2/
   procedure Test_2_Icon_Position_test_wm_icon_position2
     (Gnattest_T: in out Test) is
      procedure Icon_Position
        (Window: Tk_Widget; X, Y: Extended_Natural) renames
        Wrap_Test_Icon_Position_965e91_ebaaaa;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Icon_Position(Get_Main_Window, 12, 13);
      Assert
        (Icon_Position(Get_Main_Window).X = 12,
         "Failed to set icon position for main window.");

--  begin read only
   end Test_2_Icon_Position_test_wm_icon_position2;
--  end read only

--  begin read only
   function Wrap_Test_Icon_Window_5eafd1_44e6ae
     (Window: Tk_Widget) return Tk_Toplevel is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Icon_Window test requirement violated");
      end;
      declare
         Test_Icon_Window_5eafd1_44e6ae_Result: constant Tk_Toplevel :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Icon_Window(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Window test commitment violated");
         end;
         return Test_Icon_Window_5eafd1_44e6ae_Result;
      end;
   end Wrap_Test_Icon_Window_5eafd1_44e6ae;
--  end read only

--  begin read only
   procedure Test_1_Icon_Window_test_wm_icon_window(Gnattest_T: in out Test);
   procedure Test_Icon_Window_5eafd1_44e6ae(Gnattest_T: in out Test) renames
     Test_1_Icon_Window_test_wm_icon_window;
--  id:2.2/5eafd152a3c4130a/Icon_Window/1/0/test_wm_icon_window/
   procedure Test_1_Icon_Window_test_wm_icon_window(Gnattest_T: in out Test) is
      function Icon_Window(Window: Tk_Widget) return Tk_Toplevel renames
        Wrap_Test_Icon_Window_5eafd1_44e6ae;
--  end read only

      pragma Unreferenced(Gnattest_T);
      IconWindow: Tk_Toplevel;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      IconWindow := Create(".test", Default_Toplevel_Create_Options);
      Icon_Window(Get_Main_Window, IconWindow);
      Assert
        (Icon_Window(Get_Main_Window) = IconWindow,
         "Failed to get icon window for main window");
      Destroy(IconWindow);

--  begin read only
   end Test_1_Icon_Window_test_wm_icon_window;
--  end read only

--  begin read only
   procedure Wrap_Test_Icon_Window_8ccb84_e657dc
     (Window, New_Icon_Window: Tk_Toplevel) is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget and New_Icon_Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Icon_Window2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Icon_Window
        (Window, New_Icon_Window);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Window2 test commitment violated");
      end;
   end Wrap_Test_Icon_Window_8ccb84_e657dc;
--  end read only

--  begin read only
   procedure Test_2_Icon_Window_test_wm_icon_window2(Gnattest_T: in out Test);
   procedure Test_Icon_Window_8ccb84_e657dc(Gnattest_T: in out Test) renames
     Test_2_Icon_Window_test_wm_icon_window2;
--  id:2.2/8ccb84d30893c538/Icon_Window/0/0/test_wm_icon_window2/
   procedure Test_2_Icon_Window_test_wm_icon_window2
     (Gnattest_T: in out Test) is
      procedure Icon_Window(Window, New_Icon_Window: Tk_Toplevel) renames
        Wrap_Test_Icon_Window_8ccb84_e657dc;
--  end read only

      pragma Unreferenced(Gnattest_T);
      IconWindow: Tk_Toplevel;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      IconWindow := Create(".test", Default_Toplevel_Create_Options);
      Icon_Window(Get_Main_Window, IconWindow);
      Assert
        (Icon_Window(Get_Main_Window) = IconWindow,
         "Failed to set icon window for main window");
      Destroy(IconWindow);

--  begin read only
   end Test_2_Icon_Window_test_wm_icon_window2;
--  end read only

--  begin read only
   procedure Wrap_Test_Manage_691f50_c53d0d(Window: Tk_Widget) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Manage test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Manage(Window);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Manage test commitment violated");
      end;
   end Wrap_Test_Manage_691f50_c53d0d;
--  end read only

--  begin read only
   procedure Test_Manage_test_wm_manage(Gnattest_T: in out Test);
   procedure Test_Manage_691f50_c53d0d(Gnattest_T: in out Test) renames
     Test_Manage_test_wm_manage;
--  id:2.2/691f50aadaddd631/Manage/1/0/test_wm_manage/
   procedure Test_Manage_test_wm_manage(Gnattest_T: in out Test) is
      procedure Manage(Window: Tk_Widget) renames
        Wrap_Test_Manage_691f50_c53d0d;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Frame: Tk_Frame;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Frame := Create(".myframe", Default_Frame_Create_Options);
      Manage(Frame);
      Assert(True, "This test can only crash.");
      Destroy(Frame);

--  begin read only
   end Test_Manage_test_wm_manage;
--  end read only

--  begin read only
   function Wrap_Test_Max_Size_35a7bd_4463a7
     (Window: Tk_Widget) return Window_Size is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Max_Size test requirement violated");
      end;
      declare
         Test_Max_Size_35a7bd_4463a7_Result: constant Window_Size :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Max_Size(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Max_Size test commitment violated");
         end;
         return Test_Max_Size_35a7bd_4463a7_Result;
      end;
   end Wrap_Test_Max_Size_35a7bd_4463a7;
--  end read only

--  begin read only
   procedure Test_1_Max_Size_test_wm_max_size(Gnattest_T: in out Test);
   procedure Test_Max_Size_35a7bd_4463a7(Gnattest_T: in out Test) renames
     Test_1_Max_Size_test_wm_max_size;
--  id:2.2/35a7bd60af3a2f9b/Max_Size/1/0/test_wm_max_size/
   procedure Test_1_Max_Size_test_wm_max_size(Gnattest_T: in out Test) is
      function Max_Size(Window: Tk_Widget) return Window_Size renames
        Wrap_Test_Max_Size_35a7bd_4463a7;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Max_Size(Get_Main_Window, (100, 100));
      Assert
        (Max_Size(Get_Main_Window).Width = 100,
         "Failed to get max size of Tk main window.");

--  begin read only
   end Test_1_Max_Size_test_wm_max_size;
--  end read only

--  begin read only
   procedure Wrap_Test_Max_Size_d91852_efa6b3
     (Window: Tk_Widget; New_Size: Window_Size) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Max_Size2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Max_Size(Window, New_Size);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Max_Size2 test commitment violated");
      end;
   end Wrap_Test_Max_Size_d91852_efa6b3;
--  end read only

--  begin read only
   procedure Test_2_Max_Size_test_wm_max_size2(Gnattest_T: in out Test);
   procedure Test_Max_Size_d91852_efa6b3(Gnattest_T: in out Test) renames
     Test_2_Max_Size_test_wm_max_size2;
--  id:2.2/d91852a86705cae9/Max_Size/0/0/test_wm_max_size2/
   procedure Test_2_Max_Size_test_wm_max_size2(Gnattest_T: in out Test) is
      procedure Max_Size(Window: Tk_Widget; New_Size: Window_Size) renames
        Wrap_Test_Max_Size_d91852_efa6b3;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Max_Size(Get_Main_Window, (200, 201));
      Assert
        (Max_Size(Get_Main_Window).Height = 201,
         "Failed to set max size of Tk main window.");

--  begin read only
   end Test_2_Max_Size_test_wm_max_size2;
--  end read only

--  begin read only
   function Wrap_Test_Min_Size_9ffcbc_7d5aa0
     (Window: Tk_Widget) return Window_Size is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Min_Size test requirement violated");
      end;
      declare
         Test_Min_Size_9ffcbc_7d5aa0_Result: constant Window_Size :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Min_Size(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Min_Size test commitment violated");
         end;
         return Test_Min_Size_9ffcbc_7d5aa0_Result;
      end;
   end Wrap_Test_Min_Size_9ffcbc_7d5aa0;
--  end read only

--  begin read only
   procedure Test_1_Min_Size_test_wm_min_size(Gnattest_T: in out Test);
   procedure Test_Min_Size_9ffcbc_7d5aa0(Gnattest_T: in out Test) renames
     Test_1_Min_Size_test_wm_min_size;
--  id:2.2/9ffcbc4a91fe793e/Min_Size/1/0/test_wm_min_size/
   procedure Test_1_Min_Size_test_wm_min_size(Gnattest_T: in out Test) is
      function Min_Size(Window: Tk_Widget) return Window_Size renames
        Wrap_Test_Min_Size_9ffcbc_7d5aa0;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Min_Size(Get_Main_Window, (100, 100));
      Assert
        (Min_Size(Get_Main_Window).Width = 100,
         "Failed to get min size of Tk main window.");

--  begin read only
   end Test_1_Min_Size_test_wm_min_size;
--  end read only

--  begin read only
   procedure Wrap_Test_Min_Size_9638c5_86115b
     (Window: Tk_Widget; New_Size: Window_Size) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Min_Size2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Min_Size(Window, New_Size);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Min_Size2 test commitment violated");
      end;
   end Wrap_Test_Min_Size_9638c5_86115b;
--  end read only

--  begin read only
   procedure Test_2_Min_Size_test_wm_min_size2(Gnattest_T: in out Test);
   procedure Test_Min_Size_9638c5_86115b(Gnattest_T: in out Test) renames
     Test_2_Min_Size_test_wm_min_size2;
--  id:2.2/9638c5259ce2a299/Min_Size/0/0/test_wm_min_size2/
   procedure Test_2_Min_Size_test_wm_min_size2(Gnattest_T: in out Test) is
      procedure Min_Size(Window: Tk_Widget; New_Size: Window_Size) renames
        Wrap_Test_Min_Size_9638c5_86115b;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Min_Size(Get_Main_Window, (200, 201));
      Assert
        (Min_Size(Get_Main_Window).Height = 201,
         "Failed to set min size of Tk main window.");

--  begin read only
   end Test_2_Min_Size_test_wm_min_size2;
--  end read only

--  begin read only
   function Wrap_Test_Override_Redirect_44db73_fdca84
     (Window: Tk_Widget) return Boolean is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Override_Redirect test requirement violated");
      end;
      declare
         Test_Override_Redirect_44db73_fdca84_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Override_Redirect
             (Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Override_Redirect test commitment violated");
         end;
         return Test_Override_Redirect_44db73_fdca84_Result;
      end;
   end Wrap_Test_Override_Redirect_44db73_fdca84;
--  end read only

--  begin read only
   procedure Test_1_Override_Redirect_test_wm_override_redirect
     (Gnattest_T: in out Test);
   procedure Test_Override_Redirect_44db73_fdca84
     (Gnattest_T: in out Test) renames
     Test_1_Override_Redirect_test_wm_override_redirect;
--  id:2.2/44db73585214744e/Override_Redirect/1/0/test_wm_override_redirect/
   procedure Test_1_Override_Redirect_test_wm_override_redirect
     (Gnattest_T: in out Test) is
      function Override_Redirect(Window: Tk_Widget) return Boolean renames
        Wrap_Test_Override_Redirect_44db73_fdca84;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (not Override_Redirect(Get_Main_Window),
         "Failed to get override redirect value for Tk main window.");

--  begin read only
   end Test_1_Override_Redirect_test_wm_override_redirect;
--  end read only

--  begin read only
   procedure Wrap_Test_Override_Redirect_1b76bc_fdca84
     (Window: Tk_Widget; Override: Boolean) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Override_Redirect test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Override_Redirect
        (Window, Override);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Override_Redirect test commitment violated");
      end;
   end Wrap_Test_Override_Redirect_1b76bc_fdca84;
--  end read only

--  begin read only
   procedure Test_2_Override_Redirect_test_wm_override_redirect
     (Gnattest_T: in out Test);
   procedure Test_Override_Redirect_1b76bc_fdca84
     (Gnattest_T: in out Test) renames
     Test_2_Override_Redirect_test_wm_override_redirect;
--  id:2.2/1b76bc0410270544/Override_Redirect/0/0/test_wm_override_redirect/
   procedure Test_2_Override_Redirect_test_wm_override_redirect
     (Gnattest_T: in out Test) is
      procedure Override_Redirect(Window: Tk_Widget; Override: Boolean) renames
        Wrap_Test_Override_Redirect_1b76bc_fdca84;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Override_Redirect(Get_Main_Window, True);
      Assert
        (Override_Redirect(Get_Main_Window),
         "Failed to set override redirect value for Tk main window.");
      Override_Redirect(Get_Main_Window, False);

--  begin read only
   end Test_2_Override_Redirect_test_wm_override_redirect;
--  end read only

--  begin read only
   function Wrap_Test_Position_From_20b302_48bfdf
     (Window: Tk_Widget) return Position_From_Value is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Position_From test requirement violated");
      end;
      declare
         Test_Position_From_20b302_48bfdf_Result: constant Position_From_Value :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Position_From(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Position_From test commitment violated");
         end;
         return Test_Position_From_20b302_48bfdf_Result;
      end;
   end Wrap_Test_Position_From_20b302_48bfdf;
--  end read only

--  begin read only
   procedure Test_1_Position_From_test_wm_position_from
     (Gnattest_T: in out Test);
   procedure Test_Position_From_20b302_48bfdf(Gnattest_T: in out Test) renames
     Test_1_Position_From_test_wm_position_from;
--  id:2.2/20b3027f5a7ae356/Position_From/1/0/test_wm_position_from/
   procedure Test_1_Position_From_test_wm_position_from
     (Gnattest_T: in out Test) is
      function Position_From
        (Window: Tk_Widget) return Position_From_Value renames
        Wrap_Test_Position_From_20b302_48bfdf;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Position_From(Get_Main_Window, Default_Position_From);
      Assert
        (Position_From(Get_Main_Window) = Default_Position_From,
         "Failed to get position from for Tk main window.");

--  begin read only
   end Test_1_Position_From_test_wm_position_from;
--  end read only

--  begin read only
   procedure Wrap_Test_Position_From_aaffd4_a97a4c
     (Window: Tk_Widget; Who: Position_From_Value := Default_Position_From) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Position_From2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Position_From(Window, Who);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Position_From2 test commitment violated");
      end;
   end Wrap_Test_Position_From_aaffd4_a97a4c;
--  end read only

--  begin read only
   procedure Test_2_Position_From_test_wm_position_from2
     (Gnattest_T: in out Test);
   procedure Test_Position_From_aaffd4_a97a4c(Gnattest_T: in out Test) renames
     Test_2_Position_From_test_wm_position_from2;
--  id:2.2/aaffd4e2abc359ed/Position_From/0/0/test_wm_position_from2/
   procedure Test_2_Position_From_test_wm_position_from2
     (Gnattest_T: in out Test) is
      procedure Position_From
        (Window: Tk_Widget;
         Who: Position_From_Value := Default_Position_From) renames
        Wrap_Test_Position_From_aaffd4_a97a4c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Position_From(Get_Main_Window, USER);
      Assert
        (Position_From(Get_Main_Window) = USER,
         "Failed to set position from for Tk main window.");

--  begin read only
   end Test_2_Position_From_test_wm_position_from2;
--  end read only

--  begin read only
   function Wrap_Test_Protocol_548901_4c2c40
     (Window: Tk_Widget) return Array_List is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Protocol test requirement violated");
      end;
      declare
         Test_Protocol_548901_4c2c40_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Protocol(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Protocol test commitment violated");
         end;
         return Test_Protocol_548901_4c2c40_Result;
      end;
   end Wrap_Test_Protocol_548901_4c2c40;
--  end read only

--  begin read only
   procedure Test_1_Protocol_test_wm_protocol(Gnattest_T: in out Test);
   procedure Test_Protocol_548901_4c2c40(Gnattest_T: in out Test) renames
     Test_1_Protocol_test_wm_protocol;
--  id:2.2/5489011eb5b824ea/Protocol/1/0/test_wm_protocol/
   procedure Test_1_Protocol_test_wm_protocol(Gnattest_T: in out Test) is
      function Protocol(Window: Tk_Widget) return Array_List renames
        Wrap_Test_Protocol_548901_4c2c40;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Protocol(Get_Main_Window)'Length = 0,
         "Failed to get default protocols for Tk main window.");

--  begin read only
   end Test_1_Protocol_test_wm_protocol;
--  end read only

--  begin read only
   function Wrap_Test_Protocol_f31455_f4acbb
     (Window: Tk_Widget; Name: String) return String is
   begin
      begin
         pragma Assert(Window /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Protocol2 test requirement violated");
      end;
      declare
         Test_Protocol_f31455_f4acbb_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Protocol(Window, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Protocol2 test commitment violated");
         end;
         return Test_Protocol_f31455_f4acbb_Result;
      end;
   end Wrap_Test_Protocol_f31455_f4acbb;
--  end read only

--  begin read only
   procedure Test_2_Protocol_test_wm_protocol2(Gnattest_T: in out Test);
   procedure Test_Protocol_f31455_f4acbb(Gnattest_T: in out Test) renames
     Test_2_Protocol_test_wm_protocol2;
--  id:2.2/f3145558fa44b9b4/Protocol/0/0/test_wm_protocol2/
   procedure Test_2_Protocol_test_wm_protocol2(Gnattest_T: in out Test) is
      function Protocol(Window: Tk_Widget; Name: String) return String renames
        Wrap_Test_Protocol_f31455_f4acbb;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Protocol(Get_Main_Window, "WM_TAKE_FOCUS", To_Tcl_String("puts hello"));
      Assert
        (Protocol(Get_Main_Window, "WM_TAKE_FOCUS") = "puts hello",
         "Failed to get command associated to WM_TAKE_FOCUS for Tk main window");

--  begin read only
   end Test_2_Protocol_test_wm_protocol2;
--  end read only

--  begin read only
   procedure Wrap_Test_Protocol_08ce2d_4c09c4
     (Window: Tk_Widget; Name: String; New_Command: Tcl_String) is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget and Name'Length > 0 and
            Length(Source => New_Command) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Protocol3 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Protocol
        (Window, Name, New_Command);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Protocol3 test commitment violated");
      end;
   end Wrap_Test_Protocol_08ce2d_4c09c4;
--  end read only

--  begin read only
   procedure Test_3_Protocol_test_wm_protocol3(Gnattest_T: in out Test);
   procedure Test_Protocol_08ce2d_4c09c4(Gnattest_T: in out Test) renames
     Test_3_Protocol_test_wm_protocol3;
--  id:2.2/08ce2daafbc89885/Protocol/0/0/test_wm_protocol3/
   procedure Test_3_Protocol_test_wm_protocol3(Gnattest_T: in out Test) is
      procedure Protocol
        (Window: Tk_Widget; Name: String; New_Command: Tcl_String) renames
        Wrap_Test_Protocol_08ce2d_4c09c4;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Protocol(Get_Main_Window, "WM_TAKE_FOCUS", To_Tcl_String("puts hello"));
      Assert
        (Protocol(Get_Main_Window, "WM_TAKE_FOCUS") = "puts hello",
         "Failed to set command associated to WM_TAKE_FOCUS for Tk main window");

--  begin read only
   end Test_3_Protocol_test_wm_protocol3;
--  end read only

--  begin read only
   function Wrap_Test_Resizable_4a4f98_2b8386
     (Window: Tk_Widget) return Resizable_Data is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Resizable test requirement violated");
      end;
      declare
         Test_Resizable_4a4f98_2b8386_Result: constant Resizable_Data :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Resizable(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Resizable test commitment violated");
         end;
         return Test_Resizable_4a4f98_2b8386_Result;
      end;
   end Wrap_Test_Resizable_4a4f98_2b8386;
--  end read only

--  begin read only
   procedure Test_1_Resizable_test_wm_resizable(Gnattest_T: in out Test);
   procedure Test_Resizable_4a4f98_2b8386(Gnattest_T: in out Test) renames
     Test_1_Resizable_test_wm_resizable;
--  id:2.2/4a4f98c7c6bf5c44/Resizable/1/0/test_wm_resizable/
   procedure Test_1_Resizable_test_wm_resizable(Gnattest_T: in out Test) is
      function Resizable(Window: Tk_Widget) return Resizable_Data renames
        Wrap_Test_Resizable_4a4f98_2b8386;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Resizable(Get_Main_Window).Height,
         "Failed to get resizable info for Tk main window.");

--  begin read only
   end Test_1_Resizable_test_wm_resizable;
--  end read only

--  begin read only
   procedure Wrap_Test_Resizable_70137c_b49918
     (Window: Tk_Widget; Width, Height: Boolean) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Resizable2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Resizable
        (Window, Width, Height);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Resizable2 test commitment violated");
      end;
   end Wrap_Test_Resizable_70137c_b49918;
--  end read only

--  begin read only
   procedure Test_2_Resizable_test_wm_resizable2(Gnattest_T: in out Test);
   procedure Test_Resizable_70137c_b49918(Gnattest_T: in out Test) renames
     Test_2_Resizable_test_wm_resizable2;
--  id:2.2/70137c9fb8c71010/Resizable/0/0/test_wm_resizable2/
   procedure Test_2_Resizable_test_wm_resizable2(Gnattest_T: in out Test) is
      procedure Resizable(Window: Tk_Widget; Width, Height: Boolean) renames
        Wrap_Test_Resizable_70137c_b49918;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Resizable(Get_Main_Window, True, False);
      Assert
        (not Resizable(Get_Main_Window).Height,
         "Failed to set resizable info for Tk main window.");

--  begin read only
   end Test_2_Resizable_test_wm_resizable2;
--  end read only

--  begin read only
   function Wrap_Test_Size_From_35c19a_7bb223
     (Window: Tk_Widget) return Position_From_Value is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Size_From test requirement violated");
      end;
      declare
         Test_Size_From_35c19a_7bb223_Result: constant Position_From_Value :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Size_From(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Size_From test commitment violated");
         end;
         return Test_Size_From_35c19a_7bb223_Result;
      end;
   end Wrap_Test_Size_From_35c19a_7bb223;
--  end read only

--  begin read only
   procedure Test_1_Size_From_test_wm_size_from(Gnattest_T: in out Test);
   procedure Test_Size_From_35c19a_7bb223(Gnattest_T: in out Test) renames
     Test_1_Size_From_test_wm_size_from;
--  id:2.2/35c19a68a2456fd8/Size_From/1/0/test_wm_size_from/
   procedure Test_1_Size_From_test_wm_size_from(Gnattest_T: in out Test) is
      function Size_From(Window: Tk_Widget) return Position_From_Value renames
        Wrap_Test_Size_From_35c19a_7bb223;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Size_From(Get_Main_Window) = Default_Position_From,
         "Failed to get default size from for Tk main window.");

--  begin read only
   end Test_1_Size_From_test_wm_size_from;
--  end read only

--  begin read only
   procedure Wrap_Test_Size_From_8b7927_bc3e6a
     (Window: Tk_Widget; Who: Position_From_Value := Default_Position_From) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Size_From2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Size_From(Window, Who);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Size_From2 test commitment violated");
      end;
   end Wrap_Test_Size_From_8b7927_bc3e6a;
--  end read only

--  begin read only
   procedure Test_2_Size_From_test_wm_size_from2(Gnattest_T: in out Test);
   procedure Test_Size_From_8b7927_bc3e6a(Gnattest_T: in out Test) renames
     Test_2_Size_From_test_wm_size_from2;
--  id:2.2/8b7927e33fde514a/Size_From/0/0/test_wm_size_from2/
   procedure Test_2_Size_From_test_wm_size_from2(Gnattest_T: in out Test) is
      procedure Size_From
        (Window: Tk_Widget;
         Who: Position_From_Value := Default_Position_From) renames
        Wrap_Test_Size_From_8b7927_bc3e6a;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Size_From(Get_Main_Window, USER);
      Assert
        (Size_From(Get_Main_Window) = USER,
         "Failed to get default size from for Tk main window.");

--  begin read only
   end Test_2_Size_From_test_wm_size_from2;
--  end read only

--  begin read only
   function Wrap_Test_Stack_Order_2d6e08_ada760
     (Window: Tk_Widget) return Widgets_Array is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Stack_Order test requirement violated");
      end;
      declare
         Test_Stack_Order_2d6e08_ada760_Result: constant Widgets_Array :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Stack_Order(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Stack_Order test commitment violated");
         end;
         return Test_Stack_Order_2d6e08_ada760_Result;
      end;
   end Wrap_Test_Stack_Order_2d6e08_ada760;
--  end read only

--  begin read only
   procedure Test_1_Stack_Order_test_wm_stack_order(Gnattest_T: in out Test);
   procedure Test_Stack_Order_2d6e08_ada760(Gnattest_T: in out Test) renames
     Test_1_Stack_Order_test_wm_stack_order;
--  id:2.2/2d6e08911932b44e/Stack_Order/1/0/test_wm_stack_order/
   procedure Test_1_Stack_Order_test_wm_stack_order(Gnattest_T: in out Test) is
      function Stack_Order(Window: Tk_Widget) return Widgets_Array renames
        Wrap_Test_Stack_Order_2d6e08_ada760;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      declare
         Result: constant Widgets_Array := Stack_Order(Get_Main_Window);
      begin
         Assert
           (Result(1) = Get_Main_Window,
            "Failed to get stack order for Tk main window");
      end;

--  begin read only
   end Test_1_Stack_Order_test_wm_stack_order;
--  end read only

--  begin read only
   function Wrap_Test_Stack_Order_4063e5_065f0c
     (Window, Second_Window: Tk_Widget; Above: Boolean := True)
      return Boolean is
   begin
      begin
         pragma Assert(Window /= Null_Widget and Second_Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Stack_Order2 test requirement violated");
      end;
      declare
         Test_Stack_Order_4063e5_065f0c_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Stack_Order
             (Window, Second_Window, Above);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Stack_Order2 test commitment violated");
         end;
         return Test_Stack_Order_4063e5_065f0c_Result;
      end;
   end Wrap_Test_Stack_Order_4063e5_065f0c;
--  end read only

--  begin read only
   procedure Test_2_Stack_Order_test_wm_stack_order2(Gnattest_T: in out Test);
   procedure Test_Stack_Order_4063e5_065f0c(Gnattest_T: in out Test) renames
     Test_2_Stack_Order_test_wm_stack_order2;
--  id:2.2/4063e54489ef174f/Stack_Order/0/0/test_wm_stack_order2/
   procedure Test_2_Stack_Order_test_wm_stack_order2
     (Gnattest_T: in out Test) is
      function Stack_Order
        (Window, Second_Window: Tk_Widget; Above: Boolean := True)
         return Boolean renames
        Wrap_Test_Stack_Order_4063e5_065f0c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (not Stack_Order(Get_Main_Window, Get_Main_Window),
         "Failed to get if Tk main window is above self.");

--  begin read only
   end Test_2_Stack_Order_test_wm_stack_order2;
--  end read only

--  begin read only
   function Wrap_Test_State_193cfa_369ab4
     (Window: Tk_Widget) return Window_States is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_State test requirement violated");
      end;
      declare
         Test_State_193cfa_369ab4_Result: constant Window_States :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.State(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_State test commitment violated");
         end;
         return Test_State_193cfa_369ab4_Result;
      end;
   end Wrap_Test_State_193cfa_369ab4;
--  end read only

--  begin read only
   procedure Test_1_State_test_wm_state(Gnattest_T: in out Test);
   procedure Test_State_193cfa_369ab4(Gnattest_T: in out Test) renames
     Test_1_State_test_wm_state;
--  id:2.2/193cfa43938a1bc2/State/1/0/test_wm_state/
   procedure Test_1_State_test_wm_state(Gnattest_T: in out Test) is
      function State(Window: Tk_Widget) return Window_States renames
        Wrap_Test_State_193cfa_369ab4;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (State(Get_Main_Window) = Default_Window_State,
         "Failed to get default Tk main window state.");

--  begin read only
   end Test_1_State_test_wm_state;
--  end read only

--  begin read only
   procedure Wrap_Test_State_c8a3e9_b6b816
     (Window: Tk_Widget; New_State: Window_States := Default_Window_State) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_State2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.State(Window, New_State);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_State2 test commitment violated");
      end;
   end Wrap_Test_State_c8a3e9_b6b816;
--  end read only

--  begin read only
   procedure Test_2_State_test_wm_state2(Gnattest_T: in out Test);
   procedure Test_State_c8a3e9_b6b816(Gnattest_T: in out Test) renames
     Test_2_State_test_wm_state2;
--  id:2.2/c8a3e96d75cb85a1/State/0/0/test_wm_state2/
   procedure Test_2_State_test_wm_state2(Gnattest_T: in out Test) is
      procedure State
        (Window: Tk_Widget;
         New_State: Window_States := Default_Window_State) renames
        Wrap_Test_State_c8a3e9_b6b816;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      State(Get_Main_Window, WITHDRAWN);
      Assert
        (State(Get_Main_Window) = WITHDRAWN,
         "Failed to set Tk main window state.");

--  begin read only
   end Test_2_State_test_wm_state2;
--  end read only

--  begin read only
   function Wrap_Test_Title_01b6e1_70d180
     (Window: Tk_Widget) return Tcl_String is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Title test requirement violated");
      end;
      declare
         Test_Title_01b6e1_70d180_Result: constant Tcl_String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Title(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Title test commitment violated");
         end;
         return Test_Title_01b6e1_70d180_Result;
      end;
   end Wrap_Test_Title_01b6e1_70d180;
--  end read only

--  begin read only
   procedure Test_1_Title_test_wm_title(Gnattest_T: in out Test);
   procedure Test_Title_01b6e1_70d180(Gnattest_T: in out Test) renames
     Test_1_Title_test_wm_title;
--  id:2.2/01b6e1957b3c0914/Title/1/0/test_wm_title/
   procedure Test_1_Title_test_wm_title(Gnattest_T: in out Test) is
      function Title(Window: Tk_Widget) return Tcl_String renames
        Wrap_Test_Title_01b6e1_70d180;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Title(Get_Main_Window) = To_Tcl_String("tk"),
         "Failed to get default title for Tk main window.");

--  begin read only
   end Test_1_Title_test_wm_title;
--  end read only

--  begin read only
   procedure Wrap_Test_Title_1f8dd2_35ca12
     (Window: Tk_Widget; New_Title: Tcl_String) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Title2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Title(Window, New_Title);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Title2 test commitment violated");
      end;
   end Wrap_Test_Title_1f8dd2_35ca12;
--  end read only

--  begin read only
   procedure Test_2_Title_test_wm_title2(Gnattest_T: in out Test);
   procedure Test_Title_1f8dd2_35ca12(Gnattest_T: in out Test) renames
     Test_2_Title_test_wm_title2;
--  id:2.2/1f8dd244664971f3/Title/0/0/test_wm_title2/
   procedure Test_2_Title_test_wm_title2(Gnattest_T: in out Test) is
      procedure Title(Window: Tk_Widget; New_Title: Tcl_String) renames
        Wrap_Test_Title_1f8dd2_35ca12;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Title(Get_Main_Window, To_Tcl_String("My Title"));
      Assert
        (Title(Get_Main_Window) = To_Tcl_String("My Title"),
         "Failed to set title for Tk main window.");

--  begin read only
   end Test_2_Title_test_wm_title2;
--  end read only

--  begin read only
   function Wrap_Test_Transient_600247_b820a7
     (Window: Tk_Widget) return Tk_Widget is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Transient test requirement violated");
      end;
      declare
         Test_Transient_600247_b820a7_Result: constant Tk_Widget :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Transient(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-wm.ads:0:):Test_Wm_Transient test commitment violated");
         end;
         return Test_Transient_600247_b820a7_Result;
      end;
   end Wrap_Test_Transient_600247_b820a7;
--  end read only

--  begin read only
   procedure Test_1_Transient_test_wm_transient(Gnattest_T: in out Test);
   procedure Test_Transient_600247_b820a7(Gnattest_T: in out Test) renames
     Test_1_Transient_test_wm_transient;
--  id:2.2/600247ae2a247faa/Transient/1/0/test_wm_transient/
   procedure Test_1_Transient_test_wm_transient(Gnattest_T: in out Test) is
      function Transient(Window: Tk_Widget) return Tk_Widget renames
        Wrap_Test_Transient_600247_b820a7;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Transient(Get_Main_Window) = Null_Widget,
         "Failed to get default transient widget for Tk window.");

--  begin read only
   end Test_1_Transient_test_wm_transient;
--  end read only

--  begin read only
   procedure Wrap_Test_Transient_6697c9_9ec765(Window, Master: Tk_Widget) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Transient2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Transient(Window, Master);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Transient2 test commitment violated");
      end;
   end Wrap_Test_Transient_6697c9_9ec765;
--  end read only

--  begin read only
   procedure Test_2_Transient_test_wm_transient2(Gnattest_T: in out Test);
   procedure Test_Transient_6697c9_9ec765(Gnattest_T: in out Test) renames
     Test_2_Transient_test_wm_transient2;
--  id:2.2/6697c9aec91a8b4e/Transient/0/0/test_wm_transient2/
   procedure Test_2_Transient_test_wm_transient2(Gnattest_T: in out Test) is
      procedure Transient(Window, Master: Tk_Widget) renames
        Wrap_Test_Transient_6697c9_9ec765;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Dialog: Tk_Toplevel;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Dialog := Create(".myframe", Default_Toplevel_Create_Options);
      Transient(Dialog, Get_Main_Window);
      Assert
        (Transient(Dialog) = Get_Main_Window,
         "Failed to set transient window for Tk widget.");
      Destroy(Dialog);

--  begin read only
   end Test_2_Transient_test_wm_transient2;
--  end read only

--  begin read only
   procedure Wrap_Test_Withdraw_9bd119_51d547(Window: Tk_Widget) is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Withdraw test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Withdraw(Window);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Withdraw test commitment violated");
      end;
   end Wrap_Test_Withdraw_9bd119_51d547;
--  end read only

--  begin read only
   procedure Test_Withdraw_test_wm_withdraw(Gnattest_T: in out Test);
   procedure Test_Withdraw_9bd119_51d547(Gnattest_T: in out Test) renames
     Test_Withdraw_test_wm_withdraw;
--  id:2.2/9bd119988312fe9b/Withdraw/1/0/test_wm_withdraw/
   procedure Test_Withdraw_test_wm_withdraw(Gnattest_T: in out Test) is
      procedure Withdraw(Window: Tk_Widget) renames
        Wrap_Test_Withdraw_9bd119_51d547;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Withdraw(Get_Main_Window);
      Assert
        (State(Get_Main_Window) = WITHDRAWN,
         "Failed to withdraw Tk main window.");

--  begin read only
   end Test_Withdraw_test_wm_withdraw;
--  end read only

--  begin read only
--  id:2.2/02/
--
--  This section can be used to add elaboration code for the global state.
--
begin
--  end read only
   null;
--  begin read only
--  end read only
end Tk.Wm.Test_Data.Tests;
