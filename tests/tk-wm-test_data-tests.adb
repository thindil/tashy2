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
   procedure Wrap_Test_Set_Aspect_193522_4b5997
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Aspect
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
   end Wrap_Test_Set_Aspect_193522_4b5997;
--  end read only

--  begin read only
   procedure Test_Set_Aspect_test_wm_aspect(Gnattest_T: in out Test);
   procedure Test_Set_Aspect_193522_4b5997(Gnattest_T: in out Test) renames
     Test_Set_Aspect_test_wm_aspect;
--  id:2.2/1935229520c54bf4/Set_Aspect/1/0/test_wm_aspect/
   procedure Test_Set_Aspect_test_wm_aspect(Gnattest_T: in out Test) is
      procedure Set_Aspect
        (Window: Tk_Toplevel;
         Min_Numer, Min_Denom, Max_Numer, Max_Denom: Natural) renames
        Wrap_Test_Set_Aspect_193522_4b5997;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Aspect(Get_Main_Window, 10, 10, 20, 20);
      Assert
        (Get_Aspect(Get_Main_Window).Min_Numer = 10,
         "Failed to set aspect for the selected widget.");

--  begin read only
   end Test_Set_Aspect_test_wm_aspect;
--  end read only

--  begin read only
   function Wrap_Test_Get_Aspect_6af3ff_d6b574
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
         Test_Get_Aspect_6af3ff_d6b574_Result: constant Aspect_Data :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Aspect(Window);
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
         return Test_Get_Aspect_6af3ff_d6b574_Result;
      end;
   end Wrap_Test_Get_Aspect_6af3ff_d6b574;
--  end read only

--  begin read only
   procedure Test_Get_Aspect_test_wm_aspect2(Gnattest_T: in out Test);
   procedure Test_Get_Aspect_6af3ff_d6b574(Gnattest_T: in out Test) renames
     Test_Get_Aspect_test_wm_aspect2;
--  id:2.2/6af3ffb1b37f1068/Get_Aspect/1/0/test_wm_aspect2/
   procedure Test_Get_Aspect_test_wm_aspect2(Gnattest_T: in out Test) is
      function Get_Aspect(Window: Tk_Toplevel) return Aspect_Data renames
        Wrap_Test_Get_Aspect_6af3ff_d6b574;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Aspect(Get_Main_Window, 20, 20, 30, 30);
      Assert
        (Get_Aspect(Get_Main_Window).Min_Denom = 20,
         "Failed to get aspect for the selected widget.");

--  begin read only
   end Test_Get_Aspect_test_wm_aspect2;
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
   function Wrap_Test_Get_Attribute_e4067c_f7b8f9
     (Window: Tk_Widget; Name: Window_Atrributes_Type) return Tcl_String is
   begin
      begin
         pragma Assert
           ((Window /= Null_Widget and Name in TRANSPARENTCOLOR | TITLEPATH)
            and then To_Lower(Window_Atrributes_Type'Image(Name))'Length <= 16
            and then
              To_Big_Integer(Tk_Path_Name(Widgt => Window)'Length) +
                To_Big_Integer(Window_Atrributes_Type'Image(Name)'Length) <
              To_Big_Integer(Integer'Last - 32));
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Get_Attribute test requirement violated");
      end;
      declare
         Test_Get_Attribute_e4067c_f7b8f9_Result: constant Tcl_String :=
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
         return Test_Get_Attribute_e4067c_f7b8f9_Result;
      end;
   end Wrap_Test_Get_Attribute_e4067c_f7b8f9;
--  end read only

--  begin read only
   procedure Test_1_Get_Attribute_test_wm_get_attribute
     (Gnattest_T: in out Test);
   procedure Test_Get_Attribute_e4067c_f7b8f9(Gnattest_T: in out Test) renames
     Test_1_Get_Attribute_test_wm_get_attribute;
--  id:2.2/e4067c5f48e19ba1/Get_Attribute/1/0/test_wm_get_attribute/
   procedure Test_1_Get_Attribute_test_wm_get_attribute
     (Gnattest_T: in out Test) is
      function Get_Attribute
        (Window: Tk_Widget; Name: Window_Atrributes_Type)
         return Tcl_String renames
        Wrap_Test_Get_Attribute_e4067c_f7b8f9;
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
      if Window_Manager /= WINDOWS then
         Assert
           (True, "This option is available only on WINDOWS window manager");
         return;
      end if;
      Assert
        (Get_Attribute(Get_Main_Window, TRANSPARENTCOLOR) =
         Get_Attributes(Get_Main_Window).Transparent_Color,
         "Failed to get widget attribute as Tcl_String");

--  begin read only
   end Test_1_Get_Attribute_test_wm_get_attribute;
--  end read only

--  begin read only
   function Wrap_Test_Get_Attribute_97698a_5dc191
     (Window: Tk_Widget; Name: Window_Atrributes_Type)
      return Extended_Boolean is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget and
            Name in FULLSCREEN | ZOOMED | DISABLED | TOOLWINDOW | MODIFIED |
                NOTIFY | TRANSPARENT);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Get_Attribute2 test requirement violated");
      end;
      declare
         Test_Get_Attribute_97698a_5dc191_Result: constant Extended_Boolean :=
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
         return Test_Get_Attribute_97698a_5dc191_Result;
      end;
   end Wrap_Test_Get_Attribute_97698a_5dc191;
--  end read only

--  begin read only
   procedure Test_2_Get_Attribute_test_wm_get_attribute2
     (Gnattest_T: in out Test);
   procedure Test_Get_Attribute_97698a_5dc191(Gnattest_T: in out Test) renames
     Test_2_Get_Attribute_test_wm_get_attribute2;
--  id:2.2/97698ae96389b127/Get_Attribute/0/0/test_wm_get_attribute2/
   procedure Test_2_Get_Attribute_test_wm_get_attribute2
     (Gnattest_T: in out Test) is
      function Get_Attribute
        (Window: Tk_Widget; Name: Window_Atrributes_Type)
         return Extended_Boolean renames
        Wrap_Test_Get_Attribute_97698a_5dc191;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Attribute(Get_Main_Window, FULLSCREEN) = FALSE,
         "Failed to get widget attribute as Extended_Boolean");

--  begin read only
   end Test_2_Get_Attribute_test_wm_get_attribute2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Attribute_e0766a_48ba42
     (Window: Tk_Widget) return Alpha_Type is
   begin
      begin
         pragma Assert
           ((Window /= Null_Widget and Get_Interpreter /= Null_Interpreter)
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 21);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Get_Attribute3 test requirement violated");
      end;
      declare
         Test_Get_Attribute_e0766a_48ba42_Result: constant Alpha_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Attribute(Window);
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
         return Test_Get_Attribute_e0766a_48ba42_Result;
      end;
   end Wrap_Test_Get_Attribute_e0766a_48ba42;
--  end read only

--  begin read only
   procedure Test_3_Get_Attribute_test_wm_get_attribute3
     (Gnattest_T: in out Test);
   procedure Test_Get_Attribute_e0766a_48ba42(Gnattest_T: in out Test) renames
     Test_3_Get_Attribute_test_wm_get_attribute3;
--  id:2.2/e0766a7fc80acc58/Get_Attribute/0/0/test_wm_get_attribute3/
   procedure Test_3_Get_Attribute_test_wm_get_attribute3
     (Gnattest_T: in out Test) is
      function Get_Attribute(Window: Tk_Widget) return Alpha_Type renames
        Wrap_Test_Get_Attribute_e0766a_48ba42;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Attribute(Get_Main_Window) = 0.3,
         "Failed to get widget attribute as Alpha_Type");

--  begin read only
   end Test_3_Get_Attribute_test_wm_get_attribute3;
--  end read only

--  begin read only
   function Wrap_Test_Get_Attribute_6aefd8_1be407
     (Window: Tk_Widget) return Window_Types is
   begin
      begin
         pragma Assert
           ((Window /= Null_Widget and Get_Interpreter /= Null_Interpreter)
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 20);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Get_Attribute4 test requirement violated");
      end;
      declare
         Test_Get_Attribute_6aefd8_1be407_Result: constant Window_Types :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Attribute(Window);
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
         return Test_Get_Attribute_6aefd8_1be407_Result;
      end;
   end Wrap_Test_Get_Attribute_6aefd8_1be407;
--  end read only

--  begin read only
   procedure Test_4_Get_Attribute_test_wm_get_attribute4
     (Gnattest_T: in out Test);
   procedure Test_Get_Attribute_6aefd8_1be407(Gnattest_T: in out Test) renames
     Test_4_Get_Attribute_test_wm_get_attribute4;
--  id:2.2/6aefd831024bf05f/Get_Attribute/0/0/test_wm_get_attribute4/
   procedure Test_4_Get_Attribute_test_wm_get_attribute4
     (Gnattest_T: in out Test) is
      function Get_Attribute(Window: Tk_Widget) return Window_Types renames
        Wrap_Test_Get_Attribute_6aefd8_1be407;
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
        (Get_Attribute(Get_Main_Window) = DOCK,
         "Failed to get window type attribute for the main window");

--  begin read only
   end Test_4_Get_Attribute_test_wm_get_attribute4;
--  end read only

--  begin read only
   function Wrap_Test_Get_Client_c3e755_649902
     (Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 10);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Client test requirement violated");
      end;
      declare
         Test_Get_Client_c3e755_649902_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Client(Window);
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
         return Test_Get_Client_c3e755_649902_Result;
      end;
   end Wrap_Test_Get_Client_c3e755_649902;
--  end read only

--  begin read only
   procedure Test_Get_Client_test_wm_client(Gnattest_T: in out Test);
   procedure Test_Get_Client_c3e755_649902(Gnattest_T: in out Test) renames
     Test_Get_Client_test_wm_client;
--  id:2.2/c3e75564763f438b/Get_Client/1/0/test_wm_client/
   procedure Test_Get_Client_test_wm_client(Gnattest_T: in out Test) is
      function Get_Client(Window: Tk_Widget) return String renames
        Wrap_Test_Get_Client_c3e755_649902;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Client(Get_Main_Window) = "",
         "Failed to get client name for main window.");

