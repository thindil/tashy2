--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Menu.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Ada.Environment_Variables; use Ada.Environment_Variables;
with Tcl.Strings; use Tcl.Strings;
with Tcl.Variables; use Tcl.Variables;

--  begin read only
--  end read only
package body Tk.Menu.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

   function Integer_Get_Var is new Generic_Scalar_Tcl_Get_Var(Integer);

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Activate_e310e8_54120b
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) is
   begin
      begin
         pragma Assert
           (Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Activate_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Activate
        (Menu_Widget, Menu_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Activate_Menu test commitment violated");
      end;
   end Wrap_Test_Activate_e310e8_54120b;
--  end read only

--  begin read only
   procedure Test_1_Activate_test_activate_menu(Gnattest_T: in out Test);
   procedure Test_Activate_e310e8_54120b(Gnattest_T: in out Test) renames
     Test_1_Activate_test_activate_menu;
--  id:2.2/e310e84b92d86930/Activate/1/0/test_activate_menu/
   procedure Test_1_Activate_test_activate_menu(Gnattest_T: in out Test) is
      procedure Activate(Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) renames
        Wrap_Test_Activate_e310e8_54120b;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 12"), others => <>));
      Activate(Menu, To_Tcl_String("1"));
      Invoke(Menu, To_Tcl_String("active"));
      Assert(Integer_Get_Var("myvar") = 12, "Failed to activate menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_1_Activate_test_activate_menu;
--  end read only

--  begin read only
   procedure Wrap_Test_Activate_43ff2b_827a88
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Activate_Menu2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Activate
        (Menu_Widget, Menu_Index, Is_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Activate_Menu2 test commitment violated");
      end;
   end Wrap_Test_Activate_43ff2b_827a88;
--  end read only

--  begin read only
   procedure Test_2_Activate_test_activate_menu2(Gnattest_T: in out Test);
   procedure Test_Activate_43ff2b_827a88(Gnattest_T: in out Test) renames
     Test_2_Activate_test_activate_menu2;
--  id:2.2/43ff2bfd898ef2ba/Activate/0/0/test_activate_menu2/
   procedure Test_2_Activate_test_activate_menu2(Gnattest_T: in out Test) is
      procedure Activate
        (Menu_Widget: Tk_Menu; Menu_Index: Natural;
         Is_Index: Boolean := True) renames
        Wrap_Test_Activate_43ff2b_827a88;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 122"), others => <>));
      Activate(Menu, 1);
      Invoke(Menu, To_Tcl_String("active"));
      Assert(Integer_Get_Var("myvar") = 122, "Failed to activate menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_2_Activate_test_activate_menu2;
--  end read only

--  begin read only
   procedure Wrap_Test_Activate_c786dd_e56058
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Activate_Menu3 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Activate
        (Menu_Widget, Menu_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Activate_Menu3 test commitment violated");
      end;
   end Wrap_Test_Activate_c786dd_e56058;
--  end read only

--  begin read only
   procedure Test_3_Activate_test_activate_menu3(Gnattest_T: in out Test);
   procedure Test_Activate_c786dd_e56058(Gnattest_T: in out Test) renames
     Test_3_Activate_test_activate_menu3;
--  id:2.2/c786dd3039b63895/Activate/0/0/test_activate_menu3/
   procedure Test_3_Activate_test_activate_menu3(Gnattest_T: in out Test) is
      procedure Activate
        (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) renames
        Wrap_Test_Activate_c786dd_e56058;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 123"), others => <>));
      Activate(Menu, LAST);
      Invoke(Menu, To_Tcl_String("active"));
      Assert(Integer_Get_Var("myvar") = 123, "Failed to activate menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_3_Activate_test_activate_menu3;
--  end read only

--  begin read only
   procedure Wrap_Test_Add_0c595c_5ef6e5
     (Menu_Widget: Tk_Menu; Options: Menu_Item_Options) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Add_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Add(Menu_Widget, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Add_Menu test commitment violated");
      end;
   end Wrap_Test_Add_0c595c_5ef6e5;
--  end read only

--  begin read only
   procedure Test_Add_test_add_menu(Gnattest_T: in out Test);
   procedure Test_Add_0c595c_5ef6e5(Gnattest_T: in out Test) renames
     Test_Add_test_add_menu;
--  id:2.2/0c595c8b99343a81/Add/1/0/test_add_menu/
   procedure Test_Add_test_add_menu(Gnattest_T: in out Test) is
      procedure Add(Menu_Widget: Tk_Menu; Options: Menu_Item_Options) renames
        Wrap_Test_Add_0c595c_5ef6e5;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 14"), others => <>));
      Invoke(Menu, To_Tcl_String("1"));
      Assert(Integer_Get_Var("myvar") = 14, "Failed to add menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_Add_test_add_menu;
--  end read only

--  begin read only
   function Wrap_Test_Clone_cce6c8_8fed8c
     (Menu_Widget: Tk_Menu; New_Path_Name: Tk_Path_String;
      Menu_Type: Menu_Types := NONE) return Tk_Menu is
   begin
      begin
         pragma Assert
           (Menu_Widget /= Null_Widget and New_Path_Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Clone_Menu test requirement violated");
      end;
      declare
         Test_Clone_cce6c8_8fed8c_Result: constant Tk_Menu :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Clone
             (Menu_Widget, New_Path_Name, Menu_Type);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Clone_Menu test commitment violated");
         end;
         return Test_Clone_cce6c8_8fed8c_Result;
      end;
   end Wrap_Test_Clone_cce6c8_8fed8c;
--  end read only

--  begin read only
   procedure Test_Clone_test_clone_menu(Gnattest_T: in out Test);
   procedure Test_Clone_cce6c8_8fed8c(Gnattest_T: in out Test) renames
     Test_Clone_test_clone_menu;
--  id:2.2/cce6c8abdd50593a/Clone/1/0/test_clone_menu/
   procedure Test_Clone_test_clone_menu(Gnattest_T: in out Test) is
      function Clone
        (Menu_Widget: Tk_Menu; New_Path_Name: Tk_Path_String;
         Menu_Type: Menu_Types := NONE) return Tk_Menu renames
        Wrap_Test_Clone_cce6c8_8fed8c;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu, CloneMenu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 16"), others => <>));
      CloneMenu := Clone(Menu, ".mynewmenu");
      Invoke(CloneMenu, To_Tcl_String("1"));
      Assert(Integer_Get_Var("myvar") = 16, "Failed to clone menu.");
      Destroy(Menu);

--  begin read only
   end Test_Clone_test_clone_menu;
--  end read only

--  begin read only
   procedure Wrap_Test_Delete_a9ab1b_9992c1
     (Menu_Widget: Tk_Menu; Index1: Tcl_String;
      Index2: Tcl_String := To_Tcl_String(Source => "")) is
   begin
      begin
         pragma Assert
           (Menu_Widget /= Null_Widget and Length(Source => Index1) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Delete_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Delete
        (Menu_Widget, Index1, Index2);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Delete_Menu test commitment violated");
      end;
   end Wrap_Test_Delete_a9ab1b_9992c1;
--  end read only

--  begin read only
   procedure Test_1_Delete_test_delete_menu(Gnattest_T: in out Test);
   procedure Test_Delete_a9ab1b_9992c1(Gnattest_T: in out Test) renames
     Test_1_Delete_test_delete_menu;
--  id:2.2/a9ab1b16a4991733/Delete/1/0/test_delete_menu/
   procedure Test_1_Delete_test_delete_menu(Gnattest_T: in out Test) is
      procedure Delete
        (Menu_Widget: Tk_Menu; Index1: Tcl_String;
         Index2: Tcl_String := To_Tcl_String(Source => "")) renames
        Wrap_Test_Delete_a9ab1b_9992c1;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Delete(Menu, To_Tcl_String("1"));
      Invoke(Menu, To_Tcl_String("1"));
      Assert(Integer_Get_Var("myvar") = 14, "Failed to delete menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_1_Delete_test_delete_menu;
--  end read only

--  begin read only
   procedure Wrap_Test_Delete_6e86ea_8b9fc5
     (Menu_Widget: Tk_Menu; Index1: Natural; Index2: Extended_Natural := -1;
      Is_Index1, Is_Index2: Boolean := True) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Delete_Menu2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Delete
        (Menu_Widget, Index1, Index2, Is_Index1, Is_Index2);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Delete_Menu2 test commitment violated");
      end;
   end Wrap_Test_Delete_6e86ea_8b9fc5;
--  end read only

--  begin read only
   procedure Test_2_Delete_test_delete_menu2(Gnattest_T: in out Test);
   procedure Test_Delete_6e86ea_8b9fc5(Gnattest_T: in out Test) renames
     Test_2_Delete_test_delete_menu2;
--  id:2.2/6e86ea66f875b037/Delete/0/0/test_delete_menu2/
   procedure Test_2_Delete_test_delete_menu2(Gnattest_T: in out Test) is
      procedure Delete
        (Menu_Widget: Tk_Menu; Index1: Natural; Index2: Extended_Natural := -1;
         Is_Index1, Is_Index2: Boolean := True) renames
        Wrap_Test_Delete_6e86ea_8b9fc5;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 182"), others => <>));
      Delete(Menu, 1);
      Invoke(Menu, To_Tcl_String("1"));
      Assert(Integer_Get_Var("myvar") = 14, "Failed to delete menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_2_Delete_test_delete_menu2;
--  end read only

--  begin read only
   procedure Wrap_Test_Delete_99fa1b_da6433
     (Menu_Widget: Tk_Menu; Index1: Menu_Item_Indexes;
      Index2: Menu_Item_Indexes := NONE) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Delete_Menu3 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Delete
        (Menu_Widget, Index1, Index2);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Delete_Menu3 test commitment violated");
      end;
   end Wrap_Test_Delete_99fa1b_da6433;
--  end read only

--  begin read only
   procedure Test_3_Delete_test_delete_menu3(Gnattest_T: in out Test);
   procedure Test_Delete_99fa1b_da6433(Gnattest_T: in out Test) renames
     Test_3_Delete_test_delete_menu3;
--  id:2.2/99fa1bb7bf25e0be/Delete/0/0/test_delete_menu3/
   procedure Test_3_Delete_test_delete_menu3(Gnattest_T: in out Test) is
      procedure Delete
        (Menu_Widget: Tk_Menu; Index1: Menu_Item_Indexes;
         Index2: Menu_Item_Indexes := NONE) renames
        Wrap_Test_Delete_99fa1b_da6433;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 183"), others => <>));
      Delete(Menu, LAST);
      Invoke(Menu, To_Tcl_String("1"));
      Assert(Integer_Get_Var("myvar") = 14, "Failed to delete menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_3_Delete_test_delete_menu3;
--  end read only

--  begin read only
   function Wrap_Test_Entry_Get_Options_ef78cc_729271
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Menu_Item_Options is
   begin
      begin
         pragma Assert
           (Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Entry_Get_Options_Menu test requirement violated");
      end;
      declare
         Test_Entry_Get_Options_ef78cc_729271_Result: constant Menu_Item_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Entry_Get_Options
             (Menu_Widget, Menu_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Entry_Get_Options_Menu test commitment violated");
         end;
         return Test_Entry_Get_Options_ef78cc_729271_Result;
      end;
   end Wrap_Test_Entry_Get_Options_ef78cc_729271;
--  end read only

--  begin read only
   procedure Test_1_Entry_Get_Options_test_entry_get_options_menu
     (Gnattest_T: in out Test);
   procedure Test_Entry_Get_Options_ef78cc_729271
     (Gnattest_T: in out Test) renames
     Test_1_Entry_Get_Options_test_entry_get_options_menu;
--  id:2.2/ef78cc67b161c25c/Entry_Get_Options/1/0/test_entry_get_options_menu/
   procedure Test_1_Entry_Get_Options_test_entry_get_options_menu
     (Gnattest_T: in out Test) is
      function Entry_Get_Options
        (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String)
         return Menu_Item_Options renames
        Wrap_Test_Entry_Get_Options_ef78cc_729271;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;
      Options: Menu_Item_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Options := Entry_Get_Options(Menu, To_Tcl_String("1"));
      Assert
        (Options.Command = To_Tcl_String("set myvar 18"),
         "Failed to get options of the menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_1_Entry_Get_Options_test_entry_get_options_menu;
--  end read only

--  begin read only
   function Wrap_Test_Entry_Get_Options_0615ce_9f990e
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return Menu_Item_Options is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Entry_Get_Options_Menu2 test requirement violated");
      end;
      declare
         Test_Entry_Get_Options_0615ce_9f990e_Result: constant Menu_Item_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Entry_Get_Options
             (Menu_Widget, Menu_Index, Is_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Entry_Get_Options_Menu2 test commitment violated");
         end;
         return Test_Entry_Get_Options_0615ce_9f990e_Result;
      end;
   end Wrap_Test_Entry_Get_Options_0615ce_9f990e;
--  end read only

--  begin read only
   procedure Test_2_Entry_Get_Options_test_entry_get_options_menu2
     (Gnattest_T: in out Test);
   procedure Test_Entry_Get_Options_0615ce_9f990e
     (Gnattest_T: in out Test) renames
     Test_2_Entry_Get_Options_test_entry_get_options_menu2;
--  id:2.2/0615ce8b592c7d6a/Entry_Get_Options/0/0/test_entry_get_options_menu2/
   procedure Test_2_Entry_Get_Options_test_entry_get_options_menu2
     (Gnattest_T: in out Test) is
      function Entry_Get_Options
        (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
         return Menu_Item_Options renames
        Wrap_Test_Entry_Get_Options_0615ce_9f990e;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;
      Options: Menu_Item_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 182"), others => <>));
      Options := Entry_Get_Options(Menu, 1);
      Assert
        (Options.Command = To_Tcl_String("set myvar 182"),
         "Failed to get options of the menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_2_Entry_Get_Options_test_entry_get_options_menu2;
--  end read only

--  begin read only
   function Wrap_Test_Entry_Get_Options_d1b552_f00eb7
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
      return Menu_Item_Options is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Entry_Get_Options_Menu3 test requirement violated");
      end;
      declare
         Test_Entry_Get_Options_d1b552_f00eb7_Result: constant Menu_Item_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Entry_Get_Options
             (Menu_Widget, Menu_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Entry_Get_Options_Menu3 test commitment violated");
         end;
         return Test_Entry_Get_Options_d1b552_f00eb7_Result;
      end;
   end Wrap_Test_Entry_Get_Options_d1b552_f00eb7;
--  end read only

--  begin read only
   procedure Test_3_Entry_Get_Options_test_entry_get_options_menu3
     (Gnattest_T: in out Test);
   procedure Test_Entry_Get_Options_d1b552_f00eb7
     (Gnattest_T: in out Test) renames
     Test_3_Entry_Get_Options_test_entry_get_options_menu3;
--  id:2.2/d1b55253444ed097/Entry_Get_Options/0/0/test_entry_get_options_menu3/
   procedure Test_3_Entry_Get_Options_test_entry_get_options_menu3
     (Gnattest_T: in out Test) is
      function Entry_Get_Options
        (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
         return Menu_Item_Options renames
        Wrap_Test_Entry_Get_Options_d1b552_f00eb7;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;
      Options: Menu_Item_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 183"), others => <>));
      Options := Entry_Get_Options(Menu, LAST);
      Assert
        (Options.Command = To_Tcl_String("set myvar 183"),
         "Failed to get options of the menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_3_Entry_Get_Options_test_entry_get_options_menu3;
--  end read only

--  begin read only
   procedure Wrap_Test_Entry_Configure_1d51e9_fc4fb1
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String;
      Options: Menu_Item_Options) is
   begin
      begin
         pragma Assert
           (Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Entry_Configure_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Entry_Configure
        (Menu_Widget, Menu_Index, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Entry_Configure_Menu test commitment violated");
      end;
   end Wrap_Test_Entry_Configure_1d51e9_fc4fb1;
--  end read only

--  begin read only
   procedure Test_1_Entry_Configure_test_entry_configure_menu
     (Gnattest_T: in out Test);
   procedure Test_Entry_Configure_1d51e9_fc4fb1
     (Gnattest_T: in out Test) renames
     Test_1_Entry_Configure_test_entry_configure_menu;
--  id:2.2/1d51e9e2deefcfee/Entry_Configure/1/0/test_entry_configure_menu/
   procedure Test_1_Entry_Configure_test_entry_configure_menu
     (Gnattest_T: in out Test) is
      procedure Entry_Configure
        (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String;
         Options: Menu_Item_Options) renames
        Wrap_Test_Entry_Configure_1d51e9_fc4fb1;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;
      Options, Options2: Menu_Item_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Options :=
        (Item_Type => COMMAND, Label => To_Tcl_String("New label"),
         others => <>);
      Entry_Configure(Menu, To_Tcl_String("1"), Options);
      Options2 := Entry_Get_Options(Menu, To_Tcl_String("1"));
      Assert
        (Options2.Label = Options.Label,
         "Failed to set options of the menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_1_Entry_Configure_test_entry_configure_menu;
--  end read only

--  begin read only
   procedure Wrap_Test_Entry_Configure_73d2b1_c3ebe5
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Options: Menu_Item_Options;
      Is_Index: Boolean := True) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Entry_Configure_Menu2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Entry_Configure
        (Menu_Widget, Menu_Index, Options, Is_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Entry_Configure_Menu2 test commitment violated");
      end;
   end Wrap_Test_Entry_Configure_73d2b1_c3ebe5;
--  end read only

--  begin read only
   procedure Test_2_Entry_Configure_test_entry_configure_menu2
     (Gnattest_T: in out Test);
   procedure Test_Entry_Configure_73d2b1_c3ebe5
     (Gnattest_T: in out Test) renames
     Test_2_Entry_Configure_test_entry_configure_menu2;
--  id:2.2/73d2b18900351fdc/Entry_Configure/0/0/test_entry_configure_menu2/
   procedure Test_2_Entry_Configure_test_entry_configure_menu2
     (Gnattest_T: in out Test) is
      procedure Entry_Configure
        (Menu_Widget: Tk_Menu; Menu_Index: Natural; Options: Menu_Item_Options;
         Is_Index: Boolean := True) renames
        Wrap_Test_Entry_Configure_73d2b1_c3ebe5;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;
      Options, Options2: Menu_Item_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 182"), others => <>));
      Options :=
        (Item_Type => COMMAND, Label => To_Tcl_String("New label"),
         others => <>);
      Entry_Configure(Menu, 1, Options);
      Options2 := Entry_Get_Options(Menu, To_Tcl_String("1"));
      Assert
        (Options2.Label = Options.Label,
         "Failed to set options of the menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_2_Entry_Configure_test_entry_configure_menu2;
--  end read only

--  begin read only
   procedure Wrap_Test_Entry_Configure_138c3b_1d928b
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes;
      Options: Menu_Item_Options) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Entry_Configure_Menu3 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Entry_Configure
        (Menu_Widget, Menu_Index, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Entry_Configure_Menu3 test commitment violated");
      end;
   end Wrap_Test_Entry_Configure_138c3b_1d928b;
--  end read only

--  begin read only
   procedure Test_3_Entry_Configure_test_entry_configure_menu3
     (Gnattest_T: in out Test);
   procedure Test_Entry_Configure_138c3b_1d928b
     (Gnattest_T: in out Test) renames
     Test_3_Entry_Configure_test_entry_configure_menu3;
--  id:2.2/138c3b85bffe70b9/Entry_Configure/0/0/test_entry_configure_menu3/
   procedure Test_3_Entry_Configure_test_entry_configure_menu3
     (Gnattest_T: in out Test) is
      procedure Entry_Configure
        (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes;
         Options: Menu_Item_Options) renames
        Wrap_Test_Entry_Configure_138c3b_1d928b;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;
      Options, Options2: Menu_Item_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 183"), others => <>));
      Options :=
        (Item_Type => COMMAND, Label => To_Tcl_String("New label"),
         others => <>);
      Entry_Configure(Menu, LAST, Options);
      Options2 := Entry_Get_Options(Menu, To_Tcl_String("1"));
      Assert
        (Options2.Label = Options.Label,
         "Failed to set options of the menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_3_Entry_Configure_test_entry_configure_menu3;
--  end read only

--  begin read only
   function Wrap_Test_Index_d34072_0f3076
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Extended_Natural is
   begin
      begin
         pragma Assert
           (Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Index_Menu test requirement violated");
      end;
      declare
         Test_Index_d34072_0f3076_Result: constant Extended_Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Index
             (Menu_Widget, Menu_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Index_Menu test commitment violated");
         end;
         return Test_Index_d34072_0f3076_Result;
      end;
   end Wrap_Test_Index_d34072_0f3076;
--  end read only

--  begin read only
   procedure Test_1_Index_test_index_menu(Gnattest_T: in out Test);
   procedure Test_Index_d34072_0f3076(Gnattest_T: in out Test) renames
     Test_1_Index_test_index_menu;
--  id:2.2/d34072613038bb35/Index/1/0/test_index_menu/
   procedure Test_1_Index_test_index_menu(Gnattest_T: in out Test) is
      function Index
        (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String)
         return Extended_Natural renames
        Wrap_Test_Index_d34072_0f3076;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Assert
        (Index(Menu, To_Tcl_String("end")) = 1,
         "Failed to get numerical index of the menu entry with Tcl_String.");
      Destroy(Menu);

--  begin read only
   end Test_1_Index_test_index_menu;
--  end read only

--  begin read only
   function Wrap_Test_Index_032cb4_ad9207
     (Menu_Widget: Tk_Menu; Menu_Index: Natural) return Extended_Natural is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Index_Menu2 test requirement violated");
      end;
      declare
         Test_Index_032cb4_ad9207_Result: constant Extended_Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Index
             (Menu_Widget, Menu_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Index_Menu2 test commitment violated");
         end;
         return Test_Index_032cb4_ad9207_Result;
      end;
   end Wrap_Test_Index_032cb4_ad9207;
--  end read only

--  begin read only
   procedure Test_2_Index_test_index_menu2(Gnattest_T: in out Test);
   procedure Test_Index_032cb4_ad9207(Gnattest_T: in out Test) renames
     Test_2_Index_test_index_menu2;
--  id:2.2/032cb4ee797a7dab/Index/0/0/test_index_menu2/
   procedure Test_2_Index_test_index_menu2(Gnattest_T: in out Test) is
      function Index
        (Menu_Widget: Tk_Menu; Menu_Index: Natural)
         return Extended_Natural renames
        Wrap_Test_Index_032cb4_ad9207;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(Tear_Off => FALSE, others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Assert
        (Index(Menu, 1) = 0,
         "Failed to get numerical index of the menu entry with Natural.");
      Destroy(Menu);

--  begin read only
   end Test_2_Index_test_index_menu2;
--  end read only

--  begin read only
   function Wrap_Test_Index_e3e5f0_c1d386
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
      return Extended_Natural is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Index_Menu3 test requirement violated");
      end;
      declare
         Test_Index_e3e5f0_c1d386_Result: constant Extended_Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Index
             (Menu_Widget, Menu_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Index_Menu3 test commitment violated");
         end;
         return Test_Index_e3e5f0_c1d386_Result;
      end;
   end Wrap_Test_Index_e3e5f0_c1d386;
--  end read only

--  begin read only
   procedure Test_3_Index_test_index_menu3(Gnattest_T: in out Test);
   procedure Test_Index_e3e5f0_c1d386(Gnattest_T: in out Test) renames
     Test_3_Index_test_index_menu3;
--  id:2.2/e3e5f03218b4ed4c/Index/0/0/test_index_menu3/
   procedure Test_3_Index_test_index_menu3(Gnattest_T: in out Test) is
      function Index
        (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
         return Extended_Natural renames
        Wrap_Test_Index_e3e5f0_c1d386;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Assert
        (Index(Menu, LAST) = 1,
         "Failed to get numerical index of the menu entry with Menu_Item_Index.");
      Destroy(Menu);

--  begin read only
   end Test_3_Index_test_index_menu3;
--  end read only

--  begin read only
   procedure Wrap_Test_Insert_3b526a_33fb34
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options) is
   begin
      begin
         pragma Assert
           (Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Insert_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Insert
        (Menu_Widget, Menu_Index, Item_Type, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Insert_Menu test commitment violated");
      end;
   end Wrap_Test_Insert_3b526a_33fb34;
--  end read only

--  begin read only
   procedure Test_1_Insert_test_insert_menu(Gnattest_T: in out Test);
   procedure Test_Insert_3b526a_33fb34(Gnattest_T: in out Test) renames
     Test_1_Insert_test_insert_menu;
--  id:2.2/3b526a896088071a/Insert/1/0/test_insert_menu/
   procedure Test_1_Insert_test_insert_menu(Gnattest_T: in out Test) is
      procedure Insert
        (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String;
         Item_Type: Menu_Item_Types; Options: Menu_Item_Options) renames
        Wrap_Test_Insert_3b526a_33fb34;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Insert
        (Menu, To_Tcl_String("1"), COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Invoke(Menu, To_Tcl_String("1"));
      Assert
        (Integer_Get_Var("myvar") = 20,
         "Failed to insert a new entry to the menu with Tcl_String index.");
      Destroy(Menu);

--  begin read only
   end Test_1_Insert_test_insert_menu;
--  end read only

--  begin read only
   procedure Wrap_Test_Insert_fde4b6_24d8d2
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options; Is_Index: Boolean := True) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Insert_Menu2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Insert
        (Menu_Widget, Menu_Index, Item_Type, Options, Is_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Insert_Menu2 test commitment violated");
      end;
   end Wrap_Test_Insert_fde4b6_24d8d2;
--  end read only

--  begin read only
   procedure Test_2_Insert_test_insert_menu2(Gnattest_T: in out Test);
   procedure Test_Insert_fde4b6_24d8d2(Gnattest_T: in out Test) renames
     Test_2_Insert_test_insert_menu2;
--  id:2.2/fde4b6cd2b3c7524/Insert/0/0/test_insert_menu2/
   procedure Test_2_Insert_test_insert_menu2(Gnattest_T: in out Test) is
      procedure Insert
        (Menu_Widget: Tk_Menu; Menu_Index: Natural; Item_Type: Menu_Item_Types;
         Options: Menu_Item_Options; Is_Index: Boolean := True) renames
        Wrap_Test_Insert_fde4b6_24d8d2;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Insert
        (Menu, 1, COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 220"), others => <>));
      Invoke(Menu, To_Tcl_String("1"));
      Assert
        (Integer_Get_Var("myvar") = 220,
         "Failed to insert a new entry to the menu with Natural index.");
      Destroy(Menu);

--  begin read only
   end Test_2_Insert_test_insert_menu2;
--  end read only

--  begin read only
   procedure Wrap_Test_Insert_3d057c_d006b1
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes;
      Item_Type: Menu_Item_Types; Options: Menu_Item_Options) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Insert_Menu3 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Insert
        (Menu_Widget, Menu_Index, Item_Type, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Insert_Menu3 test commitment violated");
      end;
   end Wrap_Test_Insert_3d057c_d006b1;
--  end read only

--  begin read only
   procedure Test_3_Insert_test_insert_menu3(Gnattest_T: in out Test);
   procedure Test_Insert_3d057c_d006b1(Gnattest_T: in out Test) renames
     Test_3_Insert_test_insert_menu3;
--  id:2.2/3d057c2fb6dfdbe1/Insert/0/0/test_insert_menu3/
   procedure Test_3_Insert_test_insert_menu3(Gnattest_T: in out Test) is
      procedure Insert
        (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes;
         Item_Type: Menu_Item_Types; Options: Menu_Item_Options) renames
        Wrap_Test_Insert_3d057c_d006b1;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Insert
        (Menu, LAST, COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 230"), others => <>));
      Invoke(Menu, LAST);
      Assert
        (Integer_Get_Var("myvar") = 230,
         "Failed to insert a new entry to the menu with Menu_Item_Indexes index.");
      Destroy(Menu);

--  begin read only
   end Test_3_Insert_test_insert_menu3;
--  end read only

--  begin read only
   procedure Wrap_Test_Invoke_49d5a3_7b2d3d
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) is
   begin
      begin
         pragma Assert
           (Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Invoke_Menu1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Invoke
        (Menu_Widget, Menu_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Invoke_Menu1 test commitment violated");
      end;
   end Wrap_Test_Invoke_49d5a3_7b2d3d;
--  end read only

--  begin read only
   procedure Test_1_Invoke_test_invoke_menu1(Gnattest_T: in out Test);
   procedure Test_Invoke_49d5a3_7b2d3d(Gnattest_T: in out Test) renames
     Test_1_Invoke_test_invoke_menu1;
--  id:2.2/49d5a34545cc4ea1/Invoke/1/0/test_invoke_menu1/
   procedure Test_1_Invoke_test_invoke_menu1(Gnattest_T: in out Test) is
      procedure Invoke(Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) renames
        Wrap_Test_Invoke_49d5a3_7b2d3d;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Invoke(Menu, To_Tcl_String("1"));
      Assert
        (Integer_Get_Var("myvar") = 18,
         "Failed to invoke the menu entry with Tcl_String index.");
      Destroy(Menu);

--  begin read only
   end Test_1_Invoke_test_invoke_menu1;
--  end read only

--  begin read only
   procedure Wrap_Test_Invoke_7593eb_d8311f
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Invoke_Menu3 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Invoke
        (Menu_Widget, Menu_Index, Is_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Invoke_Menu3 test commitment violated");
      end;
   end Wrap_Test_Invoke_7593eb_d8311f;
--  end read only

--  begin read only
   procedure Test_2_Invoke_test_invoke_menu3(Gnattest_T: in out Test);
   procedure Test_Invoke_7593eb_d8311f(Gnattest_T: in out Test) renames
     Test_2_Invoke_test_invoke_menu3;
--  id:2.2/7593ebc4c4763bb1/Invoke/0/0/test_invoke_menu3/
   procedure Test_2_Invoke_test_invoke_menu3(Gnattest_T: in out Test) is
      procedure Invoke
        (Menu_Widget: Tk_Menu; Menu_Index: Natural;
         Is_Index: Boolean := True) renames
        Wrap_Test_Invoke_7593eb_d8311f;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 128"), others => <>));
      Invoke(Menu, 1);
      Assert
        (Integer_Get_Var("myvar") = 128,
         "Failed to invoke the menu entry with Natural index.");
      Destroy(Menu);

--  begin read only
   end Test_2_Invoke_test_invoke_menu3;
--  end read only

--  begin read only
   procedure Wrap_Test_Invoke_d16f08_c23171
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Invoke_Menu4 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Invoke
        (Menu_Widget, Menu_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Invoke_Menu4 test commitment violated");
      end;
   end Wrap_Test_Invoke_d16f08_c23171;
--  end read only

--  begin read only
   procedure Test_3_Invoke_test_invoke_menu4(Gnattest_T: in out Test);
   procedure Test_Invoke_d16f08_c23171(Gnattest_T: in out Test) renames
     Test_3_Invoke_test_invoke_menu4;
--  id:2.2/d16f08a15380c9bb/Invoke/0/0/test_invoke_menu4/
   procedure Test_3_Invoke_test_invoke_menu4(Gnattest_T: in out Test) is
      procedure Invoke
        (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) renames
        Wrap_Test_Invoke_d16f08_c23171;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 138"), others => <>));
      Invoke(Menu, 1);
      Assert
        (Integer_Get_Var("myvar") = 138,
         "Failed to invoke the menu entry with Menu_Item_Indexes index.");
      Destroy(Menu);

--  begin read only
   end Test_3_Invoke_test_invoke_menu4;
--  end read only

--  begin read only
   function Wrap_Test_Invoke_0a3e65_d5e898
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return String is
   begin
      begin
         pragma Assert
           (Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Invoke_Menu2 test requirement violated");
      end;
      declare
         Test_Invoke_0a3e65_d5e898_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Invoke
             (Menu_Widget, Menu_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Invoke_Menu2 test commitment violated");
         end;
         return Test_Invoke_0a3e65_d5e898_Result;
      end;
   end Wrap_Test_Invoke_0a3e65_d5e898;
--  end read only

--  begin read only
   procedure Test_4_Invoke_test_invoke_menu2(Gnattest_T: in out Test);
   procedure Test_Invoke_0a3e65_d5e898(Gnattest_T: in out Test) renames
     Test_4_Invoke_test_invoke_menu2;
--  id:2.2/0a3e653fbd9b066f/Invoke/0/0/test_invoke_menu2/
   procedure Test_4_Invoke_test_invoke_menu2(Gnattest_T: in out Test) is
      function Invoke
        (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return String renames
        Wrap_Test_Invoke_0a3e65_d5e898;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Assert
        (Invoke(Menu, To_Tcl_String("1")) = "20",
         "Failed to invoke the menu entry and get it result with Tcl_String index.");
      Destroy(Menu);

--  begin read only
   end Test_4_Invoke_test_invoke_menu2;
--  end read only

--  begin read only
   function Wrap_Test_Invoke_781f8e_c01adc
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return String is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Invoke_Menu5 test requirement violated");
      end;
      declare
         Test_Invoke_781f8e_c01adc_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Invoke
             (Menu_Widget, Menu_Index, Is_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Invoke_Menu5 test commitment violated");
         end;
         return Test_Invoke_781f8e_c01adc_Result;
      end;
   end Wrap_Test_Invoke_781f8e_c01adc;
--  end read only

--  begin read only
   procedure Test_5_Invoke_test_invoke_menu5(Gnattest_T: in out Test);
   procedure Test_Invoke_781f8e_c01adc(Gnattest_T: in out Test) renames
     Test_5_Invoke_test_invoke_menu5;
--  id:2.2/781f8ec621995590/Invoke/0/0/test_invoke_menu5/
   procedure Test_5_Invoke_test_invoke_menu5(Gnattest_T: in out Test) is
      function Invoke
        (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
         return String renames
        Wrap_Test_Invoke_781f8e_c01adc;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 220"), others => <>));
      Assert
        (Invoke(Menu, 1) = "220",
         "Failed to invoke the menu entry and get it result with Natural index.");
      Destroy(Menu);

--  begin read only
   end Test_5_Invoke_test_invoke_menu5;
--  end read only

--  begin read only
   function Wrap_Test_Invoke_a338ab_66d08a
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) return String is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Invoke_Menu6 test requirement violated");
      end;
      declare
         Test_Invoke_a338ab_66d08a_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Invoke
             (Menu_Widget, Menu_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Invoke_Menu6 test commitment violated");
         end;
         return Test_Invoke_a338ab_66d08a_Result;
      end;
   end Wrap_Test_Invoke_a338ab_66d08a;
--  end read only

--  begin read only
   procedure Test_6_Invoke_test_invoke_menu6(Gnattest_T: in out Test);
   procedure Test_Invoke_a338ab_66d08a(Gnattest_T: in out Test) renames
     Test_6_Invoke_test_invoke_menu6;
--  id:2.2/a338ab7f4640e446/Invoke/0/0/test_invoke_menu6/
   procedure Test_6_Invoke_test_invoke_menu6(Gnattest_T: in out Test) is
      function Invoke
        (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
         return String renames
        Wrap_Test_Invoke_a338ab_66d08a;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 230"), others => <>));
      Assert
        (Invoke(Menu, LAST) = "230",
         "Failed to invoke the menu entry and get it result with Menu_Item_Indexes index.");
      Destroy(Menu);

--  begin read only
   end Test_6_Invoke_test_invoke_menu6;
--  end read only

--  begin read only
   procedure Wrap_Test_Post_297225_baf848
     (Menu_Widget: Tk_Menu; X, Y: Natural) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Post_Menu1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Post(Menu_Widget, X, Y);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Post_Menu1 test commitment violated");
      end;
   end Wrap_Test_Post_297225_baf848;
--  end read only

--  begin read only
   procedure Test_1_Post_test_post_menu1(Gnattest_T: in out Test);
   procedure Test_Post_297225_baf848(Gnattest_T: in out Test) renames
     Test_1_Post_test_post_menu1;
--  id:2.2/297225f173973896/Post/1/0/test_post_menu1/
   procedure Test_1_Post_test_post_menu1(Gnattest_T: in out Test) is
      procedure Post(Menu_Widget: Tk_Menu; X, Y: Natural) renames
        Wrap_Test_Post_297225_baf848;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Post(Menu, 1, 1);
      Assert(True, "This test can only crash.");
      Destroy(Menu);

--  begin read only
   end Test_1_Post_test_post_menu1;
--  end read only

--  begin read only
   function Wrap_Test_Post_311578_f13317
     (Menu_Widget: Tk_Menu; X, Y: Natural) return String is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Post_Menu2 test requirement violated");
      end;
      declare
         Test_Post_311578_f13317_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Post
             (Menu_Widget, X, Y);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Post_Menu2 test commitment violated");
         end;
         return Test_Post_311578_f13317_Result;
      end;
   end Wrap_Test_Post_311578_f13317;
--  end read only

--  begin read only
   procedure Test_2_Post_test_post_menu2(Gnattest_T: in out Test);
   procedure Test_Post_311578_f13317(Gnattest_T: in out Test) renames
     Test_2_Post_test_post_menu2;
--  id:2.2/311578116772a834/Post/0/0/test_post_menu2/
   procedure Test_2_Post_test_post_menu2(Gnattest_T: in out Test) is
      function Post(Menu_Widget: Tk_Menu; X, Y: Natural) return String renames
        Wrap_Test_Post_311578_f13317;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Menu, ".mymenu",
         Menu_Options'
           (Post_Command => To_Tcl_String("set myvar 22"), others => <>));
      Assert
        (Post(Menu, 0, 0) = "22",
         "Failed to get result of post command for the menu.");
      Destroy(Menu);

--  begin read only
   end Test_2_Post_test_post_menu2;
--  end read only

--  begin read only
   procedure Wrap_Test_Post_Cascade_09822b_aeea07
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) is
   begin
      begin
         pragma Assert
           (Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_PostCascade_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Post_Cascade
        (Menu_Widget, Menu_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_PostCascade_Menu test commitment violated");
      end;
   end Wrap_Test_Post_Cascade_09822b_aeea07;
--  end read only

--  begin read only
   procedure Test_1_Post_Cascade_test_postcascade_menu
     (Gnattest_T: in out Test);
   procedure Test_Post_Cascade_09822b_aeea07(Gnattest_T: in out Test) renames
     Test_1_Post_Cascade_test_postcascade_menu;
--  id:2.2/09822bcc68bc7a63/Post_Cascade/1/0/test_postcascade_menu/
   procedure Test_1_Post_Cascade_test_postcascade_menu
     (Gnattest_T: in out Test) is
      procedure Post_Cascade
        (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) renames
        Wrap_Test_Post_Cascade_09822b_aeea07;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Post_Cascade(Menu, To_Tcl_String("1"));
      Assert(True, "This test can only crash.");
      Destroy(Menu);

--  begin read only
   end Test_1_Post_Cascade_test_postcascade_menu;
--  end read only

--  begin read only
   procedure Wrap_Test_Post_Cascade_cc0d55_c83524
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_PostCascade_Menu2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Post_Cascade
        (Menu_Widget, Menu_Index, Is_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_PostCascade_Menu2 test commitment violated");
      end;
   end Wrap_Test_Post_Cascade_cc0d55_c83524;
--  end read only

--  begin read only
   procedure Test_2_Post_Cascade_test_postcascade_menu2
     (Gnattest_T: in out Test);
   procedure Test_Post_Cascade_cc0d55_c83524(Gnattest_T: in out Test) renames
     Test_2_Post_Cascade_test_postcascade_menu2;
--  id:2.2/cc0d55e2f01430e1/Post_Cascade/0/0/test_postcascade_menu2/
   procedure Test_2_Post_Cascade_test_postcascade_menu2
     (Gnattest_T: in out Test) is
      procedure Post_Cascade
        (Menu_Widget: Tk_Menu; Menu_Index: Natural;
         Is_Index: Boolean := True) renames
        Wrap_Test_Post_Cascade_cc0d55_c83524;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Post_Cascade(Menu, 1);
      Assert(True, "This test can only crash.");
      Destroy(Menu);

--  begin read only
   end Test_2_Post_Cascade_test_postcascade_menu2;
--  end read only

--  begin read only
   procedure Wrap_Test_Post_Cascade_38af3a_1e3e67
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_PostCascade_Menu3 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Post_Cascade
        (Menu_Widget, Menu_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_PostCascade_Menu3 test commitment violated");
      end;
   end Wrap_Test_Post_Cascade_38af3a_1e3e67;
--  end read only

--  begin read only
   procedure Test_3_Post_Cascade_test_postcascade_menu3
     (Gnattest_T: in out Test);
   procedure Test_Post_Cascade_38af3a_1e3e67(Gnattest_T: in out Test) renames
     Test_3_Post_Cascade_test_postcascade_menu3;
--  id:2.2/38af3a44bddc1284/Post_Cascade/0/0/test_postcascade_menu3/
   procedure Test_3_Post_Cascade_test_postcascade_menu3
     (Gnattest_T: in out Test) is
      procedure Post_Cascade
        (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) renames
        Wrap_Test_Post_Cascade_38af3a_1e3e67;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Post_Cascade(Menu, LAST);
      Assert(True, "This test can only crash.");
      Destroy(Menu);

--  begin read only
   end Test_3_Post_Cascade_test_postcascade_menu3;
--  end read only

--  begin read only
   function Wrap_Test_Get_Item_Type_a8752e_8c54de
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Menu_Item_Types is
   begin
      begin
         pragma Assert
           (Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Get_Item_Type_Menu test requirement violated");
      end;
      declare
         Test_Get_Item_Type_a8752e_8c54de_Result: constant Menu_Item_Types :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Get_Item_Type
             (Menu_Widget, Menu_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Get_Item_Type_Menu test commitment violated");
         end;
         return Test_Get_Item_Type_a8752e_8c54de_Result;
      end;
   end Wrap_Test_Get_Item_Type_a8752e_8c54de;
--  end read only

--  begin read only
   procedure Test_1_Get_Item_Type_test_get_item_type_menu
     (Gnattest_T: in out Test);
   procedure Test_Get_Item_Type_a8752e_8c54de(Gnattest_T: in out Test) renames
     Test_1_Get_Item_Type_test_get_item_type_menu;
--  id:2.2/a8752eeb9d339580/Get_Item_Type/1/0/test_get_item_type_menu/
   procedure Test_1_Get_Item_Type_test_get_item_type_menu
     (Gnattest_T: in out Test) is
      function Get_Item_Type
        (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String)
         return Menu_Item_Types renames
        Wrap_Test_Get_Item_Type_a8752e_8c54de;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Assert
        (Get_Item_Type(Menu, To_Tcl_String("1")) = COMMAND,
         "Failed to get type of menu entry with Tcl_String index.");
      Destroy(Menu);

--  begin read only
   end Test_1_Get_Item_Type_test_get_item_type_menu;
--  end read only

--  begin read only
   function Wrap_Test_Get_Item_Type_2b168c_962e70
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return Menu_Item_Types is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Get_Item_Type_Menu2 test requirement violated");
      end;
      declare
         Test_Get_Item_Type_2b168c_962e70_Result: constant Menu_Item_Types :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Get_Item_Type
             (Menu_Widget, Menu_Index, Is_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Get_Item_Type_Menu2 test commitment violated");
         end;
         return Test_Get_Item_Type_2b168c_962e70_Result;
      end;
   end Wrap_Test_Get_Item_Type_2b168c_962e70;
--  end read only

--  begin read only
   procedure Test_2_Get_Item_Type_test_get_item_type_menu2
     (Gnattest_T: in out Test);
   procedure Test_Get_Item_Type_2b168c_962e70(Gnattest_T: in out Test) renames
     Test_2_Get_Item_Type_test_get_item_type_menu2;
--  id:2.2/2b168c08f56c2411/Get_Item_Type/0/0/test_get_item_type_menu2/
   procedure Test_2_Get_Item_Type_test_get_item_type_menu2
     (Gnattest_T: in out Test) is
      function Get_Item_Type
        (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
         return Menu_Item_Types renames
        Wrap_Test_Get_Item_Type_2b168c_962e70;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Assert
        (Get_Item_Type(Menu, 1) = COMMAND,
         "Failed to get type of menu entry with Natural Index.");
      Destroy(Menu);

--  begin read only
   end Test_2_Get_Item_Type_test_get_item_type_menu2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Item_Type_8d689d_527e33
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
      return Menu_Item_Types is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Get_Item_Type_Menu3 test requirement violated");
      end;
      declare
         Test_Get_Item_Type_8d689d_527e33_Result: constant Menu_Item_Types :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Get_Item_Type
             (Menu_Widget, Menu_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Get_Item_Type_Menu3 test commitment violated");
         end;
         return Test_Get_Item_Type_8d689d_527e33_Result;
      end;
   end Wrap_Test_Get_Item_Type_8d689d_527e33;
--  end read only

--  begin read only
   procedure Test_3_Get_Item_Type_test_get_item_type_menu3
     (Gnattest_T: in out Test);
   procedure Test_Get_Item_Type_8d689d_527e33(Gnattest_T: in out Test) renames
     Test_3_Get_Item_Type_test_get_item_type_menu3;
--  id:2.2/8d689de5467b712f/Get_Item_Type/0/0/test_get_item_type_menu3/
   procedure Test_3_Get_Item_Type_test_get_item_type_menu3
     (Gnattest_T: in out Test) is
      function Get_Item_Type
        (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
         return Menu_Item_Types renames
        Wrap_Test_Get_Item_Type_8d689d_527e33;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Assert
        (Get_Item_Type(Menu, 1) = COMMAND,
         "Failed to get type of menu entry with Natural Index.");
      Destroy(Menu);

--  begin read only
   end Test_3_Get_Item_Type_test_get_item_type_menu3;
--  end read only

--  begin read only
   procedure Wrap_Test_Unpost_74fd1c_cf7a1c(Menu_Widget: Tk_Menu) is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Unpost_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Unpost(Menu_Widget);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Unpost_Menu test commitment violated");
      end;
   end Wrap_Test_Unpost_74fd1c_cf7a1c;
--  end read only

--  begin read only
   procedure Test_Unpost_test_unpost_menu(Gnattest_T: in out Test);
   procedure Test_Unpost_74fd1c_cf7a1c(Gnattest_T: in out Test) renames
     Test_Unpost_test_unpost_menu;
--  id:2.2/74fd1c47e14bce5a/Unpost/1/0/test_unpost_menu/
   procedure Test_Unpost_test_unpost_menu(Gnattest_T: in out Test) is
      procedure Unpost(Menu_Widget: Tk_Menu) renames
        Wrap_Test_Unpost_74fd1c_cf7a1c;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Post(Menu, 0, 0);
      Unpost(Menu);
      Assert(True, "This test can only crash.");
      Destroy(Menu);

--  begin read only
   end Test_Unpost_test_unpost_menu;
--  end read only

--  begin read only
   function Wrap_Test_X_Position_2f4d2c_e9e27f
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Natural is
   begin
      begin
         pragma Assert
           (Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_X_Position_Menu test requirement violated");
      end;
      declare
         Test_X_Position_2f4d2c_e9e27f_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.X_Position
             (Menu_Widget, Menu_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_X_Position_Menu test commitment violated");
         end;
         return Test_X_Position_2f4d2c_e9e27f_Result;
      end;
   end Wrap_Test_X_Position_2f4d2c_e9e27f;
--  end read only

--  begin read only
   procedure Test_1_X_Position_test_x_position_menu(Gnattest_T: in out Test);
   procedure Test_X_Position_2f4d2c_e9e27f(Gnattest_T: in out Test) renames
     Test_1_X_Position_test_x_position_menu;
--  id:2.2/2f4d2c2f8ab1a7e0/X_Position/1/0/test_x_position_menu/
   procedure Test_1_X_Position_test_x_position_menu(Gnattest_T: in out Test) is
      function X_Position
        (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Natural renames
        Wrap_Test_X_Position_2f4d2c_e9e27f;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(Tear_Off => FALSE, others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Assert
        (X_Position(Menu, To_Tcl_String("0")) = 1,
         "Failed to get X position of the menu entry with Tcl_String index.");
      Destroy(Menu);

--  begin read only
   end Test_1_X_Position_test_x_position_menu;
--  end read only

--  begin read only
   function Wrap_Test_X_Position_789329_f6fff3
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return Natural is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_X_Position_Menu2 test requirement violated");
      end;
      declare
         Test_X_Position_789329_f6fff3_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.X_Position
             (Menu_Widget, Menu_Index, Is_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_X_Position_Menu2 test commitment violated");
         end;
         return Test_X_Position_789329_f6fff3_Result;
      end;
   end Wrap_Test_X_Position_789329_f6fff3;
--  end read only

--  begin read only
   procedure Test_2_X_Position_test_x_position_menu2(Gnattest_T: in out Test);
   procedure Test_X_Position_789329_f6fff3(Gnattest_T: in out Test) renames
     Test_2_X_Position_test_x_position_menu2;
--  id:2.2/789329fe67c001db/X_Position/0/0/test_x_position_menu2/
   procedure Test_2_X_Position_test_x_position_menu2
     (Gnattest_T: in out Test) is
      function X_Position
        (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
         return Natural renames
        Wrap_Test_X_Position_789329_f6fff3;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(Tear_Off => FALSE, others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Assert
        (X_Position(Menu, 0) = 1,
         "Failed to get X position of the menu entry with Natural index.");
      Destroy(Menu);

--  begin read only
   end Test_2_X_Position_test_x_position_menu2;
--  end read only

--  begin read only
   function Wrap_Test_X_Position_a37ded_0ad35d
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) return Natural is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_X_Position_Menu3 test requirement violated");
      end;
      declare
         Test_X_Position_a37ded_0ad35d_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.X_Position
             (Menu_Widget, Menu_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_X_Position_Menu3 test commitment violated");
         end;
         return Test_X_Position_a37ded_0ad35d_Result;
      end;
   end Wrap_Test_X_Position_a37ded_0ad35d;
--  end read only

--  begin read only
   procedure Test_3_X_Position_test_x_position_menu3(Gnattest_T: in out Test);
   procedure Test_X_Position_a37ded_0ad35d(Gnattest_T: in out Test) renames
     Test_3_X_Position_test_x_position_menu3;
--  id:2.2/a37dedb0baec3f8b/X_Position/0/0/test_x_position_menu3/
   procedure Test_3_X_Position_test_x_position_menu3
     (Gnattest_T: in out Test) is
      function X_Position
        (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
         return Natural renames
        Wrap_Test_X_Position_a37ded_0ad35d;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(Tear_Off => FALSE, others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Assert
        (X_Position(Menu, LAST) = 1,
         "Failed to get X position of the menu entry with Menu_Item_Indexes index.");
      Destroy(Menu);

--  begin read only
   end Test_3_X_Position_test_x_position_menu3;
--  end read only

--  begin read only
   function Wrap_Test_Y_Position_623b60_3f1329
     (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Natural is
   begin
      begin
         pragma Assert
           (Menu_Widget /= Null_Widget and Length(Source => Menu_Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Y_Position_Menu test requirement violated");
      end;
      declare
         Test_Y_Position_623b60_3f1329_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Y_Position
             (Menu_Widget, Menu_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Y_Position_Menu test commitment violated");
         end;
         return Test_Y_Position_623b60_3f1329_Result;
      end;
   end Wrap_Test_Y_Position_623b60_3f1329;
--  end read only

--  begin read only
   procedure Test_1_Y_Position_test_y_position_menu(Gnattest_T: in out Test);
   procedure Test_Y_Position_623b60_3f1329(Gnattest_T: in out Test) renames
     Test_1_Y_Position_test_y_position_menu;
--  id:2.2/623b604a863770b4/Y_Position/1/0/test_y_position_menu/
   procedure Test_1_Y_Position_test_y_position_menu(Gnattest_T: in out Test) is
      function Y_Position
        (Menu_Widget: Tk_Menu; Menu_Index: Tcl_String) return Natural renames
        Wrap_Test_Y_Position_623b60_3f1329;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(Tear_Off => FALSE, others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Assert
        (Y_Position(Menu, To_Tcl_String("0")) = 1,
         "Failed to get Y position of the menu entry with Tcl_String index.");
      Destroy(Menu);

--  begin read only
   end Test_1_Y_Position_test_y_position_menu;
--  end read only

--  begin read only
   function Wrap_Test_Y_Position_7e1bbe_2e80d9
     (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
      return Natural is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Y_Position_Menu2 test requirement violated");
      end;
      declare
         Test_Y_Position_7e1bbe_2e80d9_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Y_Position
             (Menu_Widget, Menu_Index, Is_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Y_Position_Menu2 test commitment violated");
         end;
         return Test_Y_Position_7e1bbe_2e80d9_Result;
      end;
   end Wrap_Test_Y_Position_7e1bbe_2e80d9;
--  end read only

--  begin read only
   procedure Test_2_Y_Position_test_y_position_menu2(Gnattest_T: in out Test);
   procedure Test_Y_Position_7e1bbe_2e80d9(Gnattest_T: in out Test) renames
     Test_2_Y_Position_test_y_position_menu2;
--  id:2.2/7e1bbe5924ffd25b/Y_Position/0/0/test_y_position_menu2/
   procedure Test_2_Y_Position_test_y_position_menu2
     (Gnattest_T: in out Test) is
      function Y_Position
        (Menu_Widget: Tk_Menu; Menu_Index: Natural; Is_Index: Boolean := True)
         return Natural renames
        Wrap_Test_Y_Position_7e1bbe_2e80d9;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(Tear_Off => FALSE, others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Assert
        (Y_Position(Menu, 0) = 1,
         "Failed to get Y position of the menu entry with Natural index.");
      Destroy(Menu);

--  begin read only
   end Test_2_Y_Position_test_y_position_menu2;
--  end read only

--  begin read only
   function Wrap_Test_Y_Position_9d49dc_1c0642
     (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes) return Natural is
   begin
      begin
         pragma Assert(Menu_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Y_Position_Menu3 test requirement violated");
      end;
      declare
         Test_Y_Position_9d49dc_1c0642_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Y_Position
             (Menu_Widget, Menu_Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Y_Position_Menu3 test commitment violated");
         end;
         return Test_Y_Position_9d49dc_1c0642_Result;
      end;
   end Wrap_Test_Y_Position_9d49dc_1c0642;
--  end read only

--  begin read only
   procedure Test_3_Y_Position_test_y_position_menu3(Gnattest_T: in out Test);
   procedure Test_Y_Position_9d49dc_1c0642(Gnattest_T: in out Test) renames
     Test_3_Y_Position_test_y_position_menu3;
--  id:2.2/9d49dc01842064f7/Y_Position/0/0/test_y_position_menu3/
   procedure Test_3_Y_Position_test_y_position_menu3
     (Gnattest_T: in out Test) is
      function Y_Position
        (Menu_Widget: Tk_Menu; Menu_Index: Menu_Item_Indexes)
         return Natural renames
        Wrap_Test_Y_Position_9d49dc_1c0642;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(Tear_Off => FALSE, others => <>));
      Add
        (Menu,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Assert
        (Y_Position(Menu, 0) = 1,
         "Failed to get Y position of the menu entry with Menu_Item_Indexes index.");
      Destroy(Menu);

--  begin read only
   end Test_3_Y_Position_test_y_position_menu3;
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
end Tk.Menu.Test_Data.Tests;
