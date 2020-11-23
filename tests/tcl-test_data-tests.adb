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
   procedure Wrap_Test_Tcl_Eval_6f41cd_386758
     (Script: String; Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(Script'Length > 0 and Interpreter /= Null_Interpreter);
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
   end Wrap_Test_Tcl_Eval_6f41cd_386758;
--  end read only

--  begin read only
   procedure Test_Tcl_Eval_test_tcl_eval(Gnattest_T: in out Test);
   procedure Test_Tcl_Eval_6f41cd_386758(Gnattest_T: in out Test) renames
     Test_Tcl_Eval_test_tcl_eval;
--  id:2.2/6f41cdb0dd725e03/Tcl_Eval/1/0/test_tcl_eval/
   procedure Test_Tcl_Eval_test_tcl_eval(Gnattest_T: in out Test) is
      procedure Tcl_Eval
        (Script: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Tcl_Eval_6f41cd_386758;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("expr 2 + 2");
      Assert(Tcl_GetResult = "4", "Failed to evaluate Tcl code.");

--  begin read only
   end Test_Tcl_Eval_test_tcl_eval;
--  end read only

--  begin read only
   function Wrap_Test_Tcl_GetResult_3875a5_b83d43
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
         Test_Tcl_GetResult_3875a5_b83d43_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Tcl_GetResult(Interpreter);
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
         return Test_Tcl_GetResult_3875a5_b83d43_Result;
      end;
   end Wrap_Test_Tcl_GetResult_3875a5_b83d43;
--  end read only

--  begin read only
   procedure Test_Tcl_GetResult_test_tcl_getresult(Gnattest_T: in out Test);
   procedure Test_Tcl_GetResult_3875a5_b83d43(Gnattest_T: in out Test) renames
     Test_Tcl_GetResult_test_tcl_getresult;
--  id:2.2/3875a5a7f66e0974/Tcl_GetResult/1/0/test_tcl_getresult/
   procedure Test_Tcl_GetResult_test_tcl_getresult(Gnattest_T: in out Test) is
      function Tcl_GetResult
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Tcl_GetResult_3875a5_b83d43;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_SetResult("2");
      Assert(Tcl_GetResult = "2", "Failed to get Tcl result");

--  begin read only
   end Test_Tcl_GetResult_test_tcl_getresult;
--  end read only

--  begin read only
   procedure Wrap_Test_Tcl_SetResult_e87522_5a72b9
     (Result: String; Result_Type: Result_Types := TCL_STATIC;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(Result'Length > 0 and Interpreter /= Null_Interpreter);
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
   end Wrap_Test_Tcl_SetResult_e87522_5a72b9;
--  end read only

--  begin read only
   procedure Test_Tcl_SetResult_test_tcl_setresult(Gnattest_T: in out Test);
   procedure Test_Tcl_SetResult_e87522_5a72b9(Gnattest_T: in out Test) renames
     Test_Tcl_SetResult_test_tcl_setresult;
--  id:2.2/e875226c0ec21ff5/Tcl_SetResult/1/0/test_tcl_setresult/
   procedure Test_Tcl_SetResult_test_tcl_setresult(Gnattest_T: in out Test) is
      procedure Tcl_SetResult
        (Result: String; Result_Type: Result_Types := TCL_STATIC;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Tcl_SetResult_e87522_5a72b9;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_SetResult("2");
      Assert(Tcl_GetResult = "2", "Failed to set Tcl result");

--  begin read only
   end Test_Tcl_SetResult_test_tcl_setresult;
--  end read only

--  begin read only
   procedure Wrap_Test_Tcl_SetVar_43dc1c_572e53
     (Var_Name, New_Value: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := (1 => NONE)) is
   begin
      begin
         pragma Assert(Var_Name'Length > 0 and New_Value'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl.ads:0):Test_Tcl_SetVar test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tcl.Tcl_SetVar
        (Var_Name, New_Value, Interpreter, Flags);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tcl.ads:0:):Test_Tcl_SetVar test commitment violated");
      end;
   end Wrap_Test_Tcl_SetVar_43dc1c_572e53;
--  end read only

--  begin read only
   procedure Test_Tcl_SetVar_test_tcl_setvar(Gnattest_T: in out Test);
   procedure Test_Tcl_SetVar_43dc1c_572e53(Gnattest_T: in out Test) renames
     Test_Tcl_SetVar_test_tcl_setvar;
--  id:2.2/43dc1c0be12b9d1d/Tcl_SetVar/1/0/test_tcl_setvar/
   procedure Test_Tcl_SetVar_test_tcl_setvar(Gnattest_T: in out Test) is
      procedure Tcl_SetVar
        (Var_Name, New_Value: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := (1 => NONE)) renames
        Wrap_Test_Tcl_SetVar_43dc1c_572e53;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_SetVar("myvar", "2");
      Tcl_Eval("expr 2 + $myvar");
      Assert(Tcl_GetResult = 4, "Failed to set value of Tcl variable 'myvar'");

--  begin read only
   end Test_Tcl_SetVar_test_tcl_setvar;
--  end read only

--  begin read only
   procedure Wrap_Test_Tcl_SetVar2_38fd66_e29f6c
     (Array_Name, Index_Name, New_Value: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := (1 => NONE)) is
   begin
      begin
         pragma Assert
           (Array_Name'Length > 0 and Index_Name'Length > 0 and
            New_Value'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl.ads:0):Test_Tcl_SetVar2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tcl.Tcl_SetVar2
        (Array_Name, Index_Name, New_Value, Interpreter, Flags);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tcl.ads:0:):Test_Tcl_SetVar2 test commitment violated");
      end;
   end Wrap_Test_Tcl_SetVar2_38fd66_e29f6c;
--  end read only

--  begin read only
   procedure Test_Tcl_SetVar2_test_tcl_setvar2(Gnattest_T: in out Test);
   procedure Test_Tcl_SetVar2_38fd66_e29f6c(Gnattest_T: in out Test) renames
     Test_Tcl_SetVar2_test_tcl_setvar2;
--  id:2.2/38fd661e5bbe3686/Tcl_SetVar2/1/0/test_tcl_setvar2/
   procedure Test_Tcl_SetVar2_test_tcl_setvar2(Gnattest_T: in out Test) is
      procedure Tcl_SetVar2
        (Array_Name, Index_Name, New_Value: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := (1 => NONE)) renames
        Wrap_Test_Tcl_SetVar2_38fd66_e29f6c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_SetVar2("myarray", "0" ,"2");
      Tcl_Eval("expr 2 + $myarray(0)");
      Assert(Tcl_GetResult = 4, "Failed to set value of Tcl first element in 'myarray'");

--  begin read only
   end Test_Tcl_SetVar2_test_tcl_setvar2;
--  end read only

--  begin read only
   function Wrap_Test_Tcl_GetVar_61051d_45f6e9
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := (1 => NONE)) return String is
   begin
      begin
         pragma Assert
           (Var_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl.ads:0):Test_Tcl_GetVar test requirement violated");
      end;
      declare
         Test_Tcl_GetVar_61051d_45f6e9_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Tcl_GetVar
             (Var_Name, Interpreter, Flags);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl.ads:0:):Test_Tcl_GetVar test commitment violated");
         end;
         return Test_Tcl_GetVar_61051d_45f6e9_Result;
      end;
   end Wrap_Test_Tcl_GetVar_61051d_45f6e9;
--  end read only

--  begin read only
   procedure Test_Tcl_GetVar_test_tcl_getvar(Gnattest_T: in out Test);
   procedure Test_Tcl_GetVar_61051d_45f6e9(Gnattest_T: in out Test) renames
     Test_Tcl_GetVar_test_tcl_getvar;
--  id:2.2/61051d76f4cad0bd/Tcl_GetVar/1/0/test_tcl_getvar/
   procedure Test_Tcl_GetVar_test_tcl_getvar(Gnattest_T: in out Test) is
      function Tcl_GetVar
        (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := (1 => NONE)) return String renames
        Wrap_Test_Tcl_GetVar_61051d_45f6e9;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_SetVar("myvar", "test");
      Assert(Tcl_GetVar("myvar") = "test", "Failed to get value of variable 'myvar'");
      begin
         Assert(Tcl_GetVar("nonexistingvariable") = "nonexistingvalue", "");
         Assert(False, "Failed to handle non-existing Tcl variable.");
      exception
         when Tcl_Exception =>
            null;
      end;

--  begin read only
   end Test_Tcl_GetVar_test_tcl_getvar;
--  end read only

--  begin read only
   function Wrap_Test_Tcl_GetVar2_7938c0_601542
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := (1 => NONE)) return String is
   begin
      begin
         pragma Assert
           (Var_Name'Length > 0 and Index_Name'Length > 0 and
            Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl.ads:0):Test_Tcl_GetVar2 test requirement violated");
      end;
      declare
         Test_Tcl_GetVar2_7938c0_601542_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Tcl_GetVar2
             (Var_Name, Index_Name, Interpreter, Flags);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl.ads:0:):Test_Tcl_GetVar2 test commitment violated");
         end;
         return Test_Tcl_GetVar2_7938c0_601542_Result;
      end;
   end Wrap_Test_Tcl_GetVar2_7938c0_601542;
--  end read only

--  begin read only
   procedure Test_Tcl_GetVar2_test_tcl_getvar2(Gnattest_T: in out Test);
   procedure Test_Tcl_GetVar2_7938c0_601542(Gnattest_T: in out Test) renames
     Test_Tcl_GetVar2_test_tcl_getvar2;
--  id:2.2/7938c09481aa023e/Tcl_GetVar2/1/0/test_tcl_getvar2/
   procedure Test_Tcl_GetVar2_test_tcl_getvar2(Gnattest_T: in out Test) is
      function Tcl_GetVar2
        (Var_Name, Index_Name: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := (1 => NONE)) return String renames
        Wrap_Test_Tcl_GetVar2_7938c0_601542;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_SetVar2("myarray", "0" ,"test");
      Assert(Tcl_GetVar2("myarray", "0") = "test", "Failed to get value of the first element of array 'myarray'");
      begin
         Assert(Tcl_GetVar2("nonexistingarray", "0") = "nonexistingvalue", "");
         Assert(False, "Failed to handle non-existing Tcl variable.");
      exception
         when Tcl_Exception =>
            null;
      end;

--  begin read only
   end Test_Tcl_GetVar2_test_tcl_getvar2;
--  end read only

--  begin read only
   procedure Wrap_Test_Tcl_UnsetVar_458887_5d27f9
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := (1 => NONE)) is
   begin
      begin
         pragma Assert
           (Var_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl.ads:0):Test_Tcl_UnsetVar test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tcl.Tcl_UnsetVar
        (Var_Name, Interpreter, Flags);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tcl.ads:0:):Test_Tcl_UnsetVar test commitment violated");
      end;
   end Wrap_Test_Tcl_UnsetVar_458887_5d27f9;
