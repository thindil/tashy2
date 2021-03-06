--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Button.Test_Data.

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

--  begin read only
--  end read only
package body Tk.Button.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Flash_21d4a1_fe4617(Button_Widget: Tk_Button) is
   begin
      begin
         pragma Assert(Button_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-button.ads:0):Test_Flash_Button test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Button.Flash(Button_Widget);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-button.ads:0:):Test_Flash_Button test commitment violated");
      end;
   end Wrap_Test_Flash_21d4a1_fe4617;
--  end read only

--  begin read only
   procedure Test_Flash_test_flash_button(Gnattest_T: in out Test);
   procedure Test_Flash_21d4a1_fe4617(Gnattest_T: in out Test) renames
     Test_Flash_test_flash_button;
--  id:2.2/21d4a1d7f9902425/Flash/1/0/test_flash_button/
   procedure Test_Flash_test_flash_button(Gnattest_T: in out Test) is
      procedure Flash(Button_Widget: Tk_Button) renames
        Wrap_Test_Flash_21d4a1_fe4617;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Flash(Button);
      Assert(True, "This test can only crash");
      Destroy(Button);

--  begin read only
   end Test_Flash_test_flash_button;
--  end read only

--  begin read only
   procedure Wrap_Test_Invoke_05a9d3_ac3b13(Button_Widget: Tk_Button) is
   begin
      begin
         pragma Assert(Button_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-button.ads:0):Test_Invoke_Button1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Button.Invoke(Button_Widget);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-button.ads:0:):Test_Invoke_Button1 test commitment violated");
      end;
   end Wrap_Test_Invoke_05a9d3_ac3b13;
--  end read only

--  begin read only
   procedure Test_1_Invoke_test_invoke_button1(Gnattest_T: in out Test);
   procedure Test_Invoke_05a9d3_ac3b13(Gnattest_T: in out Test) renames
     Test_1_Invoke_test_invoke_button1;
--  id:2.2/05a9d3a88a18a5a9/Invoke/1/0/test_invoke_button1/
   procedure Test_1_Invoke_test_invoke_button1(Gnattest_T: in out Test) is
      procedure Invoke(Button_Widget: Tk_Button) renames
        Wrap_Test_Invoke_05a9d3_ac3b13;
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
         Button_Options'
           (Command => To_Tcl_String("set buttonvar 2"), others => <>));
      Invoke(Button);
      Assert
        (Tcl_Get_Var("buttonvar") = "2",
         "Failed to invoke Tcl command related to the button.");
      Destroy(Button);

--  begin read only
   end Test_1_Invoke_test_invoke_button1;
--  end read only

--  begin read only
   function Wrap_Test_Invoke_89eee4_562019
     (Button_Widget: Tk_Button) return String is
   begin
      begin
         pragma Assert(Button_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-button.ads:0):Test_Invoke_Button2 test requirement violated");
      end;
      declare
         Test_Invoke_89eee4_562019_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Button.Invoke
             (Button_Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-button.ads:0:):Test_Invoke_Button2 test commitment violated");
         end;
         return Test_Invoke_89eee4_562019_Result;
      end;
   end Wrap_Test_Invoke_89eee4_562019;
--  end read only

--  begin read only
   procedure Test_2_Invoke_test_invoke_button2(Gnattest_T: in out Test);
   procedure Test_Invoke_89eee4_562019(Gnattest_T: in out Test) renames
     Test_2_Invoke_test_invoke_button2;
--  id:2.2/89eee4a7b544ee30/Invoke/0/0/test_invoke_button2/
   procedure Test_2_Invoke_test_invoke_button2(Gnattest_T: in out Test) is
      function Invoke(Button_Widget: Tk_Button) return String renames
        Wrap_Test_Invoke_89eee4_562019;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Result: String(1 .. 4);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Button, ".mybutton",
         Button_Options'
           (Command => To_Tcl_String(".mybutton cget -text"),
            Text => To_Tcl_String("Quit"), others => <>));
      Result := Invoke(Button);
      Assert
        (Result = "Quit",
         "Failed to invoke Tcl command related to the button.");
      Destroy(Button);

--  begin read only
   end Test_2_Invoke_test_invoke_button2;
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
end Tk.Button.Test_Data.Tests;
