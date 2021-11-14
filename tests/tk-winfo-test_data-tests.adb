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
with Tk.Wm; use Tk.Wm;

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
   function Wrap_Test_Atom_8a3ab9_cb4226
     (A_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return Positive is
   begin
      begin
         pragma Assert(A_Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Atom test requirement violated");
      end;
      declare
         Test_Atom_8a3ab9_cb4226_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Atom
             (A_Name, Interpreter, Window);
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
         return Test_Atom_8a3ab9_cb4226_Result;
      end;
   end Wrap_Test_Atom_8a3ab9_cb4226;
--  end read only

--  begin read only
   procedure Test_Atom_test_winfo_atom(Gnattest_T: in out Test);
   procedure Test_Atom_8a3ab9_cb4226(Gnattest_T: in out Test) renames
     Test_Atom_test_winfo_atom;
--  id:2.2/8a3ab96a938bcb73/Atom/1/0/test_winfo_atom/
   procedure Test_Atom_test_winfo_atom(Gnattest_T: in out Test) is
      function Atom
        (A_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter;
         Window: Tk_Widget := Null_Widget) return Positive renames
        Wrap_Test_Atom_8a3ab9_cb4226;
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
     (Atom_Id: Positive; Interpreter: Tcl_Interpreter := Get_Interpreter;
      Window: Tk_Widget := Null_Widget) return String is
   begin
      declare
         Test_Atom_Name_ffa709_5ba3e0_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Atom_Name
             (Atom_Id, Interpreter, Window);
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
        (Atom_Id: Positive; Interpreter: Tcl_Interpreter := Get_Interpreter;
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
   function Wrap_Test_Class_1df3af_850207(Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 12);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Class test requirement violated");
      end;
      declare
         Test_Class_1df3af_850207_Result: constant String :=
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
         return Test_Class_1df3af_850207_Result;
      end;
   end Wrap_Test_Class_1df3af_850207;
--  end read only

--  begin read only
   procedure Test_Class_test_winfo_class(Gnattest_T: in out Test);
   procedure Test_Class_1df3af_850207(Gnattest_T: in out Test) renames
     Test_Class_test_winfo_class;
--  id:2.2/1df3af831add96c0/Class/1/0/test_winfo_class/
   procedure Test_Class_test_winfo_class(Gnattest_T: in out Test) is
      function Class(Window: Tk_Widget) return String renames
        Wrap_Test_Class_1df3af_850207;
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
   function Wrap_Test_Color_Map_Full_f60f4e_3de321
     (Window: Tk_Widget) return Tcl_Boolean_Result is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 19);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Color_Map_Full test requirement violated");
      end;
      declare
         Test_Color_Map_Full_f60f4e_3de321_Result: constant Tcl_Boolean_Result :=
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
         return Test_Color_Map_Full_f60f4e_3de321_Result;
      end;
   end Wrap_Test_Color_Map_Full_f60f4e_3de321;
--  end read only

--  begin read only
   procedure Test_Color_Map_Full_test_winfo_color_map_full
     (Gnattest_T: in out Test);
   procedure Test_Color_Map_Full_f60f4e_3de321(Gnattest_T: in out Test) renames
     Test_Color_Map_Full_test_winfo_color_map_full;
--  id:2.2/f60f4e8bc5be7113/Color_Map_Full/1/0/test_winfo_color_map_full/
   procedure Test_Color_Map_Full_test_winfo_color_map_full
     (Gnattest_T: in out Test) is
      function Color_Map_Full
        (Window: Tk_Widget) return Tcl_Boolean_Result renames
        Wrap_Test_Color_Map_Full_f60f4e_3de321;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (not Color_Map_Full(Get_Main_Window).Result,
         "Failed to get the information about full color map for Tk main window.");

--  begin read only
   end Test_Color_Map_Full_test_winfo_color_map_full;
--  end read only

--  begin read only
   function Wrap_Test_Containing_916a42_e3dd46
     (Root_Window_X, Root_Window_Y: Pixel_Data;
      Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Widget is
   begin
      begin
         pragma Assert
           (Root_Window_X /= Empty_Pixel_Data and
            Root_Window_Y /= Empty_Pixel_Data);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Containing test requirement violated");
      end;
      declare
         Test_Containing_916a42_e3dd46_Result: constant Tk_Widget :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Containing
             (Root_Window_X, Root_Window_Y, Window, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Containing test commitment violated");
         end;
         return Test_Containing_916a42_e3dd46_Result;
      end;
   end Wrap_Test_Containing_916a42_e3dd46;
--  end read only

--  begin read only
   procedure Test_Containing_test_winfo_containing(Gnattest_T: in out Test);
   procedure Test_Containing_916a42_e3dd46(Gnattest_T: in out Test) renames
     Test_Containing_test_winfo_containing;
--  id:2.2/916a42abf702d325/Containing/1/0/test_winfo_containing/
   procedure Test_Containing_test_winfo_containing(Gnattest_T: in out Test) is
      function Containing
        (Root_Window_X, Root_Window_Y: Pixel_Data;
         Window: Tk_Widget := Null_Widget;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Tk_Widget renames
        Wrap_Test_Containing_916a42_e3dd46;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Containing((0.0, PIXEL), (0.0, PIXEL)) = Get_Main_Window,
         "Failed to get window at 0,0 coordinates.");

--  begin read only
   end Test_Containing_test_winfo_containing;
--  end read only

--  begin read only
   function Wrap_Test_Colors_Depth_27cc4a_1900bc
     (Window: Tk_Widget) return Positive is
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
         Test_Colors_Depth_27cc4a_1900bc_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Colors_Depth(Window);
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
         return Test_Colors_Depth_27cc4a_1900bc_Result;
      end;
   end Wrap_Test_Colors_Depth_27cc4a_1900bc;
--  end read only

--  begin read only
   procedure Test_Colors_Depth_test_winfo_depth(Gnattest_T: in out Test);
   procedure Test_Colors_Depth_27cc4a_1900bc(Gnattest_T: in out Test) renames
     Test_Colors_Depth_test_winfo_depth;
--  id:2.2/27cc4a890815be4a/Colors_Depth/1/0/test_winfo_depth/
   procedure Test_Colors_Depth_test_winfo_depth(Gnattest_T: in out Test) is
      function Colors_Depth(Window: Tk_Widget) return Positive renames
        Wrap_Test_Colors_Depth_27cc4a_1900bc;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Colors_Depth(Get_Main_Window) > 1,
         "Failed to get color depth of the Tk main window.");

--  begin read only
   end Test_Colors_Depth_test_winfo_depth;
--  end read only

--  begin read only
   function Wrap_Test_Exists_a87cb0_7a630c
     (Name: Tk_Path_String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tcl_Boolean_Result is
   begin
      begin
         pragma Assert
           (Name'Length > 0 and Name'Length < Integer'Last - 13 and
            Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Exists test requirement violated");
      end;
      declare
         Test_Exists_a87cb0_7a630c_Result: constant Tcl_Boolean_Result :=
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
         return Test_Exists_a87cb0_7a630c_Result;
      end;
   end Wrap_Test_Exists_a87cb0_7a630c;
--  end read only

--  begin read only
   procedure Test_Exists_test_winfo_exists(Gnattest_T: in out Test);
   procedure Test_Exists_a87cb0_7a630c(Gnattest_T: in out Test) renames
     Test_Exists_test_winfo_exists;
--  id:2.2/a87cb0d7f49d8e1f/Exists/1/0/test_winfo_exists/
   procedure Test_Exists_test_winfo_exists(Gnattest_T: in out Test) is
      function Exists
        (Name: Tk_Path_String; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Tcl_Boolean_Result renames
        Wrap_Test_Exists_a87cb0_7a630c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Winfo.Exists(".").Result,
         "Failed to check if the main Tk window exists.");
      Assert
        (not Winfo.Exists(".test").Result,
         "Failed to check non existing Tk window.");

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
   function Wrap_Test_Geometry_74d873_9e4b51
     (Window: Tk_Widget) return Window_Geometry is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Geometry test requirement violated");
      end;
      declare
         Test_Geometry_74d873_9e4b51_Result: constant Window_Geometry :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Geometry(Window);
      begin
         begin
            pragma Assert
              (Test_Geometry_74d873_9e4b51_Result /= Empty_Window_Geometry);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Geometry test commitment violated");
         end;
         return Test_Geometry_74d873_9e4b51_Result;
      end;
   end Wrap_Test_Geometry_74d873_9e4b51;
--  end read only

--  begin read only
   procedure Test_Geometry_test_winfo_geometry(Gnattest_T: in out Test);
   procedure Test_Geometry_74d873_9e4b51(Gnattest_T: in out Test) renames
     Test_Geometry_test_winfo_geometry;
--  id:2.2/74d873a7db43126c/Geometry/1/0/test_winfo_geometry/
   procedure Test_Geometry_test_winfo_geometry(Gnattest_T: in out Test) is
      function Geometry(Window: Tk_Widget) return Window_Geometry renames
        Wrap_Test_Geometry_74d873_9e4b51;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Geometry(Get_Main_Window) = Get_Geometry(Get_Main_Window),
         "Failed to get geometry of the Tk main window");

--  begin read only
   end Test_Geometry_test_winfo_geometry;
--  end read only

--  begin read only
   function Wrap_Test_Height_b50988_c88298
     (Window: Tk_Widget) return Positive is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Height test requirement violated");
      end;
      declare
         Test_Height_b50988_c88298_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Height(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Height test commitment violated");
         end;
         return Test_Height_b50988_c88298_Result;
      end;
   end Wrap_Test_Height_b50988_c88298;
--  end read only

--  begin read only
   procedure Test_Height_test_winfo_height(Gnattest_T: in out Test);
   procedure Test_Height_b50988_c88298(Gnattest_T: in out Test) renames
     Test_Height_test_winfo_height;
--  id:2.2/b5098876224ade4f/Height/1/0/test_winfo_height/
   procedure Test_Height_test_winfo_height(Gnattest_T: in out Test) is
      function Height(Window: Tk_Widget) return Positive renames
        Wrap_Test_Height_b50988_c88298;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Height(Get_Main_Window) = Geometry(Get_Main_Window).Height,
         "Failed to get height of the Tk main window");

--  begin read only
   end Test_Height_test_winfo_height;
--  end read only

--  begin read only
   function Wrap_Test_Id_e14e13_d4cbde(Window: Tk_Widget) return Positive is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Id test requirement violated");
      end;
      declare
         Test_Id_e14e13_d4cbde_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Id(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Id test commitment violated");
         end;
         return Test_Id_e14e13_d4cbde_Result;
      end;
   end Wrap_Test_Id_e14e13_d4cbde;
--  end read only

--  begin read only
   procedure Test_Id_test_winfo_id(Gnattest_T: in out Test);
   procedure Test_Id_e14e13_d4cbde(Gnattest_T: in out Test) renames
     Test_Id_test_winfo_id;
--  id:2.2/e14e13ca057db210/Id/1/0/test_winfo_id/
   procedure Test_Id_test_winfo_id(Gnattest_T: in out Test) is
      function Id(Window: Tk_Widget) return Positive renames
        Wrap_Test_Id_e14e13_d4cbde;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      if Id(Get_Main_Window) = 1 then
         return;
      end if;
      Assert(True, "This test can only crash.");

--  begin read only
   end Test_Id_test_winfo_id;
--  end read only

--  begin read only
   function Wrap_Test_Interpreters_aa8c94_a1d488
     (Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List is
   begin
      declare
         Test_Interpreters_aa8c94_a1d488_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Interpreters
             (Window, Interpreter);
      begin
         return Test_Interpreters_aa8c94_a1d488_Result;
      end;
   end Wrap_Test_Interpreters_aa8c94_a1d488;
--  end read only

--  begin read only
   procedure Test_Interpreters_test_winfo_interpreters
     (Gnattest_T: in out Test);
   procedure Test_Interpreters_aa8c94_a1d488(Gnattest_T: in out Test) renames
     Test_Interpreters_test_winfo_interpreters;
--  id:2.2/aa8c947a16a9f4d3/Interpreters/1/0/test_winfo_interpreters/
   procedure Test_Interpreters_test_winfo_interpreters
     (Gnattest_T: in out Test) is
      function Interpreters
        (Window: Tk_Widget := Null_Widget;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Array_List renames
        Wrap_Test_Interpreters_aa8c94_a1d488;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Interpreters(Get_Main_Window)'Length > 0,
         "Failed to get the list of Tcl interpreters for Tk main window.");

--  begin read only
   end Test_Interpreters_test_winfo_interpreters;
--  end read only

--  begin read only
   function Wrap_Test_Is_Mapped_086085_173a11
     (Window: Tk_Widget) return Tcl_Boolean_Result is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 15);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Is_Mapped test requirement violated");
      end;
      declare
         Test_Is_Mapped_086085_173a11_Result: constant Tcl_Boolean_Result :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Is_Mapped(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Is_Mapped test commitment violated");
         end;
         return Test_Is_Mapped_086085_173a11_Result;
      end;
   end Wrap_Test_Is_Mapped_086085_173a11;
--  end read only

--  begin read only
   procedure Test_Is_Mapped_test_winfo_is_mapped(Gnattest_T: in out Test);
   procedure Test_Is_Mapped_086085_173a11(Gnattest_T: in out Test) renames
     Test_Is_Mapped_test_winfo_is_mapped;
--  id:2.2/086085612124ea62/Is_Mapped/1/0/test_winfo_is_mapped/
   procedure Test_Is_Mapped_test_winfo_is_mapped(Gnattest_T: in out Test) is
      function Is_Mapped(Window: Tk_Widget) return Tcl_Boolean_Result renames
        Wrap_Test_Is_Mapped_086085_173a11;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Is_Mapped(Get_Main_Window).Result,
         "Failed to check if Tk main window is mapped.");

--  begin read only
   end Test_Is_Mapped_test_winfo_is_mapped;
--  end read only

--  begin read only
   function Wrap_Test_Manager_0c5ddb_cd7633(Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Manager test requirement violated");
      end;
      declare
         Test_Manager_0c5ddb_cd7633_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Manager(Window);
      begin
         begin
            pragma Assert(Test_Manager_0c5ddb_cd7633_Result'Length > 0);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Manager test commitment violated");
         end;
         return Test_Manager_0c5ddb_cd7633_Result;
      end;
   end Wrap_Test_Manager_0c5ddb_cd7633;
--  end read only

--  begin read only
   procedure Test_Manager_test_winfo_manager(Gnattest_T: in out Test);
   procedure Test_Manager_0c5ddb_cd7633(Gnattest_T: in out Test) renames
     Test_Manager_test_winfo_manager;
--  id:2.2/0c5ddbd2bf164c45/Manager/1/0/test_winfo_manager/
   procedure Test_Manager_test_winfo_manager(Gnattest_T: in out Test) is
      function Manager(Window: Tk_Widget) return String renames
        Wrap_Test_Manager_0c5ddb_cd7633;
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
        (Manager(Button) = "grid",
         "Failed to get the name of the manager for button widget.");
      Destroy(Button);

--  begin read only
   end Test_Manager_test_winfo_manager;
--  end read only

--  begin read only
   function Wrap_Test_Name_0da7b9_ba0234(Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Name test requirement violated");
      end;
      declare
         Test_Name_0da7b9_ba0234_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Name(Window);
      begin
         begin
            pragma Assert(Test_Name_0da7b9_ba0234_Result'Length > 0);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Name test commitment violated");
         end;
         return Test_Name_0da7b9_ba0234_Result;
      end;
   end Wrap_Test_Name_0da7b9_ba0234;
--  end read only

--  begin read only
   procedure Test_Name_test_winfo_name(Gnattest_T: in out Test);
   procedure Test_Name_0da7b9_ba0234(Gnattest_T: in out Test) renames
     Test_Name_test_winfo_name;
--  id:2.2/0da7b9364fa43677/Name/1/0/test_winfo_name/
   procedure Test_Name_test_winfo_name(Gnattest_T: in out Test) is
      function Name(Window: Tk_Widget) return String renames
        Wrap_Test_Name_0da7b9_ba0234;
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
        (Name(Button) = "button",
         "Failed to get the name of the button widget.");
      Destroy(Button);

--  begin read only
   end Test_Name_test_winfo_name;
--  end read only

--  begin read only
   function Wrap_Test_Parent_252286_c941bb(Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 13);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Parent test requirement violated");
      end;
      declare
         Test_Parent_252286_c941bb_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Parent(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Parent test commitment violated");
         end;
         return Test_Parent_252286_c941bb_Result;
      end;
   end Wrap_Test_Parent_252286_c941bb;
--  end read only

--  begin read only
   procedure Test_Parent_test_winfo_parent(Gnattest_T: in out Test);
   procedure Test_Parent_252286_c941bb(Gnattest_T: in out Test) renames
     Test_Parent_test_winfo_parent;
--  id:2.2/252286145870bfec/Parent/1/0/test_winfo_parent/
   procedure Test_Parent_test_winfo_parent(Gnattest_T: in out Test) is
      function Parent(Window: Tk_Widget) return String renames
        Wrap_Test_Parent_252286_c941bb;
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
        (Parent(Button) = ".",
         "Failed to get the path name of the parent widget for the button widget");
      Destroy(Button);

--  begin read only
   end Test_Parent_test_winfo_parent;
--  end read only

--  begin read only
   function Wrap_Test_Path_Name_c74192_a4034c
     (Window_Id: Positive; Window: Tk_Widget := Null_Widget;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      declare
         Test_Path_Name_c74192_a4034c_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Path_Name
             (Window_Id, Window, Interpreter);
      begin
         return Test_Path_Name_c74192_a4034c_Result;
      end;
   end Wrap_Test_Path_Name_c74192_a4034c;
--  end read only

--  begin read only
   procedure Test_Path_Name_test_winfo_path_name(Gnattest_T: in out Test);
   procedure Test_Path_Name_c74192_a4034c(Gnattest_T: in out Test) renames
     Test_Path_Name_test_winfo_path_name;
--  id:2.2/c74192f527d879a1/Path_Name/1/0/test_winfo_path_name/
   procedure Test_Path_Name_test_winfo_path_name(Gnattest_T: in out Test) is
      function Path_Name
        (Window_Id: Positive; Window: Tk_Widget := Null_Widget;
         Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Path_Name_c74192_a4034c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Path_Name(Id(Get_Main_Window)) = ".",
         "Failed to get the Tk path name for the main Tk window.");

--  begin read only
   end Test_Path_Name_test_winfo_path_name;
--  end read only

--  begin read only
   function Wrap_Test_Pixels_60cc8c_ac6879
     (Window: Tk_Widget; Number: Pixel_Data) return Integer is
   begin
      begin
         pragma Assert(Window /= Null_Widget and Number /= Empty_Pixel_Data);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Pixels test requirement violated");
      end;
      declare
         Test_Pixels_60cc8c_ac6879_Result: constant Integer :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Pixels
             (Window, Number);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Pixels test commitment violated");
         end;
         return Test_Pixels_60cc8c_ac6879_Result;
      end;
   end Wrap_Test_Pixels_60cc8c_ac6879;
--  end read only

--  begin read only
   procedure Test_Pixels_test_winfo_pixels(Gnattest_T: in out Test);
   procedure Test_Pixels_60cc8c_ac6879(Gnattest_T: in out Test) renames
     Test_Pixels_test_winfo_pixels;
--  id:2.2/60cc8cabde14d39b/Pixels/1/0/test_winfo_pixels/
   procedure Test_Pixels_test_winfo_pixels(Gnattest_T: in out Test) is
      function Pixels
        (Window: Tk_Widget; Number: Pixel_Data) return Integer renames
        Wrap_Test_Pixels_60cc8c_ac6879;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Pixels
           (Get_Main_Window, Pixel_Data'(Value => 2.0, Value_Unit => PIXEL)) =
         2,
         "Failed to get point distance in Tk main window.");

--  begin read only
   end Test_Pixels_test_winfo_pixels;
--  end read only

--  begin read only
   function Wrap_Test_Pointer_X_54c935_e5ce32
     (Window: Tk_Widget) return Extended_Natural is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Pointer_X test requirement violated");
      end;
      declare
         Test_Pointer_X_54c935_e5ce32_Result: constant Extended_Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Pointer_X(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Pointer_X test commitment violated");
         end;
         return Test_Pointer_X_54c935_e5ce32_Result;
      end;
   end Wrap_Test_Pointer_X_54c935_e5ce32;
--  end read only

--  begin read only
   procedure Test_Pointer_X_test_winfo_pointer_x(Gnattest_T: in out Test);
   procedure Test_Pointer_X_54c935_e5ce32(Gnattest_T: in out Test) renames
     Test_Pointer_X_test_winfo_pointer_x;
--  id:2.2/54c935ae232a418f/Pointer_X/1/0/test_winfo_pointer_x/
   procedure Test_Pointer_X_test_winfo_pointer_x(Gnattest_T: in out Test) is
      function Pointer_X(Window: Tk_Widget) return Extended_Natural renames
        Wrap_Test_Pointer_X_54c935_e5ce32;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Pointer_X(Get_Main_Window) > -1,
         "Failed to get X coordinate of the mouse pointer in Tk main window.");

--  begin read only
   end Test_Pointer_X_test_winfo_pointer_x;
--  end read only

--  begin read only
   function Wrap_Test_Pointer_X_Y_e6a4c1_ad38ab
     (Window: Tk_Widget) return Point_Position is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Pointer_X_Y test requirement violated");
      end;
      declare
         Test_Pointer_X_Y_e6a4c1_ad38ab_Result: constant Point_Position :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Pointer_X_Y(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Pointer_X_Y test commitment violated");
         end;
         return Test_Pointer_X_Y_e6a4c1_ad38ab_Result;
      end;
   end Wrap_Test_Pointer_X_Y_e6a4c1_ad38ab;
--  end read only

--  begin read only
   procedure Test_Pointer_X_Y_test_winfo_pointer_x_y(Gnattest_T: in out Test);
   procedure Test_Pointer_X_Y_e6a4c1_ad38ab(Gnattest_T: in out Test) renames
     Test_Pointer_X_Y_test_winfo_pointer_x_y;
--  id:2.2/e6a4c1e42bd42bfe/Pointer_X_Y/1/0/test_winfo_pointer_x_y/
   procedure Test_Pointer_X_Y_test_winfo_pointer_x_y
     (Gnattest_T: in out Test) is
      function Pointer_X_Y(Window: Tk_Widget) return Point_Position renames
        Wrap_Test_Pointer_X_Y_e6a4c1_ad38ab;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Pointer_X_Y(Get_Main_Window) /= Empty_Point_Position,
         "Failed to get X and Y coordinate of the mouse pointer in Tk main window.");

--  begin read only
   end Test_Pointer_X_Y_test_winfo_pointer_x_y;
--  end read only

--  begin read only
   function Wrap_Test_Pointer_Y_37e90e_63e9b1
     (Window: Tk_Widget) return Extended_Natural is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Pointer_Y test requirement violated");
      end;
      declare
         Test_Pointer_Y_37e90e_63e9b1_Result: constant Extended_Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Pointer_Y(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Pointer_Y test commitment violated");
         end;
         return Test_Pointer_Y_37e90e_63e9b1_Result;
      end;
   end Wrap_Test_Pointer_Y_37e90e_63e9b1;
--  end read only

--  begin read only
   procedure Test_Pointer_Y_test_winfo_pointer_y(Gnattest_T: in out Test);
   procedure Test_Pointer_Y_37e90e_63e9b1(Gnattest_T: in out Test) renames
     Test_Pointer_Y_test_winfo_pointer_y;
--  id:2.2/37e90ea1e5cf346b/Pointer_Y/1/0/test_winfo_pointer_y/
   procedure Test_Pointer_Y_test_winfo_pointer_y(Gnattest_T: in out Test) is
      function Pointer_Y(Window: Tk_Widget) return Extended_Natural renames
        Wrap_Test_Pointer_Y_37e90e_63e9b1;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Pointer_Y(Get_Main_Window) > -1,
         "Failed to get Y coordinate of the mouse pointer in Tk main window.");

--  begin read only
   end Test_Pointer_Y_test_winfo_pointer_y;
--  end read only

--  begin read only
   function Wrap_Test_Requested_Height_dc94e9_a6c984
     (Window: Tk_Widget) return Natural is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Requested_Height test requirement violated");
      end;
      declare
         Test_Requested_Height_dc94e9_a6c984_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Requested_Height
             (Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Requested_Height test commitment violated");
         end;
         return Test_Requested_Height_dc94e9_a6c984_Result;
      end;
   end Wrap_Test_Requested_Height_dc94e9_a6c984;
--  end read only

--  begin read only
   procedure Test_Requested_Height_test_winfo_requested_height
     (Gnattest_T: in out Test);
   procedure Test_Requested_Height_dc94e9_a6c984
     (Gnattest_T: in out Test) renames
     Test_Requested_Height_test_winfo_requested_height;
--  id:2.2/dc94e910d301053f/Requested_Height/1/0/test_winfo_requested_height/
   procedure Test_Requested_Height_test_winfo_requested_height
     (Gnattest_T: in out Test) is
      function Requested_Height(Window: Tk_Widget) return Natural renames
        Wrap_Test_Requested_Height_dc94e9_a6c984;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Requested_Height(Get_Main_Window) > 0,
         "Failed to get the requested height for the Tk main window.");

--  begin read only
   end Test_Requested_Height_test_winfo_requested_height;
--  end read only

--  begin read only
   function Wrap_Test_Requested_Width_701192_2835fe
     (Window: Tk_Widget) return Natural is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Requested_Width test requirement violated");
      end;
      declare
         Test_Requested_Width_701192_2835fe_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Requested_Width
             (Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Requested_Width test commitment violated");
         end;
         return Test_Requested_Width_701192_2835fe_Result;
      end;
   end Wrap_Test_Requested_Width_701192_2835fe;
--  end read only

--  begin read only
   procedure Test_Requested_Width_test_winfo_requested_width
     (Gnattest_T: in out Test);
   procedure Test_Requested_Width_701192_2835fe
     (Gnattest_T: in out Test) renames
     Test_Requested_Width_test_winfo_requested_width;
--  id:2.2/701192129fc44dd3/Requested_Width/1/0/test_winfo_requested_width/
   procedure Test_Requested_Width_test_winfo_requested_width
     (Gnattest_T: in out Test) is
      function Requested_Width(Window: Tk_Widget) return Natural renames
        Wrap_Test_Requested_Width_701192_2835fe;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Requested_Width(Get_Main_Window) > 0,
         "Failed to get the requested width for the Tk main window.");

--  begin read only
   end Test_Requested_Width_test_winfo_requested_width;
--  end read only

--  begin read only
   function Wrap_Test_Rgb_954e04_1a1bb1
     (Color_Name: Colors_Names; Window: Tk_Widget := Get_Main_Window)
      return Color_Type is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Rgb test requirement violated");
      end;
      declare
         Test_Rgb_954e04_1a1bb1_Result: constant Color_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Rgb
             (Color_Name, Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Rgb test commitment violated");
         end;
         return Test_Rgb_954e04_1a1bb1_Result;
      end;
   end Wrap_Test_Rgb_954e04_1a1bb1;
--  end read only

--  begin read only
   procedure Test_Rgb_test_winfo_rgb(Gnattest_T: in out Test);
   procedure Test_Rgb_954e04_1a1bb1(Gnattest_T: in out Test) renames
     Test_Rgb_test_winfo_rgb;
--  id:2.2/954e0402ee16cd10/Rgb/1/0/test_winfo_rgb/
   procedure Test_Rgb_test_winfo_rgb(Gnattest_T: in out Test) is
      function Rgb
        (Color_Name: Colors_Names; Window: Tk_Widget := Get_Main_Window)
         return Color_Type renames
        Wrap_Test_Rgb_954e04_1a1bb1;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Rgb(AQUA) = (Red => 0, Green => 65_535, Blue => 65_535),
         "Failed to get rgb values for aqua color.");

--  begin read only
   end Test_Rgb_test_winfo_rgb;
--  end read only

--  begin read only
   function Wrap_Test_Root_X_a9154b_0f2cf6
     (Window: Tk_Widget) return Extended_Natural is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Root_X test requirement violated");
      end;
      declare
         Test_Root_X_a9154b_0f2cf6_Result: constant Extended_Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Root_X(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Root_X test commitment violated");
         end;
         return Test_Root_X_a9154b_0f2cf6_Result;
      end;
   end Wrap_Test_Root_X_a9154b_0f2cf6;
--  end read only

--  begin read only
   procedure Test_Root_X_test_winfo_root_x(Gnattest_T: in out Test);
   procedure Test_Root_X_a9154b_0f2cf6(Gnattest_T: in out Test) renames
     Test_Root_X_test_winfo_root_x;
--  id:2.2/a9154b78c3cf2dea/Root_X/1/0/test_winfo_root_x/
   procedure Test_Root_X_test_winfo_root_x(Gnattest_T: in out Test) is
      function Root_X(Window: Tk_Widget) return Extended_Natural renames
        Wrap_Test_Root_X_a9154b_0f2cf6;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Root_X(Get_Main_Window) = 0,
         "Failed to get X root coordinate for Tk main window.");

--  begin read only
   end Test_Root_X_test_winfo_root_x;
--  end read only

--  begin read only
   function Wrap_Test_Root_Y_b2f35d_2266c1
     (Window: Tk_Widget) return Extended_Natural is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Root_Y test requirement violated");
      end;
      declare
         Test_Root_Y_b2f35d_2266c1_Result: constant Extended_Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Root_Y(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Root_Y test commitment violated");
         end;
         return Test_Root_Y_b2f35d_2266c1_Result;
      end;
   end Wrap_Test_Root_Y_b2f35d_2266c1;
--  end read only

--  begin read only
   procedure Test_Root_Y_test_winfo_root_y(Gnattest_T: in out Test);
   procedure Test_Root_Y_b2f35d_2266c1(Gnattest_T: in out Test) renames
     Test_Root_Y_test_winfo_root_y;
--  id:2.2/b2f35def0a46a46b/Root_Y/1/0/test_winfo_root_y/
   procedure Test_Root_Y_test_winfo_root_y(Gnattest_T: in out Test) is
      function Root_Y(Window: Tk_Widget) return Extended_Natural renames
        Wrap_Test_Root_Y_b2f35d_2266c1;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Root_Y(Get_Main_Window) = 0,
         "Failed to get Y root coordinate for Tk main window.");

--  begin read only
   end Test_Root_Y_test_winfo_root_y;
--  end read only

--  begin read only
   function Wrap_Test_Screen_6fc5d3_32e1e9(Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 13);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Screen test requirement violated");
      end;
      declare
         Test_Screen_6fc5d3_32e1e9_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Screen(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Screen test commitment violated");
         end;
         return Test_Screen_6fc5d3_32e1e9_Result;
      end;
   end Wrap_Test_Screen_6fc5d3_32e1e9;
--  end read only

--  begin read only
   procedure Test_Screen_test_winfo_screen(Gnattest_T: in out Test);
   procedure Test_Screen_6fc5d3_32e1e9(Gnattest_T: in out Test) renames
     Test_Screen_test_winfo_screen;
--  id:2.2/6fc5d397fb7798c8/Screen/1/0/test_winfo_screen/
   procedure Test_Screen_test_winfo_screen(Gnattest_T: in out Test) is
      function Screen(Window: Tk_Widget) return String renames
        Wrap_Test_Screen_6fc5d3_32e1e9;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Screen(Get_Main_Window)'Length > 0,
         "Failed to get the name of screen of Tk main window.");

--  begin read only
   end Test_Screen_test_winfo_screen;
--  end read only

--  begin read only
   function Wrap_Test_Screen_Cells_37d289_147863
     (Window: Tk_Widget) return Positive is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Screen_Cells test requirement violated");
      end;
      declare
         Test_Screen_Cells_37d289_147863_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Screen_Cells(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Screen_Cells test commitment violated");
         end;
         return Test_Screen_Cells_37d289_147863_Result;
      end;
   end Wrap_Test_Screen_Cells_37d289_147863;
--  end read only

--  begin read only
   procedure Test_Screen_Cells_test_winfo_screen_cells
     (Gnattest_T: in out Test);
   procedure Test_Screen_Cells_37d289_147863(Gnattest_T: in out Test) renames
     Test_Screen_Cells_test_winfo_screen_cells;
--  id:2.2/37d28945cddc4f21/Screen_Cells/1/0/test_winfo_screen_cells/
   procedure Test_Screen_Cells_test_winfo_screen_cells
     (Gnattest_T: in out Test) is
      function Screen_Cells(Window: Tk_Widget) return Positive renames
        Wrap_Test_Screen_Cells_37d289_147863;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Screen_Cells(Get_Main_Window) = 256,
         "Failed to get the amount of screen cells for Tk main window.");

--  begin read only
   end Test_Screen_Cells_test_winfo_screen_cells;
--  end read only

--  begin read only
   function Wrap_Test_Screen_Depth_60dc8d_a34485
     (Window: Tk_Widget) return Positive is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Screen_Depth test requirement violated");
      end;
      declare
         Test_Screen_Depth_60dc8d_a34485_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Screen_Depth(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Screen_Depth test commitment violated");
         end;
         return Test_Screen_Depth_60dc8d_a34485_Result;
      end;
   end Wrap_Test_Screen_Depth_60dc8d_a34485;
--  end read only

--  begin read only
   procedure Test_Screen_Depth_test_winfo_screen_depth
     (Gnattest_T: in out Test);
   procedure Test_Screen_Depth_60dc8d_a34485(Gnattest_T: in out Test) renames
     Test_Screen_Depth_test_winfo_screen_depth;
--  id:2.2/60dc8d6275da6d87/Screen_Depth/1/0/test_winfo_screen_depth/
   procedure Test_Screen_Depth_test_winfo_screen_depth
     (Gnattest_T: in out Test) is
      function Screen_Depth(Window: Tk_Widget) return Positive renames
        Wrap_Test_Screen_Depth_60dc8d_a34485;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Screen_Depth(Get_Main_Window) = 24,
         "Failed to get the screen depth of Tk main window.");

--  begin read only
   end Test_Screen_Depth_test_winfo_screen_depth;
--  end read only

--  begin read only
   function Wrap_Test_Screen_Height_0d8e96_07a2f4
     (Window: Tk_Widget) return Positive is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Screen_Height test requirement violated");
      end;
      declare
         Test_Screen_Height_0d8e96_07a2f4_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Screen_Height(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Screen_Height test commitment violated");
         end;
         return Test_Screen_Height_0d8e96_07a2f4_Result;
      end;
   end Wrap_Test_Screen_Height_0d8e96_07a2f4;
--  end read only

--  begin read only
   procedure Test_Screen_Height_test_winfo_screen_height
     (Gnattest_T: in out Test);
   procedure Test_Screen_Height_0d8e96_07a2f4(Gnattest_T: in out Test) renames
     Test_Screen_Height_test_winfo_screen_height;
--  id:2.2/0d8e96378acbd1b8/Screen_Height/1/0/test_winfo_screen_height/
   procedure Test_Screen_Height_test_winfo_screen_height
     (Gnattest_T: in out Test) is
      function Screen_Height(Window: Tk_Widget) return Positive renames
        Wrap_Test_Screen_Height_0d8e96_07a2f4;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Screen_Height(Get_Main_Window) > 0,
         "Failed to get the screen height of Tk main window.");

--  begin read only
   end Test_Screen_Height_test_winfo_screen_height;
--  end read only

--  begin read only
   function Wrap_Test_Screen_Milimeters_Height_64f6ac_98364e
     (Window: Tk_Widget) return Positive is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Screen_Milimeters_Height test requirement violated");
      end;
      declare
         Test_Screen_Milimeters_Height_64f6ac_98364e_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo
             .Screen_Milimeters_Height
             (Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Screen_Milimeters_Height test commitment violated");
         end;
         return Test_Screen_Milimeters_Height_64f6ac_98364e_Result;
      end;
   end Wrap_Test_Screen_Milimeters_Height_64f6ac_98364e;
--  end read only

--  begin read only
   procedure Test_Screen_Milimeters_Height_test_winfo_screen_milimeters_height
     (Gnattest_T: in out Test);
   procedure Test_Screen_Milimeters_Height_64f6ac_98364e
     (Gnattest_T: in out Test) renames
     Test_Screen_Milimeters_Height_test_winfo_screen_milimeters_height;
--  id:2.2/64f6ac20ec1658d4/Screen_Milimeters_Height/1/0/test_winfo_screen_milimeters_height/
   procedure Test_Screen_Milimeters_Height_test_winfo_screen_milimeters_height
     (Gnattest_T: in out Test) is
      function Screen_Milimeters_Height
        (Window: Tk_Widget) return Positive renames
        Wrap_Test_Screen_Milimeters_Height_64f6ac_98364e;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Screen_Milimeters_Height(Get_Main_Window) > 0,
         "Failed to get the screen height in milimeters of Tk main window.");

--  begin read only
   end Test_Screen_Milimeters_Height_test_winfo_screen_milimeters_height;
--  end read only

--  begin read only
   function Wrap_Test_Screen_Milimeters_Width_aa8ee0_a6bf9c
     (Window: Tk_Widget) return Positive is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Screen_Milimeters_Width test requirement violated");
      end;
      declare
         Test_Screen_Milimeters_Width_aa8ee0_a6bf9c_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo
             .Screen_Milimeters_Width
             (Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Screen_Milimeters_Width test commitment violated");
         end;
         return Test_Screen_Milimeters_Width_aa8ee0_a6bf9c_Result;
      end;
   end Wrap_Test_Screen_Milimeters_Width_aa8ee0_a6bf9c;
--  end read only

--  begin read only
   procedure Test_Screen_Milimeters_Width_test_winfo_screen_milimeters_width
     (Gnattest_T: in out Test);
   procedure Test_Screen_Milimeters_Width_aa8ee0_a6bf9c
     (Gnattest_T: in out Test) renames
     Test_Screen_Milimeters_Width_test_winfo_screen_milimeters_width;
--  id:2.2/aa8ee0d99449fa4b/Screen_Milimeters_Width/1/0/test_winfo_screen_milimeters_width/
   procedure Test_Screen_Milimeters_Width_test_winfo_screen_milimeters_width
     (Gnattest_T: in out Test) is
      function Screen_Milimeters_Width
        (Window: Tk_Widget) return Positive renames
        Wrap_Test_Screen_Milimeters_Width_aa8ee0_a6bf9c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Screen_Milimeters_Width(Get_Main_Window) > 0,
         "Failed to get the screen width in milimeters of Tk main window.");

--  begin read only
   end Test_Screen_Milimeters_Width_test_winfo_screen_milimeters_width;
--  end read only

--  begin read only
   function Wrap_Test_Screen_Visual_fa94d0_1d67c8
     (Window: Tk_Widget) return Screen_Visual_Type is
   begin
      begin
         pragma Assert
           ((Window /= Null_Widget
             and then Tk_Path_Name(Widgt => Window)'Length <
               Integer'Last - 19) and
            Get_Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Screen_Visual test requirement violated");
      end;
      declare
         Test_Screen_Visual_fa94d0_1d67c8_Result: constant Screen_Visual_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Screen_Visual(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Screen_Visual test commitment violated");
         end;
         return Test_Screen_Visual_fa94d0_1d67c8_Result;
      end;
   end Wrap_Test_Screen_Visual_fa94d0_1d67c8;
--  end read only

--  begin read only
   procedure Test_Screen_Visual_test_winfo_screen_visual
     (Gnattest_T: in out Test);
   procedure Test_Screen_Visual_fa94d0_1d67c8(Gnattest_T: in out Test) renames
     Test_Screen_Visual_test_winfo_screen_visual;
--  id:2.2/fa94d0bde32bc0f2/Screen_Visual/1/0/test_winfo_screen_visual/
   procedure Test_Screen_Visual_test_winfo_screen_visual
     (Gnattest_T: in out Test) is
      function Screen_Visual
        (Window: Tk_Widget) return Screen_Visual_Type renames
        Wrap_Test_Screen_Visual_fa94d0_1d67c8;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Screen_Visual(Get_Main_Window) = TRUECOLOR,
         "Failed to get screen visual for Tk main window.");

--  begin read only
   end Test_Screen_Visual_test_winfo_screen_visual;
--  end read only

--  begin read only
   function Wrap_Test_Screen_Width_8321ec_7e95f9
     (Window: Tk_Widget) return Positive is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Screen_Width test requirement violated");
      end;
      declare
         Test_Screen_Width_8321ec_7e95f9_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Screen_Width(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Screen_Width test commitment violated");
         end;
         return Test_Screen_Width_8321ec_7e95f9_Result;
      end;
   end Wrap_Test_Screen_Width_8321ec_7e95f9;
--  end read only

--  begin read only
   procedure Test_Screen_Width_test_winfo_screen_width
     (Gnattest_T: in out Test);
   procedure Test_Screen_Width_8321ec_7e95f9(Gnattest_T: in out Test) renames
     Test_Screen_Width_test_winfo_screen_width;
--  id:2.2/8321ecd166a383a6/Screen_Width/1/0/test_winfo_screen_width/
   procedure Test_Screen_Width_test_winfo_screen_width
     (Gnattest_T: in out Test) is
      function Screen_Width(Window: Tk_Widget) return Positive renames
        Wrap_Test_Screen_Width_8321ec_7e95f9;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Screen_Width(Get_Main_Window) > 0,
         "Failed to get the screen width of Tk main window.");

--  begin read only
   end Test_Screen_Width_test_winfo_screen_width;
--  end read only

--  begin read only
   function Wrap_Test_Server_e424b7_78bc02(Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 13);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Server test requirement violated");
      end;
      declare
         Test_Server_e424b7_78bc02_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Server(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Server test commitment violated");
         end;
         return Test_Server_e424b7_78bc02_Result;
      end;
   end Wrap_Test_Server_e424b7_78bc02;
--  end read only

--  begin read only
   procedure Test_Server_test_winfo_server(Gnattest_T: in out Test);
   procedure Test_Server_e424b7_78bc02(Gnattest_T: in out Test) renames
     Test_Server_test_winfo_server;
--  id:2.2/e424b7f8de42cc3a/Server/1/0/test_winfo_server/
   procedure Test_Server_test_winfo_server(Gnattest_T: in out Test) is
      function Server(Window: Tk_Widget) return String renames
        Wrap_Test_Server_e424b7_78bc02;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Server(Get_Main_Window)'Length > 0,
         "Failed to get the name of the display server for Tk main window.");

--  begin read only
   end Test_Server_test_winfo_server;
--  end read only

--  begin read only
   function Wrap_Test_Toplevel_5fee9d_a31831
     (Window: Tk_Widget) return String is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 15);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Toplevel test requirement violated");
      end;
      declare
         Test_Toplevel_5fee9d_a31831_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Toplevel(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Toplevel test commitment violated");
         end;
         return Test_Toplevel_5fee9d_a31831_Result;
      end;
   end Wrap_Test_Toplevel_5fee9d_a31831;
--  end read only

--  begin read only
   procedure Test_Toplevel_test_winfo_toplevel(Gnattest_T: in out Test);
   procedure Test_Toplevel_5fee9d_a31831(Gnattest_T: in out Test) renames
     Test_Toplevel_test_winfo_toplevel;
--  id:2.2/5fee9d10c3705c8f/Toplevel/1/0/test_winfo_toplevel/
   procedure Test_Toplevel_test_winfo_toplevel(Gnattest_T: in out Test) is
      function Toplevel(Window: Tk_Widget) return String renames
        Wrap_Test_Toplevel_5fee9d_a31831;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Toplevel(Get_Main_Window) = ".",
         "Failed to get toplevel window for Tk main window.");

--  begin read only
   end Test_Toplevel_test_winfo_toplevel;
--  end read only

--  begin read only
   function Wrap_Test_Viewable_7e17e3_8c7bbb
     (Window: Tk_Widget) return Tcl_Boolean_Result is
   begin
      begin
         pragma Assert
           (Window /= Null_Widget
            and then Tk_Path_Name(Widgt => Window)'Length < Integer'Last - 15);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Viewable test requirement violated");
      end;
      declare
         Test_Viewable_7e17e3_8c7bbb_Result: constant Tcl_Boolean_Result :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Viewable(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Viewable test commitment violated");
         end;
         return Test_Viewable_7e17e3_8c7bbb_Result;
      end;
   end Wrap_Test_Viewable_7e17e3_8c7bbb;
--  end read only

--  begin read only
   procedure Test_Viewable_test_winfo_viewable(Gnattest_T: in out Test);
   procedure Test_Viewable_7e17e3_8c7bbb(Gnattest_T: in out Test) renames
     Test_Viewable_test_winfo_viewable;
--  id:2.2/7e17e32beadd956a/Viewable/1/0/test_winfo_viewable/
   procedure Test_Viewable_test_winfo_viewable(Gnattest_T: in out Test) is
      function Viewable(Window: Tk_Widget) return Tcl_Boolean_Result renames
        Wrap_Test_Viewable_7e17e3_8c7bbb;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Viewable(Get_Main_Window).Result,
         "Failed to get viewable state for Tk main window.");

--  begin read only
   end Test_Viewable_test_winfo_viewable;
--  end read only

--  begin read only
   function Wrap_Test_Visual_Id_bfbe6b_3ec6f0
     (Window: Tk_Widget) return Positive is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Visual_Id test requirement violated");
      end;
      declare
         Test_Visual_Id_bfbe6b_3ec6f0_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Visual_Id(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Visual_Id test commitment violated");
         end;
         return Test_Visual_Id_bfbe6b_3ec6f0_Result;
      end;
   end Wrap_Test_Visual_Id_bfbe6b_3ec6f0;
--  end read only

--  begin read only
   procedure Test_Visual_Id_test_winfo_visual_id(Gnattest_T: in out Test);
   procedure Test_Visual_Id_bfbe6b_3ec6f0(Gnattest_T: in out Test) renames
     Test_Visual_Id_test_winfo_visual_id;
--  id:2.2/bfbe6bf365344960/Visual_Id/1/0/test_winfo_visual_id/
   procedure Test_Visual_Id_test_winfo_visual_id(Gnattest_T: in out Test) is
      function Visual_Id(Window: Tk_Widget) return Positive renames
        Wrap_Test_Visual_Id_bfbe6b_3ec6f0;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Visual_Id(Get_Main_Window) = 16#21#,
         "Failed to get Id for visual for Tk main window.");

--  begin read only
   end Test_Visual_Id_test_winfo_visual_id;
--  end read only

--  begin read only
   function Wrap_Test_Visuals_Available_a6aadc_de5564
     (Window: Tk_Widget; Include_Ids: Boolean := False) return Visuals_List is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Visuals_Available test requirement violated");
      end;
      declare
         Test_Visuals_Available_a6aadc_de5564_Result: constant Visuals_List :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Visuals_Available
             (Window, Include_Ids);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Visuals_Available test commitment violated");
         end;
         return Test_Visuals_Available_a6aadc_de5564_Result;
      end;
   end Wrap_Test_Visuals_Available_a6aadc_de5564;
--  end read only

--  begin read only
   procedure Test_Visuals_Available_test_winfo_visuals_available
     (Gnattest_T: in out Test);
   procedure Test_Visuals_Available_a6aadc_de5564
     (Gnattest_T: in out Test) renames
     Test_Visuals_Available_test_winfo_visuals_available;
--  id:2.2/a6aadccaa5000111/Visuals_Available/1/0/test_winfo_visuals_available/
   procedure Test_Visuals_Available_test_winfo_visuals_available
     (Gnattest_T: in out Test) is
      function Visuals_Available
        (Window: Tk_Widget; Include_Ids: Boolean := False)
         return Visuals_List renames
        Wrap_Test_Visuals_Available_a6aadc_de5564;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Visuals_Available(Get_Main_Window) /= Empty_Visual_List,
         "Failed to get the list of available visuals for TK main window.");

--  begin read only
   end Test_Visuals_Available_test_winfo_visuals_available;
--  end read only

--  begin read only
   function Wrap_Test_Virtual_Root_Height_c10eb6_0cf3d9
     (Window: Tk_Widget) return Positive is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Virtual_Root_Height test requirement violated");
      end;
      declare
         Test_Virtual_Root_Height_c10eb6_0cf3d9_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Virtual_Root_Height
             (Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Virtual_Root_Height test commitment violated");
         end;
         return Test_Virtual_Root_Height_c10eb6_0cf3d9_Result;
      end;
   end Wrap_Test_Virtual_Root_Height_c10eb6_0cf3d9;
--  end read only

--  begin read only
   procedure Test_Virtual_Root_Height_test_winfo_virtual_root_height
     (Gnattest_T: in out Test);
   procedure Test_Virtual_Root_Height_c10eb6_0cf3d9
     (Gnattest_T: in out Test) renames
     Test_Virtual_Root_Height_test_winfo_virtual_root_height;
--  id:2.2/c10eb6bfd36ab96b/Virtual_Root_Height/1/0/test_winfo_virtual_root_height/
   procedure Test_Virtual_Root_Height_test_winfo_virtual_root_height
     (Gnattest_T: in out Test) is
      function Virtual_Root_Height(Window: Tk_Widget) return Positive renames
        Wrap_Test_Virtual_Root_Height_c10eb6_0cf3d9;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Virtual_Root_Height(Get_Main_Window) > 0,
         "Failed to get virtual root height of Tk main window.");

--  begin read only
   end Test_Virtual_Root_Height_test_winfo_virtual_root_height;
--  end read only

--  begin read only
   function Wrap_Test_Virtual_Root_Width_34af8b_13e28c
     (Window: Tk_Widget) return Positive is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Virtual_Root_Width test requirement violated");
      end;
      declare
         Test_Virtual_Root_Width_34af8b_13e28c_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Virtual_Root_Width
             (Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Virtual_Root_Width test commitment violated");
         end;
         return Test_Virtual_Root_Width_34af8b_13e28c_Result;
      end;
   end Wrap_Test_Virtual_Root_Width_34af8b_13e28c;
--  end read only

--  begin read only
   procedure Test_Virtual_Root_Width_test_winfo_virtual_root_width
     (Gnattest_T: in out Test);
   procedure Test_Virtual_Root_Width_34af8b_13e28c
     (Gnattest_T: in out Test) renames
     Test_Virtual_Root_Width_test_winfo_virtual_root_width;
--  id:2.2/34af8ba4fc834109/Virtual_Root_Width/1/0/test_winfo_virtual_root_width/
   procedure Test_Virtual_Root_Width_test_winfo_virtual_root_width
     (Gnattest_T: in out Test) is
      function Virtual_Root_Width(Window: Tk_Widget) return Positive renames
        Wrap_Test_Virtual_Root_Width_34af8b_13e28c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Virtual_Root_Width(Get_Main_Window) > 0,
         "Failed to get virtual root width of Tk main window.");

--  begin read only
   end Test_Virtual_Root_Width_test_winfo_virtual_root_width;
--  end read only

--  begin read only
   function Wrap_Test_Virtual_Root_X_6cfaed_207bc9
     (Window: Tk_Widget) return Integer is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Virtual_Root_X test requirement violated");
      end;
      declare
         Test_Virtual_Root_X_6cfaed_207bc9_Result: constant Integer :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Virtual_Root_X
             (Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Virtual_Root_X test commitment violated");
         end;
         return Test_Virtual_Root_X_6cfaed_207bc9_Result;
      end;
   end Wrap_Test_Virtual_Root_X_6cfaed_207bc9;
--  end read only

--  begin read only
   procedure Test_Virtual_Root_X_test_winfo_virtual_root_x
     (Gnattest_T: in out Test);
   procedure Test_Virtual_Root_X_6cfaed_207bc9(Gnattest_T: in out Test) renames
     Test_Virtual_Root_X_test_winfo_virtual_root_x;
--  id:2.2/6cfaed2a8125b797/Virtual_Root_X/1/0/test_winfo_virtual_root_x/
   procedure Test_Virtual_Root_X_test_winfo_virtual_root_x
     (Gnattest_T: in out Test) is
      function Virtual_Root_X(Window: Tk_Widget) return Integer renames
        Wrap_Test_Virtual_Root_X_6cfaed_207bc9;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Virtual_Root_X(Get_Main_Window) > -1,
         "Failed to get virtual root X of Tk main window.");

--  begin read only
   end Test_Virtual_Root_X_test_winfo_virtual_root_x;
--  end read only

--  begin read only
   function Wrap_Test_Virtual_Root_Y_6a3724_e36110
     (Window: Tk_Widget) return Integer is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Virtual_Root_Y test requirement violated");
      end;
      declare
         Test_Virtual_Root_Y_6a3724_e36110_Result: constant Integer :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Virtual_Root_Y
             (Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Virtual_Root_Y test commitment violated");
         end;
         return Test_Virtual_Root_Y_6a3724_e36110_Result;
      end;
   end Wrap_Test_Virtual_Root_Y_6a3724_e36110;
--  end read only

--  begin read only
   procedure Test_Virtual_Root_Y_test_winfo_virtual_root_y
     (Gnattest_T: in out Test);
   procedure Test_Virtual_Root_Y_6a3724_e36110(Gnattest_T: in out Test) renames
     Test_Virtual_Root_Y_test_winfo_virtual_root_y;
--  id:2.2/6a3724ab671cea28/Virtual_Root_Y/1/0/test_winfo_virtual_root_y/
   procedure Test_Virtual_Root_Y_test_winfo_virtual_root_y
     (Gnattest_T: in out Test) is
      function Virtual_Root_Y(Window: Tk_Widget) return Integer renames
        Wrap_Test_Virtual_Root_Y_6a3724_e36110;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Virtual_Root_Y(Get_Main_Window) > -1,
         "Failed to get virtual root Y of Tk main window.");

--  begin read only
   end Test_Virtual_Root_Y_test_winfo_virtual_root_y;
--  end read only

--  begin read only
   function Wrap_Test_Width_fa2186_53745f(Window: Tk_Widget) return Positive is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Width test requirement violated");
      end;
      declare
         Test_Width_fa2186_53745f_Result: constant Positive :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Width(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Width test commitment violated");
         end;
         return Test_Width_fa2186_53745f_Result;
      end;
   end Wrap_Test_Width_fa2186_53745f;
--  end read only

--  begin read only
   procedure Test_Width_test_winfo_width(Gnattest_T: in out Test);
   procedure Test_Width_fa2186_53745f(Gnattest_T: in out Test) renames
     Test_Width_test_winfo_width;
--  id:2.2/fa2186de9c5ca5ec/Width/1/0/test_winfo_width/
   procedure Test_Width_test_winfo_width(Gnattest_T: in out Test) is
      function Width(Window: Tk_Widget) return Positive renames
        Wrap_Test_Width_fa2186_53745f;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Width(Get_Main_Window) > 0, "Failed to get width of Tk main window.");

--  begin read only
   end Test_Width_test_winfo_width;
--  end read only

--  begin read only
   function Wrap_Test_X_91dd91_776ecc(Window: Tk_Widget) return Natural is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_X test requirement violated");
      end;
      declare
         Test_X_91dd91_776ecc_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.X(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_X test commitment violated");
         end;
         return Test_X_91dd91_776ecc_Result;
      end;
   end Wrap_Test_X_91dd91_776ecc;
--  end read only

--  begin read only
   procedure Test_X_test_winfo_x(Gnattest_T: in out Test);
   procedure Test_X_91dd91_776ecc(Gnattest_T: in out Test) renames
     Test_X_test_winfo_x;
--  id:2.2/91dd9164a623e081/X/1/0/test_winfo_x/
   procedure Test_X_test_winfo_x(Gnattest_T: in out Test) is
      function X(Window: Tk_Widget) return Natural renames
        Wrap_Test_X_91dd91_776ecc;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (X(Get_Main_Window) > -1,
         "Failed to get X coordinate for Tk main window.");

--  begin read only
   end Test_X_test_winfo_x;
--  end read only

--  begin read only
   function Wrap_Test_Y_07f0ff_4d9e51(Window: Tk_Widget) return Natural is
   begin
      begin
         pragma Assert(Window /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-winfo.ads:0):Test_Winfo_Y test requirement violated");
      end;
      declare
         Test_Y_07f0ff_4d9e51_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Winfo.Y(Window);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-winfo.ads:0:):Test_Winfo_Y test commitment violated");
         end;
         return Test_Y_07f0ff_4d9e51_Result;
      end;
   end Wrap_Test_Y_07f0ff_4d9e51;
--  end read only

--  begin read only
   procedure Test_Y_test_winfo_y(Gnattest_T: in out Test);
   procedure Test_Y_07f0ff_4d9e51(Gnattest_T: in out Test) renames
     Test_Y_test_winfo_y;
--  id:2.2/07f0ff7be83621db/Y/1/0/test_winfo_y/
   procedure Test_Y_test_winfo_y(Gnattest_T: in out Test) is
      function Y(Window: Tk_Widget) return Natural renames
        Wrap_Test_Y_07f0ff_4d9e51;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Y(Get_Main_Window) > -1,
         "Failed to get Y coordinate for Tk main window.");

--  begin read only
   end Test_Y_test_winfo_y;
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
