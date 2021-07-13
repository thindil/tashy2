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
   function Wrap_Test_Color_Map_Full_032f44_b01906
     (Window: Tk_Widget) return Boolean is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Color_Map_Full test requirement violated");
      end;
      declare
         Test_Color_Map_Full_032f44_b01906_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Color_Map_Full
             (Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Color_Map_Full test commitment violated");
         end;
         return Test_Color_Map_Full_032f44_b01906_Result;
      end;
   end Wrap_Test_Color_Map_Full_032f44_b01906;
--  end read only

--  begin read only
   procedure Test_Color_Map_Full_test_winfo_color_map_full
     (Gnattest_T: in out Test);
   procedure Test_Color_Map_Full_032f44_b01906(Gnattest_T: in out Test) renames
     Test_Color_Map_Full_test_winfo_color_map_full;
--  id:2.2/032f44d0553a64e1/Color_Map_Full/1/0/test_winfo_color_map_full/
   procedure Test_Color_Map_Full_test_winfo_color_map_full
     (Gnattest_T: in out Test) is
      function Color_Map_Full(Window: Tk_Widget) return Boolean renames
        Wrap_Test_Color_Map_Full_032f44_b01906;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (not Color_Map_Full(Get_Main_Window),
         "Failed to get the information about full color map for Tk main window.");

--  begin read only
   end Test_Color_Map_Full_test_winfo_color_map_full;
--  end read only

--  begin read only
   function Wrap_Test_Containing_ed034e_1e0939
     (Root_X, Root_Y: Natural; Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Widget is
   begin
      declare
         Test_Containing_ed034e_1e0939_Result: constant Tk_Widget :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Containing
             (Root_X, Root_Y, Window, Interpreter);
      begin
         return Test_Containing_ed034e_1e0939_Result;
      end;
   end Wrap_Test_Containing_ed034e_1e0939;
--  end read only

--  begin read only
   procedure Test_Containing_test_winfo_containing(Gnattest_T: in out Test);
   procedure Test_Containing_ed034e_1e0939(Gnattest_T: in out Test) renames
     Test_Containing_test_winfo_containing;
--  id:2.2/ed034e691e4ca512/Containing/1/0/test_winfo_containing/
   procedure Test_Containing_test_winfo_containing(Gnattest_T: in out Test) is
      function Containing
        (Root_X, Root_Y: Natural; Window: Tk_Widget := Null_Widget;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Tk_Widget renames
        Wrap_Test_Containing_ed034e_1e0939;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Containing(0, 0) = Get_Main_Window,
         "Failed to get window at 0,0 coordinates.");

--  begin read only
   end Test_Containing_test_winfo_containing;
--  end read only

--  begin read only
   function Wrap_Test_Depth_7447d3_1900bc(Window: Tk_Widget) return Positive is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Depth test requirement violated");
      end;
      declare
         Test_Depth_7447d3_1900bc_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Depth(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Depth test commitment violated");
         end;
         return Test_Depth_7447d3_1900bc_Result;
      end;
   end Wrap_Test_Depth_7447d3_1900bc;
--  end read only

--  begin read only
   procedure Test_Depth_test_winfo_depth(Gnattest_T: in out Test);
   procedure Test_Depth_7447d3_1900bc(Gnattest_T: in out Test) renames
     Test_Depth_test_winfo_depth;
--  id:2.2/7447d3d0a69f4e2c/Depth/1/0/test_winfo_depth/
   procedure Test_Depth_test_winfo_depth(Gnattest_T: in out Test) is
      function Depth(Window: Tk_Widget) return Positive renames
        Wrap_Test_Depth_7447d3_1900bc;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Depth(Get_Main_Window) > 1,
         "Failed to get color depth of the Tk main window.");

--  begin read only
   end Test_Depth_test_winfo_depth;
--  end read only

--  begin read only
   function Wrap_Test_Exists_e0ba6a_c15285
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean is
   begin
      begin
         pragma Assert(Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Exists test requirement violated");
      end;
      declare
         Test_Exists_e0ba6a_c15285_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Exists
             (Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Exists test commitment violated");
         end;
         return Test_Exists_e0ba6a_c15285_Result;
      end;
   end Wrap_Test_Exists_e0ba6a_c15285;
--  end read only

--  begin read only
   procedure Test_Exists_test_winfo_exists(Gnattest_T: in out Test);
   procedure Test_Exists_e0ba6a_c15285(Gnattest_T: in out Test) renames
     Test_Exists_test_winfo_exists;
--  id:2.2/e0ba6a6d9c808e1e/Exists/1/0/test_winfo_exists/
   procedure Test_Exists_test_winfo_exists(Gnattest_T: in out Test) is
      function Exists
        (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Boolean renames
        Wrap_Test_Exists_e0ba6a_c15285;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Winfo.Exists("."), "Failed to check if the main Tk window exists.");
      Assert
        (not Winfo.Exists(".test"), "Failed to check non existing Tk window.");

--  begin read only
   end Test_Exists_test_winfo_exists;
--  end read only

--  begin read only
   function Wrap_Test_Floating_Point_Pixels_e16a1c_9b10a0
     (Window: Tk_Widget; Number: Pixel_Data) return Float is
   begin
      begin
         pragma Assert(Window /= Null_Widget and Number /= Empty_Pixel_Data);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Floating_Point_Pixels test requirement violated");
      end;
      declare
         Test_Floating_Point_Pixels_e16a1c_9b10a0_Result: constant Float :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Floating_Point_Pixels
             (Window, Number);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Floating_Point_Pixels test commitment violated");
         end;
         return Test_Floating_Point_Pixels_e16a1c_9b10a0_Result;
      end;
   end Wrap_Test_Floating_Point_Pixels_e16a1c_9b10a0;
--  end read only

--  begin read only
   procedure Test_Floating_Point_Pixels_test_winfo_floating_point_pixels
     (Gnattest_T: in out Test);
   procedure Test_Floating_Point_Pixels_e16a1c_9b10a0
     (Gnattest_T: in out Test) renames
     Test_Floating_Point_Pixels_test_winfo_floating_point_pixels;
--  id:2.2/e16a1c25d7e19ad5/Floating_Point_Pixels/1/0/test_winfo_floating_point_pixels/
   procedure Test_Floating_Point_Pixels_test_winfo_floating_point_pixels
     (Gnattest_T: in out Test) is
      function Floating_Point_Pixels
        (Window: Tk_Widget; Number: Pixel_Data) return Float renames
        Wrap_Test_Floating_Point_Pixels_e16a1c_9b10a0;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Floating_Point_Pixels
           (Get_Main_Window, Pixel_Data'(Value => 2.0, Value_Unit => PIXEL)) =
         2.0,
         "Failed to get floating point distance in Tk main window.");

--  begin read only
   end Test_Floating_Point_Pixels_test_winfo_floating_point_pixels;
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
