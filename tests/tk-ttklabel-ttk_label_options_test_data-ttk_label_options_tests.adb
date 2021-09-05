--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.TtkLabel.Ttk_Label_Options_Test_Data.

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
package body Tk.TtkLabel.Ttk_Label_Options_Test_Data.Ttk_Label_Options_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Create_32e405_cf77f4
     (Path_Name: Tk_Path_String; Options: Ttk_Label_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Label is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttklabel.ads:0):Test_Create_TtkLabel1 test requirement violated");
      end;
      declare
         Test_Create_32e405_cf77f4_Result: constant Ttk_Label :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkLabel.Create
             (Path_Name, Options, Interpreter);
      begin
         begin
            pragma Assert(Test_Create_32e405_cf77f4_Result /= Null_Widget);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttklabel.ads:0:):Test_Create_TtkLabel1 test commitment violated");
         end;
         return Test_Create_32e405_cf77f4_Result;
      end;
   end Wrap_Test_Create_32e405_cf77f4;
--  end read only

--  begin read only
   procedure Test_1_Create_test_create_ttklabel1
     (Gnattest_T: in out Test_Ttk_Label_Options);
   procedure Test_Create_32e405_cf77f4
     (Gnattest_T: in out Test_Ttk_Label_Options) renames
     Test_1_Create_test_create_ttklabel1;
--  id:2.2/32e405543423d7b8/Create/1/0/test_create_ttklabel1/
   procedure Test_1_Create_test_create_ttklabel1
     (Gnattest_T: in out Test_Ttk_Label_Options) is
      function Create
        (Path_Name: Tk_Path_String; Options: Ttk_Label_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Ttk_Label renames
        Wrap_Test_Create_32e405_cf77f4;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Label: Ttk_Label := Null_Widget;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Label := Create(".mylabel", Ttk_Label_Options'(others => <>));
      Assert
        (Label /= Null_Widget,
         "Failed to create a new Ttk label with function.");
      Destroy(Label);

--  begin read only
   end Test_1_Create_test_create_ttklabel1;
--  end read only

--  begin read only
   procedure Wrap_Test_Create_ebbdc1_341022
     (Label: out Ttk_Label; Path_Name: Tk_Path_String;
      Options: Ttk_Label_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttklabel.ads:0):Test_Create_TtkLabel2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkLabel.Create
        (Label, Path_Name, Options, Interpreter);
      begin
         pragma Assert(Label /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttklabel.ads:0:):Test_Create_TtkLabel2 test commitment violated");
      end;
   end Wrap_Test_Create_ebbdc1_341022;
--  end read only

--  begin read only
   procedure Test_2_Create_test_create_ttklabel2
     (Gnattest_T: in out Test_Ttk_Label_Options);
   procedure Test_Create_ebbdc1_341022
     (Gnattest_T: in out Test_Ttk_Label_Options) renames
     Test_2_Create_test_create_ttklabel2;
--  id:2.2/ebbdc1934f0fa33d/Create/0/0/test_create_ttklabel2/
   procedure Test_2_Create_test_create_ttklabel2
     (Gnattest_T: in out Test_Ttk_Label_Options) is
      procedure Create
        (Label: out Ttk_Label; Path_Name: Tk_Path_String;
         Options: Ttk_Label_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Create_ebbdc1_341022;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Label: Ttk_Label := Null_Widget;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Label, ".mylabel", Ttk_Label_Options'(others => <>));
      Assert
        (Label /= Null_Widget,
         "Failed to create a new Ttk label with procedure.");
      Destroy(Label);

--  begin read only
   end Test_2_Create_test_create_ttklabel2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Options_ded36e_523496
     (Label: Ttk_Label) return Ttk_Label_Options is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttklabel.ads:0):Test_Get_Options_TtkLabel test requirement violated");
      end;
      declare
         Test_Get_Options_ded36e_523496_Result: constant Ttk_Label_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkLabel.Get_Options(Label);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttklabel.ads:0:):Test_Get_Options_TtkLabel test commitment violated");
         end;
         return Test_Get_Options_ded36e_523496_Result;
      end;
   end Wrap_Test_Get_Options_ded36e_523496;
--  end read only

--  begin read only
   procedure Test_Get_Options_test_get_options_ttklabel
     (Gnattest_T: in out Test_Ttk_Label_Options);
   procedure Test_Get_Options_ded36e_523496
     (Gnattest_T: in out Test_Ttk_Label_Options) renames
     Test_Get_Options_test_get_options_ttklabel;
--  id:2.2/ded36e34d54c20f9/Get_Options/1/0/test_get_options_ttklabel/
   procedure Test_Get_Options_test_get_options_ttklabel
     (Gnattest_T: in out Test_Ttk_Label_Options) is
      function Get_Options(Label: Ttk_Label) return Ttk_Label_Options renames
        Wrap_Test_Get_Options_ded36e_523496;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Label: Ttk_Label;
      Options: Ttk_Label_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Label, ".mylabel",
         Ttk_Label_Options'(Text => To_Tcl_String("text"), others => <>));
      Options := Get_Options(Label);
      Assert
        (Options.Text = To_Tcl_String("text"),
         "Failed to get options of Ttk label.");
      Destroy(Label);

--  begin read only
   end Test_Get_Options_test_get_options_ttklabel;
--  end read only

--  begin read only
   procedure Wrap_Test_Configure_0076be_ea215f
     (Label: Ttk_Label; Options: Ttk_Label_Options) is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttklabel.ads:0):Test_Configure_TtkLabel test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkLabel.Configure
        (Label, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttklabel.ads:0:):Test_Configure_TtkLabel test commitment violated");
      end;
   end Wrap_Test_Configure_0076be_ea215f;
--  end read only

--  begin read only
   procedure Test_Configure_test_configure_ttklabel
     (Gnattest_T: in out Test_Ttk_Label_Options);
   procedure Test_Configure_0076be_ea215f
     (Gnattest_T: in out Test_Ttk_Label_Options) renames
     Test_Configure_test_configure_ttklabel;
--  id:2.2/0076be6725db0897/Configure/1/0/test_configure_ttklabel/
   procedure Test_Configure_test_configure_ttklabel
     (Gnattest_T: in out Test_Ttk_Label_Options) is
      procedure Configure(Label: Ttk_Label; Options: Ttk_Label_Options) renames
        Wrap_Test_Configure_0076be_ea215f;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Label: Ttk_Label;
      Options: Ttk_Label_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Label, ".mylabel",
         Ttk_Label_Options'(Text => To_Tcl_String("text"), others => <>));
      Configure
        (Label,
         Ttk_Label_Options'
           (Text => To_Tcl_String("another text"), others => <>));
      Options := Get_Options(Label);
      Assert
        (Options.Text = To_Tcl_String("another text"),
         "Failed to set options for Ttk label.");
      Destroy(Label);

--  begin read only
   end Test_Configure_test_configure_ttklabel;
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
end Tk.TtkLabel.Ttk_Label_Options_Test_Data.Ttk_Label_Options_Tests;
