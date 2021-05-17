--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tcl.Variables.Test_Data.

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
package body Tcl.Variables.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

   function Get_Result is new Generic_Scalar_Tcl_Get_Result(Integer);

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Tcl_Set_Var_524f28_572e53
     (Var_Name, New_Value: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) is
   begin
      begin
         pragma Assert(Var_Name'Length > 0 and New_Value'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-variables.ads:0):Test_Tcl_SetVar test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tcl.Variables.Tcl_Set_Var
        (Var_Name, New_Value, Interpreter, Flags);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tcl-variables.ads:0:):Test_Tcl_SetVar test commitment violated");
      end;
   end Wrap_Test_Tcl_Set_Var_524f28_572e53;
--  end read only

--  begin read only
   procedure Test_Tcl_Set_Var_test_tcl_setvar(Gnattest_T: in out Test);
   procedure Test_Tcl_Set_Var_524f28_572e53(Gnattest_T: in out Test) renames
     Test_Tcl_Set_Var_test_tcl_setvar;
--  id:2.2/524f28d8df9078d6/Tcl_Set_Var/1/0/test_tcl_setvar/
   procedure Test_Tcl_Set_Var_test_tcl_setvar(Gnattest_T: in out Test) is
      procedure Tcl_Set_Var
        (Var_Name, New_Value: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := Default_Flags_Array) renames
        Wrap_Test_Tcl_Set_Var_524f28_572e53;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Set_Var("myvar", "2");
      Tcl_Eval("expr 2 + $myvar");
      Assert(Get_Result = 4, "Failed to set value of Tcl variable 'myvar'");

--  begin read only
   end Test_Tcl_Set_Var_test_tcl_setvar;
--  end read only

--  begin read only
   procedure Wrap_Test_Tcl_Set_Var2_256ebf_e29f6c
     (Array_Name, Index_Name, New_Value: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) is
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
               "req_sloc(tcl-variables.ads:0):Test_Tcl_SetVar2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tcl.Variables.Tcl_Set_Var2
        (Array_Name, Index_Name, New_Value, Interpreter, Flags);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tcl-variables.ads:0:):Test_Tcl_SetVar2 test commitment violated");
      end;
   end Wrap_Test_Tcl_Set_Var2_256ebf_e29f6c;
--  end read only

--  begin read only
   procedure Test_Tcl_Set_Var2_test_tcl_setvar2(Gnattest_T: in out Test);
   procedure Test_Tcl_Set_Var2_256ebf_e29f6c(Gnattest_T: in out Test) renames
     Test_Tcl_Set_Var2_test_tcl_setvar2;
--  id:2.2/256ebf8f1093c92d/Tcl_Set_Var2/1/0/test_tcl_setvar2/
   procedure Test_Tcl_Set_Var2_test_tcl_setvar2(Gnattest_T: in out Test) is
      procedure Tcl_Set_Var2
        (Array_Name, Index_Name, New_Value: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := Default_Flags_Array) renames
        Wrap_Test_Tcl_Set_Var2_256ebf_e29f6c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Set_Var2("myarray", "0", "2");
      Tcl_Eval("expr 2 + $myarray(0)");
      Assert
        (Get_Result = 4,
         "Failed to set value of Tcl first element in 'myarray'");

--  begin read only
   end Test_Tcl_Set_Var2_test_tcl_setvar2;
--  end read only

--  begin read only
   function Wrap_Test_Tcl_Get_Var_ea64a1_45f6e9
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return String is
   begin
      begin
         pragma Assert
           (Var_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-variables.ads:0):Test_Tcl_GetVar test requirement violated");
      end;
      declare
         Test_Tcl_Get_Var_ea64a1_45f6e9_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Variables.Tcl_Get_Var
             (Var_Name, Interpreter, Flags);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-variables.ads:0:):Test_Tcl_GetVar test commitment violated");
         end;
         return Test_Tcl_Get_Var_ea64a1_45f6e9_Result;
      end;
   end Wrap_Test_Tcl_Get_Var_ea64a1_45f6e9;
--  end read only

--  begin read only
   procedure Test_Tcl_Get_Var_test_tcl_getvar(Gnattest_T: in out Test);
   procedure Test_Tcl_Get_Var_ea64a1_45f6e9(Gnattest_T: in out Test) renames
     Test_Tcl_Get_Var_test_tcl_getvar;
--  id:2.2/ea64a1eac88b0f53/Tcl_Get_Var/1/0/test_tcl_getvar/
   procedure Test_Tcl_Get_Var_test_tcl_getvar(Gnattest_T: in out Test) is
      function Tcl_Get_Var
        (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := Default_Flags_Array) return String renames
        Wrap_Test_Tcl_Get_Var_ea64a1_45f6e9;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Set_Var("myvar", "test");
      Assert
        (Tcl_Get_Var("myvar") = "test",
         "Failed to get value of variable 'myvar'");
      begin
         Assert(Tcl_Get_Var("nonexistingvariable") = "nonexistingvalue", "");
         Assert(False, "Failed to handle non-existing Tcl variable.");
      exception
         when Tcl_Exception =>
            null;
      end;

--  begin read only
   end Test_Tcl_Get_Var_test_tcl_getvar;
--  end read only

