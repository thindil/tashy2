--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.TtkLabelFrame.Ttk_Label_Frame_Options_Test_Data.

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
package body Tk.TtkLabelFrame.Ttk_Label_Frame_Options_Test_Data
  .Ttk_Label_Frame_Options_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Configure_0076be_459bf9
     (Frame_Widget: Ttk_Label_Frame; Options: Ttk_Label_Frame_Options) is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttklabelframe.ads:0):Test_Configure_TtkLabelFrame test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkLabelFrame.Configure
        (Frame_Widget, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttklabelframe.ads:0:):Test_Configure_TtkLabelFrame test commitment violated");
      end;
   end Wrap_Test_Configure_0076be_459bf9;
--  end read only

--  begin read only
   procedure Test_Configure_test_configure_ttklabelframe
     (Gnattest_T: in out Test_Ttk_Label_Frame_Options);
   procedure Test_Configure_0076be_459bf9
     (Gnattest_T: in out Test_Ttk_Label_Frame_Options) renames
     Test_Configure_test_configure_ttklabelframe;
--  id:2.2/0076be6725db0897/Configure/1/0/test_configure_ttklabelframe/
   procedure Test_Configure_test_configure_ttklabelframe
     (Gnattest_T: in out Test_Ttk_Label_Frame_Options) is
      procedure Configure
        (Frame_Widget: Ttk_Label_Frame;
         Options: Ttk_Label_Frame_Options) renames
        Wrap_Test_Configure_0076be_459bf9;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Frame: Ttk_Label_Frame;
      Options: Ttk_Label_Frame_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Frame, ".myframe",
         Ttk_Label_Frame_Options'(Relief => RAISED, others => <>));
      Configure
        (Frame, Ttk_Label_Frame_Options'(Relief => SOLID, others => <>));
      Options := Get_Options(Frame);
      Assert
        (Options.Relief = SOLID, "Failed to set options for Ttk labelframe.");
      Destroy(Frame);

--  begin read only
   end Test_Configure_test_configure_ttklabelframe;
--  end read only

--  begin read only
   function Wrap_Test_Create_32e405_465c74
     (Path_Name: String; Options: Ttk_Label_Frame_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Ttk_Label_Frame is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttklabelframe.ads:0):Test_Create_TtkLabelFrame1 test requirement violated");
      end;
      declare
         Test_Create_32e405_465c74_Result: constant Ttk_Label_Frame :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkLabelFrame.Create
             (Path_Name, Options, Interpreter);
      begin
         begin
            pragma Assert(Test_Create_32e405_465c74_Result /= Null_Widget);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttklabelframe.ads:0:):Test_Create_TtkLabelFrame1 test commitment violated");
         end;
         return Test_Create_32e405_465c74_Result;
      end;
   end Wrap_Test_Create_32e405_465c74;
--  end read only

--  begin read only
   procedure Test_1_Create_test_create_ttklabelframe1
     (Gnattest_T: in out Test_Ttk_Label_Frame_Options);
   procedure Test_Create_32e405_465c74
     (Gnattest_T: in out Test_Ttk_Label_Frame_Options) renames
     Test_1_Create_test_create_ttklabelframe1;
