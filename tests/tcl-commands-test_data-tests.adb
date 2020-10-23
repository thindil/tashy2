--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tcl.Commands.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Ada.Text_IO;

--  begin read only
--  end read only
package body Tcl.Commands.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

   function My_Proc
     (ClientData: System.Address; Interpreter: Tcl_Interpreter; Argc: Positive;
      Argv: Argv_Pointer.Pointer) return Natural with
      Convention => C;
   function My_Proc
     (ClientData: System.Address; Interpreter: Tcl_Interpreter; Argc: Positive;
      Argv: Argv_Pointer.Pointer) return Natural is
   begin
      Ada.Text_IO.Put_Line("Arguments:" & Positive'Image(Argc));
      for I in 0 .. Argc - 1 loop
         Ada.Text_IO.Put_Line(Natural'Image(I) & ": " & Get_Argument(Argv, I));
      end loop;
      return TCL_OK;
   end My_Proc;

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Tcl_CreateCommand_323eac_b11b8b
     (Command_Name: String; Proc: Tcl_CmdProc;
      Interpreter: Tcl_Interpreter := Get_Interpreter;
      DeleteProc: Tcl_CmdDeleteProc := null) return Tcl_Command is
   begin
      begin
         pragma Assert(Command_Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tcl-commands.ads:0):Test_Tcl_CreateCommand test requirement violated");
      end;
      declare
         Test_Tcl_CreateCommand_323eac_b11b8b_Result: constant Tcl_Command :=
           GNATtest_Generated.GNATtest_Standard.Tcl.Commands.Tcl_CreateCommand
             (Command_Name, Proc, Interpreter, DeleteProc);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tcl-commands.ads:0:):Test_Tcl_CreateCommand test commitment violated");
         end;
         return Test_Tcl_CreateCommand_323eac_b11b8b_Result;
      end;
   end Wrap_Test_Tcl_CreateCommand_323eac_b11b8b;
--  end read only

--  begin read only
   procedure Test_Tcl_CreateCommand_test_tcl_createcommand
     (Gnattest_T: in out Test);
   procedure Test_Tcl_CreateCommand_323eac_b11b8b
     (Gnattest_T: in out Test) renames
     Test_Tcl_CreateCommand_test_tcl_createcommand;
--  id:2.2/323eacae65f8ec1f/Tcl_CreateCommand/1/0/test_tcl_createcommand/
   procedure Test_Tcl_CreateCommand_test_tcl_createcommand
     (Gnattest_T: in out Test) is
      function Tcl_CreateCommand
        (Command_Name: String; Proc: Tcl_CmdProc;
         Interpreter: Tcl_Interpreter := Get_Interpreter;
         DeleteProc: Tcl_CmdDeleteProc := null) return Tcl_Command renames
        Wrap_Test_Tcl_CreateCommand_323eac_b11b8b;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (Tcl_CreateCommand("MyProc", My_Proc'Access) /=
         Tcl_Command(Null_Address),
         "Failed to create a new Tcl command");
      Tcl_Eval("MyProc asd");
      Tcl_Eval("MyProc ads sdf");
      Tcl_Eval("MyProc {Asd asfd} wer sdgfdgfd");

--  begin read only
   end Test_Tcl_CreateCommand_test_tcl_createcommand;
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
end Tcl.Commands.Test_Data.Tests;