--  begin read only
   end Test_Get_Client_test_wm_client;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Client_2c6ab7_d2f7a7
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Client(Window, Name);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Client2 test commitment violated");
      end;
   end Wrap_Test_Set_Client_2c6ab7_d2f7a7;
--  end read only

--  begin read only
   procedure Test_Set_Client_test_wm_client2(Gnattest_T: in out Test);
   procedure Test_Set_Client_2c6ab7_d2f7a7(Gnattest_T: in out Test) renames
     Test_Set_Client_test_wm_client2;
--  id:2.2/2c6ab78c0e561cfd/Set_Client/1/0/test_wm_client2/
   procedure Test_Set_Client_test_wm_client2(Gnattest_T: in out Test) is
      procedure Set_Client(Window: Tk_Widget; Name: Tcl_String) renames
        Wrap_Test_Set_Client_2c6ab7_d2f7a7;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Client(Get_Main_Window, To_Tcl_String("test"));
      Assert
        (Get_Client(Get_Main_Window) = "test",
         "Failed to set the client name for main window.");

--  begin read only
   end Test_Set_Client_test_wm_client2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Color_Map_Windows_2764f5_798c45
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
         Test_Get_Color_Map_Windows_2764f5_798c45_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Color_Map_Windows
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
         return Test_Get_Color_Map_Windows_2764f5_798c45_Result;
      end;
   end Wrap_Test_Get_Color_Map_Windows_2764f5_798c45;
--  end read only

--  begin read only
   procedure Test_Get_Color_Map_Windows_test_wm_color_map_windows
     (Gnattest_T: in out Test);
   procedure Test_Get_Color_Map_Windows_2764f5_798c45
     (Gnattest_T: in out Test) renames
     Test_Get_Color_Map_Windows_test_wm_color_map_windows;
--  id:2.2/2764f52fa588a37b/Get_Color_Map_Windows/1/0/test_wm_color_map_windows/
   procedure Test_Get_Color_Map_Windows_test_wm_color_map_windows
     (Gnattest_T: in out Test) is
      function Get_Color_Map_Windows
        (Window: Tk_Widget) return Array_List renames
        Wrap_Test_Get_Color_Map_Windows_2764f5_798c45;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Color_Map_Windows(Get_Main_Window) = Empty_Array_List,
         "Failed to get color map windows for main window.");

--  begin read only
   end Test_Get_Color_Map_Windows_test_wm_color_map_windows;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Color_Map_Windows_af7285_93136d
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Color_Map_Windows
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
   end Wrap_Test_Set_Color_Map_Windows_af7285_93136d;
--  end read only

--  begin read only
   procedure Test_Set_Color_Map_Windows_test_wm_color_map_windows2
     (Gnattest_T: in out Test);
   procedure Test_Set_Color_Map_Windows_af7285_93136d
     (Gnattest_T: in out Test) renames
     Test_Set_Color_Map_Windows_test_wm_color_map_windows2;
--  id:2.2/af72857c79d61b73/Set_Color_Map_Windows/1/0/test_wm_color_map_windows2/
   procedure Test_Set_Color_Map_Windows_test_wm_color_map_windows2
     (Gnattest_T: in out Test) is
      procedure Set_Color_Map_Windows
        (Window: Tk_Widget; Widgets: Widgets_Array) renames
        Wrap_Test_Set_Color_Map_Windows_af7285_93136d;
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
      Set_Color_Map_Windows(Get_Main_Window, (1 => Button, 2 => Button2));
      Assert
        (Get_Color_Map_Windows(Get_Main_Window)'Length = 2,
         "Failed to get list of color map windows for main window.");
      Destroy(Button);
      Destroy(Button2);

--  begin read only
   end Test_Set_Color_Map_Windows_test_wm_color_map_windows2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Command_93826d_e6db9d
     (Window: Tk_Widget) return Tcl_String is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 11);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Command test requirement violated");
      end;
      declare
         Test_Get_Command_93826d_e6db9d_Result: constant Tcl_String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Command(Window);
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
         return Test_Get_Command_93826d_e6db9d_Result;
      end;
   end Wrap_Test_Get_Command_93826d_e6db9d;
--  end read only

--  begin read only
   procedure Test_Get_Command_test_wm_command(Gnattest_T: in out Test);
   procedure Test_Get_Command_93826d_e6db9d(Gnattest_T: in out Test) renames
     Test_Get_Command_test_wm_command;
--  id:2.2/93826dbefac44151/Get_Command/1/0/test_wm_command/
   procedure Test_Get_Command_test_wm_command(Gnattest_T: in out Test) is
      function Get_Command(Window: Tk_Widget) return Tcl_String renames
        Wrap_Test_Get_Command_93826d_e6db9d;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (To_Ada_String(Get_Command(Get_Main_Window))'Length = 0,
         "Failed to get WM_COMMAND property for main window.");

--  begin read only
   end Test_Get_Command_test_wm_command;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Command_49e617_7c33cf
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Command
        (Window, Wm_Command);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Command2 test commitment violated");
      end;
   end Wrap_Test_Set_Command_49e617_7c33cf;
--  end read only

--  begin read only
   procedure Test_Set_Command_test_wm_command2(Gnattest_T: in out Test);
   procedure Test_Set_Command_49e617_7c33cf(Gnattest_T: in out Test) renames
     Test_Set_Command_test_wm_command2;
--  id:2.2/49e61738ee13f7d9/Set_Command/1/0/test_wm_command2/
   procedure Test_Set_Command_test_wm_command2(Gnattest_T: in out Test) is
      procedure Set_Command(Window: Tk_Widget; Wm_Command: Tcl_String) renames
        Wrap_Test_Set_Command_49e617_7c33cf;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Command(Get_Main_Window, To_Tcl_String("my command"));
      Assert
        (To_Ada_String(Get_Command(Get_Main_Window)) = "my command",
         "Failed to set WM_COMMAND property for main window.");

--  begin read only
   end Test_Set_Command_test_wm_command2;
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
   function Wrap_Test_Get_Focus_Model_526220_857661
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
         Test_Get_Focus_Model_526220_857661_Result: constant Focus_Model_Types :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Focus_Model(Window);
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
         return Test_Get_Focus_Model_526220_857661_Result;
      end;
   end Wrap_Test_Get_Focus_Model_526220_857661;
--  end read only

--  begin read only
   procedure Test_Get_Focus_Model_test_wm_focus_model(Gnattest_T: in out Test);
   procedure Test_Get_Focus_Model_526220_857661
     (Gnattest_T: in out Test) renames
     Test_Get_Focus_Model_test_wm_focus_model;
--  id:2.2/526220c38426c666/Get_Focus_Model/1/0/test_wm_focus_model/
   procedure Test_Get_Focus_Model_test_wm_focus_model
     (Gnattest_T: in out Test) is
      function Get_Focus_Model
        (Window: Tk_Widget) return Focus_Model_Types renames
        Wrap_Test_Get_Focus_Model_526220_857661;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Focus_Model(Get_Main_Window) = PASSIVE,
         "Failed to get default focus model for main window.");

--  begin read only
   end Test_Get_Focus_Model_test_wm_focus_model;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Focus_Model_71dc8a_9f50c8
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Focus_Model
        (Window, Model);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Focus_Model2 test commitment violated");
      end;
   end Wrap_Test_Set_Focus_Model_71dc8a_9f50c8;