--  id:2.2/32e405543423d7b8/Create/1/0/test_create_ttklabelframe1/
   procedure Test_1_Create_test_create_ttklabelframe1
     (Gnattest_T: in out Test_Ttk_Label_Frame_Options) is
      function Create
        (Path_Name: String; Options: Ttk_Label_Frame_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Ttk_Label_Frame renames
        Wrap_Test_Create_32e405_465c74;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Frame: Ttk_Label_Frame;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Frame := Create(".myframe", Ttk_Label_Frame_Options'(others => <>));
      Assert
        (Frame /= Null_Widget,
         "Failed to create a new Ttk labelframe with function.");
      Destroy(Frame);

--  begin read only
   end Test_1_Create_test_create_ttklabelframe1;
--  end read only

--  begin read only
   procedure Wrap_Test_Create_ebbdc1_d1ec6f
     (Frame_Widget: out Ttk_Label_Frame; Path_Name: String;
      Options: Ttk_Label_Frame_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttklabelframe.ads:0):Test_Create_TtkLabelFrame2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkLabelFrame.Create
        (Frame_Widget, Path_Name, Options, Interpreter);
      begin
         pragma Assert(Frame_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttklabelframe.ads:0:):Test_Create_TtkLabelFrame2 test commitment violated");
      end;
   end Wrap_Test_Create_ebbdc1_d1ec6f;
--  end read only

--  begin read only
   procedure Test_2_Create_test_create_ttklabelframe2
     (Gnattest_T: in out Test_Ttk_Label_Frame_Options);
   procedure Test_Create_ebbdc1_d1ec6f
     (Gnattest_T: in out Test_Ttk_Label_Frame_Options) renames
     Test_2_Create_test_create_ttklabelframe2;
--  id:2.2/ebbdc1934f0fa33d/Create/0/0/test_create_ttklabelframe2/
   procedure Test_2_Create_test_create_ttklabelframe2
     (Gnattest_T: in out Test_Ttk_Label_Frame_Options) is
      procedure Create
        (Frame_Widget: out Ttk_Label_Frame; Path_Name: String;
         Options: Ttk_Label_Frame_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Create_ebbdc1_d1ec6f;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Frame: Ttk_Label_Frame;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Frame, ".myframe", Ttk_Label_Frame_Options'(others => <>));
      Assert
        (Frame /= Null_Widget,
         "Failed to create a new Ttk labelframe with procedure.");
      Destroy(Frame);

--  begin read only
   end Test_2_Create_test_create_ttklabelframe2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Options_ded36e_39fa14
     (Frame_Widget: Ttk_Label_Frame) return Ttk_Label_Frame_Options is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttklabelframe.ads:0):Test_Get_Options_TtkLabelFrame test requirement violated");
      end;
      declare
         Test_Get_Options_ded36e_39fa14_Result: constant Ttk_Label_Frame_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkLabelFrame.Get_Options
             (Frame_Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttklabelframe.ads:0:):Test_Get_Options_TtkLabelFrame test commitment violated");
         end;
         return Test_Get_Options_ded36e_39fa14_Result;
      end;
   end Wrap_Test_Get_Options_ded36e_39fa14;
--  end read only

--  begin read only
   procedure Test_Get_Options_test_get_options_ttklabelframe
     (Gnattest_T: in out Test_Ttk_Label_Frame_Options);
   procedure Test_Get_Options_ded36e_39fa14
     (Gnattest_T: in out Test_Ttk_Label_Frame_Options) renames
     Test_Get_Options_test_get_options_ttklabelframe;
--  id:2.2/ded36e34d54c20f9/Get_Options/1/0/test_get_options_ttklabelframe/
   procedure Test_Get_Options_test_get_options_ttklabelframe
     (Gnattest_T: in out Test_Ttk_Label_Frame_Options) is
      function Get_Options
        (Frame_Widget: Ttk_Label_Frame) return Ttk_Label_Frame_Options renames
        Wrap_Test_Get_Options_ded36e_39fa14;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Frame: Ttk_Label_Frame;
      Options: Ttk_Label_Frame_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Frame, ".myframe",
         Ttk_Label_Frame_Options'(Relief => RAISED, others => <>));
      Options := Get_Options(Frame);
      Assert
        (Options.Relief = Raised, "Failed to get options of Ttk labelframe.");
      Destroy(Frame);

--  begin read only
   end Test_Get_Options_test_get_options_ttklabelframe;
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
end Tk.TtkLabelFrame.Ttk_Label_Frame_Options_Test_Data
  .Ttk_Label_Frame_Options_Tests;
