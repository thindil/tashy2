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
   procedure Wrap_Test_Flash_21d4a1_cc5d66(Widget: Tk_Button) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-button.ads:0):Test_Flash_Button test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Button.Flash(Widget);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-button.ads:0:):Test_Flash_Button test commitment violated");
      end;
   end Wrap_Test_Flash_21d4a1_cc5d66;
--  end read only

--  begin read only
   procedure Test_Flash_test_flash_button(Gnattest_T: in out Test);
   procedure Test_Flash_21d4a1_cc5d66(Gnattest_T: in out Test) renames
     Test_Flash_test_flash_button;
--  id:2.2/21d4a1d7f9902425/Flash/1/0/test_flash_button/
   procedure Test_Flash_test_flash_button(Gnattest_T: in out Test) is
      procedure Flash(Widget: Tk_Button) renames Wrap_Test_Flash_21d4a1_cc5d66;
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
   procedure Wrap_Test_Invoke_05a9d3_953100(Widget: Tk_Button) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-button.ads:0):Test_Invoke_Button1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Button.Invoke(Widget);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-button.ads:0:):Test_Invoke_Button1 test commitment violated");
      end;
   end Wrap_Test_Invoke_05a9d3_953100;
--  end read only

--  begin read only
   procedure Test_1_Invoke_test_invoke_button1(Gnattest_T: in out Test);
   procedure Test_Invoke_05a9d3_953100(Gnattest_T: in out Test) renames
     Test_1_Invoke_test_invoke_button1;
--  id:2.2/05a9d3a88a18a5a9/Invoke/1/0/test_invoke_button1/
   procedure Test_1_Invoke_test_invoke_button1(Gnattest_T: in out Test) is
      procedure Invoke(Widget: Tk_Button) renames
        Wrap_Test_Invoke_05a9d3_953100;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_1_Invoke_test_invoke_button1;
--  end read only

--  begin read only
   function Wrap_Test_Invoke_89eee4_9c2ae3(Widget: Tk_Button) return String is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-button.ads:0):Test_Invoke_Button2 test requirement violated");
      end;
      declare
         Test_Invoke_89eee4_9c2ae3_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Button.Invoke(Widget);
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
         return Test_Invoke_89eee4_9c2ae3_Result;
      end;
   end Wrap_Test_Invoke_89eee4_9c2ae3;
--  end read only

--  begin read only
   procedure Test_2_Invoke_test_invoke_button2(Gnattest_T: in out Test);
   procedure Test_Invoke_89eee4_9c2ae3(Gnattest_T: in out Test) renames
     Test_2_Invoke_test_invoke_button2;
--  id:2.2/89eee4a7b544ee30/Invoke/0/0/test_invoke_button2/
   procedure Test_2_Invoke_test_invoke_button2(Gnattest_T: in out Test) is
      function Invoke(Widget: Tk_Button) return String renames
        Wrap_Test_Invoke_89eee4_9c2ae3;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Invoke_test_invoke_button2;
--  end read only

--  begin read only
   function Wrap_Test_Invoke_e2c227_35cdc5(Widget: Tk_Button) return Integer is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-button.ads:0):Test_Invoke_Button3 test requirement violated");
      end;
      declare
         Test_Invoke_e2c227_35cdc5_Result: constant Integer :=
           GNATtest_Generated.GNATtest_Standard.Tk.Button.Invoke(Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-button.ads:0:):Test_Invoke_Button3 test commitment violated");
         end;
         return Test_Invoke_e2c227_35cdc5_Result;
      end;
   end Wrap_Test_Invoke_e2c227_35cdc5;
--  end read only

--  begin read only
   procedure Test_3_Invoke_test_invoke_button3(Gnattest_T: in out Test);
   procedure Test_Invoke_e2c227_35cdc5(Gnattest_T: in out Test) renames
     Test_3_Invoke_test_invoke_button3;
--  id:2.2/e2c227ba89cf8cf0/Invoke/0/0/test_invoke_button3/
   procedure Test_3_Invoke_test_invoke_button3(Gnattest_T: in out Test) is
      function Invoke(Widget: Tk_Button) return Integer renames
        Wrap_Test_Invoke_e2c227_35cdc5;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_3_Invoke_test_invoke_button3;
--  end read only

--  begin read only
   function Wrap_Test_Invoke_6e0b2f_f05801(Widget: Tk_Button) return Float is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-button.ads:0):Test_Invoke_Button4 test requirement violated");
      end;
      declare
         Test_Invoke_6e0b2f_f05801_Result: constant Float :=
           GNATtest_Generated.GNATtest_Standard.Tk.Button.Invoke(Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-button.ads:0:):Test_Invoke_Button4 test commitment violated");
         end;
         return Test_Invoke_6e0b2f_f05801_Result;
      end;
   end Wrap_Test_Invoke_6e0b2f_f05801;
--  end read only

--  begin read only
   procedure Test_4_Invoke_test_invoke_button4(Gnattest_T: in out Test);
   procedure Test_Invoke_6e0b2f_f05801(Gnattest_T: in out Test) renames
     Test_4_Invoke_test_invoke_button4;
--  id:2.2/6e0b2f6e0a7e9e72/Invoke/0/0/test_invoke_button4/
   procedure Test_4_Invoke_test_invoke_button4(Gnattest_T: in out Test) is
      function Invoke(Widget: Tk_Button) return Float renames
        Wrap_Test_Invoke_6e0b2f_f05801;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_4_Invoke_test_invoke_button4;
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