--  end read only

--  begin read only
   procedure Test_Set_Focus_Model_test_wm_focus_model2
     (Gnattest_T: in out Test);
   procedure Test_Set_Focus_Model_71dc8a_9f50c8
     (Gnattest_T: in out Test) renames
     Test_Set_Focus_Model_test_wm_focus_model2;
--  id:2.2/71dc8a9d44c357c0/Set_Focus_Model/1/0/test_wm_focus_model2/
   procedure Test_Set_Focus_Model_test_wm_focus_model2
     (Gnattest_T: in out Test) is
      procedure Set_Focus_Model
        (Window: Tk_Widget; Model: Focus_Model_Types) renames
        Wrap_Test_Set_Focus_Model_71dc8a_9f50c8;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Focus_Model(Get_Main_Window, ACTIVE);
      Assert
        (Get_Focus_Model(Get_Main_Window) = ACTIVE,
         "Failed to set default focus model for main window.");
      Set_Focus_Model(Get_Main_Window, PASSIVE);

--  begin read only
   end Test_Set_Focus_Model_test_wm_focus_model2;
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
   function Wrap_Test_Get_Frame_7e4b43_b86ec4
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
         Test_Get_Frame_7e4b43_b86ec4_Result: constant Tk_Window :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Frame(Window);
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
         return Test_Get_Frame_7e4b43_b86ec4_Result;
      end;
   end Wrap_Test_Get_Frame_7e4b43_b86ec4;
--  end read only

--  begin read only
   procedure Test_Get_Frame_test_wm_frame(Gnattest_T: in out Test);
   procedure Test_Get_Frame_7e4b43_b86ec4(Gnattest_T: in out Test) renames
     Test_Get_Frame_test_wm_frame;
--  id:2.2/7e4b432230fba945/Get_Frame/1/0/test_wm_frame/
   procedure Test_Get_Frame_test_wm_frame(Gnattest_T: in out Test) is
      function Get_Frame(Window: Tk_Widget) return Tk_Window renames
        Wrap_Test_Get_Frame_7e4b43_b86ec4;
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
        (Get_Frame(Frame_Window) = Tk_Window_Id(Frame_Window),
         "Failed to get frame for Tk toplevel.");
      Destroy(Frame_Window);

--  begin read only
   end Test_Get_Frame_test_wm_frame;
--  end read only

--  begin read only
   function Wrap_Test_Get_Geometry_ef6848_4f4f37
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
         Test_Get_Geometry_ef6848_4f4f37_Result: constant Window_Geometry :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Geometry(Window);
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
         return Test_Get_Geometry_ef6848_4f4f37_Result;
      end;
   end Wrap_Test_Get_Geometry_ef6848_4f4f37;
--  end read only

--  begin read only
   procedure Test_Get_Geometry_test_wm_geometry(Gnattest_T: in out Test);
   procedure Test_Get_Geometry_ef6848_4f4f37(Gnattest_T: in out Test) renames
     Test_Get_Geometry_test_wm_geometry;
--  id:2.2/ef68484d6359273c/Get_Geometry/1/0/test_wm_geometry/
   procedure Test_Get_Geometry_test_wm_geometry(Gnattest_T: in out Test) is
      function Get_Geometry(Window: Tk_Widget) return Window_Geometry renames
        Wrap_Test_Get_Geometry_ef6848_4f4f37;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Geometry(Get_Main_Window).Width > 0,
         "Failed to get width of the Tk main window.");

--  begin read only
   end Test_Get_Geometry_test_wm_geometry;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Geometry_218b77_9bd66a
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Geometry
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
   end Wrap_Test_Set_Geometry_218b77_9bd66a;
--  end read only

--  begin read only
   procedure Test_Set_Geometry_test_wm_geometry2(Gnattest_T: in out Test);
   procedure Test_Set_Geometry_218b77_9bd66a(Gnattest_T: in out Test) renames
     Test_Set_Geometry_test_wm_geometry2;
--  id:2.2/218b77a0cb8ea295/Set_Geometry/1/0/test_wm_geometry2/
   procedure Test_Set_Geometry_test_wm_geometry2(Gnattest_T: in out Test) is
      procedure Set_Geometry
        (Window: Tk_Widget;
         Width, Height, X, Y: Extended_Natural := -1) renames
        Wrap_Test_Set_Geometry_218b77_9bd66a;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Geometry(Get_Main_Window, -1, -1, 10, 12);
      Assert
        (Get_Geometry(Get_Main_Window).X = 10,
         "Failed to set geometry for Tk main window.");

--  begin read only
   end Test_Set_Geometry_test_wm_geometry2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Grid_30f13e_fc763d
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
         Test_Get_Grid_30f13e_fc763d_Result: constant Window_Grid_Geometry :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Grid(Window);
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
         return Test_Get_Grid_30f13e_fc763d_Result;
      end;
   end Wrap_Test_Get_Grid_30f13e_fc763d;
--  end read only

--  begin read only
   procedure Test_Get_Grid_test_wm_grid(Gnattest_T: in out Test);
   procedure Test_Get_Grid_30f13e_fc763d(Gnattest_T: in out Test) renames
     Test_Get_Grid_test_wm_grid;
--  id:2.2/30f13eee71cfdc11/Get_Grid/1/0/test_wm_grid/
   procedure Test_Get_Grid_test_wm_grid(Gnattest_T: in out Test) is
      function Get_Grid(Window: Tk_Widget) return Window_Grid_Geometry renames
        Wrap_Test_Get_Grid_30f13e_fc763d;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Grid(Get_Main_Window) = Empty_Window_Grid_Geometry,
         "Failed to get grid geometry for Tk main window.");

--  begin read only
   end Test_Get_Grid_test_wm_grid;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Grid_9a47fa_1fe5bc
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Grid
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
   end Wrap_Test_Set_Grid_9a47fa_1fe5bc;
--  end read only

--  begin read only
   procedure Test_Set_Grid_test_wm_grid2(Gnattest_T: in out Test);
   procedure Test_Set_Grid_9a47fa_1fe5bc(Gnattest_T: in out Test) renames
     Test_Set_Grid_test_wm_grid2;
--  id:2.2/9a47fa803ca147ca/Set_Grid/1/0/test_wm_grid2/
   procedure Test_Set_Grid_test_wm_grid2(Gnattest_T: in out Test) is
      procedure Set_Grid
        (Window: Tk_Widget;
         Base_Width, Base_Height, Width_Inc, Height_Inc: Positive) renames
        Wrap_Test_Set_Grid_9a47fa_1fe5bc;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Grid(Get_Main_Window, 10, 10, 10, 10);
      Assert
        (Get_Grid(Get_Main_Window).Base_Width = 10,
         "Failed to set grid geometry for Tk main window.");

--  begin read only
   end Test_Set_Grid_test_wm_grid2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Group_f9ea32_7210ab
     (Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 9);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Group test requirement violated");
      end;
      declare
         Test_Get_Group_f9ea32_7210ab_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Group(Window);
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
         return Test_Get_Group_f9ea32_7210ab_Result;
      end;
   end Wrap_Test_Get_Group_f9ea32_7210ab;
--  end read only

--  begin read only
   procedure Test_Get_Group_test_wm_group(Gnattest_T: in out Test);
   procedure Test_Get_Group_f9ea32_7210ab(Gnattest_T: in out Test) renames
     Test_Get_Group_test_wm_group;
--  id:2.2/f9ea329d4f6f9334/Get_Group/1/0/test_wm_group/
   procedure Test_Get_Group_test_wm_group(Gnattest_T: in out Test) is
      function Get_Group(Window: Tk_Widget) return String renames
        Wrap_Test_Get_Group_f9ea32_7210ab;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Group(Get_Main_Window)'Length = 0,
         "Failed to get group of Tk main window.");

--  begin read only
   end Test_Get_Group_test_wm_group;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Group_67e692_95a2e7
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Group(Window, Path_Name);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Group2 test commitment violated");
      end;
   end Wrap_Test_Set_Group_67e692_95a2e7;
--  end read only

--  begin read only
   procedure Test_Set_Group_test_wm_group2(Gnattest_T: in out Test);
   procedure Test_Set_Group_67e692_95a2e7(Gnattest_T: in out Test) renames
     Test_Set_Group_test_wm_group2;
--  id:2.2/67e692bfb3aed896/Set_Group/1/0/test_wm_group2/
   procedure Test_Set_Group_test_wm_group2(Gnattest_T: in out Test) is
      procedure Set_Group(Window: Tk_Widget; Path_Name: Tcl_String) renames
        Wrap_Test_Set_Group_67e692_95a2e7;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Group(Get_Main_Window, To_Tcl_String("."));
      Assert
        (Get_Group(Get_Main_Window) = ".",
         "Failed to set group for the Tk main window.");

