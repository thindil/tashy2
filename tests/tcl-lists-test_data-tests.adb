--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tcl.Lists.Test_Data.

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
package body Tcl.Lists.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Split_List_Variable_b25096_53b238
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      begin
         pragma Assert(Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-lists.ads:0):Test_Split_List_Variable test requirement violated");
      end;
      declare
         Test_Split_List_Variable_b25096_53b238_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Lists.Split_List_Variable
             (Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-lists.ads:0:):Test_Split_List_Variable test commitment violated");
         end;
         return Test_Split_List_Variable_b25096_53b238_Result;
      end;
   end Wrap_Test_Split_List_Variable_b25096_53b238;
--  end read only

--  begin read only
   procedure Test_Split_List_Variable_test_split_list_variable
     (Gnattest_T: in out Test);
   procedure Test_Split_List_Variable_b25096_53b238
     (Gnattest_T: in out Test) renames
     Test_Split_List_Variable_test_split_list_variable;
--  id:2.2/b25096b8f19adb69/Split_List_Variable/1/0/test_split_list_variable/
   procedure Test_Split_List_Variable_test_split_list_variable
     (Gnattest_T: in out Test) is
      function Split_List_Variable
        (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Array_List renames
        Wrap_Test_Split_List_Variable_b25096_53b238;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Split_List_Variable_test_split_list_variable;
--  end read only

--  begin read only
   function Wrap_Test_Split_List_908c8a_b5e33c
     (List: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      begin
         pragma Assert(List'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-lists.ads:0):Test_Split_List test requirement violated");
      end;
      declare
         Test_Split_List_908c8a_b5e33c_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Lists.Split_List
             (List, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-lists.ads:0:):Test_Split_List test commitment violated");
         end;
         return Test_Split_List_908c8a_b5e33c_Result;
      end;
   end Wrap_Test_Split_List_908c8a_b5e33c;
--  end read only

--  begin read only
   procedure Test_Split_List_test_split_list(Gnattest_T: in out Test);
   procedure Test_Split_List_908c8a_b5e33c(Gnattest_T: in out Test) renames
     Test_Split_List_test_split_list;
--  id:2.2/908c8a0cca9c184f/Split_List/1/0/test_split_list/
   procedure Test_Split_List_test_split_list(Gnattest_T: in out Test) is
      function Split_List
        (List: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Array_List renames
        Wrap_Test_Split_List_908c8a_b5e33c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("set mylist [list a b c d]");
      declare
         My_List: constant Array_List := Split_List("mylist");
      begin
         Assert
           (My_List'Length = 4, "Failed to convert Tcl list to Ada array.");
      end;

--  begin read only
   end Test_Split_List_test_split_list;
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
end Tcl.Lists.Test_Data.Tests;