--  end read only

--  begin read only
   procedure Test_Tcl_UnsetVar_test_tcl_unsetvar(Gnattest_T: in out Test);
   procedure Test_Tcl_UnsetVar_458887_5d27f9(Gnattest_T: in out Test) renames
     Test_Tcl_UnsetVar_test_tcl_unsetvar;
--  id:2.2/458887f3577ce647/Tcl_UnsetVar/1/0/test_tcl_unsetvar/
   procedure Test_Tcl_UnsetVar_test_tcl_unsetvar(Gnattest_T: in out Test) is
      procedure Tcl_UnsetVar
        (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := (1 => NONE)) renames
        Wrap_Test_Tcl_UnsetVar_458887_5d27f9;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_SetVar("myvar", "2");
      Tcl_UnsetVar("myvar");
      begin
         Assert(Tcl_GetVar("myvar") = "2", "Failed to remove Tcl variable");
      exception
         when Tcl_Exception =>
            null;
      end;
      begin
         Tcl_UnsetVar("myvar2");
         Assert(False, "Failed to handle removing non-existing Tcl variable");
      exception
         when Tcl_Exception =>
            null;
      end;

--  begin read only
   end Test_Tcl_UnsetVar_test_tcl_unsetvar;
--  end read only

--  begin read only
   procedure Wrap_Test_Tcl_UnsetVar2_5c4efc_618eb3
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := (1 => NONE)) is
   begin
      begin
         pragma Assert
           (Var_Name'Length > 0 and Index_Name'Length > 0 and
            Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl.ads:0):Test_Tcl_UnsetVar2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tcl.Tcl_UnsetVar2
        (Var_Name, Index_Name, Interpreter, Flags);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tcl.ads:0:):Test_Tcl_UnsetVar2 test commitment violated");
      end;
   end Wrap_Test_Tcl_UnsetVar2_5c4efc_618eb3;
