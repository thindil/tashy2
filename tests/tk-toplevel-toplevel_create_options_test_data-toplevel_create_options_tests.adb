--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.TopLevel.Toplevel_Create_Options_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Ada.Environment_Variables; use Ada.Environment_Variables;

--  begin read only
--  end read only
package body Tk.TopLevel.TopLevel_Create_Options_Test_Data
  .Toplevel_Create_Options_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Create_Options_To_String_99b390_8e6b01
     (Options: Toplevel_Create_Options) return String is
   begin
      declare
         Test_Create_Options_To_String_99b390_8e6b01_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.TopLevel
             .Create_Options_To_String
             (Options);
      begin
         return Test_Create_Options_To_String_99b390_8e6b01_Result;
      end;
   end Wrap_Test_Create_Options_To_String_99b390_8e6b01;
--  end read only

--  begin read only
   procedure Test_Create_Options_To_String_test_create_options_to_string
     (Gnattest_T: in out Test_Toplevel_Create_Options);
   procedure Test_Create_Options_To_String_99b390_8e6b01
     (Gnattest_T: in out Test_Toplevel_Create_Options) renames
     Test_Create_Options_To_String_test_create_options_to_string;
--  id:2.2/99b390994ccf28e6/Create_Options_To_String/1/0/test_create_options_to_string/
   procedure Test_Create_Options_To_String_test_create_options_to_string
     (Gnattest_T: in out Test_Toplevel_Create_Options) is
      function Create_Options_To_String
        (Options: Toplevel_Create_Options) return String renames
        Wrap_Test_Create_Options_To_String_99b390_8e6b01;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (Create_Options_To_String(Toplevel_Create_Options'(others => <>)) = "",
         "Failed to convert default Toplevel_Create_Options to Tcl command.");
      Assert
        (Create_Options_To_String
           (Toplevel_Create_Options'
              (Screen => To_Tcl_String("0:0"), others => <>)) =
         " -screen 0:0",
         "Failed to convert Toplevel_Create_Options to Tcl command.");

--  begin read only
   end Test_Create_Options_To_String_test_create_options_to_string;
--  end read only

--  begin read only
   function Wrap_Test_Create_32e405_9db90c
     (Path_Name: Tk_Path_String; Options: Toplevel_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Toplevel is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-toplevel.ads:0):Test_Create_TopLevel1 test requirement violated");
      end;
      declare
         Test_Create_32e405_9db90c_Result: constant Tk_Toplevel :=
           GNATtest_Generated.GNATtest_Standard.Tk.TopLevel.Create
             (Path_Name, Options, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-toplevel.ads:0:):Test_Create_TopLevel1 test commitment violated");
         end;
         return Test_Create_32e405_9db90c_Result;
      end;
   end Wrap_Test_Create_32e405_9db90c;
--  end read only

--  begin read only
   procedure Test_1_Create_test_create_toplevel1
     (Gnattest_T: in out Test_Toplevel_Create_Options);
   procedure Test_Create_32e405_9db90c
     (Gnattest_T: in out Test_Toplevel_Create_Options) renames
     Test_1_Create_test_create_toplevel1;
--  id:2.2/32e405543423d7b8/Create/1/0/test_create_toplevel1/
   procedure Test_1_Create_test_create_toplevel1
     (Gnattest_T: in out Test_Toplevel_Create_Options) is
      function Create
        (Path_Name: Tk_Path_String; Options: Toplevel_Create_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Tk_Toplevel renames
        Wrap_Test_Create_32e405_9db90c;
--  end read only

      pragma Unreferenced(Gnattest_T);
      TopLevel: Tk_Toplevel := Null_Widget;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(TopLevel, ".mydialog", Toplevel_Create_Options'(others => <>));
      Assert(TopLevel /= Null_Widget, "Failed to create a new toplevel.");
      Destroy(TopLevel);

--  begin read only
   end Test_1_Create_test_create_toplevel1;
--  end read only

--  begin read only
   procedure Wrap_Test_Create_ebbdc1_055047
     (Toplevel_Widget: out Tk_Toplevel; Path_Name: Tk_Path_String;
      Options: Toplevel_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-toplevel.ads:0):Test_Create_TopLevel2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TopLevel.Create
        (Toplevel_Widget, Path_Name, Options, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-toplevel.ads:0:):Test_Create_TopLevel2 test commitment violated");
      end;
   end Wrap_Test_Create_ebbdc1_055047;
--  end read only

--  begin read only
   procedure Test_2_Create_test_create_toplevel2
     (Gnattest_T: in out Test_Toplevel_Create_Options);
   procedure Test_Create_ebbdc1_055047
     (Gnattest_T: in out Test_Toplevel_Create_Options) renames
     Test_2_Create_test_create_toplevel2;
--  id:2.2/ebbdc1934f0fa33d/Create/0/0/test_create_toplevel2/
   procedure Test_2_Create_test_create_toplevel2
     (Gnattest_T: in out Test_Toplevel_Create_Options) is
      procedure Create
        (Toplevel_Widget: out Tk_Toplevel; Path_Name: Tk_Path_String;
         Options: Toplevel_Create_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Create_ebbdc1_055047;
--  end read only

      pragma Unreferenced(Gnattest_T);
      TopLevel: Tk_Toplevel := Null_Widget;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      TopLevel := Create(".mydialog", Toplevel_Create_Options'(others => <>));
      Assert(TopLevel /= Null_Widget, "Failed to create a new toplevel.");
      Destroy(TopLevel);

--  begin read only
   end Test_2_Create_test_create_toplevel2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Options_ded36e_2e13ca
     (Toplevel_Widget: Tk_Toplevel) return Toplevel_Create_Options is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-toplevel.ads:0):Test_Get_Options_TopLevel test requirement violated");
      end;
      declare
         Test_Get_Options_ded36e_2e13ca_Result: constant Toplevel_Create_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.TopLevel.Get_Options
             (Toplevel_Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-toplevel.ads:0:):Test_Get_Options_TopLevel test commitment violated");
         end;
         return Test_Get_Options_ded36e_2e13ca_Result;
      end;
   end Wrap_Test_Get_Options_ded36e_2e13ca;
--  end read only

--  begin read only
   procedure Test_Get_Options_test_get_options_toplevel
     (Gnattest_T: in out Test_Toplevel_Create_Options);
   procedure Test_Get_Options_ded36e_2e13ca
     (Gnattest_T: in out Test_Toplevel_Create_Options) renames
     Test_Get_Options_test_get_options_toplevel;
--  id:2.2/ded36e34d54c20f9/Get_Options/1/0/test_get_options_toplevel/
   procedure Test_Get_Options_test_get_options_toplevel
     (Gnattest_T: in out Test_Toplevel_Create_Options) is
      function Get_Options
        (Toplevel_Widget: Tk_Toplevel) return Toplevel_Create_Options renames
        Wrap_Test_Get_Options_ded36e_2e13ca;
--  end read only

      pragma Unreferenced(Gnattest_T);
      TopLevel: Tk_Toplevel;
      Options: Toplevel_Create_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (TopLevel, ".mydialog",
         Toplevel_Create_Options'(Relief => RAISED, others => <>));
      Options := Get_Options(TopLevel);
      Assert(Options.Relief = RAISED, "Failed to get toplevel options.");
      Destroy(TopLevel);

--  begin read only
   end Test_Get_Options_test_get_options_toplevel;
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
end Tk.TopLevel.TopLevel_Create_Options_Test_Data
  .Toplevel_Create_Options_Tests;
