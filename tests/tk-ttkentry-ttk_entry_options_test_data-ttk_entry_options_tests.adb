--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.TtkEntry.Ttk_Entry_Options_Test_Data.

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
package body Tk.TtkEntry.Ttk_Entry_Options_Test_Data.Ttk_Entry_Options_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Create_32e405_754d98
     (Path_Name: String; Options: Ttk_Entry_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Entry is
   begin
      begin
         pragma Assert
           (Path_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Create_TtkEntry1 test requirement violated");
      end;
      declare
         Test_Create_32e405_754d98_Result: constant Ttk_Entry :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Create
             (Path_Name, Options, Interpreter);
      begin
         begin
            pragma Assert(Test_Create_32e405_754d98_Result /= Null_Widget);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkentry.ads:0:):Test_Create_TtkEntry1 test commitment violated");
         end;
         return Test_Create_32e405_754d98_Result;
      end;
   end Wrap_Test_Create_32e405_754d98;
--  end read only

--  begin read only
   procedure Test_1_Create_test_create_ttkentry1
     (Gnattest_T: in out Test_Ttk_Entry_Options);
   procedure Test_Create_32e405_754d98
     (Gnattest_T: in out Test_Ttk_Entry_Options) renames
     Test_1_Create_test_create_ttkentry1;
--  id:2.2/32e405543423d7b8/Create/1/0/test_create_ttkentry1/
   procedure Test_1_Create_test_create_ttkentry1
     (Gnattest_T: in out Test_Ttk_Entry_Options) is
      function Create
        (Path_Name: String; Options: Ttk_Entry_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Ttk_Entry renames
        Wrap_Test_Create_32e405_754d98;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry := Null_Widget;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Assert
        (Entry_Widget /= Null_Widget,
         "Failed to create a new Ttk entry with function.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_1_Create_test_create_ttkentry1;
--  end read only

--  begin read only
   procedure Wrap_Test_Create_ebbdc1_4965ea
     (Entry_Widget: out Ttk_Entry; Path_Name: String;
      Options: Ttk_Entry_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Path_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Create_TtkEntry2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Create
        (Entry_Widget, Path_Name, Options, Interpreter);
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Create_TtkEntry2 test commitment violated");
      end;
   end Wrap_Test_Create_ebbdc1_4965ea;
--  end read only

--  begin read only
   procedure Test_2_Create_test_create_ttkentry2
     (Gnattest_T: in out Test_Ttk_Entry_Options);
   procedure Test_Create_ebbdc1_4965ea
     (Gnattest_T: in out Test_Ttk_Entry_Options) renames
     Test_2_Create_test_create_ttkentry2;
--  id:2.2/ebbdc1934f0fa33d/Create/0/0/test_create_ttkentry2/
   procedure Test_2_Create_test_create_ttkentry2
     (Gnattest_T: in out Test_Ttk_Entry_Options) is
      procedure Create
        (Entry_Widget: out Ttk_Entry; Path_Name: String;
         Options: Ttk_Entry_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Create_ebbdc1_4965ea;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry := Null_Widget;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Entry_Widget, ".myentry", Ttk_Entry_Options'(others => <>));
      Assert
        (Entry_Widget /= Null_Widget,
         "Failed to create a new Ttk entry with procedure.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_2_Create_test_create_ttkentry2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Options_ded36e_b6e91d
     (Entry_Widget: Ttk_Entry) return Ttk_Entry_Options is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Get_Options_TtkEntry test requirement violated");
      end;
      declare
         Test_Get_Options_ded36e_b6e91d_Result: constant Ttk_Entry_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Get_Options
             (Entry_Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkentry.ads:0:):Test_Get_Options_TtkEntry test commitment violated");
         end;
         return Test_Get_Options_ded36e_b6e91d_Result;
      end;
   end Wrap_Test_Get_Options_ded36e_b6e91d;
--  end read only

--  begin read only
   procedure Test_Get_Options_test_get_options_ttkentry
     (Gnattest_T: in out Test_Ttk_Entry_Options);
   procedure Test_Get_Options_ded36e_b6e91d
     (Gnattest_T: in out Test_Ttk_Entry_Options) renames
     Test_Get_Options_test_get_options_ttkentry;
--  id:2.2/ded36e34d54c20f9/Get_Options/1/0/test_get_options_ttkentry/
   procedure Test_Get_Options_test_get_options_ttkentry
     (Gnattest_T: in out Test_Ttk_Entry_Options) is
      function Get_Options
        (Entry_Widget: Ttk_Entry) return Ttk_Entry_Options renames
        Wrap_Test_Get_Options_ded36e_b6e91d;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;
      Options: Ttk_Entry_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Entry_Widget, ".myentry",
         Ttk_Entry_Options'(Width => 10, others => <>));
      Options := Get_Options(Entry_Widget);
      Assert(Options.Width = 10, "Failed to get options of Ttk entry.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_Get_Options_test_get_options_ttkentry;
--  end read only

--  begin read only
   procedure Wrap_Test_Configure_0076be_f010fa
     (Entry_Widget: Ttk_Entry; Options: Ttk_Entry_Options) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Configure_TtkEntry test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Configure
        (Entry_Widget, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Configure_TtkEntry test commitment violated");
      end;
   end Wrap_Test_Configure_0076be_f010fa;
--  end read only

--  begin read only
   procedure Test_Configure_test_configure_ttkentry
     (Gnattest_T: in out Test_Ttk_Entry_Options);
   procedure Test_Configure_0076be_f010fa
     (Gnattest_T: in out Test_Ttk_Entry_Options) renames
     Test_Configure_test_configure_ttkentry;
--  id:2.2/0076be6725db0897/Configure/1/0/test_configure_ttkentry/
   procedure Test_Configure_test_configure_ttkentry
     (Gnattest_T: in out Test_Ttk_Entry_Options) is
      procedure Configure
        (Entry_Widget: Ttk_Entry; Options: Ttk_Entry_Options) renames
        Wrap_Test_Configure_0076be_f010fa;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;
      Options: Ttk_Entry_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Entry_Widget, ".myentry", Ttk_Entry_Options'(others => <>));
      Configure(Entry_Widget, Ttk_Entry_Options'(Width => 15, others => <>));
      Options := Get_Options(Entry_Widget);
      Assert(Options.Width = 15, "Failed to set options for Ttk entry.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_Configure_test_configure_ttkentry;
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
end Tk.TtkEntry.Ttk_Entry_Options_Test_Data.Ttk_Entry_Options_Tests;
