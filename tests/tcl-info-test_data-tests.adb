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
   function Wrap_Test_Arguments_11e765_2155d3
     (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbounded_Strings_Array is
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
         Test_Arguments_11e765_2155d3_Result: constant Unbounded_Strings_Array :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Arguments
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
         return Test_Arguments_11e765_2155d3_Result;
      end;
   end Wrap_Test_Arguments_11e765_2155d3;
--  end read only

--  begin read only
   procedure Test_Arguments_test_info_arguments(Gnattest_T: in out Test);
   procedure Test_Arguments_11e765_2155d3(Gnattest_T: in out Test) renames
     Test_Arguments_test_info_arguments;
--  id:2.2/11e7650f895c0a5f/Arguments/1/0/test_info_arguments/
   procedure Test_Arguments_test_info_arguments(Gnattest_T: in out Test) is
      function Arguments
        (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Unbounded_Strings_Array renames
        Wrap_Test_Arguments_11e765_2155d3;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("proc myproc {arg1 {arg2 2}} {return 0}");
      declare
         Result: Unbounded_Strings_Array := Arguments("myproc");
      begin
         Assert
           (Result'Length = 2 and Result(1) = To_Unbounded_String("arg1"),
            "Failed to get arguments list of Tcl procedure.");
      end;

--  begin read only
   end Test_Arguments_test_info_arguments;
--  end read only

--  begin read only
   function Wrap_Test_Procedure_Body_bc2330_b86b33
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
         Test_Procedure_Body_bc2330_b86b33_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Procedure_Body
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
         return Test_Procedure_Body_bc2330_b86b33_Result;
      end;
   end Wrap_Test_Procedure_Body_bc2330_b86b33;
--  end read only

--  begin read only
   procedure Test_Procedure_Body_test_info_procedure_body
     (Gnattest_T: in out Test);
   procedure Test_Procedure_Body_bc2330_b86b33(Gnattest_T: in out Test) renames
     Test_Procedure_Body_test_info_procedure_body;
--  id:2.2/bc2330b4c01267e2/Procedure_Body/1/0/test_info_procedure_body/
   procedure Test_Procedure_Body_test_info_procedure_body
     (Gnattest_T: in out Test) is
      function Procedure_Body
        (Proc_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return String renames
        Wrap_Test_Procedure_Body_bc2330_b86b33;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (Procedure_Body("myproc") = "return 0",
         "Failed to get the body of Tcl procedure.");

--  begin read only
   end Test_Procedure_Body_test_info_procedure_body;
--  end read only

--  begin read only
   function Wrap_Test_Commands_Count_39e46a_cae496
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
         Test_Commands_Count_39e46a_cae496_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Commands_Count
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
         return Test_Commands_Count_39e46a_cae496_Result;
      end;
   end Wrap_Test_Commands_Count_39e46a_cae496;
--  end read only

--  begin read only
   procedure Test_Commands_Count_test_info_commands_count
     (Gnattest_T: in out Test);
   procedure Test_Commands_Count_39e46a_cae496(Gnattest_T: in out Test) renames
     Test_Commands_Count_test_info_commands_count;
--  id:2.2/39e46a558838a3ef/Commands_Count/1/0/test_info_commands_count/
   procedure Test_Commands_Count_test_info_commands_count
     (Gnattest_T: in out Test) is
      function Commands_Count
        (Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Natural renames
        Wrap_Test_Commands_Count_39e46a_cae496;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("info cmdcount");
      Assert
        (Commands_Count = Tcl_GetResult,
         "Failed to get amount of available Tcl commands.");

--  begin read only
   end Test_Commands_Count_test_info_commands_count;
--  end read only

--  begin read only
   function Wrap_Test_Commands_c6b29f_675616
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbounded_Strings_Array is
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
         Test_Commands_c6b29f_675616_Result: constant Unbounded_Strings_Array :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Commands
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
         return Test_Commands_c6b29f_675616_Result;
      end;
   end Wrap_Test_Commands_c6b29f_675616;
--  end read only

--  begin read only
   procedure Test_Commands_test_info_command(Gnattest_T: in out Test);
   procedure Test_Commands_c6b29f_675616(Gnattest_T: in out Test) renames
     Test_Commands_test_info_command;
--  id:2.2/c6b29fbc91dbb879/Commands/1/0/test_info_command/
   procedure Test_Commands_test_info_command(Gnattest_T: in out Test) is
      function Commands
        (Pattern: String := "";
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Unbounded_Strings_Array renames
        Wrap_Test_Commands_c6b29f_675616;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      declare
         Commands_Array: Unbounded_Strings_Array := Commands("put*");
      begin
         Assert
           (Commands_Array'Length = 1 and
            Commands_Array(1) = To_Unbounded_String("puts"),
            "Failed to get names of available Tcl commands.");
      end;

--  begin read only
   end Test_Commands_test_info_command;
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
   function Wrap_Test_Coroutine_e20165_613b2a
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
         Test_Coroutine_e20165_613b2a_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Coroutine
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
         return Test_Coroutine_e20165_613b2a_Result;
      end;
   end Wrap_Test_Coroutine_e20165_613b2a;
--  end read only

--  begin read only
   procedure Test_Coroutine_test_info_coroutine(Gnattest_T: in out Test);
   procedure Test_Coroutine_e20165_613b2a(Gnattest_T: in out Test) renames
     Test_Coroutine_test_info_coroutine;
--  id:2.2/e20165c7c1a804b5/Coroutine/1/0/test_info_coroutine/
   procedure Test_Coroutine_test_info_coroutine(Gnattest_T: in out Test) is
      function Coroutine
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Coroutine_e20165_613b2a;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert(Coroutine = "", "Failed to get the name of current coroutine.");

--  begin read only
   end Test_Coroutine_test_info_coroutine;
--  end read only

--  begin read only
   function Wrap_Test_Default_c49ada_db99d7
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
         Test_Default_c49ada_db99d7_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Default
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
         return Test_Default_c49ada_db99d7_Result;
      end;
   end Wrap_Test_Default_c49ada_db99d7;
--  end read only

--  begin read only
   procedure Test_Default_test_info_default(Gnattest_T: in out Test);
   procedure Test_Default_c49ada_db99d7(Gnattest_T: in out Test) renames
     Test_Default_test_info_default;
--  id:2.2/c49adaf20f823d22/Default/1/0/test_info_default/
   procedure Test_Default_test_info_default(Gnattest_T: in out Test) is
      function Default
        (Proc_Name, Argument, Var_Name: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Boolean renames
        Wrap_Test_Default_c49ada_db99d7;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (not Default("myproc", "arg1", "myvalue"),
         "Failed to get info about no default value in Tcl procedure.");
      if Default("myproc", "arg2", "myvalue") then
         Assert
           (Tcl_GetVar("myvalue") = 2,
            "Failed to get default value for Tcl procedure.");
      else
         Assert
           (False, "Failed to get info about default value in Tcl procedure.");
      end if;

--  begin read only
   end Test_Default_test_info_default;
--  end read only

--  begin read only
   function Wrap_Test_ErrorStack_bd77fa_123ed2
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
         Test_ErrorStack_bd77fa_123ed2_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.ErrorStack
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
         return Test_ErrorStack_bd77fa_123ed2_Result;
      end;
   end Wrap_Test_ErrorStack_bd77fa_123ed2;
--  end read only

--  begin read only
   procedure Test_ErrorStack_test_info_errorstack(Gnattest_T: in out Test);
   procedure Test_ErrorStack_bd77fa_123ed2(Gnattest_T: in out Test) renames
     Test_ErrorStack_test_info_errorstack;
--  id:2.2/bd77fa6f40e645d6/ErrorStack/1/0/test_info_errorstack/
   procedure Test_ErrorStack_test_info_errorstack(Gnattest_T: in out Test) is
      function ErrorStack
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_ErrorStack_bd77fa_123ed2;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert(ErrorStack'Length = 0, "Failed to get error stack info.");

--  begin read only
   end Test_ErrorStack_test_info_errorstack;
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

      Tcl_SetVar("myvar", "2");
      Assert(Info.Exists("myvar"), "Failed to find existing variable.");
      Assert
        (not Info.Exists("randomnamevar"),
         "Failed to not find non existing variable.");

--  begin read only
   end Test_Exists_test_info_exists;
--  end read only

--  begin read only
   function Wrap_Test_Functions_50f93e_10dc33
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbounded_Strings_Array is
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
         Test_Functions_50f93e_10dc33_Result: constant Unbounded_Strings_Array :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Functions
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
         return Test_Functions_50f93e_10dc33_Result;
      end;
   end Wrap_Test_Functions_50f93e_10dc33;
--  end read only

--  begin read only
   procedure Test_Functions_test_info_functions(Gnattest_T: in out Test);
   procedure Test_Functions_50f93e_10dc33(Gnattest_T: in out Test) renames
     Test_Functions_test_info_functions;
--  id:2.2/50f93e8b2d0e93bd/Functions/1/0/test_info_functions/
   procedure Test_Functions_test_info_functions(Gnattest_T: in out Test) is
      function Functions
        (Pattern: String := "";
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Unbounded_Strings_Array renames
        Wrap_Test_Functions_50f93e_10dc33;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      declare
         Functions_Array: Unbounded_Strings_Array := Functions("log1*");
      begin
         Assert
           (Functions_Array'Length = 1 and
            Functions_Array(1) = To_Unbounded_String("log10"),
            "Failed to get names of available Tcl math functions.");
      end;

--  begin read only
   end Test_Functions_test_info_functions;
--  end read only

--  begin read only
   function Wrap_Test_Globals_77446d_c19ad0
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbounded_Strings_Array is
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
         Test_Globals_77446d_c19ad0_Result: constant Unbounded_Strings_Array :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Globals
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
         return Test_Globals_77446d_c19ad0_Result;
      end;
   end Wrap_Test_Globals_77446d_c19ad0;
--  end read only

--  begin read only
   procedure Test_Globals_test_info_globals(Gnattest_T: in out Test);
   procedure Test_Globals_77446d_c19ad0(Gnattest_T: in out Test) renames
     Test_Globals_test_info_globals;
--  id:2.2/77446dccb135db5e/Globals/1/0/test_info_globals/
   procedure Test_Globals_test_info_globals(Gnattest_T: in out Test) is
      function Globals
        (Pattern: String := "";
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Unbounded_Strings_Array renames
        Wrap_Test_Globals_77446d_c19ad0;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      declare
         Globals_Array: Unbounded_Strings_Array := Globals("en*");
      begin
         Assert
           (Globals_Array'Length = 1 and
            Globals_Array(1) = To_Unbounded_String("env"),
            "Failed to get names of available Tcl global variables.");
      end;

--  begin read only
   end Test_Globals_test_info_globals;
--  end read only

--  begin read only
   function Wrap_Test_HostName_f98e16_b2a918
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
         Test_HostName_f98e16_b2a918_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.HostName(Interpreter);
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
         return Test_HostName_f98e16_b2a918_Result;
      end;
   end Wrap_Test_HostName_f98e16_b2a918;
--  end read only

--  begin read only
   procedure Test_HostName_test_info_hostname(Gnattest_T: in out Test);
   procedure Test_HostName_f98e16_b2a918(Gnattest_T: in out Test) renames
     Test_HostName_test_info_hostname;
--  id:2.2/f98e16966f0b68e2/HostName/1/0/test_info_hostname/
   procedure Test_HostName_test_info_hostname(Gnattest_T: in out Test) is
      function HostName
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_HostName_f98e16_b2a918;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("set host [info hostname]");
      Assert(HostName = Tcl_GetVar("host"), "Failed to get the host name.");

--  begin read only
   end Test_HostName_test_info_hostname;
--  end read only

--  begin read only
   function Wrap_Test_Library_77b287_8b9a20
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
         Test_Library_77b287_8b9a20_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Library(Interpreter);
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
         return Test_Library_77b287_8b9a20_Result;
      end;
   end Wrap_Test_Library_77b287_8b9a20;
--  end read only

--  begin read only
   procedure Test_Library_test_info_library(Gnattest_T: in out Test);
   procedure Test_Library_77b287_8b9a20(Gnattest_T: in out Test) renames
     Test_Library_test_info_library;
--  id:2.2/77b28756b6b9de08/Library/1/0/test_info_library/
   procedure Test_Library_test_info_library(Gnattest_T: in out Test) is
      function Library
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Library_77b287_8b9a20;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("set library [info library]");
      Assert
        (Library = Tcl_GetVar("library"),
         "Failed to get the path to Tcl library.");

--  begin read only
   end Test_Library_test_info_library;
--  end read only

--  begin read only
   function Wrap_Test_Locals_4964d0_f4c43e
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbounded_Strings_Array is
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
         Test_Locals_4964d0_f4c43e_Result: constant Unbounded_Strings_Array :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Locals
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
         return Test_Locals_4964d0_f4c43e_Result;
      end;
   end Wrap_Test_Locals_4964d0_f4c43e;
--  end read only

--  begin read only
   procedure Test_Locals_test_info_locals(Gnattest_T: in out Test);
   procedure Test_Locals_4964d0_f4c43e(Gnattest_T: in out Test) renames
     Test_Locals_test_info_locals;
--  id:2.2/4964d04c6101ab1f/Locals/1/0/test_info_locals/
   procedure Test_Locals_test_info_locals(Gnattest_T: in out Test) is
      function Locals
        (Pattern: String := "";
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Unbounded_Strings_Array renames
        Wrap_Test_Locals_4964d0_f4c43e;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      declare
         Locals_Array: Unbounded_Strings_Array := Locals;
      begin
         Assert
           (Locals_Array'Length = 1 and
            Locals_Array(1) = Null_Unbounded_String,
            "Failed to get names of available Tcl local variables.");
      end;

--  begin read only
   end Test_Locals_test_info_locals;
--  end read only

--  begin read only
   function Wrap_Test_Name_Of_Executable_64477f_24ff4c
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
         Test_Name_Of_Executable_64477f_24ff4c_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Name_Of_Executable
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
         return Test_Name_Of_Executable_64477f_24ff4c_Result;
      end;
   end Wrap_Test_Name_Of_Executable_64477f_24ff4c;
--  end read only

--  begin read only
   procedure Test_Name_Of_Executable_test_info_name_of_executable
     (Gnattest_T: in out Test);
   procedure Test_Name_Of_Executable_64477f_24ff4c
     (Gnattest_T: in out Test) renames
     Test_Name_Of_Executable_test_info_name_of_executable;
--  id:2.2/64477f8c1decfabe/Name_Of_Executable/1/0/test_info_name_of_executable/
   procedure Test_Name_Of_Executable_test_info_name_of_executable
     (Gnattest_T: in out Test) is
      function Name_Of_Executable
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Name_Of_Executable_64477f_24ff4c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("set nameofexec [info nameofexecutable]");
      Assert
        (Name_Of_Executable = Tcl_GetVar("nameofexec"),
         "Failed to get the name of executable.");

--  begin read only
   end Test_Name_Of_Executable_test_info_name_of_executable;
--  end read only

--  begin read only
   function Wrap_Test_Patch_Level_b52e42_325136
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
         Test_Patch_Level_b52e42_325136_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Patch_Level
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
         return Test_Patch_Level_b52e42_325136_Result;
      end;
   end Wrap_Test_Patch_Level_b52e42_325136;
--  end read only

--  begin read only
   procedure Test_Patch_Level_test_info_patch_level(Gnattest_T: in out Test);
   procedure Test_Patch_Level_b52e42_325136(Gnattest_T: in out Test) renames
     Test_Patch_Level_test_info_patch_level;
--  id:2.2/b52e42b93cdc2894/Patch_Level/1/0/test_info_patch_level/
   procedure Test_Patch_Level_test_info_patch_level(Gnattest_T: in out Test) is
      function Patch_Level
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Patch_Level_b52e42_325136;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("set patch [info patchlevel]");
      Assert
        (Patch_Level = Tcl_GetVar("patch"),
         "Failed to get the library patch level.");

--  begin read only
   end Test_Patch_Level_test_info_patch_level;
--  end read only

--  begin read only
   function Wrap_Test_Procs_2db85e_884500
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbounded_Strings_Array is
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
         Test_Procs_2db85e_884500_Result: constant Unbounded_Strings_Array :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Procs
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
         return Test_Procs_2db85e_884500_Result;
      end;
   end Wrap_Test_Procs_2db85e_884500;
--  end read only

--  begin read only
   procedure Test_Procs_test_info_procs(Gnattest_T: in out Test);
   procedure Test_Procs_2db85e_884500(Gnattest_T: in out Test) renames
     Test_Procs_test_info_procs;
--  id:2.2/2db85e941f975361/Procs/1/0/test_info_procs/
   procedure Test_Procs_test_info_procs(Gnattest_T: in out Test) is
      function Procs
        (Pattern: String := "";
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Unbounded_Strings_Array renames
        Wrap_Test_Procs_2db85e_884500;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      declare
         Procs_Array: Unbounded_Strings_Array := Procs("mypr*");
      begin
         Assert
           (Procs_Array'Length = 1 and
            Procs_Array(1) = To_Unbounded_String("myproc"),
            "Failed to get names of available Tcl procedures.");
      end;

--  begin read only
   end Test_Procs_test_info_procs;
--  end read only

--  begin read only
   function Wrap_Test_Script_b67457_ddce00
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
         Test_Script_b67457_ddce00_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Script
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
         return Test_Script_b67457_ddce00_Result;
      end;
   end Wrap_Test_Script_b67457_ddce00;
--  end read only

--  begin read only
   procedure Test_Script_test_info_script(Gnattest_T: in out Test);
   procedure Test_Script_b67457_ddce00(Gnattest_T: in out Test) renames
     Test_Script_test_info_script;
--  id:2.2/b67457baa3eb723c/Script/1/0/test_info_script/
   procedure Test_Script_test_info_script(Gnattest_T: in out Test) is
      function Script
        (File_Name: String := "";
         Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Script_b67457_ddce00;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert(Script'Length = 0, "Failed to get the name of Tcl script.");

--  begin read only
   end Test_Script_test_info_script;
--  end read only

--  begin read only
   function Wrap_Test_Tcl_Version_f8490f_6661d4
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
         Test_Tcl_Version_f8490f_6661d4_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Tcl_Version
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
         return Test_Tcl_Version_f8490f_6661d4_Result;
      end;
   end Wrap_Test_Tcl_Version_f8490f_6661d4;
--  end read only

--  begin read only
   procedure Test_Tcl_Version_test_info_tcl_version(Gnattest_T: in out Test);
   procedure Test_Tcl_Version_f8490f_6661d4(Gnattest_T: in out Test) renames
     Test_Tcl_Version_test_info_tcl_version;
--  id:2.2/f8490f0fbc1565a4/Tcl_Version/1/0/test_info_tcl_version/
   procedure Test_Tcl_Version_test_info_tcl_version(Gnattest_T: in out Test) is
      function Tcl_Version
        (Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Tcl_Version_f8490f_6661d4;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tcl_Eval("set version [info tclversion]");
      Assert
        (Tcl_Version = Tcl_GetVar("version"),
         "Failed to get the Tcl version.");

--  begin read only
   end Test_Tcl_Version_test_info_tcl_version;
--  end read only

--  begin read only
   function Wrap_Test_Vars_0a6a99_9d2a56
     (Pattern: String := ""; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Unbounded_Strings_Array is
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
         Test_Vars_0a6a99_9d2a56_Result: constant Unbounded_Strings_Array :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Info.Vars
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
         return Test_Vars_0a6a99_9d2a56_Result;
      end;
   end Wrap_Test_Vars_0a6a99_9d2a56;
--  end read only

--  begin read only
   procedure Test_Vars_test_info_vars(Gnattest_T: in out Test);
   procedure Test_Vars_0a6a99_9d2a56(Gnattest_T: in out Test) renames
     Test_Vars_test_info_vars;
--  id:2.2/0a6a99c8e79715a2/Vars/1/0/test_info_vars/
   procedure Test_Vars_test_info_vars(Gnattest_T: in out Test) is
      function Vars
        (Pattern: String := "";
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Unbounded_Strings_Array renames
        Wrap_Test_Vars_0a6a99_9d2a56;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      declare
         Variables_Array: Unbounded_Strings_Array := Vars("en*");
      begin
         Assert
           (Variables_Array'Length = 1 and
            Variables_Array(1) = To_Unbounded_String("env"),
            "Failed to get names of available all Tcl variables.");
      end;

--  begin read only
   end Test_Vars_test_info_vars;
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
