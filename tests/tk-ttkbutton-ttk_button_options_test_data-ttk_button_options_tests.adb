--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.TtkButton.Ttk_Button_Options_Test_Data.

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
package body Tk.TtkButton.Ttk_Button_Options_Test_Data
  .Ttk_Button_Options_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Create_32e405_868367
     (Path_Name: String; Options: Ttk_Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Ttk_Button is
   begin
      begin
         pragma Assert
           (Path_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkbutton.ads:0):Test_Create_TtkButton1 test requirement violated");
      end;
      declare
         Test_Create_32e405_868367_Result: constant Ttk_Button :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkButton.Create
             (Path_Name, Options, Interpreter);
      begin
         begin
            pragma Assert(Test_Create_32e405_868367_Result /= Null_Widget);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkbutton.ads:0:):Test_Create_TtkButton1 test commitment violated");
         end;
         return Test_Create_32e405_868367_Result;
      end;
   end Wrap_Test_Create_32e405_868367;
--  end read only

--  begin read only
   procedure Test_1_Create_test_create_ttkbutton1
     (Gnattest_T: in out Test_Ttk_Button_Options);
   procedure Test_Create_32e405_868367
     (Gnattest_T: in out Test_Ttk_Button_Options) renames
     Test_1_Create_test_create_ttkbutton1;
--  id:2.2/32e405543423d7b8/Create/1/0/test_create_ttkbutton1/
   procedure Test_1_Create_test_create_ttkbutton1
     (Gnattest_T: in out Test_Ttk_Button_Options) is
      function Create
        (Path_Name: String; Options: Ttk_Button_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Ttk_Button renames
        Wrap_Test_Create_32e405_868367;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_1_Create_test_create_ttkbutton1;
--  end read only

--  begin read only
   procedure Wrap_Test_Create_ebbdc1_80798c
     (Widget: out Ttk_Button; Path_Name: String; Options: Ttk_Button_Options;
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
               "req_sloc(tk-ttkbutton.ads:0):Test_Create_TtkButton2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkButton.Create
        (Widget, Path_Name, Options, Interpreter);
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkbutton.ads:0:):Test_Create_TtkButton2 test commitment violated");
      end;
   end Wrap_Test_Create_ebbdc1_80798c;
--  end read only

--  begin read only
   procedure Test_2_Create_test_create_ttkbutton2
     (Gnattest_T: in out Test_Ttk_Button_Options);
   procedure Test_Create_ebbdc1_80798c
     (Gnattest_T: in out Test_Ttk_Button_Options) renames
     Test_2_Create_test_create_ttkbutton2;
--  id:2.2/ebbdc1934f0fa33d/Create/0/0/test_create_ttkbutton2/
   procedure Test_2_Create_test_create_ttkbutton2
     (Gnattest_T: in out Test_Ttk_Button_Options) is
      procedure Create
        (Widget: out Ttk_Button; Path_Name: String;
         Options: Ttk_Button_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Create_ebbdc1_80798c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Create_test_create_ttkbutton2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Options_ded36e_d5d981
     (Widget: Ttk_Button) return Ttk_Button_Options is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkbutton.ads:0):Test_Get_Options_TtkButton test requirement violated");
      end;
      declare
         Test_Get_Options_ded36e_d5d981_Result: constant Ttk_Button_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkButton.Get_Options
             (Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkbutton.ads:0:):Test_Get_Options_TtkButton test commitment violated");
         end;
         return Test_Get_Options_ded36e_d5d981_Result;
      end;
   end Wrap_Test_Get_Options_ded36e_d5d981;
--  end read only

--  begin read only
   procedure Test_Get_Options_test_get_options_ttkbutton
     (Gnattest_T: in out Test_Ttk_Button_Options);
   procedure Test_Get_Options_ded36e_d5d981
     (Gnattest_T: in out Test_Ttk_Button_Options) renames
     Test_Get_Options_test_get_options_ttkbutton;
--  id:2.2/ded36e34d54c20f9/Get_Options/1/0/test_get_options_ttkbutton/
   procedure Test_Get_Options_test_get_options_ttkbutton
     (Gnattest_T: in out Test_Ttk_Button_Options) is
      function Get_Options
        (Widget: Ttk_Button) return Ttk_Button_Options renames
        Wrap_Test_Get_Options_ded36e_d5d981;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Get_Options_test_get_options_ttkbutton;
--  end read only

--  begin read only
   procedure Wrap_Test_Configure_0076be_fd49e6
     (Widget: Ttk_Button; Options: Ttk_Button_Options) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkbutton.ads:0):Test_Configure_TtkButton test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkButton.Configure
        (Widget, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkbutton.ads:0:):Test_Configure_TtkButton test commitment violated");
      end;
   end Wrap_Test_Configure_0076be_fd49e6;
--  end read only

--  begin read only
   procedure Test_Configure_test_configure_ttkbutton
     (Gnattest_T: in out Test_Ttk_Button_Options);
   procedure Test_Configure_0076be_fd49e6
     (Gnattest_T: in out Test_Ttk_Button_Options) renames
     Test_Configure_test_configure_ttkbutton;
--  id:2.2/0076be6725db0897/Configure/1/0/test_configure_ttkbutton/
   procedure Test_Configure_test_configure_ttkbutton
     (Gnattest_T: in out Test_Ttk_Button_Options) is
      procedure Configure
        (Widget: Ttk_Button; Options: Ttk_Button_Options) renames
        Wrap_Test_Configure_0076be_fd49e6;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Configure_test_configure_ttkbutton;
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
end Tk.TtkButton.Ttk_Button_Options_Test_Data.Ttk_Button_Options_Tests;
