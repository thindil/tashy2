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

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Activate_e310e8_318e72
     (Widget: Tk_Menu; Index: Tcl_String) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Length(Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Activate_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Activate(Widget, Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Activate_Menu test commitment violated");
      end;
   end Wrap_Test_Activate_e310e8_318e72;
--  end read only

--  begin read only
   procedure Test_Activate_test_activate_menu(Gnattest_T: in out Test);
   procedure Test_Activate_e310e8_318e72(Gnattest_T: in out Test) renames
     Test_Activate_test_activate_menu;
--  id:2.2/e310e84b92d86930/Activate/1/0/test_activate_menu/
   procedure Test_Activate_test_activate_menu(Gnattest_T: in out Test) is
      procedure Activate(Widget: Tk_Menu; Index: Tcl_String) renames
        Wrap_Test_Activate_e310e8_318e72;
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
        (Menu, COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 12"), others => <>));
      Activate(Menu, To_Tcl_String("1"));
      Invoke(Menu, To_Tcl_String("active"));
      Assert(Tcl_GetVar("myvar") = 12, "Failed to activate menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_Activate_test_activate_menu;
--  end read only

--  begin read only
   procedure Wrap_Test_Add_ba4759_b5105f
     (Widget: Tk_Menu; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Add_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Add
        (Widget, Item_Type, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Add_Menu test commitment violated");
      end;
   end Wrap_Test_Add_ba4759_b5105f;
--  end read only

--  begin read only
   procedure Test_Add_test_add_menu(Gnattest_T: in out Test);
   procedure Test_Add_ba4759_b5105f(Gnattest_T: in out Test) renames
     Test_Add_test_add_menu;
--  id:2.2/ba4759ab1f934e2d/Add/1/0/test_add_menu/
   procedure Test_Add_test_add_menu(Gnattest_T: in out Test) is
      procedure Add
        (Widget: Tk_Menu; Item_Type: Menu_Item_Types;
         Options: Menu_Item_Options) renames
        Wrap_Test_Add_ba4759_b5105f;
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
        (Menu, COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 14"), others => <>));
      Invoke(Menu, To_Tcl_String("1"));
      Assert(Tcl_GetVar("myvar") = 14, "Failed to add menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_Add_test_add_menu;
--  end read only

--  begin read only
   function Wrap_Test_Clone_cce6c8_307c8a
     (Widget: Tk_Menu; New_Path_Name: String; Menu_Type: Menu_Types := NONE)
      return Tk_Menu is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and New_Path_Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Clone_Menu test requirement violated");
      end;
      declare
         Test_Clone_cce6c8_307c8a_Result: constant Tk_Menu :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Clone
             (Widget, New_Path_Name, Menu_Type);
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
         return Test_Clone_cce6c8_307c8a_Result;
      end;
   end Wrap_Test_Clone_cce6c8_307c8a;
--  end read only

--  begin read only
   procedure Test_Clone_test_clone_menu(Gnattest_T: in out Test);
   procedure Test_Clone_cce6c8_307c8a(Gnattest_T: in out Test) renames
     Test_Clone_test_clone_menu;
--  id:2.2/cce6c8abdd50593a/Clone/1/0/test_clone_menu/
   procedure Test_Clone_test_clone_menu(Gnattest_T: in out Test) is
      function Clone
        (Widget: Tk_Menu; New_Path_Name: String; Menu_Type: Menu_Types := NONE)
         return Tk_Menu renames
        Wrap_Test_Clone_cce6c8_307c8a;
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
        (Menu, COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 16"), others => <>));
      CloneMenu := Clone(Menu, ".mynewmenu");
      Invoke(CloneMenu, To_Tcl_String("1"));
      Assert(Tcl_GetVar("myvar") = 16, "Failed to clone menu.");
      Destroy(Menu);

--  begin read only
   end Test_Clone_test_clone_menu;
--  end read only

--  begin read only
   procedure Wrap_Test_Delete_a9ab1b_16a141
     (Widget: Tk_Menu; Index1: Tcl_String;
      Index2: Tcl_String := To_Tcl_String("")) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Length(Index1) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Delete_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Delete
        (Widget, Index1, Index2);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Delete_Menu test commitment violated");
      end;
   end Wrap_Test_Delete_a9ab1b_16a141;
--  end read only

--  begin read only
   procedure Test_Delete_test_delete_menu(Gnattest_T: in out Test);
   procedure Test_Delete_a9ab1b_16a141(Gnattest_T: in out Test) renames
     Test_Delete_test_delete_menu;
--  id:2.2/a9ab1b16a4991733/Delete/1/0/test_delete_menu/
   procedure Test_Delete_test_delete_menu(Gnattest_T: in out Test) is
      procedure Delete
        (Widget: Tk_Menu; Index1: Tcl_String;
         Index2: Tcl_String := To_Tcl_String("")) renames
        Wrap_Test_Delete_a9ab1b_16a141;
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
        (Menu, COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Delete(Menu, To_Tcl_String("1"));
      Invoke(Menu, To_Tcl_String("1"));
      Assert(Tcl_GetVar("myvar") = 16, "Failed to delete menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_Delete_test_delete_menu;
--  end read only

--  begin read only
   function Wrap_Test_Entry_Get_Options_ef78cc_829c3b
     (Widget: Tk_Menu; Index: Tcl_String) return Menu_Item_Options is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Length(Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Entry_Get_Options_Menu test requirement violated");
      end;
      declare
         Test_Entry_Get_Options_ef78cc_829c3b_Result: constant Menu_Item_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Entry_Get_Options
             (Widget, Index);
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
         return Test_Entry_Get_Options_ef78cc_829c3b_Result;
      end;
   end Wrap_Test_Entry_Get_Options_ef78cc_829c3b;
--  end read only

--  begin read only
   procedure Test_Entry_Get_Options_test_entry_get_options_menu
     (Gnattest_T: in out Test);
   procedure Test_Entry_Get_Options_ef78cc_829c3b
     (Gnattest_T: in out Test) renames
     Test_Entry_Get_Options_test_entry_get_options_menu;
--  id:2.2/ef78cc67b161c25c/Entry_Get_Options/1/0/test_entry_get_options_menu/
   procedure Test_Entry_Get_Options_test_entry_get_options_menu
     (Gnattest_T: in out Test) is
      function Entry_Get_Options
        (Widget: Tk_Menu; Index: Tcl_String) return Menu_Item_Options renames
        Wrap_Test_Entry_Get_Options_ef78cc_829c3b;
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
        (Menu, COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Options := Entry_Get_Options(Menu, To_Tcl_String("1"));
      Assert
        (Options.Command = To_Tcl_String("set myvar 18"),
         "Failed to get options of the menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_Entry_Get_Options_test_entry_get_options_menu;
--  end read only

--  begin read only
   procedure Wrap_Test_Entry_Configure_1d51e9_4589e7
     (Widget: Tk_Menu; Index: Tcl_String; Options: Menu_Item_Options) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Length(Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Entry_Configure_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Entry_Configure
        (Widget, Index, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Entry_Configure_Menu test commitment violated");
      end;
   end Wrap_Test_Entry_Configure_1d51e9_4589e7;
--  end read only

--  begin read only
   procedure Test_Entry_Configure_test_entry_configure_menu
     (Gnattest_T: in out Test);
   procedure Test_Entry_Configure_1d51e9_4589e7
     (Gnattest_T: in out Test) renames
     Test_Entry_Configure_test_entry_configure_menu;
--  id:2.2/1d51e9e2deefcfee/Entry_Configure/1/0/test_entry_configure_menu/
   procedure Test_Entry_Configure_test_entry_configure_menu
     (Gnattest_T: in out Test) is
      procedure Entry_Configure
        (Widget: Tk_Menu; Index: Tcl_String;
         Options: Menu_Item_Options) renames
        Wrap_Test_Entry_Configure_1d51e9_4589e7;
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
        (Menu, COMMAND,
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
   end Test_Entry_Configure_test_entry_configure_menu;
--  end read only

--  begin read only
   function Wrap_Test_Index_d34072_74dcd8
     (Widget: Tk_Menu; Index: Tcl_String) return Extended_Natural is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Length(Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Index_Menu test requirement violated");
      end;
      declare
         Test_Index_d34072_74dcd8_Result: constant Extended_Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Index(Widget, Index);
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
         return Test_Index_d34072_74dcd8_Result;
      end;
   end Wrap_Test_Index_d34072_74dcd8;
--  end read only

--  begin read only
   procedure Test_Index_test_index_menu(Gnattest_T: in out Test);
   procedure Test_Index_d34072_74dcd8(Gnattest_T: in out Test) renames
     Test_Index_test_index_menu;
--  id:2.2/d34072613038bb35/Index/1/0/test_index_menu/
   procedure Test_Index_test_index_menu(Gnattest_T: in out Test) is
      function Index
        (Widget: Tk_Menu; Index: Tcl_String) return Extended_Natural renames
        Wrap_Test_Index_d34072_74dcd8;
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
        (Menu, COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Assert
        (Index(Menu, To_Tcl_String("end")) = 1,
         "Failed to get numerical index of the menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_Index_test_index_menu;
--  end read only

--  begin read only
   procedure Wrap_Test_Insert_3b526a_b25559
     (Widget: Tk_Menu; Index: Tcl_String; Item_Type: Menu_Item_Types;
      Options: Menu_Item_Options) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Length(Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Insert_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Insert
        (Widget, Index, Item_Type, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Insert_Menu test commitment violated");
      end;
   end Wrap_Test_Insert_3b526a_b25559;
--  end read only

--  begin read only
   procedure Test_Insert_test_insert_menu(Gnattest_T: in out Test);
   procedure Test_Insert_3b526a_b25559(Gnattest_T: in out Test) renames
     Test_Insert_test_insert_menu;
--  id:2.2/3b526a896088071a/Insert/1/0/test_insert_menu/
   procedure Test_Insert_test_insert_menu(Gnattest_T: in out Test) is
      procedure Insert
        (Widget: Tk_Menu; Index: Tcl_String; Item_Type: Menu_Item_Types;
         Options: Menu_Item_Options) renames
        Wrap_Test_Insert_3b526a_b25559;
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
        (Menu, COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Insert
        (Menu, To_Tcl_String("1"), COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Invoke(Menu, To_Tcl_String("1"));
      Assert
        (Tcl_GetVar("myvar") = 20,
         "Failed to insert a new entry to the menu.");
      Destroy(Menu);

--  begin read only
   end Test_Insert_test_insert_menu;
--  end read only

--  begin read only
   procedure Wrap_Test_Invoke_49d5a3_c06f89
     (Widget: Tk_Menu; Index: Tcl_String) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Length(Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Invoke_Menu1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Invoke(Widget, Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Invoke_Menu1 test commitment violated");
      end;
   end Wrap_Test_Invoke_49d5a3_c06f89;
--  end read only

--  begin read only
   procedure Test_1_Invoke_test_invoke_menu1(Gnattest_T: in out Test);
   procedure Test_Invoke_49d5a3_c06f89(Gnattest_T: in out Test) renames
     Test_1_Invoke_test_invoke_menu1;
--  id:2.2/49d5a34545cc4ea1/Invoke/1/0/test_invoke_menu1/
   procedure Test_1_Invoke_test_invoke_menu1(Gnattest_T: in out Test) is
      procedure Invoke(Widget: Tk_Menu; Index: Tcl_String) renames
        Wrap_Test_Invoke_49d5a3_c06f89;
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
        (Menu, COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 18"), others => <>));
      Invoke(Menu, To_Tcl_String("1"));
      Assert(Tcl_GetVar("myvar") = 18, "Failed to invoke the menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_1_Invoke_test_invoke_menu1;
--  end read only

--  begin read only
   function Wrap_Test_Invoke_0a3e65_d7b612
     (Widget: Tk_Menu; Index: Tcl_String) return String is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Length(Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Invoke_Menu2 test requirement violated");
      end;
      declare
         Test_Invoke_0a3e65_d7b612_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Invoke(Widget, Index);
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
         return Test_Invoke_0a3e65_d7b612_Result;
      end;
   end Wrap_Test_Invoke_0a3e65_d7b612;
--  end read only

--  begin read only
   procedure Test_2_Invoke_test_invoke_menu2(Gnattest_T: in out Test);
   procedure Test_Invoke_0a3e65_d7b612(Gnattest_T: in out Test) renames
     Test_2_Invoke_test_invoke_menu2;
--  id:2.2/0a3e653fbd9b066f/Invoke/0/0/test_invoke_menu2/
   procedure Test_2_Invoke_test_invoke_menu2(Gnattest_T: in out Test) is
      function Invoke(Widget: Tk_Menu; Index: Tcl_String) return String renames
        Wrap_Test_Invoke_0a3e65_d7b612;
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
        (Menu, COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Assert
        (Invoke(Menu, To_Tcl_String("1")) = "20",
         "Failed to invoke the menu entry and get it result.");
      Destroy(Menu);

--  begin read only
   end Test_2_Invoke_test_invoke_menu2;
--  end read only

--  begin read only
   procedure Wrap_Test_Post_297225_776e79(Widget: Tk_Menu; X, Y: Natural) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Post_Menu1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Post(Widget, X, Y);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Post_Menu1 test commitment violated");
      end;
   end Wrap_Test_Post_297225_776e79;
--  end read only

--  begin read only
   procedure Test_1_Post_test_post_menu1(Gnattest_T: in out Test);
   procedure Test_Post_297225_776e79(Gnattest_T: in out Test) renames
     Test_1_Post_test_post_menu1;
--  id:2.2/297225f173973896/Post/1/0/test_post_menu1/
   procedure Test_1_Post_test_post_menu1(Gnattest_T: in out Test) is
      procedure Post(Widget: Tk_Menu; X, Y: Natural) renames
        Wrap_Test_Post_297225_776e79;
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
   function Wrap_Test_Post_311578_f0f7a5
     (Widget: Tk_Menu; X, Y: Natural) return String is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Post_Menu2 test requirement violated");
      end;
      declare
         Test_Post_311578_f0f7a5_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Post(Widget, X, Y);
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
         return Test_Post_311578_f0f7a5_Result;
      end;
   end Wrap_Test_Post_311578_f0f7a5;
--  end read only

--  begin read only
   procedure Test_2_Post_test_post_menu2(Gnattest_T: in out Test);
   procedure Test_Post_311578_f0f7a5(Gnattest_T: in out Test) renames
     Test_2_Post_test_post_menu2;
--  id:2.2/311578116772a834/Post/0/0/test_post_menu2/
   procedure Test_2_Post_test_post_menu2(Gnattest_T: in out Test) is
      function Post(Widget: Tk_Menu; X, Y: Natural) return String renames
        Wrap_Test_Post_311578_f0f7a5;
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
   procedure Wrap_Test_PostCascade_aaed95_8e9d4c
     (Widget: Tk_Menu; Index: Tcl_String) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Length(Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_PostCascade_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.PostCascade(Widget, Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_PostCascade_Menu test commitment violated");
      end;
   end Wrap_Test_PostCascade_aaed95_8e9d4c;
--  end read only

--  begin read only
   procedure Test_PostCascade_test_postcascade_menu(Gnattest_T: in out Test);
   procedure Test_PostCascade_aaed95_8e9d4c(Gnattest_T: in out Test) renames
     Test_PostCascade_test_postcascade_menu;
--  id:2.2/aaed955bdae8e026/PostCascade/1/0/test_postcascade_menu/
   procedure Test_PostCascade_test_postcascade_menu(Gnattest_T: in out Test) is
      procedure PostCascade(Widget: Tk_Menu; Index: Tcl_String) renames
        Wrap_Test_PostCascade_aaed95_8e9d4c;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Menu: Tk_Menu;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      PostCascade(Menu, To_Tcl_String("1"));
      Assert(True, "This test can only crash.");
      Destroy(Menu);

--  begin read only
   end Test_PostCascade_test_postcascade_menu;
--  end read only

--  begin read only
   function Wrap_Test_Get_Item_Type_a8752e_62395b
     (Widget: Tk_Menu; Index: Tcl_String) return Menu_Item_Types is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Length(Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Get_Item_Type_Menu test requirement violated");
      end;
      declare
         Test_Get_Item_Type_a8752e_62395b_Result: constant Menu_Item_Types :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Get_Item_Type
             (Widget, Index);
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
         return Test_Get_Item_Type_a8752e_62395b_Result;
      end;
   end Wrap_Test_Get_Item_Type_a8752e_62395b;
--  end read only

--  begin read only
   procedure Test_Get_Item_Type_test_get_item_type_menu
     (Gnattest_T: in out Test);
   procedure Test_Get_Item_Type_a8752e_62395b(Gnattest_T: in out Test) renames
     Test_Get_Item_Type_test_get_item_type_menu;
--  id:2.2/a8752eeb9d339580/Get_Item_Type/1/0/test_get_item_type_menu/
   procedure Test_Get_Item_Type_test_get_item_type_menu
     (Gnattest_T: in out Test) is
      function Get_Item_Type
        (Widget: Tk_Menu; Index: Tcl_String) return Menu_Item_Types renames
        Wrap_Test_Get_Item_Type_a8752e_62395b;
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
        (Menu, COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Assert
        (Get_Item_Type(Menu, To_Tcl_String("1")) = COMMAND,
         "Failed to get type of menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_Get_Item_Type_test_get_item_type_menu;
--  end read only

--  begin read only
   procedure Wrap_Test_Unpost_74fd1c_6debaa(Widget: Tk_Menu) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Unpost_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Unpost(Widget);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Unpost_Menu test commitment violated");
      end;
   end Wrap_Test_Unpost_74fd1c_6debaa;
--  end read only

--  begin read only
   procedure Test_Unpost_test_unpost_menu(Gnattest_T: in out Test);
   procedure Test_Unpost_74fd1c_6debaa(Gnattest_T: in out Test) renames
     Test_Unpost_test_unpost_menu;
--  id:2.2/74fd1c47e14bce5a/Unpost/1/0/test_unpost_menu/
   procedure Test_Unpost_test_unpost_menu(Gnattest_T: in out Test) is
      procedure Unpost(Widget: Tk_Menu) renames Wrap_Test_Unpost_74fd1c_6debaa;
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
   function Wrap_Test_X_Position_2f4d2c_7abc61
     (Widget: Tk_Menu; Index: Tcl_String) return Natural is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Length(Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_X_Position_Menu test requirement violated");
      end;
      declare
         Test_X_Position_2f4d2c_7abc61_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.X_Position
             (Widget, Index);
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
         return Test_X_Position_2f4d2c_7abc61_Result;
      end;
   end Wrap_Test_X_Position_2f4d2c_7abc61;
--  end read only

--  begin read only
   procedure Test_X_Position_test_x_position_menu(Gnattest_T: in out Test);
   procedure Test_X_Position_2f4d2c_7abc61(Gnattest_T: in out Test) renames
     Test_X_Position_test_x_position_menu;
--  id:2.2/2f4d2c2f8ab1a7e0/X_Position/1/0/test_x_position_menu/
   procedure Test_X_Position_test_x_position_menu(Gnattest_T: in out Test) is
      function X_Position
        (Widget: Tk_Menu; Index: Tcl_String) return Natural renames
        Wrap_Test_X_Position_2f4d2c_7abc61;
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
        (Menu, COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Assert
        (X_Position(Menu, To_Tcl_String("0")) = 1,
         "Failed to get X position of the menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_X_Position_test_x_position_menu;
--  end read only

--  begin read only
   function Wrap_Test_Y_Position_623b60_52c065
     (Widget: Tk_Menu; Index: Tcl_String) return Natural is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Length(Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Y_Position_Menu test requirement violated");
      end;
      declare
         Test_Y_Position_623b60_52c065_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Y_Position
             (Widget, Index);
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
         return Test_Y_Position_623b60_52c065_Result;
      end;
   end Wrap_Test_Y_Position_623b60_52c065;
--  end read only

--  begin read only
   procedure Test_Y_Position_test_y_position_menu(Gnattest_T: in out Test);
   procedure Test_Y_Position_623b60_52c065(Gnattest_T: in out Test) renames
     Test_Y_Position_test_y_position_menu;
--  id:2.2/623b604a863770b4/Y_Position/1/0/test_y_position_menu/
   procedure Test_Y_Position_test_y_position_menu(Gnattest_T: in out Test) is
      function Y_Position
        (Widget: Tk_Menu; Index: Tcl_String) return Natural renames
        Wrap_Test_Y_Position_623b60_52c065;
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
        (Menu, COMMAND,
         Menu_Item_Options'
           (Command => To_Tcl_String("set myvar 20"), others => <>));
      Assert
        (Y_Position(Menu, To_Tcl_String("0")) = 1,
         "Failed to get Y position of the menu entry.");
      Destroy(Menu);

--  begin read only
   end Test_Y_Position_test_y_position_menu;
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