--  end read only

--  begin read only
   procedure Test_Tcl_UnsetVar2_test_tcl_unsetvar2(Gnattest_T: in out Test);
   procedure Test_Tcl_UnsetVar2_5c4efc_618eb3(Gnattest_T: in out Test) renames
     Test_Tcl_UnsetVar2_test_tcl_unsetvar2;
--  id:2.2/5c4efcc61d7dd0fd/Tcl_UnsetVar2/1/0/test_tcl_unsetvar2/
   procedure Test_Tcl_UnsetVar2_test_tcl_unsetvar2(Gnattest_T: in out Test) is
      procedure Tcl_UnsetVar2
        (Var_Name, Index_Name: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := (1 => NONE)) renames
        Wrap_Test_Tcl_UnsetVar2_5c4efc_618eb3;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_SetVar2("myarray", "0", "2");
      Tcl_UnsetVar2("myarray", "0");
      begin
         Assert(Tcl_GetVar2("myarray", "0") = "2", "Failed to remove the element from the Tcl array");
      exception
         when Tcl_Exception =>
            null;
      end;
      begin
         Tcl_UnsetVar2("myarray", "0");
         Assert(False, "Failed to handle removing non-existing element from Tcl array");
      exception
         when Tcl_Exception =>
            null;
      end;

--  begin read only
   end Test_Tcl_UnsetVar2_test_tcl_unsetvar2;
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
