--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Button.Button_Options_Test_Data.

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
package body Tk.Button.Button_Options_Test_Data.Button_Options_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Create_32e405_60d0ed
     (Path_Name: String; Options: Button_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Button is
   begin
      begin
         pragma Assert
           (Path_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-button.ads:0):Test_Create_Button1 test requirement violated");
      end;
      declare
         Test_Create_32e405_60d0ed_Result: constant Tk_Button :=
           GNATtest_Generated.GNATtest_Standard.Tk.Button.Create
             (Path_Name, Options, Interpreter);
      begin
         begin
            pragma Assert(Test_Create_32e405_60d0ed_Result /= Null_Widget);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-button.ads:0:):Test_Create_Button1 test commitment violated");
         end;
         return Test_Create_32e405_60d0ed_Result;
      end;
   end Wrap_Test_Create_32e405_60d0ed;
--  end read only

--  begin read only
   procedure Test_1_Create_test_create_button1
     (Gnattest_T: in out Test_Button_Options);
   procedure Test_Create_32e405_60d0ed
     (Gnattest_T: in out Test_Button_Options) renames
     Test_1_Create_test_create_button1;
--  id:2.2/32e405543423d7b8/Create/1/0/test_create_button1/
   procedure Test_1_Create_test_create_button1
     (Gnattest_T: in out Test_Button_Options) is
      function Create
        (Path_Name: String; Options: Button_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Tk_Button renames
        Wrap_Test_Create_32e405_60d0ed;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button := Null_Widget;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Button := Create(".mybutton", Button_Options'(others => <>));
      Assert(Button /= Null_Widget, "Failed to create a new button.");
      Destroy(Button);

--  begin read only
   end Test_1_Create_test_create_button1;
--  end read only

--  begin read only
   procedure Wrap_Test_Create_ebbdc1_b3fff1
     (Button_Widget: out Tk_Button; Path_Name: String; Options: Button_Options;
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
               "req_sloc(tk-button.ads:0):Test_Create_Button2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Button.Create
        (Button_Widget, Path_Name, Options, Interpreter);
      begin
         pragma Assert(Button_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-button.ads:0:):Test_Create_Button2 test commitment violated");
      end;
   end Wrap_Test_Create_ebbdc1_b3fff1;
--  end read only

--  begin read only
   procedure Test_2_Create_test_create_button2
     (Gnattest_T: in out Test_Button_Options);
   procedure Test_Create_ebbdc1_b3fff1
     (Gnattest_T: in out Test_Button_Options) renames
     Test_2_Create_test_create_button2;
--  id:2.2/ebbdc1934f0fa33d/Create/0/0/test_create_button2/
   procedure Test_2_Create_test_create_button2
     (Gnattest_T: in out Test_Button_Options) is
      procedure Create
        (Button_Widget: out Tk_Button; Path_Name: String;
         Options: Button_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Create_ebbdc1_b3fff1;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button := Null_Widget;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Assert(Button /= Null_Widget, "Failed to create a new button.");
      Destroy(Button);

--  begin read only
   end Test_2_Create_test_create_button2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Options_ded36e_964ac0
     (Button_Widget: Tk_Button) return Button_Options is
   begin
      begin
         pragma Assert(Button_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-button.ads:0):Test_Get_Options_Button test requirement violated");
      end;
      declare
         Test_Get_Options_ded36e_964ac0_Result: constant Button_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Button.Get_Options
             (Button_Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-button.ads:0:):Test_Get_Options_Button test commitment violated");
         end;
         return Test_Get_Options_ded36e_964ac0_Result;
      end;
   end Wrap_Test_Get_Options_ded36e_964ac0;
--  end read only

--  begin read only
   procedure Test_Get_Options_test_get_options_button
     (Gnattest_T: in out Test_Button_Options);
   procedure Test_Get_Options_ded36e_964ac0
     (Gnattest_T: in out Test_Button_Options) renames
     Test_Get_Options_test_get_options_button;
--  id:2.2/ded36e34d54c20f9/Get_Options/1/0/test_get_options_button/
   procedure Test_Get_Options_test_get_options_button
     (Gnattest_T: in out Test_Button_Options) is
      function Get_Options
        (Button_Widget: Tk_Button) return Button_Options renames
        Wrap_Test_Get_Options_ded36e_964ac0;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Options: Button_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Button, ".mybutton",
         Button_Options'(Text => To_Tcl_String("Quit"), others => <>));
      Options := Get_Options(Button);
      Assert
        (Options.Text = To_Tcl_String("Quit"),
         "Failed to get button options.");
      Destroy(Button);

--  begin read only
   end Test_Get_Options_test_get_options_button;
--  end read only

--  begin read only
   procedure Wrap_Test_Configure_0076be_46d43d
     (Button_Widget: Tk_Button; Options: Button_Options) is
   begin
      begin
         pragma Assert(Button_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-button.ads:0):Test_Configure_Button test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Button.Configure
        (Button_Widget, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-button.ads:0:):Test_Configure_Button test commitment violated");
      end;
   end Wrap_Test_Configure_0076be_46d43d;
--  end read only

--  begin read only
   procedure Test_Configure_test_configure_button
     (Gnattest_T: in out Test_Button_Options);
   procedure Test_Configure_0076be_46d43d
     (Gnattest_T: in out Test_Button_Options) renames
     Test_Configure_test_configure_button;
--  id:2.2/0076be6725db0897/Configure/1/0/test_configure_button/
   procedure Test_Configure_test_configure_button
     (Gnattest_T: in out Test_Button_Options) is
      procedure Configure
        (Button_Widget: Tk_Button; Options: Button_Options) renames
        Wrap_Test_Configure_0076be_46d43d;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Button, ".mybutton",
         Button_Options'(Text => To_Tcl_String("Quit"), others => <>));
      Configure
        (Button, Button_Options'(Text => To_Tcl_String("End"), others => <>));
      Assert
        (Option_Value(Button, "text") = To_Tcl_String("End"),
         "Failed to set new value for button option.");

--  begin read only
   end Test_Configure_test_configure_button;
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
end Tk.Button.Button_Options_Test_Data.Button_Options_Tests;
