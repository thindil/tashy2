--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.MainWindow.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Ada.Environment_Variables; use Ada.Environment_Variables;
with Tk.Widget; use Tk.Widget;

--  begin read only
--  end read only
package body Tk.MainWindow.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Get_Main_Window_d38719_603916 (Interpreter: Tcl_Interpreter :=
        Get_Interpreter)  return Tk.TopLevel.Tk_Toplevel
   is
   begin
      begin
         pragma Assert
           (Interpreter /= Null_Interpreter);
         null;
      exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "req_sloc(tk-mainwindow.ads:0):Test_Main_Window test requirement violated");
      end;
      declare
         Test_Get_Main_Window_d38719_603916_Result : constant Tk.TopLevel.Tk_Toplevel := GNATtest_Generated.GNATtest_Standard.Tk.MainWindow.Get_Main_Window (Interpreter);
      begin
         begin
            pragma Assert
              (True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-mainwindow.ads:0:):Test_Main_Window test commitment violated");
         end;
         return Test_Get_Main_Window_d38719_603916_Result;
      end;
   end Wrap_Test_Get_Main_Window_d38719_603916;
--  end read only

--  begin read only
   procedure Test_Get_Main_Window_test_main_window (Gnattest_T : in out Test);
   procedure Test_Get_Main_Window_d38719_603916 (Gnattest_T : in out Test) renames Test_Get_Main_Window_test_main_window;
--  id:2.2/d38719cbce978992/Get_Main_Window/1/0/test_main_window/
   procedure Test_Get_Main_Window_test_main_window (Gnattest_T : in out Test) is
      function Get_Main_Window (Interpreter: Tcl_Interpreter :=
        Get_Interpreter) return Tk.TopLevel.Tk_Toplevel renames Wrap_Test_Get_Main_Window_d38719_603916;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Main_Window /= Null_Widget,
         "Failed to get main window of Tk application.");

--  begin read only
   end Test_Get_Main_Window_test_main_window;
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
end Tk.MainWindow.Test_Data.Tests;
