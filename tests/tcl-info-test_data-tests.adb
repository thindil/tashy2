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

with Tcl.Lists; use Tcl.Lists;
with Tcl.Strings; use Tcl.Strings;
with Tcl.Variables; use Tcl.Variables;

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
   function Wrap_Test_Get_Arguments_58c9c6_2155d3
     (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      begin
         pragma Assert
           (Proc_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Arguments test requirement violated");
      end;
      declare
         Test_Get_Arguments_58c9c6_2155d3_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Arguments
             (Proc_Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Arguments test commitment violated");
         end;
         return Test_Get_Arguments_58c9c6_2155d3_Result;
      end;
   end Wrap_Test_Get_Arguments_58c9c6_2155d3;
--  end read only

--  begin read only
   procedure Test_Get_Arguments_test_info_arguments(Gnattest_T: in out Test);
   procedure Test_Get_Arguments_58c9c6_2155d3(Gnattest_T: in out Test) renames
     Test_Get_Arguments_test_info_arguments;
--  id:2.2/58c9c62146c0356d/Get_Arguments/1/0/test_info_arguments/
   procedure Test_Get_Arguments_test_info_arguments(Gnattest_T: in out Test) is
      function Get_Arguments
        (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Array_List renames
        Wrap_Test_Get_Arguments_58c9c6_2155d3;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("proc myproc {arg1 {arg2 2}} {return 0}");
      declare
         Result: Array_List := Get_Arguments("myproc");
      begin
         Assert
           (Result'Length = 2 and Result(1) = To_Tcl_String("arg1"),
            "Failed to get arguments list of Tcl procedure.");
      end;

--  begin read only
   end Test_Get_Arguments_test_info_arguments;
--  end read only

--  begin read only
   function Wrap_Test_Get_Procedure_Body_4ab4c1_b86b33
     (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String is
   begin
      begin
         pragma Assert
           (Proc_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Procedure_Body test requirement violated");
      end;
      declare
         Test_Get_Procedure_Body_4ab4c1_b86b33_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Procedure_Body
             (Proc_Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Procedure_Body test commitment violated");
         end;
         return Test_Get_Procedure_Body_4ab4c1_b86b33_Result;
      end;
   end Wrap_Test_Get_Procedure_Body_4ab4c1_b86b33;
--  end read only

--  begin read only
   procedure Test_Get_Procedure_Body_test_info_procedure_body
     (Gnattest_T: in out Test);
   procedure Test_Get_Procedure_Body_4ab4c1_b86b33
     (Gnattest_T: in out Test) renames
     Test_Get_Procedure_Body_test_info_procedure_body;
--  id:2.2/4ab4c1197abe1ad1/Get_Procedure_Body/1/0/test_info_procedure_body/
   procedure Test_Get_Procedure_Body_test_info_procedure_body
     (Gnattest_T: in out Test) is
      function Get_Procedure_Body
        (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return String renames
        Wrap_Test_Get_Procedure_Body_4ab4c1_b86b33;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (Get_Procedure_Body("myproc") = "return 0",
         "Failed to get the body of Tcl procedure.");

--  begin read only
   end Test_Get_Procedure_Body_test_info_procedure_body;
--  end read only

--  begin read only
   function Wrap_Test_Get_Commands_Count_9e53d6_cae496
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Natural is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Commands_Count test requirement violated");
      end;
      declare
         Test_Get_Commands_Count_9e53d6_cae496_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Commands_Count
             (Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Commands_Count test commitment violated");
         end;
         return Test_Get_Commands_Count_9e53d6_cae496_Result;
      end;
   end Wrap_Test_Get_Commands_Count_9e53d6_cae496;
--  end read only

--  begin read only
   procedure Test_Get_Commands_Count_test_info_commands_count
     (Gnattest_T: in out Test);
   procedure Test_Get_Commands_Count_9e53d6_cae496
     (Gnattest_T: in out Test) renames
     Test_Get_Commands_Count_test_info_commands_count;
--  id:2.2/9e53d671a67c9d1c/Get_Commands_Count/1/0/test_info_commands_count/
   procedure Test_Get_Commands_Count_test_info_commands_count
     (Gnattest_T: in out Test) is
      function Get_Commands_Count
        (Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Natural renames
        Wrap_Test_Get_Commands_Count_9e53d6_cae496;
--  end read only

      pragma Unreferenced(Gnattest_T);
      function Get_Result is new Generic_Scalar_Tcl_Get_Result(Integer);

   begin

      Tcl_Eval("info cmdcount");
      Assert
        (Get_Commands_Count = Get_Result,
         "Failed to get amount of available Tcl commands.");

--  begin read only
   end Test_Get_Commands_Count_test_info_commands_count;
--  end read only

--  begin read only
   function Wrap_Test_Get_Commands_f2ad9c_675616
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Command test requirement violated");
      end;
      declare
         Test_Get_Commands_f2ad9c_675616_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Commands
             (Pattern, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Command test commitment violated");
         end;
         return Test_Get_Commands_f2ad9c_675616_Result;
      end;
   end Wrap_Test_Get_Commands_f2ad9c_675616;
--  end read only

--  begin read only
   procedure Test_Get_Commands_test_info_command(Gnattest_T: in out Test);
   procedure Test_Get_Commands_f2ad9c_675616(Gnattest_T: in out Test) renames
     Test_Get_Commands_test_info_command;
--  id:2.2/f2ad9ce2c55ff78f/Get_Commands/1/0/test_info_command/
   procedure Test_Get_Commands_test_info_command(Gnattest_T: in out Test) is
      function Get_Commands
        (Pattern: String := "";
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Array_List renames
        Wrap_Test_Get_Commands_f2ad9c_675616;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Commands_Array: Array_List := Get_Commands("put*");

   begin

      Assert
        (Commands_Array'Length = 1 and
         Commands_Array(1) = To_Unbounded_String("puts"),
         "Failed to get names of available Tcl commands.");

--  begin read only
   end Test_Get_Commands_test_info_command;
--  end read only

--  begin read only
   function Wrap_Test_Complete_539361_79b807
     (Command: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean is
   begin
      begin
         pragma Assert(Command'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Complete test requirement violated");
      end;
      declare
         Test_Complete_539361_79b807_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Complete
             (Command, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Complete test commitment violated");
         end;
         return Test_Complete_539361_79b807_Result;
      end;
   end Wrap_Test_Complete_539361_79b807;
--  end read only

--  begin read only
   procedure Test_Complete_test_info_complete(Gnattest_T: in out Test);
   procedure Test_Complete_539361_79b807(Gnattest_T: in out Test) renames
     Test_Complete_test_info_complete;
--  id:2.2/539361c0b35d240d/Complete/1/0/test_info_complete/
   procedure Test_Complete_test_info_complete(Gnattest_T: in out Test) is
      function Complete
        (Command: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Boolean renames
        Wrap_Test_Complete_539361_79b807;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (Complete("puts"),
         "Failed to get completion status of the selected Tcl command.");

--  begin read only
   end Test_Complete_test_info_complete;
--  end read only

--  begin read only
   function Wrap_Test_Get_Coroutine_df9ca4_613b2a
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Coroutine test requirement violated");
      end;
      declare
         Test_Get_Coroutine_df9ca4_613b2a_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Coroutine
             (Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Coroutine test commitment violated");
         end;
         return Test_Get_Coroutine_df9ca4_613b2a_Result;
      end;
   end Wrap_Test_Get_Coroutine_df9ca4_613b2a;
--  end read only

--  begin read only
   procedure Test_Get_Coroutine_test_info_coroutine(Gnattest_T: in out Test);
   procedure Test_Get_Coroutine_df9ca4_613b2a(Gnattest_T: in out Test) renames
     Test_Get_Coroutine_test_info_coroutine;
--  id:2.2/df9ca4d1f658a1c9/Get_Coroutine/1/0/test_info_coroutine/
   procedure Test_Get_Coroutine_test_info_coroutine(Gnattest_T: in out Test) is
      function Get_Coroutine
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Get_Coroutine_df9ca4_613b2a;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (Get_Coroutine = "", "Failed to get the name of current coroutine.");

--  begin read only
   end Test_Get_Coroutine_test_info_coroutine;
--  end read only

--  begin read only
   function Wrap_Test_Get_Default_2d3d83_db99d7
     (Proc_Name, Argument, Var_Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Boolean is
   begin
      begin
         pragma Assert
           (Proc_Name'Length > 0 and Argument'Length > 0 and
            Var_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Default test requirement violated");
      end;
      declare
         Test_Get_Default_2d3d83_db99d7_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Default
             (Proc_Name, Argument, Var_Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Default test commitment violated");
         end;
         return Test_Get_Default_2d3d83_db99d7_Result;
      end;
   end Wrap_Test_Get_Default_2d3d83_db99d7;
--  end read only

--  begin read only
   procedure Test_Get_Default_test_info_default(Gnattest_T: in out Test);
   procedure Test_Get_Default_2d3d83_db99d7(Gnattest_T: in out Test) renames
     Test_Get_Default_test_info_default;
--  id:2.2/2d3d83648d914271/Get_Default/1/0/test_info_default/
   procedure Test_Get_Default_test_info_default(Gnattest_T: in out Test) is
      function Get_Default
        (Proc_Name, Argument, Var_Name: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Boolean renames
        Wrap_Test_Get_Default_2d3d83_db99d7;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (not Get_Default("myproc", "arg1", "myvalue"),
         "Failed to get info about no default value in Tcl procedure.");
      if Get_Default("myproc", "arg2", "myvalue") then
         Assert
           (Tcl_Get_Var("myvalue") = "2",
            "Failed to get default value for Tcl procedure.");
      else
         Assert
           (False, "Failed to get info about default value in Tcl procedure.");
      end if;

--  begin read only
   end Test_Get_Default_test_info_default;
--  end read only

--  begin read only
   function Wrap_Test_Get_Error_Stack_c33442_123ed2
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_ErrorStack test requirement violated");
      end;
      declare
         Test_Get_Error_Stack_c33442_123ed2_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Error_Stack
             (Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_ErrorStack test commitment violated");
         end;
         return Test_Get_Error_Stack_c33442_123ed2_Result;
      end;
   end Wrap_Test_Get_Error_Stack_c33442_123ed2;
--  end read only

--  begin read only
   procedure Test_Get_Error_Stack_test_info_errorstack
     (Gnattest_T: in out Test);
   procedure Test_Get_Error_Stack_c33442_123ed2
     (Gnattest_T: in out Test) renames
     Test_Get_Error_Stack_test_info_errorstack;
--  id:2.2/c33442c4db0e9986/Get_Error_Stack/1/0/test_info_errorstack/
   procedure Test_Get_Error_Stack_test_info_errorstack
     (Gnattest_T: in out Test) is
      function Get_Error_Stack
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Get_Error_Stack_c33442_123ed2;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert(Get_Error_Stack'Length = 0, "Failed to get error stack info.");

--  begin read only
   end Test_Get_Error_Stack_test_info_errorstack;
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

      Tcl_Set_Var("myvar", "2");
      Assert(Info.Exists("myvar"), "Failed to find existing variable.");
      Assert
        (not Info.Exists("randomnamevar"),
         "Failed to not find non existing variable.");

--  begin read only
   end Test_Exists_test_info_exists;
--  end read only

--  begin read only
   function Wrap_Test_Get_Functions_5a1dbc_10dc33
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Functions test requirement violated");
      end;
      declare
         Test_Get_Functions_5a1dbc_10dc33_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Functions
             (Pattern, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Functions test commitment violated");
         end;
         return Test_Get_Functions_5a1dbc_10dc33_Result;
      end;
   end Wrap_Test_Get_Functions_5a1dbc_10dc33;
--  end read only

--  begin read only
   procedure Test_Get_Functions_test_info_functions(Gnattest_T: in out Test);
   procedure Test_Get_Functions_5a1dbc_10dc33(Gnattest_T: in out Test) renames
     Test_Get_Functions_test_info_functions;
--  id:2.2/5a1dbc0c2cd65b4e/Get_Functions/1/0/test_info_functions/
   procedure Test_Get_Functions_test_info_functions(Gnattest_T: in out Test) is
      function Get_Functions
        (Pattern: String := "";
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Array_List renames
        Wrap_Test_Get_Functions_5a1dbc_10dc33;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Functions_Array: Array_List := Get_Functions("log1*");

   begin

      Assert
        (Functions_Array'Length = 1 and
         Functions_Array(1) = To_Unbounded_String("log10"),
         "Failed to get names of available Tcl math functions.");

--  begin read only
   end Test_Get_Functions_test_info_functions;
--  end read only

--  begin read only
   function Wrap_Test_Get_Globals_1284d9_c19ad0
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Globals test requirement violated");
      end;
      declare
         Test_Get_Globals_1284d9_c19ad0_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Globals
             (Pattern, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Globals test commitment violated");
         end;
         return Test_Get_Globals_1284d9_c19ad0_Result;
      end;
   end Wrap_Test_Get_Globals_1284d9_c19ad0;
--  end read only

--  begin read only
   procedure Test_Get_Globals_test_info_globals(Gnattest_T: in out Test);
   procedure Test_Get_Globals_1284d9_c19ad0(Gnattest_T: in out Test) renames
     Test_Get_Globals_test_info_globals;
--  id:2.2/1284d97e337e3f8a/Get_Globals/1/0/test_info_globals/
   procedure Test_Get_Globals_test_info_globals(Gnattest_T: in out Test) is
      function Get_Globals
        (Pattern: String := "";
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Array_List renames
        Wrap_Test_Get_Globals_1284d9_c19ad0;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Globals_Array: Array_List := Get_Globals("en*");

   begin

      Assert
        (Globals_Array'Length = 1 and
         Globals_Array(1) = To_Unbounded_String("env"),
         "Failed to get names of available Tcl global variables.");

--  begin read only
   end Test_Get_Globals_test_info_globals;
--  end read only

--  begin read only
   function Wrap_Test_Get_Host_Name_0a278d_b2a918
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_HostName test requirement violated");
      end;
      declare
         Test_Get_Host_Name_0a278d_b2a918_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Host_Name
             (Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_HostName test commitment violated");
         end;
         return Test_Get_Host_Name_0a278d_b2a918_Result;
      end;
   end Wrap_Test_Get_Host_Name_0a278d_b2a918;
--  end read only

--  begin read only
   procedure Test_Get_Host_Name_test_info_hostname(Gnattest_T: in out Test);
   procedure Test_Get_Host_Name_0a278d_b2a918(Gnattest_T: in out Test) renames
     Test_Get_Host_Name_test_info_hostname;
--  id:2.2/0a278d606913e740/Get_Host_Name/1/0/test_info_hostname/
   procedure Test_Get_Host_Name_test_info_hostname(Gnattest_T: in out Test) is
      function Get_Host_Name
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Get_Host_Name_0a278d_b2a918;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("set host [info hostname]");
      Assert
        (Get_Host_Name = Tcl_Get_Var("host"), "Failed to get the host name.");

--  begin read only
   end Test_Get_Host_Name_test_info_hostname;
--  end read only

--  begin read only
   function Wrap_Test_Get_Library_36938c_8b9a20
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Library test requirement violated");
      end;
      declare
         Test_Get_Library_36938c_8b9a20_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Library
             (Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Library test commitment violated");
         end;
         return Test_Get_Library_36938c_8b9a20_Result;
      end;
   end Wrap_Test_Get_Library_36938c_8b9a20;
--  end read only

--  begin read only
   procedure Test_Get_Library_test_info_library(Gnattest_T: in out Test);
   procedure Test_Get_Library_36938c_8b9a20(Gnattest_T: in out Test) renames
     Test_Get_Library_test_info_library;
--  id:2.2/36938c1064dbfd83/Get_Library/1/0/test_info_library/
   procedure Test_Get_Library_test_info_library(Gnattest_T: in out Test) is
      function Get_Library
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Get_Library_36938c_8b9a20;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("set library [info library]");
      Assert
        (Get_Library = Tcl_Get_Var("library"),
         "Failed to get the path to Tcl library.");

--  begin read only
   end Test_Get_Library_test_info_library;
--  end read only

--  begin read only
   function Wrap_Test_Get_Locals_09a275_f4c43e
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Locals test requirement violated");
      end;
      declare
         Test_Get_Locals_09a275_f4c43e_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Locals
             (Pattern, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Locals test commitment violated");
         end;
         return Test_Get_Locals_09a275_f4c43e_Result;
      end;
   end Wrap_Test_Get_Locals_09a275_f4c43e;
--  end read only

--  begin read only
   procedure Test_Get_Locals_test_info_locals(Gnattest_T: in out Test);
   procedure Test_Get_Locals_09a275_f4c43e(Gnattest_T: in out Test) renames
     Test_Get_Locals_test_info_locals;
--  id:2.2/09a2750c074ec5b0/Get_Locals/1/0/test_info_locals/
   procedure Test_Get_Locals_test_info_locals(Gnattest_T: in out Test) is
      function Get_Locals
        (Pattern: String := "";
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Array_List renames
        Wrap_Test_Get_Locals_09a275_f4c43e;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Locals_Array: Array_List := Get_Locals;

   begin

      Assert
        (Locals_Array'Length = 0,
         "Failed to get names of available Tcl local variables.");

--  begin read only
   end Test_Get_Locals_test_info_locals;
--  end read only

--  begin read only
   function Wrap_Test_Get_Name_Of_Executable_1cc16d_24ff4c
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Name_Of_Executable test requirement violated");
      end;
      declare
         Test_Get_Name_Of_Executable_1cc16d_24ff4c_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Name_Of_Executable
             (Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Name_Of_Executable test commitment violated");
         end;
         return Test_Get_Name_Of_Executable_1cc16d_24ff4c_Result;
      end;
   end Wrap_Test_Get_Name_Of_Executable_1cc16d_24ff4c;
--  end read only

--  begin read only
   procedure Test_Get_Name_Of_Executable_test_info_name_of_executable
     (Gnattest_T: in out Test);
   procedure Test_Get_Name_Of_Executable_1cc16d_24ff4c
     (Gnattest_T: in out Test) renames
     Test_Get_Name_Of_Executable_test_info_name_of_executable;
--  id:2.2/1cc16d3669fcd83d/Get_Name_Of_Executable/1/0/test_info_name_of_executable/
   procedure Test_Get_Name_Of_Executable_test_info_name_of_executable
     (Gnattest_T: in out Test) is
      function Get_Name_Of_Executable
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Get_Name_Of_Executable_1cc16d_24ff4c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("set nameofexec [info nameofexecutable]");
      Assert
        (Get_Name_Of_Executable = Tcl_Get_Var("nameofexec"),
         "Failed to get the name of executable.");

--  begin read only
   end Test_Get_Name_Of_Executable_test_info_name_of_executable;
--  end read only

--  begin read only
   function Wrap_Test_Get_Patch_Level_0baa9d_325136
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Patch_Level test requirement violated");
      end;
      declare
         Test_Get_Patch_Level_0baa9d_325136_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Patch_Level
             (Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Patch_Level test commitment violated");
         end;
         return Test_Get_Patch_Level_0baa9d_325136_Result;
      end;
   end Wrap_Test_Get_Patch_Level_0baa9d_325136;
--  end read only

--  begin read only
   procedure Test_Get_Patch_Level_test_info_patch_level
     (Gnattest_T: in out Test);
   procedure Test_Get_Patch_Level_0baa9d_325136
     (Gnattest_T: in out Test) renames
     Test_Get_Patch_Level_test_info_patch_level;
--  id:2.2/0baa9dff03cbd14f/Get_Patch_Level/1/0/test_info_patch_level/
   procedure Test_Get_Patch_Level_test_info_patch_level
     (Gnattest_T: in out Test) is
      function Get_Patch_Level
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Get_Patch_Level_0baa9d_325136;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("set patch [info patchlevel]");
      Assert
        (Get_Patch_Level = Tcl_Get_Var("patch"),
         "Failed to get the library patch level.");

--  begin read only
   end Test_Get_Patch_Level_test_info_patch_level;
--  end read only

--  begin read only
   function Wrap_Test_Get_Procedures_848b43_884500
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Procs test requirement violated");
      end;
      declare
         Test_Get_Procedures_848b43_884500_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Procedures
             (Pattern, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Procs test commitment violated");
         end;
         return Test_Get_Procedures_848b43_884500_Result;
      end;
   end Wrap_Test_Get_Procedures_848b43_884500;
--  end read only

--  begin read only
   procedure Test_Get_Procedures_test_info_procs(Gnattest_T: in out Test);
   procedure Test_Get_Procedures_848b43_884500(Gnattest_T: in out Test) renames
     Test_Get_Procedures_test_info_procs;
--  id:2.2/848b431ab34cfb83/Get_Procedures/1/0/test_info_procs/
   procedure Test_Get_Procedures_test_info_procs(Gnattest_T: in out Test) is
      function Get_Procedures
        (Pattern: String := "";
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Array_List renames
        Wrap_Test_Get_Procedures_848b43_884500;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Procs_Array: Array_List := Get_Procedures("mypr*");

   begin

      Assert
        (Procs_Array'Length = 1 and
         Procs_Array(1) = To_Unbounded_String("myproc"),
         "Failed to get names of available Tcl procedures.");

--  begin read only
   end Test_Get_Procedures_test_info_procs;
--  end read only

--  begin read only
   function Wrap_Test_Get_Script_86aa75_ddce00
     (File_Name: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Script test requirement violated");
      end;
      declare
         Test_Get_Script_86aa75_ddce00_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Script
             (File_Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Script test commitment violated");
         end;
         return Test_Get_Script_86aa75_ddce00_Result;
      end;
   end Wrap_Test_Get_Script_86aa75_ddce00;
--  end read only

--  begin read only
   procedure Test_Get_Script_test_info_script(Gnattest_T: in out Test);
   procedure Test_Get_Script_86aa75_ddce00(Gnattest_T: in out Test) renames
     Test_Get_Script_test_info_script;
--  id:2.2/86aa75d0f7b04cd9/Get_Script/1/0/test_info_script/
   procedure Test_Get_Script_test_info_script(Gnattest_T: in out Test) is
      function Get_Script
        (File_Name: String := "";
         Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Get_Script_86aa75_ddce00;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert(Get_Script'Length = 0, "Failed to get the name of Tcl script.");

--  begin read only
   end Test_Get_Script_test_info_script;
--  end read only

--  begin read only
   function Wrap_Test_Get_Tcl_Version_d04078_6661d4
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Tcl_Version test requirement violated");
      end;
      declare
         Test_Get_Tcl_Version_d04078_6661d4_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Tcl_Version
             (Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Tcl_Version test commitment violated");
         end;
         return Test_Get_Tcl_Version_d04078_6661d4_Result;
      end;
   end Wrap_Test_Get_Tcl_Version_d04078_6661d4;
--  end read only

--  begin read only
   procedure Test_Get_Tcl_Version_test_info_tcl_version
     (Gnattest_T: in out Test);
   procedure Test_Get_Tcl_Version_d04078_6661d4
     (Gnattest_T: in out Test) renames
     Test_Get_Tcl_Version_test_info_tcl_version;
--  id:2.2/d0407807e1ae595a/Get_Tcl_Version/1/0/test_info_tcl_version/
   procedure Test_Get_Tcl_Version_test_info_tcl_version
     (Gnattest_T: in out Test) is
      function Get_Tcl_Version
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Get_Tcl_Version_d04078_6661d4;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("set version [info tclversion]");
      Assert
        (Get_Tcl_Version = Tcl_Get_Var("version"),
         "Failed to get the Tcl version.");

--  begin read only
   end Test_Get_Tcl_Version_test_info_tcl_version;
--  end read only

--  begin read only
   function Wrap_Test_Get_Variables_fedbab_9d2a56
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Array_List is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-info.ads:0):Test_Info_Vars test requirement violated");
      end;
      declare
         Test_Get_Variables_fedbab_9d2a56_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Get_Variables
             (Pattern, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-info.ads:0:):Test_Info_Vars test commitment violated");
         end;
         return Test_Get_Variables_fedbab_9d2a56_Result;
      end;
   end Wrap_Test_Get_Variables_fedbab_9d2a56;
--  end read only

--  begin read only
   procedure Test_Get_Variables_test_info_vars(Gnattest_T: in out Test);
   procedure Test_Get_Variables_fedbab_9d2a56(Gnattest_T: in out Test) renames
     Test_Get_Variables_test_info_vars;
--  id:2.2/fedbab0106f2223f/Get_Variables/1/0/test_info_vars/
   procedure Test_Get_Variables_test_info_vars(Gnattest_T: in out Test) is
      function Get_Variables
        (Pattern: String := "";
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Array_List renames
        Wrap_Test_Get_Variables_fedbab_9d2a56;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Variables_Array: Array_List := Get_Variables("en*");

   begin

      Assert
        (Variables_Array'Length = 1 and
         Variables_Array(1) = To_Tcl_String("env"),
         "Failed to get names of available all Tcl variables.");

--  begin read only
   end Test_Get_Variables_test_info_vars;
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
