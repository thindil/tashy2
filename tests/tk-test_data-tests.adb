--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Test_Data.

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
package body Tk.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Tk_Init_dae4dd_f1b9f1
     (Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk.ads:0):Test_Tk_Init test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Tk_Init(Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk.ads:0:):Test_Tk_Init test commitment violated");
      end;
   end Wrap_Test_Tk_Init_dae4dd_f1b9f1;
--  end read only

--  begin read only
   procedure Test_Tk_Init_test_tk_init(Gnattest_T: in out Test);
   procedure Test_Tk_Init_dae4dd_f1b9f1(Gnattest_T: in out Test) renames
     Test_Tk_Init_test_tk_init;
--  id:2.2/dae4ddda1671ac5f/Tk_Init/1/0/test_tk_init/
   procedure Test_Tk_Init_test_tk_init(Gnattest_T: in out Test) is
      procedure Tk_Init
        (Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Tk_Init_dae4dd_f1b9f1;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Tk_Init;
      Assert(True, "This test can only crash");

--  begin read only
   end Test_Tk_Init_test_tk_init;
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
end Tk.Test_Data.Tests;
