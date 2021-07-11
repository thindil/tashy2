--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Winfo.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Ada.Environment_Variables; use Ada.Environment_Variables;
with Tk.Button; use Tk.Button;
with Tk.Grid; use Tk.Grid;
with Tk.MainWindow; use Tk.MainWindow;

--  begin read only
--  end read only
package body Tk.Winfo.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

   AtomNumber: Positive;

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Atom_8a3ab9_da7d59
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return Positive is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Atom test requirement violated");
      end;
      declare
         Test_Atom_8a3ab9_da7d59_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Atom
             (Name, Interpreter, Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Atom test commitment violated");
         end;
         return Test_Atom_8a3ab9_da7d59_Result;
      end;
   end Wrap_Test_Atom_8a3ab9_da7d59;
--  end read only

--  begin read only
   procedure Test_Atom_test_winfo_atom(Gnattest_T: in out Test);
   procedure Test_Atom_8a3ab9_da7d59(Gnattest_T: in out Test) renames
     Test_Atom_test_winfo_atom;
--  id:2.2/8a3ab96a938bcb73/Atom/1/0/test_winfo_atom/
   procedure Test_Atom_test_winfo_atom(Gnattest_T: in out Test) is
      function Atom
        (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
         Window: Tk_Widget := Null_Widget) return Positive renames
        Wrap_Test_Atom_8a3ab9_da7d59;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AtomNumber := Atom("test");
      Assert(True, "This test can only crash.");

--  begin read only
   end Test_Atom_test_winfo_atom;
--  end read only

--  begin read only
   function Wrap_Test_Atom_Name_ffa709_5ba3e0
     (Id: Positive; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return String is
   begin
      declare
         Test_Atom_Name_ffa709_5ba3e0_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Atom_Name
             (Id, Interpreter, Window);
      begin
         return Test_Atom_Name_ffa709_5ba3e0_Result;
      end;
   end Wrap_Test_Atom_Name_ffa709_5ba3e0;
--  end read only

--  begin read only
   procedure Test_Atom_Name_test_winfo_atom_name(Gnattest_T: in out Test);
   procedure Test_Atom_Name_ffa709_5ba3e0(Gnattest_T: in out Test) renames
     Test_Atom_Name_test_winfo_atom_name;
--  id:2.2/ffa70954d116edff/Atom_Name/1/0/test_winfo_atom_name/
   procedure Test_Atom_Name_test_winfo_atom_name(Gnattest_T: in out Test) is
      function Atom_Name
        (Id: Positive; Interpreter: Tcl_Interpreter := Get_Interpreter;
         Window: Tk_Widget := Null_Widget) return String renames
        Wrap_Test_Atom_Name_ffa709_5ba3e0;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Atom_Name(AtomNumber) = "test",
         "Failed to get the name of the selected atom ID.");

--  begin read only
   end Test_Atom_Name_test_winfo_atom_name;
--  end read only

--  begin read only
   function Wrap_Test_Cells_13d387_f11487(Window: Tk_Widget) return Natural is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Cells test requirement violated");
      end;
      declare
         Test_Cells_13d387_f11487_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Cells(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Cells test commitment violated");
         end;
         return Test_Cells_13d387_f11487_Result;
      end;
   end Wrap_Test_Cells_13d387_f11487;
--  end read only

--  begin read only
   procedure Test_Cells_test_winfo_cells(Gnattest_T: in out Test);
   procedure Test_Cells_13d387_f11487(Gnattest_T: in out Test) renames
     Test_Cells_test_winfo_cells;
--  id:2.2/13d3870d8c856a3f/Cells/1/0/test_winfo_cells/
   procedure Test_Cells_test_winfo_cells(Gnattest_T: in out Test) is
      function Cells(Window: Tk_Widget) return Natural renames
        Wrap_Test_Cells_13d387_f11487;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Cells(Get_Main_Window) = 256,
         "Failed to get the amount of cells in color map for the selected window.");

--  begin read only
   end Test_Cells_test_winfo_cells;
--  end read only

--  begin read only
   function Wrap_Test_Children_87e2ce_9a2e0c
     (Window: Tk_Widget) return Widgets_Array is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Children test requirement violated");
      end;
      declare
         Test_Children_87e2ce_9a2e0c_Result: constant Widgets_Array :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Children(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Children test commitment violated");
         end;
         return Test_Children_87e2ce_9a2e0c_Result;
      end;
   end Wrap_Test_Children_87e2ce_9a2e0c;
--  end read only

--  begin read only
   procedure Test_Children_test_winfo_children(Gnattest_T: in out Test);
   procedure Test_Children_87e2ce_9a2e0c(Gnattest_T: in out Test) renames
     Test_Children_test_winfo_children;
--  id:2.2/87e2ceba32e26025/Children/1/0/test_winfo_children/
   procedure Test_Children_test_winfo_children(Gnattest_T: in out Test) is
      function Children(Window: Tk_Widget) return Widgets_Array renames
        Wrap_Test_Children_87e2ce_9a2e0c;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Button := Create(".button", Default_Button_Options);
      Add(Button, Default_Grid_Options);
      Assert
        (Children(Get_Main_Window)'Length = 1,
         "Failed to get the list of children for the main Tk window.");
      Destroy(Button);

--  begin read only
   end Test_Children_test_winfo_children;
--  end read only

--  begin read only
   function Wrap_Test_Class_1df3af_fa80a1(Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Class test requirement violated");
      end;
      declare
         Test_Class_1df3af_fa80a1_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Class(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Class test commitment violated");
         end;
         return Test_Class_1df3af_fa80a1_Result;
      end;
   end Wrap_Test_Class_1df3af_fa80a1;
--  end read only

--  begin read only
   procedure Test_Class_test_winfo_class(Gnattest_T: in out Test);
   procedure Test_Class_1df3af_fa80a1(Gnattest_T: in out Test) renames
     Test_Class_test_winfo_class;
--  id:2.2/1df3af831add96c0/Class/1/0/test_winfo_class/
   procedure Test_Class_test_winfo_class(Gnattest_T: in out Test) is
      function Class(Window: Tk_Widget) return String renames
        Wrap_Test_Class_1df3af_fa80a1;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Button := Create(".button", Default_Button_Options);
      Assert
        (Class(Button) = "Button",
         "Failed to get the class of the Tk button widget.");
      Destroy(Button);

--  begin read only
   end Test_Class_test_winfo_class;
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
end Tk.Winfo.Test_Data.Tests;
