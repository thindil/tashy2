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
   function Wrap_Test_Tcl_Set_Var_2fed84_838ae7
     (Var_Name, New_Value: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Boolean is
   begin
      begin
         pragma Assert
           (Var_Name'Length > 0 and New_Value'Length > 0 and
            Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-variables.ads:0):Test_Tcl_SetVar test requirement violated");
      end;
      declare
         Test_Tcl_Set_Var_2fed84_838ae7_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Variables.Tcl_Set_Var
             (Var_Name, New_Value, Interpreter, Flags);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-variables.ads:0:):Test_Tcl_SetVar test commitment violated");
         end;
         return Test_Tcl_Set_Var_2fed84_838ae7_Result;
      end;
   end Wrap_Test_Tcl_Set_Var_2fed84_838ae7;
--  end read only

--  begin read only
   procedure Test_Tcl_Set_Var_test_tcl_setvar(Gnattest_T: in out Test);
   procedure Test_Tcl_Set_Var_2fed84_838ae7(Gnattest_T: in out Test) renames
     Test_Tcl_Set_Var_test_tcl_setvar;
--  id:2.2/2fed84775431142f/Tcl_Set_Var/1/0/test_tcl_setvar/
   procedure Test_Tcl_Set_Var_test_tcl_setvar(Gnattest_T: in out Test) is
      function Tcl_Set_Var
        (Var_Name, New_Value: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := Default_Flags_Array) return Boolean renames
        Wrap_Test_Tcl_Set_Var_2fed84_838ae7;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (Tcl_Set_Var("myvar", "2"),
         "Failed to set value of Tcl variable 'myvar'");

--  begin read only
   end Test_Tcl_Set_Var_test_tcl_setvar;
--  end read only

