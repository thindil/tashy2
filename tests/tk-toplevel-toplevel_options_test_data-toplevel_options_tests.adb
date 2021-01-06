--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.TopLevel.TopLevel_Options_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Ada.Environment_Variables; use Ada.Environment_Variables;

--  begin read only
--  end read only
package body Tk.TopLevel.TopLevel_Options_Test_Data.TopLevel_Options_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Configure_0076be_7763e3
     (Widget: Tk_TopLevel; Options: TopLevel_Options) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-toplevel.ads:0):Test_Configure_TopLevel test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TopLevel.Configure
        (Widget, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-toplevel.ads:0:):Test_Configure_TopLevel test commitment violated");
      end;
   end Wrap_Test_Configure_0076be_7763e3;
--  end read only

--  begin read only
   procedure Test_Configure_test_configure_toplevel
     (Gnattest_T: in out Test_TopLevel_Options);
   procedure Test_Configure_0076be_7763e3
     (Gnattest_T: in out Test_TopLevel_Options) renames
     Test_Configure_test_configure_toplevel;
--  id:2.2/0076be6725db0897/Configure/1/0/test_configure_toplevel/
   procedure Test_Configure_test_configure_toplevel
     (Gnattest_T: in out Test_TopLevel_Options) is
      procedure Configure
        (Widget: Tk_TopLevel; Options: TopLevel_Options) renames
        Wrap_Test_Configure_0076be_7763e3;
--  end read only

      pragma Unreferenced(Gnattest_T);
      TopLevel: Tk_TopLevel;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(TopLevel, ".mydialog", TopLevel_Create_Options'(others => <>));
      Configure(TopLevel, TopLevel_Options'(Relief => RAISED, others => <>));
      Assert
        (Option_Value(TopLevel, "relief") = RAISED,
         "Failed to set new value for toplevel option.");

--  begin read only
   end Test_Configure_test_configure_toplevel;
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
end Tk.TopLevel.TopLevel_Options_Test_Data.TopLevel_Options_Tests;
