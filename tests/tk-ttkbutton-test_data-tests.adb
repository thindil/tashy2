--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.TtkButton.Test_Data.

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
package body Tk.TtkButton.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Invoke_05a9d3_5c2570(Widget: Ttk_Button) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkbutton.ads:0):Test_Invoke_TtkButton1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkButton.Invoke(Widget);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkbutton.ads:0:):Test_Invoke_TtkButton1 test commitment violated");
      end;
   end Wrap_Test_Invoke_05a9d3_5c2570;
--  end read only

--  begin read only
   procedure Test_1_Invoke_test_invoke_ttkbutton1(Gnattest_T: in out Test);
   procedure Test_Invoke_05a9d3_5c2570(Gnattest_T: in out Test) renames
     Test_1_Invoke_test_invoke_ttkbutton1;
--  id:2.2/05a9d3a88a18a5a9/Invoke/1/0/test_invoke_ttkbutton1/
   procedure Test_1_Invoke_test_invoke_ttkbutton1(Gnattest_T: in out Test) is
      procedure Invoke(Widget: Ttk_Button) renames
        Wrap_Test_Invoke_05a9d3_5c2570;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Ttk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Button, ".mybutton",
         Ttk_Button_Options'
           (Command => To_Tcl_String("set buttonvar 2"), others => <>));
      Invoke(Button);
      Assert
        (Tcl_GetVar("buttonvar") = 2,
         "Failed to invoke Tcl command related to the Ttk button.");
      Destroy(Button);

--  begin read only
   end Test_1_Invoke_test_invoke_ttkbutton1;
--  end read only

--  begin read only
   function Wrap_Test_Invoke_89eee4_820a79(Widget: Ttk_Button) return String is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkbutton.ads:0):Test_Invoke_TtkButton2 test requirement violated");
      end;
      declare
         Test_Invoke_89eee4_820a79_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkButton.Invoke(Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkbutton.ads:0:):Test_Invoke_TtkButton2 test commitment violated");
         end;
         return Test_Invoke_89eee4_820a79_Result;
      end;
   end Wrap_Test_Invoke_89eee4_820a79;
--  end read only

--  begin read only
   procedure Test_2_Invoke_test_invoke_ttkbutton2(Gnattest_T: in out Test);
   procedure Test_Invoke_89eee4_820a79(Gnattest_T: in out Test) renames
     Test_2_Invoke_test_invoke_ttkbutton2;
--  id:2.2/89eee4a7b544ee30/Invoke/0/0/test_invoke_ttkbutton2/
   procedure Test_2_Invoke_test_invoke_ttkbutton2(Gnattest_T: in out Test) is
      function Invoke(Widget: Ttk_Button) return String renames
        Wrap_Test_Invoke_89eee4_820a79;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Ttk_Button;
      Result: String(1 .. 4);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Button, ".mybutton",
         Ttk_Button_Options'
           (Command => To_Tcl_String(".mybutton cget -text"),
            Text => To_Tcl_String("Quit"), others => <>));
      Result := Invoke(Button);
      Assert
        (Result = "Quit",
         "Failed to invoke Tcl command related to the Ttk button.");
      Destroy(Button);

--  begin read only
   end Test_2_Invoke_test_invoke_ttkbutton2;
--  end read only

--  begin read only
   function Wrap_Test_Invoke_e2c227_494531
     (Widget: Ttk_Button) return Integer is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkbutton.ads:0):Test_Invoke_TtkButton3 test requirement violated");
      end;
      declare
         Test_Invoke_e2c227_494531_Result: constant Integer :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkButton.Invoke(Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkbutton.ads:0:):Test_Invoke_TtkButton3 test commitment violated");
         end;
         return Test_Invoke_e2c227_494531_Result;
      end;
   end Wrap_Test_Invoke_e2c227_494531;
--  end read only

--  begin read only
   procedure Test_3_Invoke_test_invoke_ttkbutton3(Gnattest_T: in out Test);
   procedure Test_Invoke_e2c227_494531(Gnattest_T: in out Test) renames
     Test_3_Invoke_test_invoke_ttkbutton3;
--  id:2.2/e2c227ba89cf8cf0/Invoke/0/0/test_invoke_ttkbutton3/
   procedure Test_3_Invoke_test_invoke_ttkbutton3(Gnattest_T: in out Test) is
      function Invoke(Widget: Ttk_Button) return Integer renames
        Wrap_Test_Invoke_e2c227_494531;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Ttk_Button;
      Result: Integer;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Button, ".mybutton",
         Ttk_Button_Options'
           (Command => To_Tcl_String("expr 2 + 2"), others => <>));
      Result := Invoke(Button);
      Assert
        (Result = 4,
         "Failed to invoke Tcl command related to the Ttk button.");
      Destroy(Button);

--  begin read only
   end Test_3_Invoke_test_invoke_ttkbutton3;
--  end read only

--  begin read only
   function Wrap_Test_Invoke_6e0b2f_49c2e8(Widget: Ttk_Button) return Float is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkbutton.ads:0):Test_Invoke_TtkButton4 test requirement violated");
      end;
      declare
         Test_Invoke_6e0b2f_49c2e8_Result: constant Float :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkButton.Invoke(Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkbutton.ads:0:):Test_Invoke_TtkButton4 test commitment violated");
         end;
         return Test_Invoke_6e0b2f_49c2e8_Result;
      end;
   end Wrap_Test_Invoke_6e0b2f_49c2e8;
--  end read only

--  begin read only
   procedure Test_4_Invoke_test_invoke_ttkbutton4(Gnattest_T: in out Test);
   procedure Test_Invoke_6e0b2f_49c2e8(Gnattest_T: in out Test) renames
     Test_4_Invoke_test_invoke_ttkbutton4;
--  id:2.2/6e0b2f6e0a7e9e72/Invoke/0/0/test_invoke_ttkbutton4/
   procedure Test_4_Invoke_test_invoke_ttkbutton4(Gnattest_T: in out Test) is
      function Invoke(Widget: Ttk_Button) return Float renames
        Wrap_Test_Invoke_6e0b2f_49c2e8;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Ttk_Button;
      Result: Float;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Button, ".mybutton",
         Ttk_Button_Options'
           (Command => To_Tcl_String("expr 2.5 + 2"), others => <>));
      Result := Invoke(Button);
      Assert
        (Result = 4.5, "Failed to invoke Tcl command related to the button.");
      Destroy(Button);

--  begin read only
   end Test_4_Invoke_test_invoke_ttkbutton4;
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
end Tk.TtkButton.Test_Data.Tests;