--  begin read only
   end Test_Set_Group_test_wm_group2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Icon_Bitmap_6135da_c75fae
     (Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 14);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Icon_Bitmap test requirement violated");
      end;
      declare
         Test_Get_Icon_Bitmap_6135da_c75fae_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Icon_Bitmap(Window);
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
         return Test_Get_Icon_Bitmap_6135da_c75fae_Result;
      end;
   end Wrap_Test_Get_Icon_Bitmap_6135da_c75fae;
--  end read only

--  begin read only
   procedure Test_Get_Icon_Bitmap_test_wm_icon_bitmap(Gnattest_T: in out Test);
   procedure Test_Get_Icon_Bitmap_6135da_c75fae
     (Gnattest_T: in out Test) renames
     Test_Get_Icon_Bitmap_test_wm_icon_bitmap;
--  id:2.2/6135dacd09d62480/Get_Icon_Bitmap/1/0/test_wm_icon_bitmap/
   procedure Test_Get_Icon_Bitmap_test_wm_icon_bitmap
     (Gnattest_T: in out Test) is
      function Get_Icon_Bitmap(Window: Tk_Widget) return String renames
        Wrap_Test_Get_Icon_Bitmap_6135da_c75fae;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Icon_Bitmap(Get_Main_Window)'Length = 0,
         "Failed to get bitmap icon name for Tk main window.");

--  begin read only
   end Test_Get_Icon_Bitmap_test_wm_icon_bitmap;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Icon_Bitmap_9571ee_31ebac
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Icon_Bitmap
        (Window, Bitmap);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Bitmap2 test commitment violated");
      end;
   end Wrap_Test_Set_Icon_Bitmap_9571ee_31ebac;
--  end read only

--  begin read only
   procedure Test_Set_Icon_Bitmap_test_wm_icon_bitmap2
     (Gnattest_T: in out Test);
   procedure Test_Set_Icon_Bitmap_9571ee_31ebac
     (Gnattest_T: in out Test) renames
     Test_Set_Icon_Bitmap_test_wm_icon_bitmap2;
--  id:2.2/9571ee96c7b7976c/Set_Icon_Bitmap/1/0/test_wm_icon_bitmap2/
   procedure Test_Set_Icon_Bitmap_test_wm_icon_bitmap2
     (Gnattest_T: in out Test) is
      procedure Set_Icon_Bitmap(Window: Tk_Widget; Bitmap: Tcl_String) renames
        Wrap_Test_Set_Icon_Bitmap_9571ee_31ebac;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Icon_Bitmap(Get_Main_Window, To_Tcl_String("info"));
      Assert
        (Get_Icon_Bitmap(Get_Main_Window) = "info",
         "Failed to set icon bitmap for Tk main window.");

--  begin read only
   end Test_Set_Icon_Bitmap_test_wm_icon_bitmap2;
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
   function Wrap_Test_Get_Icon_Mask_dd14ea_9079a9
     (Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 12);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Icon_Mask test requirement violated");
      end;
      declare
         Test_Get_Icon_Mask_dd14ea_9079a9_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Icon_Mask(Window);
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
         return Test_Get_Icon_Mask_dd14ea_9079a9_Result;
      end;
   end Wrap_Test_Get_Icon_Mask_dd14ea_9079a9;
--  end read only

--  begin read only
   procedure Test_Get_Icon_Mask_test_wm_icon_mask(Gnattest_T: in out Test);
   procedure Test_Get_Icon_Mask_dd14ea_9079a9(Gnattest_T: in out Test) renames
     Test_Get_Icon_Mask_test_wm_icon_mask;
--  id:2.2/dd14ea6a5be023bd/Get_Icon_Mask/1/0/test_wm_icon_mask/
   procedure Test_Get_Icon_Mask_test_wm_icon_mask(Gnattest_T: in out Test) is
      function Get_Icon_Mask(Window: Tk_Widget) return String renames
        Wrap_Test_Get_Icon_Mask_dd14ea_9079a9;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Icon_Mask(Get_Main_Window)'Length = 0,
         "Failed to get icon mask for the Tk main window.");

--  begin read only
   end Test_Get_Icon_Mask_test_wm_icon_mask;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Icon_Mask_7f471f_b2153c
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Icon_Mask(Window, Bitmap);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Mask2 test commitment violated");
      end;
   end Wrap_Test_Set_Icon_Mask_7f471f_b2153c;
--  end read only

--  begin read only
   procedure Test_Set_Icon_Mask_test_wm_icon_mask2(Gnattest_T: in out Test);
   procedure Test_Set_Icon_Mask_7f471f_b2153c(Gnattest_T: in out Test) renames
     Test_Set_Icon_Mask_test_wm_icon_mask2;
--  id:2.2/7f471fc64954c1a2/Set_Icon_Mask/1/0/test_wm_icon_mask2/
   procedure Test_Set_Icon_Mask_test_wm_icon_mask2(Gnattest_T: in out Test) is
      procedure Set_Icon_Mask(Window: Tk_Widget; Bitmap: Tcl_String) renames
        Wrap_Test_Set_Icon_Mask_7f471f_b2153c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Icon_Mask(Get_Main_Window, To_Tcl_String("error"));
      Assert
        (Get_Icon_Mask(Get_Main_Window) = "error",
         "Failed to set icon mask for the Tk main window.");

--  begin read only
   end Test_Set_Icon_Mask_test_wm_icon_mask2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Icon_Name_ab4de4_2bafa0
     (Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 12);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Icon_Name test requirement violated");
      end;
      declare
         Test_Get_Icon_Name_ab4de4_2bafa0_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Icon_Name(Window);
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
         return Test_Get_Icon_Name_ab4de4_2bafa0_Result;
      end;
   end Wrap_Test_Get_Icon_Name_ab4de4_2bafa0;
--  end read only

--  begin read only
   procedure Test_Get_Icon_Name_test_wm_icon_name(Gnattest_T: in out Test);
   procedure Test_Get_Icon_Name_ab4de4_2bafa0(Gnattest_T: in out Test) renames
     Test_Get_Icon_Name_test_wm_icon_name;
--  id:2.2/ab4de4e943b76c5a/Get_Icon_Name/1/0/test_wm_icon_name/
   procedure Test_Get_Icon_Name_test_wm_icon_name(Gnattest_T: in out Test) is
      function Get_Icon_Name(Window: Tk_Widget) return String renames
        Wrap_Test_Get_Icon_Name_ab4de4_2bafa0;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Icon_Name(Get_Main_Window)'Length = 0,
         "Failed to get icon name for the Tk main window.");

--  begin read only
   end Test_Get_Icon_Name_test_wm_icon_name;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Icon_Name_8f26b1_3f7273
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Icon_Name
        (Window, New_Name);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Name2 test commitment violated");
      end;
   end Wrap_Test_Set_Icon_Name_8f26b1_3f7273;
--  end read only

--  begin read only
   procedure Test_Set_Icon_Name_test_wm_icon_name2(Gnattest_T: in out Test);
   procedure Test_Set_Icon_Name_8f26b1_3f7273(Gnattest_T: in out Test) renames
     Test_Set_Icon_Name_test_wm_icon_name2;
--  id:2.2/8f26b164b74a03b6/Set_Icon_Name/1/0/test_wm_icon_name2/
   procedure Test_Set_Icon_Name_test_wm_icon_name2(Gnattest_T: in out Test) is
      procedure Set_Icon_Name(Window: Tk_Widget; New_Name: Tcl_String) renames
        Wrap_Test_Set_Icon_Name_8f26b1_3f7273;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Icon_Name(Get_Main_Window, To_Tcl_String("test"));
      Assert
        (Get_Icon_Name(Get_Main_Window) = "test",
         "Failed to set icon name for the Tk main window.");

--  begin read only
   end Test_Set_Icon_Name_test_wm_icon_name2;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Icon_Photo_27ff53_a0feb6
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Icon_Photo
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
   end Wrap_Test_Set_Icon_Photo_27ff53_a0feb6;
--  end read only

--  begin read only
   procedure Test_Set_Icon_Photo_test_wm_icon_photo(Gnattest_T: in out Test);
   procedure Test_Set_Icon_Photo_27ff53_a0feb6(Gnattest_T: in out Test) renames
     Test_Set_Icon_Photo_test_wm_icon_photo;
