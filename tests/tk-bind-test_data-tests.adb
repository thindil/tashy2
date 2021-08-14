--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Bind.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Ada.Environment_Variables; use Ada.Environment_Variables;
with Tcl.Variables; use Tcl.Variables;
with Tk.MainWindow; use Tk.MainWindow;

--  begin read only
--  end read only
package body Tk.Bind.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Bind_04d206_6eb3e9
     (Window: Tk_Widget; Sequence: Modifiers_Type; Script: Tcl_String;
      Append: Boolean := False) is
   begin
      begin
         pragma Assert(Window /= Null_Widget and Length(Script) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-bind.ads:0):Test_Bind test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Bind.Bind
        (Window, Sequence, Script, Append);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-bind.ads:0:):Test_Bind test commitment violated");
      end;
   end Wrap_Test_Bind_04d206_6eb3e9;
--  end read only

--  begin read only
   procedure Test_1_Bind_test_bind(Gnattest_T: in out Test);
   procedure Test_Bind_04d206_6eb3e9(Gnattest_T: in out Test) renames
     Test_1_Bind_test_bind;
--  id:2.2/04d2062144a2af29/Bind/1/0/test_bind/
   procedure Test_1_Bind_test_bind(Gnattest_T: in out Test) is
      procedure Bind
        (Window: Tk_Widget; Sequence: Modifiers_Type; Script: Tcl_String;
         Append: Boolean := False) renames
        Wrap_Test_Bind_04d206_6eb3e9;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Bind(Get_Main_Window, BUTTON_1, To_Tcl_String("exit"));
      Assert
        (Tcl_Eval("bind .") = "<Button-1>",
         "Failed to set bind for Tk main window with simple sequence");

--  begin read only
   end Test_1_Bind_test_bind;
--  end read only

--  begin read only
   procedure Wrap_Test_Bind_3ca5a8_5391b4
     (Window: Tk_Widget; Sequence: Modifiers_Array; Script: Tcl_String;
      Append: Boolean := False) is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget and Sequence /= Empty_Modifiers_Array and
            Length(Script) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-bind.ads:0):Test_Bind2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Bind.Bind
        (Window, Sequence, Script, Append);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-bind.ads:0:):Test_Bind2 test commitment violated");
      end;
   end Wrap_Test_Bind_3ca5a8_5391b4;
--  end read only

--  begin read only
   procedure Test_2_Bind_test_bind2(Gnattest_T: in out Test);
   procedure Test_Bind_3ca5a8_5391b4(Gnattest_T: in out Test) renames
     Test_2_Bind_test_bind2;
--  id:2.2/3ca5a89df5b871fe/Bind/0/0/test_bind2/
   procedure Test_2_Bind_test_bind2(Gnattest_T: in out Test) is
      procedure Bind
        (Window: Tk_Widget; Sequence: Modifiers_Array; Script: Tcl_String;
         Append: Boolean := False) renames
        Wrap_Test_Bind_3ca5a8_5391b4;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Bind(Get_Main_Window, (CONTROL, BUTTON_1), To_Tcl_String("exit"));
      Assert
        (Tcl_Eval("bind .") = "<Control-Button-1> <Button-1>",
         "Failed to set bind for Tk main window with array sequence");

--  begin read only
   end Test_2_Bind_test_bind2;
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
end Tk.Bind.Test_Data.Tests;