--  begin read only
   function Wrap_Test_Tcl_Set_Var2_cf5c20_939c43
     (Array_Name, Index_Name, New_Value: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Boolean is
   begin
      begin
         pragma Assert
           (Array_Name'Length > 0 and Index_Name'Length > 0 and
            New_Value'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-variables.ads:0):Test_Tcl_SetVar2 test requirement violated");
      end;
      declare
         Test_Tcl_Set_Var2_cf5c20_939c43_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Variables.Tcl_Set_Var2
             (Array_Name, Index_Name, New_Value, Interpreter, Flags);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-variables.ads:0:):Test_Tcl_SetVar2 test commitment violated");
         end;
         return Test_Tcl_Set_Var2_cf5c20_939c43_Result;
      end;
   end Wrap_Test_Tcl_Set_Var2_cf5c20_939c43;
--  end read only

--  begin read only
   procedure Test_Tcl_Set_Var2_test_tcl_setvar2(Gnattest_T: in out Test);
   procedure Test_Tcl_Set_Var2_cf5c20_939c43(Gnattest_T: in out Test) renames
     Test_Tcl_Set_Var2_test_tcl_setvar2;
--  id:2.2/cf5c2010f1889c78/Tcl_Set_Var2/1/0/test_tcl_setvar2/
   procedure Test_Tcl_Set_Var2_test_tcl_setvar2(Gnattest_T: in out Test) is
      function Tcl_Set_Var2
        (Array_Name, Index_Name, New_Value: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := Default_Flags_Array) return Boolean renames
        Wrap_Test_Tcl_Set_Var2_cf5c20_939c43;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (Tcl_Set_Var2("myarray", "0", "2"),
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

      if Tcl_Set_Var("myvar", "test") then
         Assert
           (Tcl_Get_Var("myvar") = "test",
            "Failed to get value of variable 'myvar'");
      end if;
      Assert
        (Tcl_Get_Var("nonexistingvariable") = "nonexistingvalue",
         "Failed to handle non-existing Tcl variable.");

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

      if Tcl_Set_Var2("myarray", "0", "test") then
         Assert
           (Tcl_Get_Var2("myarray", "0") = "test",
            "Failed to get value of the first element of array 'myarray'");
      end if;
      Assert
        (Tcl_Get_Var2("nonexistingarray", "0") = "nonexistingvalue",
         "Failed to handle non-existing Tcl variable.");

--  begin read only
   end Test_Tcl_Get_Var2_test_tcl_getvar2;
--  end read only

--  begin read only
   function Wrap_Test_Tcl_Unset_Var_8e988e_5d27f9
     (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Boolean is
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
      declare
         Test_Tcl_Unset_Var_8e988e_5d27f9_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Variables.Tcl_Unset_Var
             (Var_Name, Interpreter, Flags);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-variables.ads:0:):Test_Tcl_UnsetVar test commitment violated");
         end;
         return Test_Tcl_Unset_Var_8e988e_5d27f9_Result;
      end;
   end Wrap_Test_Tcl_Unset_Var_8e988e_5d27f9;
--  end read only

--  begin read only
   procedure Test_Tcl_Unset_Var_test_tcl_unsetvar(Gnattest_T: in out Test);
   procedure Test_Tcl_Unset_Var_8e988e_5d27f9(Gnattest_T: in out Test) renames
     Test_Tcl_Unset_Var_test_tcl_unsetvar;
--  id:2.2/8e988e1e1f2bb3d6/Tcl_Unset_Var/1/0/test_tcl_unsetvar/
   procedure Test_Tcl_Unset_Var_test_tcl_unsetvar(Gnattest_T: in out Test) is
      function Tcl_Unset_Var
        (Var_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := Default_Flags_Array) return Boolean renames
        Wrap_Test_Tcl_Unset_Var_8e988e_5d27f9;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Tcl_Set_Var("myvar", "2") then
         Assert(Tcl_Unset_Var("myvar"), "Can't remove Tcl variable.");
      end if;
      Assert(Tcl_Get_Var("myvar") = "2", "Failed to remove Tcl variable");
      Assert
        (not Tcl_Unset_Var("myvar2"),
         "Failed to handle removing non-existing Tcl variable");

--  begin read only
   end Test_Tcl_Unset_Var_test_tcl_unsetvar;
--  end read only

--  begin read only
   function Wrap_Test_Tcl_Unset_Var2_2a5c63_618eb3
     (Var_Name, Index_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      Flags: Flags_Array := Default_Flags_Array) return Boolean is
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
      declare
         Test_Tcl_Unset_Var2_2a5c63_618eb3_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Variables.Tcl_Unset_Var2
             (Var_Name, Index_Name, Interpreter, Flags);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-variables.ads:0:):Test_Tcl_UnsetVar2 test commitment violated");
         end;
         return Test_Tcl_Unset_Var2_2a5c63_618eb3_Result;
      end;
   end Wrap_Test_Tcl_Unset_Var2_2a5c63_618eb3;
--  end read only

--  begin read only
   procedure Test_Tcl_Unset_Var2_test_tcl_unsetvar2(Gnattest_T: in out Test);
   procedure Test_Tcl_Unset_Var2_2a5c63_618eb3(Gnattest_T: in out Test) renames
     Test_Tcl_Unset_Var2_test_tcl_unsetvar2;
--  id:2.2/2a5c63d5dabeda5a/Tcl_Unset_Var2/1/0/test_tcl_unsetvar2/
   procedure Test_Tcl_Unset_Var2_test_tcl_unsetvar2(Gnattest_T: in out Test) is
      function Tcl_Unset_Var2
        (Var_Name, Index_Name: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter;
         Flags: Flags_Array := Default_Flags_Array) return Boolean renames
        Wrap_Test_Tcl_Unset_Var2_2a5c63_618eb3;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Tcl_Set_Var2("myarray", "0", "2") then
         Assert
           (Tcl_Unset_Var2("myarray", "0"),
            "Can't remove element from Tcl array.");
      end if;
      Assert
        (Tcl_Get_Var2("myarray", "0") = "2",
         "Failed to remove the element from the Tcl array");
      Assert
        (not Tcl_Unset_Var2("myarray", "0"),
         "Failed to handle removing non-existing element from Tcl array");

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
