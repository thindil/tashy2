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
   procedure Wrap_Test_Tcl_Eval_6f41cd_5b9cd5
     (Tcl_Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Tcl_Script'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl.ads:0):Test_Tcl_Eval test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tcl.Tcl_Eval
        (Tcl_Script, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tcl.ads:0:):Test_Tcl_Eval test commitment violated");
      end;
   end Wrap_Test_Tcl_Eval_6f41cd_5b9cd5;
--  end read only

--  begin read only
   procedure Test_Tcl_Eval_test_tcl_eval(Gnattest_T: in out Test);
   procedure Test_Tcl_Eval_6f41cd_5b9cd5(Gnattest_T: in out Test) renames
     Test_Tcl_Eval_test_tcl_eval;
--  id:2.2/6f41cdb0dd725e03/Tcl_Eval/1/0/test_tcl_eval/
   procedure Test_Tcl_Eval_test_tcl_eval(Gnattest_T: in out Test) is
      procedure Tcl_Eval
        (Tcl_Script: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Tcl_Eval_6f41cd_5b9cd5;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("expr 2 + 2");
      Assert(Tcl_Get_Result = "4", "Failed to evaluate Tcl code.");

--  begin read only
   end Test_Tcl_Eval_test_tcl_eval;
--  end read only

--  begin read only
   function Wrap_Test_Tcl_Get_Result_9a7ac3_b83d43
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl.ads:0):Test_Tcl_GetResult test requirement violated");
      end;
      declare
         Test_Tcl_Get_Result_9a7ac3_b83d43_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Tcl_Get_Result
             (Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl.ads:0:):Test_Tcl_GetResult test commitment violated");
         end;
         return Test_Tcl_Get_Result_9a7ac3_b83d43_Result;
      end;
   end Wrap_Test_Tcl_Get_Result_9a7ac3_b83d43;
--  end read only

--  begin read only
   procedure Test_Tcl_Get_Result_test_tcl_getresult(Gnattest_T: in out Test);
   procedure Test_Tcl_Get_Result_9a7ac3_b83d43(Gnattest_T: in out Test) renames
     Test_Tcl_Get_Result_test_tcl_getresult;
--  id:2.2/9a7ac36b6f9d677a/Tcl_Get_Result/1/0/test_tcl_getresult/
   procedure Test_Tcl_Get_Result_test_tcl_getresult(Gnattest_T: in out Test) is
      function Tcl_Get_Result
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Tcl_Get_Result_9a7ac3_b83d43;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Set_Result("2");
      Assert(Tcl_Get_Result = "2", "Failed to get Tcl result");

--  begin read only
   end Test_Tcl_Get_Result_test_tcl_getresult;
--  end read only

--  begin read only
   procedure Wrap_Test_Tcl_Set_Result_2e8975_cb8f85
     (Tcl_Result: String; Result_Type: Result_Types := Default_Result_Type;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Tcl_Result'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl.ads:0):Test_Tcl_SetResult test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tcl.Tcl_Set_Result
        (Tcl_Result, Result_Type, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tcl.ads:0:):Test_Tcl_SetResult test commitment violated");
      end;
   end Wrap_Test_Tcl_Set_Result_2e8975_cb8f85;
--  end read only

--  begin read only
   procedure Test_Tcl_Set_Result_test_tcl_setresult(Gnattest_T: in out Test);
   procedure Test_Tcl_Set_Result_2e8975_cb8f85(Gnattest_T: in out Test) renames
     Test_Tcl_Set_Result_test_tcl_setresult;
--  id:2.2/2e8975e68b3f48df/Tcl_Set_Result/1/0/test_tcl_setresult/
   procedure Test_Tcl_Set_Result_test_tcl_setresult(Gnattest_T: in out Test) is
      procedure Tcl_Set_Result
        (Tcl_Result: String; Result_Type: Result_Types := Default_Result_Type;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Tcl_Set_Result_2e8975_cb8f85;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Set_Result("2");
      Assert(Tcl_Get_Result = "2", "Failed to set Tcl result");

--  begin read only
   end Test_Tcl_Set_Result_test_tcl_setresult;
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
