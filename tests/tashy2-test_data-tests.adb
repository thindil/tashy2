--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tashy2.Test_Data.

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
package body Tashy2.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_To_C_String_399e2e_d041fb
     (Str: String) return chars_ptr is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tashy2.ads:0):Test_To_C_String test requirement violated");
      end;
      declare
         Test_To_C_String_399e2e_d041fb_Result: constant chars_ptr :=
           GNATtest_Generated.GNATtest_Standard.Tashy2.To_C_String(Str);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tashy2.ads:0:):Test_To_C_String test commitment violated");
         end;
         return Test_To_C_String_399e2e_d041fb_Result;
      end;
   end Wrap_Test_To_C_String_399e2e_d041fb;
--  end read only

--  begin read only
   procedure Test_To_C_String_test_to_c_string(Gnattest_T: in out Test);
   procedure Test_To_C_String_399e2e_d041fb(Gnattest_T: in out Test) renames
     Test_To_C_String_test_to_c_string;
--  id:2.2/399e2ed874392483/To_C_String/1/0/test_to_c_string/
   procedure Test_To_C_String_test_to_c_string(Gnattest_T: in out Test) is
      function To_C_String(Str: String) return chars_ptr renames
        Wrap_Test_To_C_String_399e2e_d041fb;
--  end read only

      pragma Unreferenced(Gnattest_T);
      C_String: constant chars_ptr := To_C_String("My String");

   begin

      Assert(True, "This test can only crash.");

--  begin read only
   end Test_To_C_String_test_to_c_string;
--  end read only

--  begin read only
   function Wrap_Test_From_C_String_0232b0_cebe6b
     (Item: chars_ptr) return String is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tashy2.ads:0):Test_From_C_String test requirement violated");
      end;
      declare
         Test_From_C_String_0232b0_cebe6b_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tashy2.From_C_String(Item);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tashy2.ads:0:):Test_From_C_String test commitment violated");
         end;
         return Test_From_C_String_0232b0_cebe6b_Result;
      end;
   end Wrap_Test_From_C_String_0232b0_cebe6b;
--  end read only

--  begin read only
   procedure Test_From_C_String_test_from_c_string(Gnattest_T: in out Test);
   procedure Test_From_C_String_0232b0_cebe6b(Gnattest_T: in out Test) renames
     Test_From_C_String_test_from_c_string;
--  id:2.2/0232b0bd023bca97/From_C_String/1/0/test_from_c_string/
   procedure Test_From_C_String_test_from_c_string(Gnattest_T: in out Test) is
      function From_C_String(Item: chars_ptr) return String renames
        Wrap_Test_From_C_String_0232b0_cebe6b;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (From_C_String(To_C_String("My String2")) = "My String2",
         "Failed to convert C String to Ada String.");

--  begin read only
   end Test_From_C_String_test_from_c_string;
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
end Tashy2.Test_Data.Tests;
