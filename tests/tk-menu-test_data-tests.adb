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
   procedure Wrap_Test_Activate_e310e8_4d580e
     (Menu: Tk_Menu; Index: Tcl_String) is
   begin
      begin
         pragma Assert(Length(Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Activate_Menu test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Activate(Menu, Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Activate_Menu test commitment violated");
      end;
   end Wrap_Test_Activate_e310e8_4d580e;
--  end read only

--  begin read only
   procedure Test_Activate_test_activate_menu(Gnattest_T: in out Test);
   procedure Test_Activate_e310e8_4d580e(Gnattest_T: in out Test) renames
     Test_Activate_test_activate_menu;
--  id:2.2/e310e84b92d86930/Activate/1/0/test_activate_menu/
   procedure Test_Activate_test_activate_menu(Gnattest_T: in out Test) is
      procedure Activate(Menu: Tk_Menu; Index: Tcl_String) renames
        Wrap_Test_Activate_e310e8_4d580e;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Activate_test_activate_menu;
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
