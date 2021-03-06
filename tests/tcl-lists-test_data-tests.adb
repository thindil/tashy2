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
   function Wrap_Test_Split_List_908c8a_2f822c
     (List: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-lists.ads:0):Test_Split_List test requirement violated");
      end;
      declare
         Test_Split_List_908c8a_2f822c_Result: constant Array_List :=
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
         return Test_Split_List_908c8a_2f822c_Result;
      end;
   end Wrap_Test_Split_List_908c8a_2f822c;
--  end read only

--  begin read only
   procedure Test_Split_List_test_split_list(Gnattest_T: in out Test);
   procedure Test_Split_List_908c8a_2f822c(Gnattest_T: in out Test) renames
     Test_Split_List_test_split_list;
--  id:2.2/908c8a0cca9c184f/Split_List/1/0/test_split_list/
   procedure Test_Split_List_test_split_list(Gnattest_T: in out Test) is
      function Split_List
        (List: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Array_List renames
        Wrap_Test_Split_List_908c8a_2f822c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      declare
         My_List: constant Array_List := Split_List("a b c d e");
      begin
         Assert
           (My_List'Length = 5, "Failed to convert Tcl list to Ada array.");
      end;

      declare
         My_List: constant Array_List := Split_List("");
      begin
         Assert
           (My_List'Length = 0,
            "Failed to convert empty Tcl list to Ada array.");
      end;

--  begin read only
   end Test_Split_List_test_split_list;
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

      Tcl_Eval("set mylist [list a b c d]");
      declare
         My_List: constant Array_List := Split_List_Variable("mylist");
      begin
         Assert
           (My_List'Length = 4,
            "Failed to convert Tcl list variable to Ada array.");
      end;

--  begin read only
   end Test_Split_List_Variable_test_split_list_variable;
--  end read only

--  begin read only
   function Wrap_Test_Merge_List_46a169_8803ae
     (List: Array_List) return String is
   begin
      begin
         pragma Assert(List'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-lists.ads:0):Test_Merge_List test requirement violated");
      end;
      declare
         Test_Merge_List_46a169_8803ae_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Lists.Merge_List(List);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-lists.ads:0:):Test_Merge_List test commitment violated");
         end;
         return Test_Merge_List_46a169_8803ae_Result;
      end;
   end Wrap_Test_Merge_List_46a169_8803ae;
--  end read only

--  begin read only
   procedure Test_Merge_List_test_merge_list(Gnattest_T: in out Test);
   procedure Test_Merge_List_46a169_8803ae(Gnattest_T: in out Test) renames
     Test_Merge_List_test_merge_list;
--  id:2.2/46a1691971009546/Merge_List/1/0/test_merge_list/
   procedure Test_Merge_List_test_merge_list(Gnattest_T: in out Test) is
      function Merge_List(List: Array_List) return String renames
        Wrap_Test_Merge_List_46a169_8803ae;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (Merge_List((To_Tcl_String("Ada"), To_Tcl_String("Tcl"))) = "Ada Tcl",
         "Failed to merge Ada array into Tcl list");

--  begin read only
   end Test_Merge_List_test_merge_list;
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
