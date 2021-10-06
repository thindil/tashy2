--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Grid.Test_Data.

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
with Tk.MainWindow; use Tk.MainWindow;

--  begin read only
--  end read only
package body Tk.Grid.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Add_09f411_b5946b
     (Child: Tk_Widget; Options: Grid_Options := Default_Grid_Options) is
   begin
      begin
         pragma Assert(Child /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Add1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Add(Child, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Add1 test commitment violated");
      end;
   end Wrap_Test_Add_09f411_b5946b;
--  end read only

--  begin read only
   procedure Test_1_Add_test_add1(Gnattest_T: in out Test);
   procedure Test_Add_09f411_b5946b(Gnattest_T: in out Test) renames
     Test_1_Add_test_add1;
--  id:2.2/09f41181ba943205/Add/1/0/test_add1/
   procedure Test_1_Add_test_add1(Gnattest_T: in out Test) is
      procedure Add
        (Child: Tk_Widget;
         Options: Grid_Options := Default_Grid_Options) renames
        Wrap_Test_Add_09f411_b5946b;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Add(Button);
      Assert
        (Get_Size(Get_Main_Window) = (1, 1), "Failed to add widget to grid.");
      Destroy(Button);

--  begin read only
   end Test_1_Add_test_add1;
--  end read only

--  begin read only
   procedure Wrap_Test_Add_6de79c_257591
     (Widgets: Widgets_Array; Options: Grid_Options := Default_Grid_Options) is
   begin
      begin
         pragma Assert(Widgets'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Add2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Add(Widgets, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Add2 test commitment violated");
      end;
   end Wrap_Test_Add_6de79c_257591;
--  end read only

--  begin read only
   procedure Test_2_Add_test_add2(Gnattest_T: in out Test);
   procedure Test_Add_6de79c_257591(Gnattest_T: in out Test) renames
     Test_2_Add_test_add2;
--  id:2.2/6de79c7546153f9d/Add/0/0/test_add2/
   procedure Test_2_Add_test_add2(Gnattest_T: in out Test) is
      procedure Add
        (Widgets: Widgets_Array;
         Options: Grid_Options := Default_Grid_Options) renames
        Wrap_Test_Add_6de79c_257591;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button1: Tk_Button;
      Button2: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button1, ".mybutton", Button_Options'(others => <>));
      Create(Button2, ".mybutton2", Button_Options'(others => <>));
      Add((Button1, Button2));
      Assert
        (Get_Size(Get_Main_Window) = (2, 1), "Failed to add widgets to grid.");
      Destroy(Button1);
      Destroy(Button2);

--  begin read only
   end Test_2_Add_test_add2;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Anchor_94c9fb_f07f8d
     (Master: Tk_Widget; New_Direction: Directions_Type) is
   begin
      begin
         pragma Assert(Master /= Null_Widget and New_Direction /= NONE);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Anchor1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Set_Anchor
        (Master, New_Direction);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Anchor1 test commitment violated");
      end;
   end Wrap_Test_Set_Anchor_94c9fb_f07f8d;
--  end read only

--  begin read only
   procedure Test_Set_Anchor_test_anchor1(Gnattest_T: in out Test);
   procedure Test_Set_Anchor_94c9fb_f07f8d(Gnattest_T: in out Test) renames
     Test_Set_Anchor_test_anchor1;
--  id:2.2/94c9fbd74d3a50b6/Set_Anchor/1/0/test_anchor1/
   procedure Test_Set_Anchor_test_anchor1(Gnattest_T: in out Test) is
      procedure Set_Anchor
        (Master: Tk_Widget; New_Direction: Directions_Type) renames
        Wrap_Test_Set_Anchor_94c9fb_f07f8d;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Anchor(Get_Main_Window, CENTER);
      Assert
        (Get_Anchor(Get_Main_Window) = CENTER,
         "Failed to set anchor for grid.");

--  begin read only
   end Test_Set_Anchor_test_anchor1;
--  end read only

--  begin read only
   function Wrap_Test_Get_Anchor_3fef99_b06609
     (Master: Tk_Widget) return Directions_Type is
   begin
      begin
         pragma Assert
           (Master /= Null_Widget
            or else Tk_Interp(Widgt => Master) /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Anchor2 test requirement violated");
      end;
      declare
         Test_Get_Anchor_3fef99_b06609_Result: constant Directions_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Anchor(Master);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Anchor2 test commitment violated");
         end;
         return Test_Get_Anchor_3fef99_b06609_Result;
      end;
   end Wrap_Test_Get_Anchor_3fef99_b06609;
--  end read only

--  begin read only
   procedure Test_Get_Anchor_test_anchor2(Gnattest_T: in out Test);
   procedure Test_Get_Anchor_3fef99_b06609(Gnattest_T: in out Test) renames
     Test_Get_Anchor_test_anchor2;
--  id:2.2/3fef99fba2d1c85d/Get_Anchor/1/0/test_anchor2/
   procedure Test_Get_Anchor_test_anchor2(Gnattest_T: in out Test) is
      function Get_Anchor(Master: Tk_Widget) return Directions_Type renames
        Wrap_Test_Get_Anchor_3fef99_b06609;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Anchor(Get_Main_Window) = CENTER,
         "Failed to get anchor for grid.");

--  begin read only
   end Test_Get_Anchor_test_anchor2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Bounding_Box_c2a26c_6b6e30
     (Master: Tk_Widget; Column, Row, Column2, Row2: Natural)
      return Bbox_Data is
   begin
      begin
         pragma Assert(Master /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Get_BBox test requirement violated");
      end;
      declare
         Test_Get_Bounding_Box_c2a26c_6b6e30_Result: constant Bbox_Data :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Bounding_Box
             (Master, Column, Row, Column2, Row2);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Get_BBox test commitment violated");
         end;
         return Test_Get_Bounding_Box_c2a26c_6b6e30_Result;
      end;
   end Wrap_Test_Get_Bounding_Box_c2a26c_6b6e30;
--  end read only

--  begin read only
   procedure Test_1_Get_Bounding_Box_test_get_bbox(Gnattest_T: in out Test);
   procedure Test_Get_Bounding_Box_c2a26c_6b6e30
     (Gnattest_T: in out Test) renames
     Test_1_Get_Bounding_Box_test_get_bbox;
--  id:2.2/c2a26cdb24b5a363/Get_Bounding_Box/1/0/test_get_bbox/
   procedure Test_1_Get_Bounding_Box_test_get_bbox(Gnattest_T: in out Test) is
      function Get_Bounding_Box
        (Master: Tk_Widget; Column, Row, Column2, Row2: Natural)
         return Bbox_Data renames
        Wrap_Test_Get_Bounding_Box_c2a26c_6b6e30;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_1_Get_Bounding_Box_test_get_bbox;
--  end read only

--  begin read only
   function Wrap_Test_Get_Bounding_Box_154409_8eb716
     (Master: Tk_Widget; Column, Row: Natural) return Bbox_Data is
   begin
      begin
         pragma Assert(Master /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Get_BBox2 test requirement violated");
      end;
      declare
         Test_Get_Bounding_Box_154409_8eb716_Result: constant Bbox_Data :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Bounding_Box
             (Master, Column, Row);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Get_BBox2 test commitment violated");
         end;
         return Test_Get_Bounding_Box_154409_8eb716_Result;
      end;
   end Wrap_Test_Get_Bounding_Box_154409_8eb716;
--  end read only

--  begin read only
   procedure Test_2_Get_Bounding_Box_test_get_bbox2(Gnattest_T: in out Test);
   procedure Test_Get_Bounding_Box_154409_8eb716
     (Gnattest_T: in out Test) renames
     Test_2_Get_Bounding_Box_test_get_bbox2;
--  id:2.2/1544093478185a78/Get_Bounding_Box/0/0/test_get_bbox2/
   procedure Test_2_Get_Bounding_Box_test_get_bbox2(Gnattest_T: in out Test) is
      function Get_Bounding_Box
        (Master: Tk_Widget; Column, Row: Natural) return Bbox_Data renames
        Wrap_Test_Get_Bounding_Box_154409_8eb716;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Get_Bounding_Box_test_get_bbox2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Bounding_Box_f0c44d_c84870
     (Master: Tk_Widget) return Bbox_Data is
   begin
      begin
         pragma Assert(Master /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Get_BBox3 test requirement violated");
      end;
      declare
         Test_Get_Bounding_Box_f0c44d_c84870_Result: constant Bbox_Data :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Bounding_Box
             (Master);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Get_BBox3 test commitment violated");
         end;
         return Test_Get_Bounding_Box_f0c44d_c84870_Result;
      end;
   end Wrap_Test_Get_Bounding_Box_f0c44d_c84870;
--  end read only

--  begin read only
   procedure Test_3_Get_Bounding_Box_test_get_bbox3(Gnattest_T: in out Test);
   procedure Test_Get_Bounding_Box_f0c44d_c84870
     (Gnattest_T: in out Test) renames
     Test_3_Get_Bounding_Box_test_get_bbox3;
--  id:2.2/f0c44deef0828329/Get_Bounding_Box/0/0/test_get_bbox3/
   procedure Test_3_Get_Bounding_Box_test_get_bbox3(Gnattest_T: in out Test) is
      function Get_Bounding_Box(Master: Tk_Widget) return Bbox_Data renames
        Wrap_Test_Get_Bounding_Box_f0c44d_c84870;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_3_Get_Bounding_Box_test_get_bbox3;
--  end read only

--  begin read only
   procedure Wrap_Test_Column_Configure_b41aca_dcc0a7
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) is
   begin
      begin
         pragma Assert
           (Master /= Null_Widget and Length(Source => Child_Name) > 0 and
            Options /= Default_Column_Options);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Column_Configure1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Column_Configure
        (Master, Child_Name, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Column_Configure1 test commitment violated");
      end;
   end Wrap_Test_Column_Configure_b41aca_dcc0a7;
--  end read only

--  begin read only
   procedure Test_1_Column_Configure_test_column_configure1
     (Gnattest_T: in out Test);
   procedure Test_Column_Configure_b41aca_dcc0a7
     (Gnattest_T: in out Test) renames
     Test_1_Column_Configure_test_column_configure1;
--  id:2.2/b41aca7d33fda6d6/Column_Configure/1/0/test_column_configure1/
   procedure Test_1_Column_Configure_test_column_configure1
     (Gnattest_T: in out Test) is
      procedure Column_Configure
        (Master: Tk_Widget; Child_Name: Tcl_String;
         Options: Column_Options) renames
        Wrap_Test_Column_Configure_b41aca_dcc0a7;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Options: Column_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Add(Button);
      Column_Configure
        (Get_Main_Window, To_Tcl_String(Tk_Path_Name(Button)),
         Column_Options'(Weight => 5, others => <>));
      Options := Get_Column_Options(Get_Main_Window, 0);
      Assert
        (Options.Weight = 5,
         "Failed to set column options with child name for grid.");
      Destroy(Button);

--  begin read only
   end Test_1_Column_Configure_test_column_configure1;
--  end read only

--  begin read only
   procedure Wrap_Test_Column_Configure_dbcaa4_baf62d
     (Master, Child: Tk_Widget; Options: Column_Options) is
   begin
      begin
         pragma Assert
           (Master /= Null_Widget and Child /= Null_Widget and
            Options /= Default_Column_Options);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Column_Configure2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Column_Configure
        (Master, Child, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Column_Configure2 test commitment violated");
      end;
   end Wrap_Test_Column_Configure_dbcaa4_baf62d;
--  end read only

--  begin read only
   procedure Test_2_Column_Configure_test_column_configure2
     (Gnattest_T: in out Test);
   procedure Test_Column_Configure_dbcaa4_baf62d
     (Gnattest_T: in out Test) renames
     Test_2_Column_Configure_test_column_configure2;
--  id:2.2/dbcaa489b9b4b4dc/Column_Configure/0/0/test_column_configure2/
   procedure Test_2_Column_Configure_test_column_configure2
     (Gnattest_T: in out Test) is
      procedure Column_Configure
        (Master, Child: Tk_Widget; Options: Column_Options) renames
        Wrap_Test_Column_Configure_dbcaa4_baf62d;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Options: Column_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Add(Button);
      Column_Configure
        (Get_Main_Window, Button, Column_Options'(Weight => 15, others => <>));
      Options := Get_Column_Options(Get_Main_Window, 0);
      Assert
        (Options.Weight = 15,
         "Failed to set column options with child for grid.");
      Destroy(Button);

--  begin read only
   end Test_2_Column_Configure_test_column_configure2;
--  end read only

--  begin read only
   procedure Wrap_Test_Column_Configure_86279e_3e25dc
     (Master: Tk_Widget; Column: Natural; Options: Column_Options) is
   begin
      begin
         pragma Assert
           (Master /= Null_Widget and Options /= Default_Column_Options);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Column_Configure3 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Column_Configure
        (Master, Column, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Column_Configure3 test commitment violated");
      end;
   end Wrap_Test_Column_Configure_86279e_3e25dc;
--  end read only

--  begin read only
   procedure Test_3_Column_Configure_test_column_configure3
     (Gnattest_T: in out Test);
   procedure Test_Column_Configure_86279e_3e25dc
     (Gnattest_T: in out Test) renames
     Test_3_Column_Configure_test_column_configure3;
--  id:2.2/86279edebadeb350/Column_Configure/0/0/test_column_configure3/
   procedure Test_3_Column_Configure_test_column_configure3
     (Gnattest_T: in out Test) is
      procedure Column_Configure
        (Master: Tk_Widget; Column: Natural; Options: Column_Options) renames
        Wrap_Test_Column_Configure_86279e_3e25dc;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Options: Column_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Column_Configure
        (Get_Main_Window, 0, Column_Options'(Weight => 1, others => <>));
      Options := Get_Column_Options(Get_Main_Window, 0);
      Assert
        (Options.Weight = 1,
         "Failed to set column options with column number for grid.");

--  begin read only
   end Test_3_Column_Configure_test_column_configure3;
--  end read only

--  begin read only
   function Wrap_Test_Get_Column_Options_22be63_f54751
     (Master: Tk_Widget; Column: Natural) return Column_Options is
   begin
      begin
         pragma Assert(Master /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Get_Column_Options test requirement violated");
      end;
      declare
         Test_Get_Column_Options_22be63_f54751_Result: constant Column_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Column_Options
             (Master, Column);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Get_Column_Options test commitment violated");
         end;
         return Test_Get_Column_Options_22be63_f54751_Result;
      end;
   end Wrap_Test_Get_Column_Options_22be63_f54751;
--  end read only

--  begin read only
   procedure Test_Get_Column_Options_test_get_column_options
     (Gnattest_T: in out Test);
   procedure Test_Get_Column_Options_22be63_f54751
     (Gnattest_T: in out Test) renames
     Test_Get_Column_Options_test_get_column_options;
--  id:2.2/22be6327e6c5ccd3/Get_Column_Options/1/0/test_get_column_options/
   procedure Test_Get_Column_Options_test_get_column_options
     (Gnattest_T: in out Test) is
      function Get_Column_Options
        (Master: Tk_Widget; Column: Natural) return Column_Options renames
        Wrap_Test_Get_Column_Options_22be63_f54751;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Options: Column_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Column_Configure
        (Get_Main_Window, 0, Column_Options'(Weight => 23, others => <>));
      Options := Get_Column_Options(Get_Main_Window, 0);
      Assert(Options.Weight = 23, "Failed to get column options for grid.");

--  begin read only
   end Test_Get_Column_Options_test_get_column_options;
--  end read only

--  begin read only
   procedure Wrap_Test_Configure_c67185_4765c0
     (Child: Tk_Widget; Options: Grid_Options) is
   begin
      begin
         pragma Assert
           (Child /= Null_Widget and Options /= Default_Grid_Options);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Configure1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Configure(Child, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Configure1 test commitment violated");
      end;
   end Wrap_Test_Configure_c67185_4765c0;
--  end read only

--  begin read only
   procedure Test_1_Configure_test_configure1(Gnattest_T: in out Test);
   procedure Test_Configure_c67185_4765c0(Gnattest_T: in out Test) renames
     Test_1_Configure_test_configure1;
--  id:2.2/c6718582592dc115/Configure/1/0/test_configure1/
   procedure Test_1_Configure_test_configure1(Gnattest_T: in out Test) is
      procedure Configure(Child: Tk_Widget; Options: Grid_Options) renames
        Wrap_Test_Configure_c67185_4765c0;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Options: Grid_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Add(Button);
      Configure(Button, Grid_Options'(Row => 1, others => <>));
      Options := Get_Info(Button);
      Assert(Options.Row = 1, "Failed to configure widget in grid.");
      Destroy(Button);

--  begin read only
   end Test_1_Configure_test_configure1;
--  end read only

--  begin read only
   procedure Wrap_Test_Configure_f31b66_3e2feb
     (Widgets: Widgets_Array; Options: Grid_Options) is
   begin
      begin
         pragma Assert(Widgets'Length > 0 and Options /= Default_Grid_Options);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Configure2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Configure(Widgets, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Configure2 test commitment violated");
      end;
   end Wrap_Test_Configure_f31b66_3e2feb;
--  end read only

--  begin read only
   procedure Test_2_Configure_test_configure2(Gnattest_T: in out Test);
   procedure Test_Configure_f31b66_3e2feb(Gnattest_T: in out Test) renames
     Test_2_Configure_test_configure2;
--  id:2.2/f31b66078cc53553/Configure/0/0/test_configure2/
   procedure Test_2_Configure_test_configure2(Gnattest_T: in out Test) is
      procedure Configure
        (Widgets: Widgets_Array; Options: Grid_Options) renames
        Wrap_Test_Configure_f31b66_3e2feb;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button1: Tk_Button;
      Button2: Tk_Button;
      Options: Grid_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button1, ".mybutton", Button_Options'(others => <>));
      Create(Button2, ".mybutton2", Button_Options'(others => <>));
      Add((Button1, Button2));
      Configure((Button1, Button2), Grid_Options'(Row => 1, others => <>));
      Options := Get_Info(Button1);
      Assert(Options.Row = 1, "Failed to configure widgets in grid.");
      Destroy(Button1);
      Destroy(Button2);

--  begin read only
   end Test_2_Configure_test_configure2;
--  end read only

--  begin read only
   procedure Wrap_Test_Forget_7f8bc2_8fa399(Child: Tk_Widget) is
   begin
      begin
         pragma Assert(Child /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Forget1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Forget(Child);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Forget1 test commitment violated");
      end;
   end Wrap_Test_Forget_7f8bc2_8fa399;
--  end read only

--  begin read only
   procedure Test_1_Forget_test_forget1(Gnattest_T: in out Test);
   procedure Test_Forget_7f8bc2_8fa399(Gnattest_T: in out Test) renames
     Test_1_Forget_test_forget1;
--  id:2.2/7f8bc223a819d0d3/Forget/1/0/test_forget1/
   procedure Test_1_Forget_test_forget1(Gnattest_T: in out Test) is
      procedure Forget(Child: Tk_Widget) renames
        Wrap_Test_Forget_7f8bc2_8fa399;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Add(Button);
      Forget(Button);
      Assert
        (Get_Slaves(Get_Main_Window)'Length = 0,
         "Failed to forget widget in grid.");
      Destroy(Button);

--  begin read only
   end Test_1_Forget_test_forget1;
--  end read only

--  begin read only
   procedure Wrap_Test_Forget_41161d_27199d(Widgets: Widgets_Array) is
   begin
      begin
         pragma Assert(Widgets'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Forget2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Forget(Widgets);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Forget2 test commitment violated");
      end;
   end Wrap_Test_Forget_41161d_27199d;
--  end read only

--  begin read only
   procedure Test_2_Forget_test_forget2(Gnattest_T: in out Test);
   procedure Test_Forget_41161d_27199d(Gnattest_T: in out Test) renames
     Test_2_Forget_test_forget2;
--  id:2.2/41161d5f24ba4e15/Forget/0/0/test_forget2/
   procedure Test_2_Forget_test_forget2(Gnattest_T: in out Test) is
      procedure Forget(Widgets: Widgets_Array) renames
        Wrap_Test_Forget_41161d_27199d;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button1: Tk_Button;
      Button2: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button1, ".mybutton", Button_Options'(others => <>));
      Create(Button2, ".mybutton2", Button_Options'(others => <>));
      Add((Button1, Button2));
      Forget((Button1, Button2));
      Assert
        (Get_Slaves(Get_Main_Window)'Length = 0,
         "Failed to forget widgets in grid.");
      Destroy(Button1);
      Destroy(Button2);

--  begin read only
   end Test_2_Forget_test_forget2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Info_8760e4_ba34a0
     (Child: Tk_Widget) return Grid_Options is
   begin
      begin
         pragma Assert(Child /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Info test requirement violated");
      end;
      declare
         Test_Get_Info_8760e4_ba34a0_Result: constant Grid_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Info(Child);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Info test commitment violated");
         end;
         return Test_Get_Info_8760e4_ba34a0_Result;
      end;
   end Wrap_Test_Get_Info_8760e4_ba34a0;
--  end read only

--  begin read only
   procedure Test_Get_Info_test_info(Gnattest_T: in out Test);
   procedure Test_Get_Info_8760e4_ba34a0(Gnattest_T: in out Test) renames
     Test_Get_Info_test_info;
--  id:2.2/8760e435e0a1baad/Get_Info/1/0/test_info/
   procedure Test_Get_Info_test_info(Gnattest_T: in out Test) is
      function Get_Info(Child: Tk_Widget) return Grid_Options renames
        Wrap_Test_Get_Info_8760e4_ba34a0;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Options: Grid_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Add(Button, Grid_Options'(Row => 1, others => <>));
      Options := Get_Info(Button);
      Assert(Options.Row = 1, "Failed to get widget grid options in grid.");
      Destroy(Button);

--  begin read only
   end Test_Get_Info_test_info;
--  end read only

--  begin read only
   function Wrap_Test_Get_Location_3c34d1_74cec4
     (Master: Tk_Widget; X, Y: Pixel_Data) return Location_Position is
   begin
      begin
         pragma Assert
           (Master /= Null_Widget and X.Value > -1.0 and Y.Value > -1.0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Location test requirement violated");
      end;
      declare
         Test_Get_Location_3c34d1_74cec4_Result: constant Location_Position :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Location
             (Master, X, Y);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Location test commitment violated");
         end;
         return Test_Get_Location_3c34d1_74cec4_Result;
      end;
   end Wrap_Test_Get_Location_3c34d1_74cec4;
--  end read only

--  begin read only
   procedure Test_Get_Location_test_location(Gnattest_T: in out Test);
   procedure Test_Get_Location_3c34d1_74cec4(Gnattest_T: in out Test) renames
     Test_Get_Location_test_location;
--  id:2.2/3c34d18d58761388/Get_Location/1/0/test_location/
   procedure Test_Get_Location_test_location(Gnattest_T: in out Test) is
      function Get_Location
        (Master: Tk_Widget; X, Y: Pixel_Data) return Location_Position renames
        Wrap_Test_Get_Location_3c34d1_74cec4;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Location(Get_Main_Window, (0.0, PIXEL), (0.0, PIXEL)) =
         (Column => 0, Row => 0),
         "Failed to get location in grid.");

--  begin read only
   end Test_Get_Location_test_location;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Propagate_38a3d0_e08f8c
     (Master: Tk_Widget; Enable: Boolean := True) is
   begin
      begin
         pragma Assert(Master /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Propagate1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Set_Propagate
        (Master, Enable);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Propagate1 test commitment violated");
      end;
   end Wrap_Test_Set_Propagate_38a3d0_e08f8c;
--  end read only

--  begin read only
   procedure Test_Set_Propagate_test_propagate1(Gnattest_T: in out Test);
   procedure Test_Set_Propagate_38a3d0_e08f8c(Gnattest_T: in out Test) renames
     Test_Set_Propagate_test_propagate1;
--  id:2.2/38a3d0651f3359fd/Set_Propagate/1/0/test_propagate1/
   procedure Test_Set_Propagate_test_propagate1(Gnattest_T: in out Test) is
      procedure Set_Propagate
        (Master: Tk_Widget; Enable: Boolean := True) renames
        Wrap_Test_Set_Propagate_38a3d0_e08f8c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Propagate(Get_Main_Window, False);
      Assert
        (not Get_Propagate(Get_Main_Window).Result,
         "Failed to set propagation for grid.");

--  begin read only
   end Test_Set_Propagate_test_propagate1;
--  end read only

--  begin read only
   function Wrap_Test_Get_Propagate_b85f28_142129
     (Master: Tk_Widget) return Tcl_Boolean_Result is
   begin
      begin
         pragma Assert(Master /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Propagate2 test requirement violated");
      end;
      declare
         Test_Get_Propagate_b85f28_142129_Result: constant Tcl_Boolean_Result :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Propagate(Master);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Propagate2 test commitment violated");
         end;
         return Test_Get_Propagate_b85f28_142129_Result;
      end;
   end Wrap_Test_Get_Propagate_b85f28_142129;
--  end read only

--  begin read only
   procedure Test_Get_Propagate_test_propagate2(Gnattest_T: in out Test);
   procedure Test_Get_Propagate_b85f28_142129(Gnattest_T: in out Test) renames
     Test_Get_Propagate_test_propagate2;
--  id:2.2/b85f2886a59076c3/Get_Propagate/1/0/test_propagate2/
   procedure Test_Get_Propagate_test_propagate2(Gnattest_T: in out Test) is
      function Get_Propagate
        (Master: Tk_Widget) return Tcl_Boolean_Result renames
        Wrap_Test_Get_Propagate_b85f28_142129;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Set_Propagate(Get_Main_Window);
      Assert
        (Get_Propagate(Get_Main_Window).Result,
         "Failed to get propagation for grid.");

--  begin read only
   end Test_Get_Propagate_test_propagate2;
--  end read only

--  begin read only
   procedure Wrap_Test_Row_Configure_cd10c1_55f5f1
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) is
   begin
      begin
         pragma Assert
           (Master /= Null_Widget and Length(Source => Child_Name) > 0 and
            Options /= Default_Column_Options);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Row_Configure1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Row_Configure
        (Master, Child_Name, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Row_Configure1 test commitment violated");
      end;
   end Wrap_Test_Row_Configure_cd10c1_55f5f1;
--  end read only

--  begin read only
   procedure Test_1_Row_Configure_test_row_configure1(Gnattest_T: in out Test);
   procedure Test_Row_Configure_cd10c1_55f5f1(Gnattest_T: in out Test) renames
     Test_1_Row_Configure_test_row_configure1;
--  id:2.2/cd10c14861fb1027/Row_Configure/1/0/test_row_configure1/
   procedure Test_1_Row_Configure_test_row_configure1
     (Gnattest_T: in out Test) is
      procedure Row_Configure
        (Master: Tk_Widget; Child_Name: Tcl_String;
         Options: Column_Options) renames
        Wrap_Test_Row_Configure_cd10c1_55f5f1;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Options: Column_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Add(Button);
      Row_Configure
        (Get_Main_Window, To_Tcl_String(Tk_Path_Name(Button)),
         Column_Options'(Weight => 5, others => <>));
      Options := Get_Row_Options(Get_Main_Window, 0);
      Assert
        (Options.Weight = 5,
         "Failed to set row options with child name for grid.");
      Destroy(Button);

--  begin read only
   end Test_1_Row_Configure_test_row_configure1;
--  end read only

--  begin read only
   procedure Wrap_Test_Row_Configure_0a2e60_353acd
     (Master, Child: Tk_Widget; Options: Column_Options) is
   begin
      begin
         pragma Assert
           (Master /= Null_Widget and Child /= Null_Widget and
            Options /= Default_Column_Options);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Row_Configure2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Row_Configure
        (Master, Child, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Row_Configure2 test commitment violated");
      end;
   end Wrap_Test_Row_Configure_0a2e60_353acd;
--  end read only

--  begin read only
   procedure Test_2_Row_Configure_test_row_configure2(Gnattest_T: in out Test);
   procedure Test_Row_Configure_0a2e60_353acd(Gnattest_T: in out Test) renames
     Test_2_Row_Configure_test_row_configure2;
--  id:2.2/0a2e60e5acb5492e/Row_Configure/0/0/test_row_configure2/
   procedure Test_2_Row_Configure_test_row_configure2
     (Gnattest_T: in out Test) is
      procedure Row_Configure
        (Master, Child: Tk_Widget; Options: Column_Options) renames
        Wrap_Test_Row_Configure_0a2e60_353acd;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Options: Column_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Add(Button);
      Row_Configure
        (Get_Main_Window, Button, Column_Options'(Weight => 15, others => <>));
      Options := Get_Row_Options(Get_Main_Window, 0);
      Assert
        (Options.Weight = 15,
         "Failed to set row options with child widget for grid.");
      Destroy(Button);

--  begin read only
   end Test_2_Row_Configure_test_row_configure2;
--  end read only

--  begin read only
   procedure Wrap_Test_Row_Configure_7261aa_f7627e
     (Master: Tk_Widget; Row: Natural; Options: Column_Options) is
   begin
      begin
         pragma Assert
           (Master /= Null_Widget and Options /= Default_Column_Options);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Row_Configure3 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Row_Configure
        (Master, Row, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Row_Configure3 test commitment violated");
      end;
   end Wrap_Test_Row_Configure_7261aa_f7627e;
--  end read only

--  begin read only
   procedure Test_3_Row_Configure_test_row_configure3(Gnattest_T: in out Test);
   procedure Test_Row_Configure_7261aa_f7627e(Gnattest_T: in out Test) renames
     Test_3_Row_Configure_test_row_configure3;
--  id:2.2/7261aa6fcbc4a5c1/Row_Configure/0/0/test_row_configure3/
   procedure Test_3_Row_Configure_test_row_configure3
     (Gnattest_T: in out Test) is
      procedure Row_Configure
        (Master: Tk_Widget; Row: Natural; Options: Column_Options) renames
        Wrap_Test_Row_Configure_7261aa_f7627e;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Options: Column_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Column_Configure
        (Get_Main_Window, 0, Column_Options'(Weight => 1, others => <>));
      Options := Get_Column_Options(Get_Main_Window, 0);
      Assert
        (Options.Weight = 1,
         "Failed to set row options with row number for grid.");

--  begin read only
   end Test_3_Row_Configure_test_row_configure3;
--  end read only

--  begin read only
   function Wrap_Test_Get_Row_Options_192829_8edf28
     (Master: Tk_Widget; Row: Natural) return Column_Options is
   begin
      begin
         pragma Assert(Master /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Get_Row_Options test requirement violated");
      end;
      declare
         Test_Get_Row_Options_192829_8edf28_Result: constant Column_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Row_Options
             (Master, Row);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Get_Row_Options test commitment violated");
         end;
         return Test_Get_Row_Options_192829_8edf28_Result;
      end;
   end Wrap_Test_Get_Row_Options_192829_8edf28;
--  end read only

--  begin read only
   procedure Test_Get_Row_Options_test_get_row_options
     (Gnattest_T: in out Test);
   procedure Test_Get_Row_Options_192829_8edf28
     (Gnattest_T: in out Test) renames
     Test_Get_Row_Options_test_get_row_options;
--  id:2.2/192829f3d87ab7ca/Get_Row_Options/1/0/test_get_row_options/
   procedure Test_Get_Row_Options_test_get_row_options
     (Gnattest_T: in out Test) is
      function Get_Row_Options
        (Master: Tk_Widget; Row: Natural) return Column_Options renames
        Wrap_Test_Get_Row_Options_192829_8edf28;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Options: Column_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Row_Configure
        (Get_Main_Window, 0, Column_Options'(Weight => 23, others => <>));
      Options := Get_Row_Options(Get_Main_Window, 0);
      Assert(Options.Weight = 23, "Failed to get column options for grid.");

--  begin read only
   end Test_Get_Row_Options_test_get_row_options;
--  end read only

--  begin read only
   procedure Wrap_Test_Remove_cf1782_4cc907(Child: Tk_Widget) is
   begin
      begin
         pragma Assert(Child /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Remove1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Remove(Child);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Remove1 test commitment violated");
      end;
   end Wrap_Test_Remove_cf1782_4cc907;
--  end read only

--  begin read only
   procedure Test_1_Remove_test_remove1(Gnattest_T: in out Test);
   procedure Test_Remove_cf1782_4cc907(Gnattest_T: in out Test) renames
     Test_1_Remove_test_remove1;
--  id:2.2/cf1782113fce8963/Remove/1/0/test_remove1/
   procedure Test_1_Remove_test_remove1(Gnattest_T: in out Test) is
      procedure Remove(Child: Tk_Widget) renames
        Wrap_Test_Remove_cf1782_4cc907;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Add(Button);
      Remove(Button);
      Assert
        (Get_Slaves(Get_Main_Window)'Length = 0,
         "Failed to remove widget in grid.");
      Destroy(Button);

--  begin read only
   end Test_1_Remove_test_remove1;
--  end read only

--  begin read only
   procedure Wrap_Test_Remove_4f07d4_13d0b1(Widgets: Widgets_Array) is
   begin
      begin
         pragma Assert(Widgets'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Remove2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Remove(Widgets);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Remove2 test commitment violated");
      end;
   end Wrap_Test_Remove_4f07d4_13d0b1;
--  end read only

--  begin read only
   procedure Test_2_Remove_test_remove2(Gnattest_T: in out Test);
   procedure Test_Remove_4f07d4_13d0b1(Gnattest_T: in out Test) renames
     Test_2_Remove_test_remove2;
--  id:2.2/4f07d4b23495ca01/Remove/0/0/test_remove2/
   procedure Test_2_Remove_test_remove2(Gnattest_T: in out Test) is
      procedure Remove(Widgets: Widgets_Array) renames
        Wrap_Test_Remove_4f07d4_13d0b1;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button1: Tk_Button;
      Button2: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button1, ".mybutton", Button_Options'(others => <>));
      Create(Button2, ".mybutton2", Button_Options'(others => <>));
      Add((Button1, Button2));
      Remove((Button1, Button2));
      Assert
        (Get_Slaves(Get_Main_Window)'Length = 0,
         "Failed to remove widgets in grid.");
      Destroy(Button1);
      Destroy(Button2);

--  begin read only
   end Test_2_Remove_test_remove2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Size_fbc383_a60758
     (Master: Tk_Widget) return Location_Position is
   begin
      begin
         pragma Assert(Master /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Size test requirement violated");
      end;
      declare
         Test_Get_Size_fbc383_a60758_Result: constant Location_Position :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Size(Master);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Size test commitment violated");
         end;
         return Test_Get_Size_fbc383_a60758_Result;
      end;
   end Wrap_Test_Get_Size_fbc383_a60758;
--  end read only

--  begin read only
   procedure Test_Get_Size_test_size(Gnattest_T: in out Test);
   procedure Test_Get_Size_fbc383_a60758(Gnattest_T: in out Test) renames
     Test_Get_Size_test_size;
--  id:2.2/fbc383da17d84224/Get_Size/1/0/test_size/
   procedure Test_Get_Size_test_size(Gnattest_T: in out Test) is
      function Get_Size(Master: Tk_Widget) return Location_Position renames
        Wrap_Test_Get_Size_fbc383_a60758;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button1: Tk_Button;
      Button2: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button1, ".mybutton", Button_Options'(others => <>));
      Create(Button2, ".mybutton2", Button_Options'(others => <>));
      Add((Button1, Button2));
      Assert
        (Get_Size(Get_Main_Window) = (Column => 2, Row => 1),
         "Failed to get grid size.");
      Destroy(Button1);
      Destroy(Button2);

--  begin read only
   end Test_Get_Size_test_size;
--  end read only

--  begin read only
   function Wrap_Test_Get_Slaves_6dfdb7_8c1fbf
     (Master: Tk_Widget; Row, Column: Extended_Natural := -1)
      return Widgets_Array is
   begin
      begin
         pragma Assert(Master /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Slaves test requirement violated");
      end;
      declare
         Test_Get_Slaves_6dfdb7_8c1fbf_Result: constant Widgets_Array :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Slaves
             (Master, Row, Column);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Slaves test commitment violated");
         end;
         return Test_Get_Slaves_6dfdb7_8c1fbf_Result;
      end;
   end Wrap_Test_Get_Slaves_6dfdb7_8c1fbf;
--  end read only

--  begin read only
   procedure Test_Get_Slaves_test_slaves(Gnattest_T: in out Test);
   procedure Test_Get_Slaves_6dfdb7_8c1fbf(Gnattest_T: in out Test) renames
     Test_Get_Slaves_test_slaves;
--  id:2.2/6dfdb7246215d3af/Get_Slaves/1/0/test_slaves/
   procedure Test_Get_Slaves_test_slaves(Gnattest_T: in out Test) is
      function Get_Slaves
        (Master: Tk_Widget; Row, Column: Extended_Natural := -1)
         return Widgets_Array renames
        Wrap_Test_Get_Slaves_6dfdb7_8c1fbf;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button1: Tk_Button;
      Button2: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button1, ".mybutton", Button_Options'(others => <>));
      Create(Button2, ".mybutton2", Button_Options'(others => <>));
      Add((Button1, Button2));
      Assert
        (Get_Slaves(Get_Main_Window)'Length = 2,
         "Failed to get list of slaves in grid.");
      Destroy(Button1);
      Destroy(Button2);

--  begin read only
   end Test_Get_Slaves_test_slaves;
--  end read only

--  begin read only
   --  procedure Test_Get_Bounding_Box_test_bbox (Gnattest_T : in out Test_);
   --  procedure Test_Get_Bounding_Box_9cd1bf_test_bbox (Gnattest_T : in out Test_) renames Test_Get_Bounding_Box_test_bbox;
--  id:2.2/9cd1bf3522e0164e/Get_Bounding_Box/1/1/test_bbox/
   --  procedure Test_Get_Bounding_Box_test_bbox (Gnattest_T : in out Test_) is
--  end read only
--
--        pragma Unreferenced(Gnattest_T);
--
--     begin
--
--        if Value("DISPLAY", "")'Length = 0 then
--           Assert(True, "No display, can't test");
--           return;
--        end if;
--        Assert
--          (Get_Bounding_Box(Get_Main_Window) = (0, 0, 0, 0),
--           "Failed to get bounding box of the widget.");
--
--  begin read only
   --  end Test_Get_Bounding_Box_test_bbox;
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
end Tk.Grid.Test_Data.Tests;
