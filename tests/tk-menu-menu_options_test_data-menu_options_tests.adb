--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Menu.Menu_Options_Test_Data.

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
package body Tk.Menu.Menu_Options_Test_Data.Menu_Options_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Create_32e405_f4d256
     (Path_Name: String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Menu is
   begin
      begin
         pragma Assert
           (Path_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Create_Menu1 test requirement violated");
      end;
      declare
         Test_Create_32e405_f4d256_Result: constant Tk_Menu :=
           GNATtest_Generated.GNATtest_Standard.Tk.Menu.Create
             (Path_Name, Options, Interpreter);
      begin
         begin
            pragma Assert(Test_Create_32e405_f4d256_Result /= Null_Widget);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-menu.ads:0:):Test_Create_Menu1 test commitment violated");
         end;
         return Test_Create_32e405_f4d256_Result;
      end;
   end Wrap_Test_Create_32e405_f4d256;
--  end read only

--  begin read only
   procedure Test_1_Create_test_create_menu1
     (Gnattest_T: in out Test_Menu_Options);
   procedure Test_Create_32e405_f4d256
     (Gnattest_T: in out Test_Menu_Options) renames
     Test_1_Create_test_create_menu1;
--  id:2.2/32e405543423d7b8/Create/1/0/test_create_menu1/
   procedure Test_1_Create_test_create_menu1
     (Gnattest_T: in out Test_Menu_Options) is
      function Create
        (Path_Name: String; Options: Menu_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Tk_Menu renames
        Wrap_Test_Create_32e405_f4d256;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_1_Create_test_create_menu1;
--  end read only

--  begin read only
   procedure Wrap_Test_Create_ebbdc1_ede574
     (Widget: out Tk_Menu; Path_Name: String; Options: Menu_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Path_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-menu.ads:0):Test_Create_Menu2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Menu.Create
        (Widget, Path_Name, Options, Interpreter);
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-menu.ads:0:):Test_Create_Menu2 test commitment violated");
      end;
   end Wrap_Test_Create_ebbdc1_ede574;
--  end read only

--  begin read only
   procedure Test_2_Create_test_create_menu2
     (Gnattest_T: in out Test_Menu_Options);
   procedure Test_Create_ebbdc1_ede574
     (Gnattest_T: in out Test_Menu_Options) renames
     Test_2_Create_test_create_menu2;
--  id:2.2/ebbdc1934f0fa33d/Create/0/0/test_create_menu2/
   procedure Test_2_Create_test_create_menu2
     (Gnattest_T: in out Test_Menu_Options) is
      procedure Create
        (Widget: out Tk_Menu; Path_Name: String; Options: Menu_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Create_ebbdc1_ede574;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Create_test_create_menu2;
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
end Tk.Menu.Menu_Options_Test_Data.Menu_Options_Tests;
