--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tcl.Test_Data.

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
package body Tcl.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Tcl_Eval_6f41cd_190200
     (Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(Script'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl.ads:0):Test_Tcl_Eval test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tcl.Tcl_Eval(Script, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tcl.ads:0:):Test_Tcl_Eval test commitment violated");
      end;
   end Wrap_Test_Tcl_Eval_6f41cd_190200;
--  end read only

--  begin read only
   procedure Test_Tcl_Eval_test_tcl_eval(Gnattest_T: in out Test);
   procedure Test_Tcl_Eval_6f41cd_190200(Gnattest_T: in out Test) renames
     Test_Tcl_Eval_test_tcl_eval;
--  id:2.2/6f41cdb0dd725e03/Tcl_Eval/1/0/test_tcl_eval/
   procedure Test_Tcl_Eval_test_tcl_eval(Gnattest_T: in out Test) is
      procedure Tcl_Eval
        (Script: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Tcl_Eval_6f41cd_190200;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Tcl_Eval_test_tcl_eval;
--  end read only

--  begin read only
   function Wrap_Test_Tcl_GetStringResult_ee4e01_95aef3
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      declare
         Test_Tcl_GetStringResult_ee4e01_95aef3_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Tcl_GetStringResult
             (Interpreter);
      begin
         return Test_Tcl_GetStringResult_ee4e01_95aef3_Result;
      end;
   end Wrap_Test_Tcl_GetStringResult_ee4e01_95aef3;
--  end read only

--  begin read only
   procedure Test_Tcl_GetStringResult_test_tcl_getstringresult
     (Gnattest_T: in out Test);
   procedure Test_Tcl_GetStringResult_ee4e01_95aef3
     (Gnattest_T: in out Test) renames
     Test_Tcl_GetStringResult_test_tcl_getstringresult;
--  id:2.2/ee4e0178367aacb7/Tcl_GetStringResult/1/0/test_tcl_getstringresult/
   procedure Test_Tcl_GetStringResult_test_tcl_getstringresult
     (Gnattest_T: in out Test) is
      function Tcl_GetStringResult
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Tcl_GetStringResult_ee4e01_95aef3;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Tcl_GetStringResult_test_tcl_getstringresult;
--  end read only

--  begin read only
   procedure Wrap_Test_Tcl_SetResult_e87522_8ece1f
     (Result: String; Result_Type: Result_Types := TCL_STATIC;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(Result'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl.ads:0):Test_Tcl_SetResult test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tcl.Tcl_SetResult
        (Result, Result_Type, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tcl.ads:0:):Test_Tcl_SetResult test commitment violated");
      end;
   end Wrap_Test_Tcl_SetResult_e87522_8ece1f;
--  end read only

--  begin read only
   procedure Test_Tcl_SetResult_test_tcl_setresult(Gnattest_T: in out Test);
   procedure Test_Tcl_SetResult_e87522_8ece1f(Gnattest_T: in out Test) renames
     Test_Tcl_SetResult_test_tcl_setresult;
--  id:2.2/e875226c0ec21ff5/Tcl_SetResult/1/0/test_tcl_setresult/
   procedure Test_Tcl_SetResult_test_tcl_setresult(Gnattest_T: in out Test) is
      procedure Tcl_SetResult
        (Result: String; Result_Type: Result_Types := TCL_STATIC;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Tcl_SetResult_e87522_8ece1f;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Tcl_SetResult_test_tcl_setresult;
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
end Tcl.Test_Data.Tests;