--  id:2.2/27ff53b0b4b9f9b6/Set_Icon_Photo/1/0/test_wm_icon_photo/
   procedure Test_Set_Icon_Photo_test_wm_icon_photo(Gnattest_T: in out Test) is
      procedure Set_Icon_Photo
        (Window: Tk_Widget; Images: Array_List;
         Default: Boolean := False) renames
        Wrap_Test_Set_Icon_Photo_27ff53_a0feb6;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Icon_Photo
        (Get_Main_Window, Array_List'(1 => To_Tcl_String("image14")), True);
      Set_Icon_Photo
        (Get_Main_Window, Array_List'(1 => To_Tcl_String("image13")));
      Assert(True, "This test can only crash.");

--  begin read only
   end Test_Set_Icon_Photo_test_wm_icon_photo;
--  end read only

--  begin read only
   function Wrap_Test_Get_Icon_Position_e3f767_0e4e31
     (Window: Tk_Widget) return Point_Position is
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
         Test_Get_Icon_Position_e3f767_0e4e31_Result: constant Point_Position :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Icon_Position
             (Window);
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
         return Test_Get_Icon_Position_e3f767_0e4e31_Result;
      end;
   end Wrap_Test_Get_Icon_Position_e3f767_0e4e31;
--  end read only

--  begin read only
   procedure Test_Get_Icon_Position_test_wm_icon_position
     (Gnattest_T: in out Test);
   procedure Test_Get_Icon_Position_e3f767_0e4e31
     (Gnattest_T: in out Test) renames
     Test_Get_Icon_Position_test_wm_icon_position;
--  id:2.2/e3f7673ec4f0d977/Get_Icon_Position/1/0/test_wm_icon_position/
   procedure Test_Get_Icon_Position_test_wm_icon_position
     (Gnattest_T: in out Test) is
      function Get_Icon_Position
        (Window: Tk_Widget) return Point_Position renames
        Wrap_Test_Get_Icon_Position_e3f767_0e4e31;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Icon_Position(Get_Main_Window, 10, 11);
      Assert
        (Get_Icon_Position(Get_Main_Window).X = 10,
         "Failed to get icon position for main window.");

--  begin read only
   end Test_Get_Icon_Position_test_wm_icon_position;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Icon_Position_801b76_ebaaaa
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Icon_Position
        (Window, X, Y);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Icon_Position2 test commitment violated");
      end;
   end Wrap_Test_Set_Icon_Position_801b76_ebaaaa;
--  end read only

--  begin read only
   procedure Test_Set_Icon_Position_test_wm_icon_position2
     (Gnattest_T: in out Test);
   procedure Test_Set_Icon_Position_801b76_ebaaaa
     (Gnattest_T: in out Test) renames
     Test_Set_Icon_Position_test_wm_icon_position2;
--  id:2.2/801b76afc5d765d3/Set_Icon_Position/1/0/test_wm_icon_position2/
   procedure Test_Set_Icon_Position_test_wm_icon_position2
     (Gnattest_T: in out Test) is
      procedure Set_Icon_Position
        (Window: Tk_Widget; X, Y: Extended_Natural) renames
        Wrap_Test_Set_Icon_Position_801b76_ebaaaa;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Icon_Position(Get_Main_Window, 12, 13);
      Assert
        (Get_Icon_Position(Get_Main_Window).X = 12,
         "Failed to set icon position for main window.");

--  begin read only
   end Test_Set_Icon_Position_test_wm_icon_position2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Icon_Window_1f202f_44e6ae
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
         Test_Get_Icon_Window_1f202f_44e6ae_Result: constant Tk_Toplevel :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Icon_Window(Window);
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
         return Test_Get_Icon_Window_1f202f_44e6ae_Result;
      end;
   end Wrap_Test_Get_Icon_Window_1f202f_44e6ae;
--  end read only

--  begin read only
   procedure Test_Get_Icon_Window_test_wm_icon_window(Gnattest_T: in out Test);
   procedure Test_Get_Icon_Window_1f202f_44e6ae
     (Gnattest_T: in out Test) renames
     Test_Get_Icon_Window_test_wm_icon_window;
--  id:2.2/1f202f58e4967440/Get_Icon_Window/1/0/test_wm_icon_window/
   procedure Test_Get_Icon_Window_test_wm_icon_window
     (Gnattest_T: in out Test) is
      function Get_Icon_Window(Window: Tk_Widget) return Tk_Toplevel renames
        Wrap_Test_Get_Icon_Window_1f202f_44e6ae;
--  end read only

      pragma Unreferenced(Gnattest_T);
      IconWindow: Tk_Toplevel;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      IconWindow := Create(".test", Default_Toplevel_Create_Options);
      Set_Icon_Window(Get_Main_Window, IconWindow);
      Assert
        (Get_Icon_Window(Get_Main_Window) = IconWindow,
         "Failed to get icon window for main window");
      Destroy(IconWindow);

--  begin read only
   end Test_Get_Icon_Window_test_wm_icon_window;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Icon_Window_d6a591_e657dc
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Icon_Window
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
   end Wrap_Test_Set_Icon_Window_d6a591_e657dc;
--  end read only

--  begin read only
   procedure Test_Set_Icon_Window_test_wm_icon_window2
     (Gnattest_T: in out Test);
   procedure Test_Set_Icon_Window_d6a591_e657dc
     (Gnattest_T: in out Test) renames
     Test_Set_Icon_Window_test_wm_icon_window2;
--  id:2.2/d6a591e102f55162/Set_Icon_Window/1/0/test_wm_icon_window2/
   procedure Test_Set_Icon_Window_test_wm_icon_window2
     (Gnattest_T: in out Test) is
      procedure Set_Icon_Window(Window, New_Icon_Window: Tk_Toplevel) renames
        Wrap_Test_Set_Icon_Window_d6a591_e657dc;
--  end read only

      pragma Unreferenced(Gnattest_T);
      IconWindow: Tk_Toplevel;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      IconWindow := Create(".test", Default_Toplevel_Create_Options);
      Set_Icon_Window(Get_Main_Window, IconWindow);
      Assert
        (Get_Icon_Window(Get_Main_Window) = IconWindow,
         "Failed to set icon window for main window");
      Destroy(IconWindow);

--  begin read only
   end Test_Set_Icon_Window_test_wm_icon_window2;
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
   function Wrap_Test_Get_Max_Size_4ccc81_4463a7
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
         Test_Get_Max_Size_4ccc81_4463a7_Result: constant Window_Size :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Max_Size(Window);
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
         return Test_Get_Max_Size_4ccc81_4463a7_Result;
      end;
   end Wrap_Test_Get_Max_Size_4ccc81_4463a7;
--  end read only

--  begin read only
   procedure Test_Get_Max_Size_test_wm_max_size(Gnattest_T: in out Test);
   procedure Test_Get_Max_Size_4ccc81_4463a7(Gnattest_T: in out Test) renames
     Test_Get_Max_Size_test_wm_max_size;
--  id:2.2/4ccc81310f1923d2/Get_Max_Size/1/0/test_wm_max_size/
   procedure Test_Get_Max_Size_test_wm_max_size(Gnattest_T: in out Test) is
      function Get_Max_Size(Window: Tk_Widget) return Window_Size renames
        Wrap_Test_Get_Max_Size_4ccc81_4463a7;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Max_Size(Get_Main_Window, 100, 100);
      Assert
        (Get_Max_Size(Get_Main_Window).Width = 100,
         "Failed to get max size of Tk main window.");

--  begin read only
   end Test_Get_Max_Size_test_wm_max_size;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Max_Size_dec96a_efa6b3
     (Window: Tk_Widget; Width, Height: Positive) is
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Max_Size
        (Window, Width, Height);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Max_Size2 test commitment violated");
      end;
   end Wrap_Test_Set_Max_Size_dec96a_efa6b3;
--  end read only

--  begin read only
   procedure Test_Set_Max_Size_test_wm_max_size2(Gnattest_T: in out Test);
   procedure Test_Set_Max_Size_dec96a_efa6b3(Gnattest_T: in out Test) renames
     Test_Set_Max_Size_test_wm_max_size2;
--  id:2.2/dec96a628d5a8eaa/Set_Max_Size/1/0/test_wm_max_size2/
   procedure Test_Set_Max_Size_test_wm_max_size2(Gnattest_T: in out Test) is
      procedure Set_Max_Size
        (Window: Tk_Widget; Width, Height: Positive) renames
        Wrap_Test_Set_Max_Size_dec96a_efa6b3;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Max_Size(Get_Main_Window, 200, 201);
      Assert
        (Get_Max_Size(Get_Main_Window).Height = 201,
         "Failed to set max size of Tk main window.");

--  begin read only
   end Test_Set_Max_Size_test_wm_max_size2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Min_Size_2ac171_7d5aa0
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
         Test_Get_Min_Size_2ac171_7d5aa0_Result: constant Window_Size :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Min_Size(Window);
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
         return Test_Get_Min_Size_2ac171_7d5aa0_Result;
      end;
   end Wrap_Test_Get_Min_Size_2ac171_7d5aa0;
--  end read only

--  begin read only
   procedure Test_Get_Min_Size_test_wm_min_size(Gnattest_T: in out Test);
   procedure Test_Get_Min_Size_2ac171_7d5aa0(Gnattest_T: in out Test) renames
     Test_Get_Min_Size_test_wm_min_size;
--  id:2.2/2ac1715c082b9fe2/Get_Min_Size/1/0/test_wm_min_size/
   procedure Test_Get_Min_Size_test_wm_min_size(Gnattest_T: in out Test) is
      function Get_Min_Size(Window: Tk_Widget) return Window_Size renames
        Wrap_Test_Get_Min_Size_2ac171_7d5aa0;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Min_Size(Get_Main_Window, 100, 100);
      Assert
        (Get_Min_Size(Get_Main_Window).Width = 100,
         "Failed to get min size of Tk main window.");

--  begin read only
   end Test_Get_Min_Size_test_wm_min_size;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Min_Size_8a0b01_86115b
     (Window: Tk_Widget; Width, Height: Positive) is
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Min_Size
        (Window, Width, Height);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Min_Size2 test commitment violated");
      end;
   end Wrap_Test_Set_Min_Size_8a0b01_86115b;
--  end read only

--  begin read only
   procedure Test_Set_Min_Size_test_wm_min_size2(Gnattest_T: in out Test);
   procedure Test_Set_Min_Size_8a0b01_86115b(Gnattest_T: in out Test) renames
     Test_Set_Min_Size_test_wm_min_size2;
--  id:2.2/8a0b010a76d86cf7/Set_Min_Size/1/0/test_wm_min_size2/
   procedure Test_Set_Min_Size_test_wm_min_size2(Gnattest_T: in out Test) is
      procedure Set_Min_Size
        (Window: Tk_Widget; Width, Height: Positive) renames
        Wrap_Test_Set_Min_Size_8a0b01_86115b;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Min_Size(Get_Main_Window, 200, 201);
      Assert
        (Get_Min_Size(Get_Main_Window).Height = 201,
         "Failed to set min size of Tk main window.");

--  begin read only
   end Test_Set_Min_Size_test_wm_min_size2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Override_Redirect_09d97c_2fcf15
     (Window: Tk_Widget) return Tcl_Boolean_Result is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 20);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Override_Redirect test requirement violated");
      end;
      declare
         Test_Get_Override_Redirect_09d97c_2fcf15_Result: constant Tcl_Boolean_Result :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Override_Redirect
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
         return Test_Get_Override_Redirect_09d97c_2fcf15_Result;
      end;
   end Wrap_Test_Get_Override_Redirect_09d97c_2fcf15;
--  end read only

--  begin read only
   procedure Test_Get_Override_Redirect_test_wm_override_redirect
     (Gnattest_T: in out Test);
   procedure Test_Get_Override_Redirect_09d97c_2fcf15
     (Gnattest_T: in out Test) renames
     Test_Get_Override_Redirect_test_wm_override_redirect;
--  id:2.2/09d97c525f93152b/Get_Override_Redirect/1/0/test_wm_override_redirect/
   procedure Test_Get_Override_Redirect_test_wm_override_redirect
     (Gnattest_T: in out Test) is
      function Get_Override_Redirect
        (Window: Tk_Widget) return Tcl_Boolean_Result renames
        Wrap_Test_Get_Override_Redirect_09d97c_2fcf15;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (not Get_Override_Redirect(Get_Main_Window).Result,
         "Failed to get override redirect value for Tk main window.");

--  begin read only
   end Test_Get_Override_Redirect_test_wm_override_redirect;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Override_Redirect_92338d_fdca84
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Override_Redirect
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
   end Wrap_Test_Set_Override_Redirect_92338d_fdca84;
--  end read only

--  begin read only
   procedure Test_Set_Override_Redirect_test_wm_override_redirect
     (Gnattest_T: in out Test);
   procedure Test_Set_Override_Redirect_92338d_fdca84
     (Gnattest_T: in out Test) renames
     Test_Set_Override_Redirect_test_wm_override_redirect;
--  id:2.2/92338d1db609051c/Set_Override_Redirect/1/0/test_wm_override_redirect/
   procedure Test_Set_Override_Redirect_test_wm_override_redirect
     (Gnattest_T: in out Test) is
      procedure Set_Override_Redirect
        (Window: Tk_Widget; Override: Boolean) renames
        Wrap_Test_Set_Override_Redirect_92338d_fdca84;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Override_Redirect(Get_Main_Window, True);
      Assert
        (Get_Override_Redirect(Get_Main_Window).Result,
         "Failed to set override redirect value for Tk main window.");
      Set_Override_Redirect(Get_Main_Window, False);

--  begin read only
   end Test_Set_Override_Redirect_test_wm_override_redirect;
--  end read only

--  begin read only
   function Wrap_Test_Get_Position_From_369d0f_48bfdf
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
         Test_Get_Position_From_369d0f_48bfdf_Result: constant Position_From_Value :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Position_From
             (Window);
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
         return Test_Get_Position_From_369d0f_48bfdf_Result;
      end;
   end Wrap_Test_Get_Position_From_369d0f_48bfdf;
--  end read only

--  begin read only
   procedure Test_Get_Position_From_test_wm_position_from
     (Gnattest_T: in out Test);
   procedure Test_Get_Position_From_369d0f_48bfdf
     (Gnattest_T: in out Test) renames
     Test_Get_Position_From_test_wm_position_from;
--  id:2.2/369d0f535527955f/Get_Position_From/1/0/test_wm_position_from/
   procedure Test_Get_Position_From_test_wm_position_from
     (Gnattest_T: in out Test) is
      function Get_Position_From
        (Window: Tk_Widget) return Position_From_Value renames
        Wrap_Test_Get_Position_From_369d0f_48bfdf;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Position_From(Get_Main_Window, Default_Position_From);
      Assert
        (Get_Position_From(Get_Main_Window) = Default_Position_From,
         "Failed to get position from for Tk main window.");

--  begin read only
   end Test_Get_Position_From_test_wm_position_from;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Position_From_8a863a_a97a4c
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Position_From
        (Window, Who);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Position_From2 test commitment violated");
      end;
   end Wrap_Test_Set_Position_From_8a863a_a97a4c;
--  end read only

--  begin read only
   procedure Test_Set_Position_From_test_wm_position_from2
     (Gnattest_T: in out Test);
   procedure Test_Set_Position_From_8a863a_a97a4c
     (Gnattest_T: in out Test) renames
     Test_Set_Position_From_test_wm_position_from2;
--  id:2.2/8a863adc8576a354/Set_Position_From/1/0/test_wm_position_from2/
   procedure Test_Set_Position_From_test_wm_position_from2
     (Gnattest_T: in out Test) is
      procedure Set_Position_From
        (Window: Tk_Widget;
         Who: Position_From_Value := Default_Position_From) renames
        Wrap_Test_Set_Position_From_8a863a_a97a4c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Position_From(Get_Main_Window, USER);
      Assert
        (Get_Position_From(Get_Main_Window) = USER,
         "Failed to set position from for Tk main window.");

--  begin read only
   end Test_Set_Position_From_test_wm_position_from2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Protocols_dcaf07_4c2c40
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
         Test_Get_Protocols_dcaf07_4c2c40_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Protocols(Window);
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
         return Test_Get_Protocols_dcaf07_4c2c40_Result;
      end;
   end Wrap_Test_Get_Protocols_dcaf07_4c2c40;
--  end read only

--  begin read only
   procedure Test_Get_Protocols_test_wm_protocol(Gnattest_T: in out Test);
   procedure Test_Get_Protocols_dcaf07_4c2c40(Gnattest_T: in out Test) renames
     Test_Get_Protocols_test_wm_protocol;
--  id:2.2/dcaf07f8ddcfb1df/Get_Protocols/1/0/test_wm_protocol/
   procedure Test_Get_Protocols_test_wm_protocol(Gnattest_T: in out Test) is
      function Get_Protocols(Window: Tk_Widget) return Array_List renames
        Wrap_Test_Get_Protocols_dcaf07_4c2c40;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Protocols(Get_Main_Window)'Length = 0,
         "Failed to get default protocols for Tk main window.");

