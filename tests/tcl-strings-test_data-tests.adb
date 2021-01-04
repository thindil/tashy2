--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tcl.Strings.Test_Data.

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
package body Tcl.Strings.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_To_Tcl_String_05e111_b689e2
     (Source: String; Evaluate: Boolean := False) return Tcl_String is
   begin
      begin
         pragma Assert(Source'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-strings.ads:0):Test_To_Tcl_String test requirement violated");
      end;
      declare
         Test_To_Tcl_String_05e111_b689e2_Result: constant Tcl_String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Strings.To_Tcl_String
             (Source, Evaluate);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-strings.ads:0:):Test_To_Tcl_String test commitment violated");
         end;
         return Test_To_Tcl_String_05e111_b689e2_Result;
      end;
   end Wrap_Test_To_Tcl_String_05e111_b689e2;
--  end read only

--  begin read only
   procedure Test_To_Tcl_String_test_to_tcl_string(Gnattest_T: in out Test);
   procedure Test_To_Tcl_String_05e111_b689e2(Gnattest_T: in out Test) renames
     Test_To_Tcl_String_test_to_tcl_string;
--  id:2.2/05e11147f5a156d7/To_Tcl_String/1/0/test_to_tcl_string/
   procedure Test_To_Tcl_String_test_to_tcl_string(Gnattest_T: in out Test) is
      function To_Tcl_String
        (Source: String; Evaluate: Boolean := False) return Tcl_String renames
        Wrap_Test_To_Tcl_String_05e111_b689e2;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (To_String(To_Tcl_String("test literal")) = "{test literal}",
         "Failed to create literal string.");
      Assert
        (To_String(To_Tcl_String("test evaluate", True)) = """test evaluate""",
         "Failed to create evaluation string.");

--  begin read only
   end Test_To_Tcl_String_test_to_tcl_string;
--  end read only

--  begin read only
   function Wrap_Test_To_Ada_String_9fab6f_7961da
     (Source: Tcl_String) return String is
   begin
      declare
         Test_To_Ada_String_9fab6f_7961da_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Strings.To_Ada_String
             (Source);
      begin
         return Test_To_Ada_String_9fab6f_7961da_Result;
      end;
   end Wrap_Test_To_Ada_String_9fab6f_7961da;
--  end read only

--  begin read only
   procedure Test_To_Ada_String_test_to_ada_string(Gnattest_T: in out Test);
   procedure Test_To_Ada_String_9fab6f_7961da(Gnattest_T: in out Test) renames
     Test_To_Ada_String_test_to_ada_string;
--  id:2.2/9fab6f9320249ad5/To_Ada_String/1/0/test_to_ada_string/
   procedure Test_To_Ada_String_test_to_ada_string(Gnattest_T: in out Test) is
      function To_Ada_String(Source: Tcl_String) return String renames
        Wrap_Test_To_Ada_String_9fab6f_7961da;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_To_Ada_String_test_to_ada_string;
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
end Tcl.Strings.Test_Data.Tests;
