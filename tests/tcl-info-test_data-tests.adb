--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tcl.Info.Test_Data.

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
package body Tcl.Info.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Exists_e0ba6a_a2ca41
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean is
   begin
      begin
         pragma Assert
           (Var_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Exists test requirement violated");
      end;
      declare
         Test_Exists_e0ba6a_a2ca41_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Exists
             (Var_Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Exists test commitment violated");
         end;
         return Test_Exists_e0ba6a_a2ca41_Result;
      end;
   end Wrap_Test_Exists_e0ba6a_a2ca41;
--  end read only

--  begin read only
   procedure Test_Exists_test_info_exists(Gnattest_T: in out Test);
   procedure Test_Exists_e0ba6a_a2ca41(Gnattest_T: in out Test) renames
     Test_Exists_test_info_exists;
--  id:2.2/e0ba6a6d9c808e1e/Exists/1/0/test_info_exists/
   procedure Test_Exists_test_info_exists(Gnattest_T: in out Test) is
      function Exists
        (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Boolean renames
        Wrap_Test_Exists_e0ba6a_a2ca41;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Exists_test_info_exists;
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
end Tcl.Info.Test_Data.Tests;