--  begin read only
   end Test_Get_Protocols_test_wm_protocol;
--  end read only

--  begin read only
   function Wrap_Test_Get_Protocol_aa44e2_dcb754
     (Window: Tk_Widget; Name: String) return String is
   begin
      begin
         pragma Assert
           ((Window /= Null_Widget and Name'Length > 0)
            and then
              To_Big_Integer(Tk_Path_Name(Widgt => Window)'Length) +
                To_Big_Integer(Name'Length) <
              To_Big_Integer(Integer'Last - 12));
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Protocol2 test requirement violated");
      end;
      declare
         Test_Get_Protocol_aa44e2_dcb754_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Protocol
             (Window, Name);
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
         return Test_Get_Protocol_aa44e2_dcb754_Result;
      end;
   end Wrap_Test_Get_Protocol_aa44e2_dcb754;
--  end read only

--  begin read only
   procedure Test_Get_Protocol_test_wm_protocol2(Gnattest_T: in out Test);
   procedure Test_Get_Protocol_aa44e2_dcb754(Gnattest_T: in out Test) renames
     Test_Get_Protocol_test_wm_protocol2;
--  id:2.2/aa44e237072653b7/Get_Protocol/1/0/test_wm_protocol2/
   procedure Test_Get_Protocol_test_wm_protocol2(Gnattest_T: in out Test) is
      function Get_Protocol
        (Window: Tk_Widget; Name: String) return String renames
        Wrap_Test_Get_Protocol_aa44e2_dcb754;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Protocol
        (Get_Main_Window, "WM_TAKE_FOCUS", To_Tcl_String("puts hello"));
      Assert
        (Get_Protocol(Get_Main_Window, "WM_TAKE_FOCUS") = "puts hello",
         "Failed to get command associated to WM_TAKE_FOCUS for Tk main window");

--  begin read only
   end Test_Get_Protocol_test_wm_protocol2;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Protocol_cd4a1b_4c09c4
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Protocol
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
   end Wrap_Test_Set_Protocol_cd4a1b_4c09c4;
--  end read only

--  begin read only
   procedure Test_Set_Protocol_test_wm_protocol3(Gnattest_T: in out Test);
   procedure Test_Set_Protocol_cd4a1b_4c09c4(Gnattest_T: in out Test) renames
     Test_Set_Protocol_test_wm_protocol3;
--  id:2.2/cd4a1b305c2e84fe/Set_Protocol/1/0/test_wm_protocol3/
   procedure Test_Set_Protocol_test_wm_protocol3(Gnattest_T: in out Test) is
      procedure Set_Protocol
        (Window: Tk_Widget; Name: String; New_Command: Tcl_String) renames
        Wrap_Test_Set_Protocol_cd4a1b_4c09c4;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Protocol
        (Get_Main_Window, "WM_TAKE_FOCUS", To_Tcl_String("puts hello"));
      Assert
        (Get_Protocol(Get_Main_Window, "WM_TAKE_FOCUS") = "puts hello",
         "Failed to set command associated to WM_TAKE_FOCUS for Tk main window");

--  begin read only
   end Test_Set_Protocol_test_wm_protocol3;
--  end read only

--  begin read only
   function Wrap_Test_Get_Resizable_0f6614_2b8386
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
         Test_Get_Resizable_0f6614_2b8386_Result: constant Resizable_Data :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Resizable(Window);
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
         return Test_Get_Resizable_0f6614_2b8386_Result;
      end;
   end Wrap_Test_Get_Resizable_0f6614_2b8386;
--  end read only

--  begin read only
   procedure Test_Get_Resizable_test_wm_resizable(Gnattest_T: in out Test);
   procedure Test_Get_Resizable_0f6614_2b8386(Gnattest_T: in out Test) renames
     Test_Get_Resizable_test_wm_resizable;
--  id:2.2/0f6614d7481d4f1a/Get_Resizable/1/0/test_wm_resizable/
   procedure Test_Get_Resizable_test_wm_resizable(Gnattest_T: in out Test) is
      function Get_Resizable(Window: Tk_Widget) return Resizable_Data renames
        Wrap_Test_Get_Resizable_0f6614_2b8386;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Resizable(Get_Main_Window).Height,
         "Failed to get resizable info for Tk main window.");

--  begin read only
   end Test_Get_Resizable_test_wm_resizable;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Resizable_0b9f82_b49918
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Resizable
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
   end Wrap_Test_Set_Resizable_0b9f82_b49918;
--  end read only

--  begin read only
   procedure Test_Set_Resizable_test_wm_resizable2(Gnattest_T: in out Test);
   procedure Test_Set_Resizable_0b9f82_b49918(Gnattest_T: in out Test) renames
     Test_Set_Resizable_test_wm_resizable2;
--  id:2.2/0b9f82b23218f6a2/Set_Resizable/1/0/test_wm_resizable2/
   procedure Test_Set_Resizable_test_wm_resizable2(Gnattest_T: in out Test) is
      procedure Set_Resizable
        (Window: Tk_Widget; Width, Height: Boolean) renames
        Wrap_Test_Set_Resizable_0b9f82_b49918;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Resizable(Get_Main_Window, True, False);
      Assert
        (not Get_Resizable(Get_Main_Window).Height,
         "Failed to set resizable info for Tk main window.");

--  begin read only
   end Test_Set_Resizable_test_wm_resizable2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Size_From_5c14ae_7bb223
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
         Test_Get_Size_From_5c14ae_7bb223_Result: constant Position_From_Value :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Size_From(Window);
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
         return Test_Get_Size_From_5c14ae_7bb223_Result;
      end;
   end Wrap_Test_Get_Size_From_5c14ae_7bb223;
--  end read only

--  begin read only
   procedure Test_Get_Size_From_test_wm_size_from(Gnattest_T: in out Test);
   procedure Test_Get_Size_From_5c14ae_7bb223(Gnattest_T: in out Test) renames
     Test_Get_Size_From_test_wm_size_from;
--  id:2.2/5c14ae6a29ff5d1c/Get_Size_From/1/0/test_wm_size_from/
   procedure Test_Get_Size_From_test_wm_size_from(Gnattest_T: in out Test) is
      function Get_Size_From
        (Window: Tk_Widget) return Position_From_Value renames
        Wrap_Test_Get_Size_From_5c14ae_7bb223;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Size_From(Get_Main_Window) = Default_Position_From,
         "Failed to get default size from for Tk main window.");

--  begin read only
   end Test_Get_Size_From_test_wm_size_from;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Size_From_e4e6f1_bc3e6a
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Size_From(Window, Who);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Size_From2 test commitment violated");
      end;
   end Wrap_Test_Set_Size_From_e4e6f1_bc3e6a;
--  end read only

--  begin read only
   procedure Test_Set_Size_From_test_wm_size_from2(Gnattest_T: in out Test);
   procedure Test_Set_Size_From_e4e6f1_bc3e6a(Gnattest_T: in out Test) renames
     Test_Set_Size_From_test_wm_size_from2;
--  id:2.2/e4e6f1d86c8db346/Set_Size_From/1/0/test_wm_size_from2/
   procedure Test_Set_Size_From_test_wm_size_from2(Gnattest_T: in out Test) is
      procedure Set_Size_From
        (Window: Tk_Widget;
         Who: Position_From_Value := Default_Position_From) renames
        Wrap_Test_Set_Size_From_e4e6f1_bc3e6a;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Size_From(Get_Main_Window, USER);
      Assert
        (Get_Size_From(Get_Main_Window) = USER,
         "Failed to set size from for Tk main window.");

--  begin read only
   end Test_Set_Size_From_test_wm_size_from2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Stack_Order_ad8dde_ada760
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
         Test_Get_Stack_Order_ad8dde_ada760_Result: constant Widgets_Array :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Stack_Order(Window);
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
         return Test_Get_Stack_Order_ad8dde_ada760_Result;
      end;
   end Wrap_Test_Get_Stack_Order_ad8dde_ada760;
--  end read only

--  begin read only
   procedure Test_Get_Stack_Order_test_wm_stack_order(Gnattest_T: in out Test);
   procedure Test_Get_Stack_Order_ad8dde_ada760
     (Gnattest_T: in out Test) renames
     Test_Get_Stack_Order_test_wm_stack_order;
--  id:2.2/ad8ddeaa750eef97/Get_Stack_Order/1/0/test_wm_stack_order/
   procedure Test_Get_Stack_Order_test_wm_stack_order
     (Gnattest_T: in out Test) is
      function Get_Stack_Order(Window: Tk_Widget) return Widgets_Array renames
        Wrap_Test_Get_Stack_Order_ad8dde_ada760;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      declare
         Result: constant Widgets_Array := Get_Stack_Order(Get_Main_Window);
      begin
         Assert
           (Result(1) = Get_Main_Window,
            "Failed to get stack order for Tk main window");
      end;

--  begin read only
   end Test_Get_Stack_Order_test_wm_stack_order;
--  end read only

--  begin read only
   function Wrap_Test_Get_Stack_Order_Above_707d59_dc5820
     (Window, Second_Window: Tk_Widget; Above: Boolean := True)
      return Tcl_Boolean_Result is
   begin
      begin
         pragma Assert
           ((Window /= Null_Widget and Second_Window /= Null_Widget)
            and then
              To_Big_Integer(Tk_Path_Name(Widgt => Window)'Length) +
                To_Big_Integer(Tk_Path_Name(Widgt => Second_Window)'Length) <
              To_Big_Integer(Integer'Last - 22));
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Stack_Order2 test requirement violated");
      end;
      declare
         Test_Get_Stack_Order_Above_707d59_dc5820_Result: constant Tcl_Boolean_Result :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Stack_Order_Above
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
         return Test_Get_Stack_Order_Above_707d59_dc5820_Result;
      end;
   end Wrap_Test_Get_Stack_Order_Above_707d59_dc5820;
--  end read only

--  begin read only
   procedure Test_Get_Stack_Order_Above_test_wm_stack_order2
     (Gnattest_T: in out Test);
   procedure Test_Get_Stack_Order_Above_707d59_dc5820
     (Gnattest_T: in out Test) renames
     Test_Get_Stack_Order_Above_test_wm_stack_order2;
--  id:2.2/707d596561e5f865/Get_Stack_Order_Above/1/0/test_wm_stack_order2/
   procedure Test_Get_Stack_Order_Above_test_wm_stack_order2
     (Gnattest_T: in out Test) is
      function Get_Stack_Order_Above
        (Window, Second_Window: Tk_Widget; Above: Boolean := True)
         return Tcl_Boolean_Result renames
        Wrap_Test_Get_Stack_Order_Above_707d59_dc5820;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (not Get_Stack_Order_Above(Get_Main_Window, Get_Main_Window).Result,
         "Failed to get if Tk main window is above self.");

--  begin read only
   end Test_Get_Stack_Order_Above_test_wm_stack_order2;
--  end read only

--  begin read only
   function Wrap_Test_Get_State_d36f93_369ab4
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
         Test_Get_State_d36f93_369ab4_Result: constant Window_States :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_State(Window);
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
         return Test_Get_State_d36f93_369ab4_Result;
      end;
   end Wrap_Test_Get_State_d36f93_369ab4;
--  end read only

--  begin read only
   procedure Test_Get_State_test_wm_state(Gnattest_T: in out Test);
   procedure Test_Get_State_d36f93_369ab4(Gnattest_T: in out Test) renames
     Test_Get_State_test_wm_state;
--  id:2.2/d36f937bace90b51/Get_State/1/0/test_wm_state/
   procedure Test_Get_State_test_wm_state(Gnattest_T: in out Test) is
      function Get_State(Window: Tk_Widget) return Window_States renames
        Wrap_Test_Get_State_d36f93_369ab4;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_State(Get_Main_Window) = Default_Window_State,
         "Failed to get default Tk main window state.");

--  begin read only
   end Test_Get_State_test_wm_state;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_State_5b3aeb_b6b816
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_State(Window, New_State);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_State2 test commitment violated");
      end;
   end Wrap_Test_Set_State_5b3aeb_b6b816;
--  end read only

--  begin read only
   procedure Test_Set_State_test_wm_state2(Gnattest_T: in out Test);
   procedure Test_Set_State_5b3aeb_b6b816(Gnattest_T: in out Test) renames
     Test_Set_State_test_wm_state2;
--  id:2.2/5b3aeb37ae679bd8/Set_State/1/0/test_wm_state2/
   procedure Test_Set_State_test_wm_state2(Gnattest_T: in out Test) is
      procedure Set_State
        (Window: Tk_Widget;
         New_State: Window_States := Default_Window_State) renames
        Wrap_Test_Set_State_5b3aeb_b6b816;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_State(Get_Main_Window, WITHDRAWN);
      Assert
        (Get_State(Get_Main_Window) = WITHDRAWN,
         "Failed to set Tk main window state.");

--  begin read only
   end Test_Set_State_test_wm_state2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Title_0b831c_790475
     (Window: Tk_Widget) return Tcl_String is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 9);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-wm.ads:0):Test_Wm_Title test requirement violated");
      end;
      declare
         Test_Get_Title_0b831c_790475_Result: constant Tcl_String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Title(Window);
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
         return Test_Get_Title_0b831c_790475_Result;
      end;
   end Wrap_Test_Get_Title_0b831c_790475;
--  end read only

--  begin read only
   procedure Test_Get_Title_test_wm_title(Gnattest_T: in out Test);
   procedure Test_Get_Title_0b831c_790475(Gnattest_T: in out Test) renames
     Test_Get_Title_test_wm_title;
--  id:2.2/0b831c9f4899cce4/Get_Title/1/0/test_wm_title/
   procedure Test_Get_Title_test_wm_title(Gnattest_T: in out Test) is
      function Get_Title(Window: Tk_Widget) return Tcl_String renames
        Wrap_Test_Get_Title_0b831c_790475;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Title(Get_Main_Window, To_Tcl_String("new title"));
      Assert
        (Get_Title(Get_Main_Window) = To_Tcl_String("new title"),
         "Failed to get title for Tk main window.");

--  begin read only
   end Test_Get_Title_test_wm_title;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Title_733354_35ca12
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Title(Window, New_Title);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Title2 test commitment violated");
      end;
   end Wrap_Test_Set_Title_733354_35ca12;
--  end read only

--  begin read only
   procedure Test_Set_Title_test_wm_title2(Gnattest_T: in out Test);
   procedure Test_Set_Title_733354_35ca12(Gnattest_T: in out Test) renames
     Test_Set_Title_test_wm_title2;
--  id:2.2/73335427dad936b0/Set_Title/1/0/test_wm_title2/
   procedure Test_Set_Title_test_wm_title2(Gnattest_T: in out Test) is
      procedure Set_Title(Window: Tk_Widget; New_Title: Tcl_String) renames
        Wrap_Test_Set_Title_733354_35ca12;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Title(Get_Main_Window, To_Tcl_String("My Title"));
      Assert
        (Get_Title(Get_Main_Window) = To_Tcl_String("My Title"),
         "Failed to set title for Tk main window.");

--  begin read only
   end Test_Set_Title_test_wm_title2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Transient_911661_b820a7
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
         Test_Get_Transient_911661_b820a7_Result: constant Tk_Widget :=
           GNATtest_Generated.GNATtest_Standard.Tk.Wm.Get_Transient(Window);
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
         return Test_Get_Transient_911661_b820a7_Result;
      end;
   end Wrap_Test_Get_Transient_911661_b820a7;
--  end read only

--  begin read only
   procedure Test_Get_Transient_test_wm_transient(Gnattest_T: in out Test);
   procedure Test_Get_Transient_911661_b820a7(Gnattest_T: in out Test) renames
     Test_Get_Transient_test_wm_transient;
--  id:2.2/91166127510dbebb/Get_Transient/1/0/test_wm_transient/
   procedure Test_Get_Transient_test_wm_transient(Gnattest_T: in out Test) is
      function Get_Transient(Window: Tk_Widget) return Tk_Widget renames
        Wrap_Test_Get_Transient_911661_b820a7;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Transient(Get_Main_Window) = Null_Widget,
         "Failed to get default transient widget for Tk window.");

--  begin read only
   end Test_Get_Transient_test_wm_transient;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Transient_522d97_9ec765
     (Window, Master: Tk_Widget) is
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
      GNATtest_Generated.GNATtest_Standard.Tk.Wm.Set_Transient(Window, Master);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-wm.ads:0:):Test_Wm_Transient2 test commitment violated");
      end;
   end Wrap_Test_Set_Transient_522d97_9ec765;
--  end read only

--  begin read only
   procedure Test_Set_Transient_test_wm_transient2(Gnattest_T: in out Test);
   procedure Test_Set_Transient_522d97_9ec765(Gnattest_T: in out Test) renames
     Test_Set_Transient_test_wm_transient2;
--  id:2.2/522d97fb19c4d4cb/Set_Transient/1/0/test_wm_transient2/
   procedure Test_Set_Transient_test_wm_transient2(Gnattest_T: in out Test) is
      procedure Set_Transient(Window, Master: Tk_Widget) renames
        Wrap_Test_Set_Transient_522d97_9ec765;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Dialog: Tk_Toplevel;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Dialog := Create(".myframe", Default_Toplevel_Create_Options);
      Set_Transient(Dialog, Get_Main_Window);
      Assert
        (Get_Transient(Dialog) = Get_Main_Window,
         "Failed to set transient window for Tk widget.");
      Destroy(Dialog);

--  begin read only
   end Test_Set_Transient_test_wm_transient2;
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
        (Get_State(Get_Main_Window) = WITHDRAWN,
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