--  begin read only
   function Wrap_Test_Tcl_Get_Var2_430f71_601542
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return String is
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
               "req_sloc(tcl-variables.ads:0):Test_Tcl_GetVar2 test requirement violated");
      end;
      declare
         Test_Tcl_Get_Var2_430f71_601542_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Variables.Tcl_Get_Var2
             (Var_Name, Index_Name, Interpreter, Flags);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-variables.ads:0:):Test_Tcl_GetVar2 test commitment violated");
         end;
         return Test_Tcl_Get_Var2_430f71_601542_Result;
      end;
   end Wrap_Test_Tcl_Get_Var2_430f71_601542;
--  end read only

--  begin read only
   procedure Test_Tcl_Get_Var2_test_tcl_getvar2(Gnattest_T: in out Test);
   procedure Test_Tcl_Get_Var2_430f71_601542(Gnattest_T: in out Test) renames
     Test_Tcl_Get_Var2_test_tcl_getvar2;
--  id:2.2/430f716d685a4a85/Tcl_Get_Var2/1/0/test_tcl_getvar2/
   procedure Test_Tcl_Get_Var2_test_tcl_getvar2(Gnattest_T: in out Test) is
      function Tcl_Get_Var2
        (Var_Name, Index_Name: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := Default_Flags_Array) return String renames
        Wrap_Test_Tcl_Get_Var2_430f71_601542;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Set_Var2("myarray", "0", "test");
      Assert
        (Tcl_Get_Var2("myarray", "0") = "test",
         "Failed to get value of the first element of array 'myarray'");
      begin
         Assert
           (Tcl_Get_Var2("nonexistingarray", "0") = "nonexistingvalue", "");
         Assert(False, "Failed to handle non-existing Tcl variable.");
      exception
         when Tcl_Exception =>
            null;
      end;

--  begin read only
   end Test_Tcl_Get_Var2_test_tcl_getvar2;
--  end read only

--  begin read only
   procedure Wrap_Test_Tcl_Unset_Var_044aaf_5d27f9
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) is
   begin
      begin
         pragma Assert
           (Var_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-variables.ads:0):Test_Tcl_UnsetVar test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tcl.Variables.Tcl_Unset_Var
        (Var_Name, Interpreter, Flags);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tcl-variables.ads:0:):Test_Tcl_UnsetVar test commitment violated");
      end;
   end Wrap_Test_Tcl_Unset_Var_044aaf_5d27f9;
--  end read only

--  begin read only
   procedure Test_Tcl_Unset_Var_test_tcl_unsetvar(Gnattest_T: in out Test);
   procedure Test_Tcl_Unset_Var_044aaf_5d27f9(Gnattest_T: in out Test) renames
     Test_Tcl_Unset_Var_test_tcl_unsetvar;
--  id:2.2/044aaf01104381e8/Tcl_Unset_Var/1/0/test_tcl_unsetvar/
   procedure Test_Tcl_Unset_Var_test_tcl_unsetvar(Gnattest_T: in out Test) is
      procedure Tcl_Unset_Var
        (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := Default_Flags_Array) renames
        Wrap_Test_Tcl_Unset_Var_044aaf_5d27f9;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Set_Var("myvar", "2");
      Tcl_Unset_Var("myvar");
      begin
         Assert(Tcl_Get_Var("myvar") = "2", "Failed to remove Tcl variable");
      exception
         when Tcl_Exception =>
            null;
      end;
      begin
         Tcl_Unset_Var("myvar2");
         Assert(False, "Failed to handle removing non-existing Tcl variable");
      exception
         when Tcl_Exception =>
            null;
      end;

--  begin read only
   end Test_Tcl_Unset_Var_test_tcl_unsetvar;
--  end read only

--  begin read only
   procedure Wrap_Test_Tcl_Unset_Var2_e9c900_618eb3
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) is
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
               "req_sloc(tcl-variables.ads:0):Test_Tcl_UnsetVar2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tcl.Variables.Tcl_Unset_Var2
        (Var_Name, Index_Name, Interpreter, Flags);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tcl-variables.ads:0:):Test_Tcl_UnsetVar2 test commitment violated");
      end;
   end Wrap_Test_Tcl_Unset_Var2_e9c900_618eb3;
--  end read only

--  begin read only
   procedure Test_Tcl_Unset_Var2_test_tcl_unsetvar2(Gnattest_T: in out Test);
   procedure Test_Tcl_Unset_Var2_e9c900_618eb3(Gnattest_T: in out Test) renames
     Test_Tcl_Unset_Var2_test_tcl_unsetvar2;
--  id:2.2/e9c900ac386cc122/Tcl_Unset_Var2/1/0/test_tcl_unsetvar2/
   procedure Test_Tcl_Unset_Var2_test_tcl_unsetvar2(Gnattest_T: in out Test) is
      procedure Tcl_Unset_Var2
        (Var_Name, Index_Name: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := Default_Flags_Array) renames
        Wrap_Test_Tcl_Unset_Var2_e9c900_618eb3;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Set_Var2("myarray", "0", "2");
      Tcl_Unset_Var2("myarray", "0");
      begin
         Assert
           (Tcl_Get_Var2("myarray", "0") = "2",
            "Failed to remove the element from the Tcl array");
      exception
         when Tcl_Exception =>
            null;
      end;
      begin
         Tcl_Unset_Var2("myarray", "0");
         Assert
           (False,
            "Failed to handle removing non-existing element from Tcl array");
      exception
         when Tcl_Exception =>
            null;
      end;

--  begin read only
   end Test_Tcl_Unset_Var2_test_tcl_unsetvar2;
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
end Tcl.Variables.Test_Data.Tests;
