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
   procedure Wrap_Test_Add_09f411_a2bbe0
     (Widget: Tk_Widget;
      Options: Grid_Options := Grid_Options'(others => <>)) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Add1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Add(Widget, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Add1 test commitment violated");
      end;
   end Wrap_Test_Add_09f411_a2bbe0;
--  end read only

--  begin read only
   procedure Test_1_Add_test_add1(Gnattest_T: in out Test);
   procedure Test_Add_09f411_a2bbe0(Gnattest_T: in out Test) renames
     Test_1_Add_test_add1;
--  id:2.2/09f41181ba943205/Add/1/0/test_add1/
   procedure Test_1_Add_test_add1(Gnattest_T: in out Test) is
      procedure Add
        (Widget: Tk_Widget;
         Options: Grid_Options := Grid_Options'(others => <>)) renames
        Wrap_Test_Add_09f411_a2bbe0;
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
      Assert(Size(Get_Main_Window) = (1, 1), "Failed to add widget to grid.");
      Destroy(Button);

--  begin read only
   end Test_1_Add_test_add1;
--  end read only

--  begin read only
   procedure Wrap_Test_Add_6de79c_257591
     (Widgets: Widgets_Array;
      Options: Grid_Options := Grid_Options'(others => <>)) is
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
         Options: Grid_Options := Grid_Options'(others => <>)) renames
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
      Assert(Size(Get_Main_Window) = (2, 1), "Failed to add widgets to grid.");
      Destroy(Button1);
      Destroy(Button2);

--  begin read only
   end Test_2_Add_test_add2;
--  end read only

--  begin read only
   procedure Wrap_Test_Anchor_f6115f_f07f8d
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
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Anchor
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
   end Wrap_Test_Anchor_f6115f_f07f8d;
--  end read only

--  begin read only
   procedure Test_1_Anchor_test_anchor1(Gnattest_T: in out Test);
   procedure Test_Anchor_f6115f_f07f8d(Gnattest_T: in out Test) renames
     Test_1_Anchor_test_anchor1;
--  id:2.2/f6115f4660f7c654/Anchor/1/0/test_anchor1/
   procedure Test_1_Anchor_test_anchor1(Gnattest_T: in out Test) is
      procedure Anchor
        (Master: Tk_Widget; New_Direction: Directions_Type) renames
        Wrap_Test_Anchor_f6115f_f07f8d;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Anchor(Get_Main_Window, CENTER);
      Assert
        (Anchor(Get_Main_Window) = CENTER, "Failed to set anchor for grid.");

--  begin read only
   end Test_1_Anchor_test_anchor1;
--  end read only

--  begin read only
   function Wrap_Test_Anchor_ba152c_19ef1e
     (Master: Tk_Widget) return Directions_Type is
   begin
      begin
         pragma Assert(Master /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Anchor2 test requirement violated");
      end;
      declare
         Test_Anchor_ba152c_19ef1e_Result: constant Directions_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Anchor(Master);
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
         return Test_Anchor_ba152c_19ef1e_Result;
      end;
   end Wrap_Test_Anchor_ba152c_19ef1e;
--  end read only

--  begin read only
   procedure Test_2_Anchor_test_anchor2(Gnattest_T: in out Test);
   procedure Test_Anchor_ba152c_19ef1e(Gnattest_T: in out Test) renames
     Test_2_Anchor_test_anchor2;
--  id:2.2/ba152c408ddd1c97/Anchor/0/0/test_anchor2/
   procedure Test_2_Anchor_test_anchor2(Gnattest_T: in out Test) is
      function Anchor(Master: Tk_Widget) return Directions_Type renames
        Wrap_Test_Anchor_ba152c_19ef1e;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Anchor(Get_Main_Window) = CENTER, "Failed to get anchor for grid.");

--  begin read only
   end Test_2_Anchor_test_anchor2;
--  end read only

--  begin read only
   function Wrap_Test_BBox_90f6a1_896807
     (Master: Tk_Widget; Column, Row, Column2, Row2: Extended_Natural := -1)
      return BBox_Array is
   begin
      begin
         pragma Assert(Master /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_BBox test requirement violated");
      end;
      declare
         Test_BBox_90f6a1_896807_Result: constant BBox_Array :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.BBox
             (Master, Column, Row, Column2, Row2);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_BBox test commitment violated");
         end;
         return Test_BBox_90f6a1_896807_Result;
      end;
   end Wrap_Test_BBox_90f6a1_896807;
--  end read only

--  begin read only
   procedure Test_BBox_test_bbox(Gnattest_T: in out Test);
   procedure Test_BBox_90f6a1_896807(Gnattest_T: in out Test) renames
     Test_BBox_test_bbox;
--  id:2.2/90f6a11fb21fc5c6/BBox/1/0/test_bbox/
   procedure Test_BBox_test_bbox(Gnattest_T: in out Test) is
      function BBox
        (Master: Tk_Widget; Column, Row, Column2, Row2: Extended_Natural := -1)
         return BBox_Array renames
        Wrap_Test_BBox_90f6a1_896807;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (BBox(Get_Main_Window) = (0, 0, 0, 0),
         "Failed to get bounding box of the widget.");

--  begin read only
   end Test_BBox_test_bbox;
--  end read only

--  begin read only
   procedure Wrap_Test_Column_Configure_b41aca_3fef41
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) is
   begin
      begin
         pragma Assert
           (Master /= Null_Widget and Length(Child_Name) > 0 and
            Options /= Column_Options'(others => <>));
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
   end Wrap_Test_Column_Configure_b41aca_3fef41;
--  end read only

--  begin read only
   procedure Test_1_Column_Configure_test_column_configure1
     (Gnattest_T: in out Test);
   procedure Test_Column_Configure_b41aca_3fef41
     (Gnattest_T: in out Test) renames
     Test_1_Column_Configure_test_column_configure1;
--  id:2.2/b41aca7d33fda6d6/Column_Configure/1/0/test_column_configure1/
   procedure Test_1_Column_Configure_test_column_configure1
     (Gnattest_T: in out Test) is
      procedure Column_Configure
        (Master: Tk_Widget; Child_Name: Tcl_String;
         Options: Column_Options) renames
        Wrap_Test_Column_Configure_b41aca_3fef41;
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
        (Get_Main_Window, To_Tcl_String(Tk_PathName(Button)),
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
   procedure Wrap_Test_Column_Configure_dbcaa4_0c842f
     (Master, Child: Tk_Widget; Options: Column_Options) is
   begin
      begin
         pragma Assert
           (Master /= Null_Widget and Child /= Null_Widget and
            Options /= Column_Options'(others => <>));
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
   end Wrap_Test_Column_Configure_dbcaa4_0c842f;
--  end read only

--  begin read only
   procedure Test_2_Column_Configure_test_column_configure2
     (Gnattest_T: in out Test);
   procedure Test_Column_Configure_dbcaa4_0c842f
     (Gnattest_T: in out Test) renames
     Test_2_Column_Configure_test_column_configure2;
--  id:2.2/dbcaa489b9b4b4dc/Column_Configure/0/0/test_column_configure2/
   procedure Test_2_Column_Configure_test_column_configure2
     (Gnattest_T: in out Test) is
      procedure Column_Configure
        (Master, Child: Tk_Widget; Options: Column_Options) renames
        Wrap_Test_Column_Configure_dbcaa4_0c842f;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Column_Configure_test_column_configure2;
--  end read only

--  begin read only
   procedure Wrap_Test_Column_Configure_86279e_2e0251
     (Master: Tk_Widget; Column: Natural; Options: Column_Options) is
   begin
      begin
         pragma Assert
           (Master /= Null_Widget and
            Options /= Column_Options'(others => <>));
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
   end Wrap_Test_Column_Configure_86279e_2e0251;
--  end read only

--  begin read only
   procedure Test_3_Column_Configure_test_column_configure3
     (Gnattest_T: in out Test);
   procedure Test_Column_Configure_86279e_2e0251
     (Gnattest_T: in out Test) renames
     Test_3_Column_Configure_test_column_configure3;
--  id:2.2/86279edebadeb350/Column_Configure/0/0/test_column_configure3/
   procedure Test_3_Column_Configure_test_column_configure3
     (Gnattest_T: in out Test) is
      procedure Column_Configure
        (Master: Tk_Widget; Column: Natural; Options: Column_Options) renames
        Wrap_Test_Column_Configure_86279e_2e0251;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_3_Column_Configure_test_column_configure3;
--  end read only

--  begin read only
   function Wrap_Test_Get_Column_Options_02d8cd_93c021
     (Master: Tk_Widget; Child_Name: Tcl_String) return Column_Options is
   begin
      begin
         pragma Assert(Master /= Null_Widget and Length(Child_Name) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Get_Column_Options1 test requirement violated");
      end;
      declare
         Test_Get_Column_Options_02d8cd_93c021_Result: constant Column_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Column_Options
             (Master, Child_Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Get_Column_Options1 test commitment violated");
         end;
         return Test_Get_Column_Options_02d8cd_93c021_Result;
      end;
   end Wrap_Test_Get_Column_Options_02d8cd_93c021;
--  end read only

--  begin read only
   procedure Test_1_Get_Column_Options_test_get_column_options1
     (Gnattest_T: in out Test);
   procedure Test_Get_Column_Options_02d8cd_93c021
     (Gnattest_T: in out Test) renames
     Test_1_Get_Column_Options_test_get_column_options1;
--  id:2.2/02d8cd9f16af9f26/Get_Column_Options/1/0/test_get_column_options1/
   procedure Test_1_Get_Column_Options_test_get_column_options1
     (Gnattest_T: in out Test) is
      function Get_Column_Options
        (Master: Tk_Widget; Child_Name: Tcl_String)
         return Column_Options renames
        Wrap_Test_Get_Column_Options_02d8cd_93c021;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_1_Get_Column_Options_test_get_column_options1;
--  end read only

--  begin read only
   function Wrap_Test_Get_Column_Options_3907c1_97f573
     (Master, Child: Tk_Widget) return Column_Options is
   begin
      begin
         pragma Assert(Master /= Null_Widget and Child /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Get_Column_Options2 test requirement violated");
      end;
      declare
         Test_Get_Column_Options_3907c1_97f573_Result: constant Column_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Column_Options
             (Master, Child);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Get_Column_Options2 test commitment violated");
         end;
         return Test_Get_Column_Options_3907c1_97f573_Result;
      end;
   end Wrap_Test_Get_Column_Options_3907c1_97f573;
--  end read only

--  begin read only
   procedure Test_2_Get_Column_Options_test_get_column_options2
     (Gnattest_T: in out Test);
   procedure Test_Get_Column_Options_3907c1_97f573
     (Gnattest_T: in out Test) renames
     Test_2_Get_Column_Options_test_get_column_options2;
--  id:2.2/3907c1538c70aea7/Get_Column_Options/0/0/test_get_column_options2/
   procedure Test_2_Get_Column_Options_test_get_column_options2
     (Gnattest_T: in out Test) is
      function Get_Column_Options
        (Master, Child: Tk_Widget) return Column_Options renames
        Wrap_Test_Get_Column_Options_3907c1_97f573;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Get_Column_Options_test_get_column_options2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Column_Options_22be63_704ef0
     (Master: Tk_Widget; Column: Natural) return Column_Options is
   begin
      begin
         pragma Assert(Master /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Get_Column_Options3 test requirement violated");
      end;
      declare
         Test_Get_Column_Options_22be63_704ef0_Result: constant Column_Options :=
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
                  "ens_sloc(tk-grid.ads:0:):Test_Get_Column_Options3 test commitment violated");
         end;
         return Test_Get_Column_Options_22be63_704ef0_Result;
      end;
   end Wrap_Test_Get_Column_Options_22be63_704ef0;
--  end read only

--  begin read only
   procedure Test_3_Get_Column_Options_test_get_column_options3
     (Gnattest_T: in out Test);
   procedure Test_Get_Column_Options_22be63_704ef0
     (Gnattest_T: in out Test) renames
     Test_3_Get_Column_Options_test_get_column_options3;
--  id:2.2/22be6327e6c5ccd3/Get_Column_Options/0/0/test_get_column_options3/
   procedure Test_3_Get_Column_Options_test_get_column_options3
     (Gnattest_T: in out Test) is
      function Get_Column_Options
        (Master: Tk_Widget; Column: Natural) return Column_Options renames
        Wrap_Test_Get_Column_Options_22be63_704ef0;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_3_Get_Column_Options_test_get_column_options3;
--  end read only

--  begin read only
   procedure Wrap_Test_Configure_c67185_affd8d
     (Widget: Tk_Widget; Options: Grid_Options) is
   begin
      begin
         pragma Assert
           (Widget /= Null_Widget and Options /= Grid_Options'(others => <>));
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Configure1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Configure(Widget, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Configure1 test commitment violated");
      end;
   end Wrap_Test_Configure_c67185_affd8d;
--  end read only

--  begin read only
   procedure Test_1_Configure_test_configure1(Gnattest_T: in out Test);
   procedure Test_Configure_c67185_affd8d(Gnattest_T: in out Test) renames
     Test_1_Configure_test_configure1;
--  id:2.2/c6718582592dc115/Configure/1/0/test_configure1/
   procedure Test_1_Configure_test_configure1(Gnattest_T: in out Test) is
      procedure Configure(Widget: Tk_Widget; Options: Grid_Options) renames
        Wrap_Test_Configure_c67185_affd8d;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_1_Configure_test_configure1;
--  end read only

--  begin read only
   procedure Wrap_Test_Configure_f31b66_5acddf
     (Widgets: Widgets_Array; Options: Grid_Options) is
   begin
      begin
         pragma Assert
           (Widgets'Length > 0 and Options /= Grid_Options'(others => <>));
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
   end Wrap_Test_Configure_f31b66_5acddf;
--  end read only

--  begin read only
   procedure Test_2_Configure_test_configure2(Gnattest_T: in out Test);
   procedure Test_Configure_f31b66_5acddf(Gnattest_T: in out Test) renames
     Test_2_Configure_test_configure2;
--  id:2.2/f31b66078cc53553/Configure/0/0/test_configure2/
   procedure Test_2_Configure_test_configure2(Gnattest_T: in out Test) is
      procedure Configure
        (Widgets: Widgets_Array; Options: Grid_Options) renames
        Wrap_Test_Configure_f31b66_5acddf;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Configure_test_configure2;
--  end read only

--  begin read only
   procedure Wrap_Test_Forget_7f8bc2_733820(Widget: Tk_Widget) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Forget1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Forget(Widget);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Forget1 test commitment violated");
      end;
   end Wrap_Test_Forget_7f8bc2_733820;
--  end read only

--  begin read only
   procedure Test_1_Forget_test_forget1(Gnattest_T: in out Test);
   procedure Test_Forget_7f8bc2_733820(Gnattest_T: in out Test) renames
     Test_1_Forget_test_forget1;
--  id:2.2/7f8bc223a819d0d3/Forget/1/0/test_forget1/
   procedure Test_1_Forget_test_forget1(Gnattest_T: in out Test) is
      procedure Forget(Widget: Tk_Widget) renames
        Wrap_Test_Forget_7f8bc2_733820;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

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

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Forget_test_forget2;
--  end read only

--  begin read only
   function Wrap_Test_Info_5c8f4b_40cc67
     (Widget: Tk_Widget) return Grid_Options is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Info test requirement violated");
      end;
      declare
         Test_Info_5c8f4b_40cc67_Result: constant Grid_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Info(Widget);
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
         return Test_Info_5c8f4b_40cc67_Result;
      end;
   end Wrap_Test_Info_5c8f4b_40cc67;
--  end read only

--  begin read only
   procedure Test_Info_test_info(Gnattest_T: in out Test);
   procedure Test_Info_5c8f4b_40cc67(Gnattest_T: in out Test) renames
     Test_Info_test_info;
--  id:2.2/5c8f4bc2598409c3/Info/1/0/test_info/
   procedure Test_Info_test_info(Gnattest_T: in out Test) is
      function Info(Widget: Tk_Widget) return Grid_Options renames
        Wrap_Test_Info_5c8f4b_40cc67;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Info_test_info;
--  end read only

--  begin read only
   function Wrap_Test_Location_01f15c_74cec4
     (Master: Tk_Widget; X, Y: Pixel_Data) return Result_Array is
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
         Test_Location_01f15c_74cec4_Result: constant Result_Array :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Location(Master, X, Y);
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
         return Test_Location_01f15c_74cec4_Result;
      end;
   end Wrap_Test_Location_01f15c_74cec4;
--  end read only

--  begin read only
   procedure Test_Location_test_location(Gnattest_T: in out Test);
   procedure Test_Location_01f15c_74cec4(Gnattest_T: in out Test) renames
     Test_Location_test_location;
--  id:2.2/01f15c117585542f/Location/1/0/test_location/
   procedure Test_Location_test_location(Gnattest_T: in out Test) is
      function Location
        (Master: Tk_Widget; X, Y: Pixel_Data) return Result_Array renames
        Wrap_Test_Location_01f15c_74cec4;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Location_test_location;
--  end read only

--  begin read only
   procedure Wrap_Test_Propagate_eff519_e08f8c
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
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Propagate(Master, Enable);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Propagate1 test commitment violated");
      end;
   end Wrap_Test_Propagate_eff519_e08f8c;
--  end read only

--  begin read only
   procedure Test_1_Propagate_test_propagate1(Gnattest_T: in out Test);
   procedure Test_Propagate_eff519_e08f8c(Gnattest_T: in out Test) renames
     Test_1_Propagate_test_propagate1;
--  id:2.2/eff5196af307b2c0/Propagate/1/0/test_propagate1/
   procedure Test_1_Propagate_test_propagate1(Gnattest_T: in out Test) is
      procedure Propagate(Master: Tk_Widget; Enable: Boolean := True) renames
        Wrap_Test_Propagate_eff519_e08f8c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_1_Propagate_test_propagate1;
--  end read only

--  begin read only
   function Wrap_Test_Propagate_306472_142129
     (Master: Tk_Widget) return Boolean is
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
         Test_Propagate_306472_142129_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Propagate(Master);
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
         return Test_Propagate_306472_142129_Result;
      end;
   end Wrap_Test_Propagate_306472_142129;
--  end read only

--  begin read only
   procedure Test_2_Propagate_test_propagate2(Gnattest_T: in out Test);
   procedure Test_Propagate_306472_142129(Gnattest_T: in out Test) renames
     Test_2_Propagate_test_propagate2;
--  id:2.2/3064720494e58f43/Propagate/0/0/test_propagate2/
   procedure Test_2_Propagate_test_propagate2(Gnattest_T: in out Test) is
      function Propagate(Master: Tk_Widget) return Boolean renames
        Wrap_Test_Propagate_306472_142129;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Propagate_test_propagate2;
--  end read only

--  begin read only
   procedure Wrap_Test_Row_Configure_cd10c1_511651
     (Master: Tk_Widget; Child_Name: Tcl_String; Options: Column_Options) is
   begin
      begin
         pragma Assert
           (Master /= Null_Widget and Length(Child_Name) > 0 and
            Options /= Column_Options'(others => <>));
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
   end Wrap_Test_Row_Configure_cd10c1_511651;
--  end read only

--  begin read only
   procedure Test_1_Row_Configure_test_row_configure1(Gnattest_T: in out Test);
   procedure Test_Row_Configure_cd10c1_511651(Gnattest_T: in out Test) renames
     Test_1_Row_Configure_test_row_configure1;
--  id:2.2/cd10c14861fb1027/Row_Configure/1/0/test_row_configure1/
   procedure Test_1_Row_Configure_test_row_configure1
     (Gnattest_T: in out Test) is
      procedure Row_Configure
        (Master: Tk_Widget; Child_Name: Tcl_String;
         Options: Column_Options) renames
        Wrap_Test_Row_Configure_cd10c1_511651;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_1_Row_Configure_test_row_configure1;
--  end read only

--  begin read only
   procedure Wrap_Test_Row_Configure_0a2e60_b77dc7
     (Master, Child: Tk_Widget; Options: Column_Options) is
   begin
      begin
         pragma Assert
           (Master /= Null_Widget and Child /= Null_Widget and
            Options /= Column_Options'(others => <>));
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
   end Wrap_Test_Row_Configure_0a2e60_b77dc7;
--  end read only

--  begin read only
   procedure Test_2_Row_Configure_test_row_configure2(Gnattest_T: in out Test);
   procedure Test_Row_Configure_0a2e60_b77dc7(Gnattest_T: in out Test) renames
     Test_2_Row_Configure_test_row_configure2;
--  id:2.2/0a2e60e5acb5492e/Row_Configure/0/0/test_row_configure2/
   procedure Test_2_Row_Configure_test_row_configure2
     (Gnattest_T: in out Test) is
      procedure Row_Configure
        (Master, Child: Tk_Widget; Options: Column_Options) renames
        Wrap_Test_Row_Configure_0a2e60_b77dc7;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Row_Configure_test_row_configure2;
--  end read only

--  begin read only
   procedure Wrap_Test_Row_Configure_7261aa_7ae33c
     (Master: Tk_Widget; Row: Natural; Options: Column_Options) is
   begin
      begin
         pragma Assert
           (Master /= Null_Widget and
            Options /= Column_Options'(others => <>));
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
   end Wrap_Test_Row_Configure_7261aa_7ae33c;
--  end read only

--  begin read only
   procedure Test_3_Row_Configure_test_row_configure3(Gnattest_T: in out Test);
   procedure Test_Row_Configure_7261aa_7ae33c(Gnattest_T: in out Test) renames
     Test_3_Row_Configure_test_row_configure3;
--  id:2.2/7261aa6fcbc4a5c1/Row_Configure/0/0/test_row_configure3/
   procedure Test_3_Row_Configure_test_row_configure3
     (Gnattest_T: in out Test) is
      procedure Row_Configure
        (Master: Tk_Widget; Row: Natural; Options: Column_Options) renames
        Wrap_Test_Row_Configure_7261aa_7ae33c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_3_Row_Configure_test_row_configure3;
--  end read only

--  begin read only
   function Wrap_Test_Get_Row_Options_f06da0_afca59
     (Master: Tk_Widget; Index: Tcl_String) return Column_Options is
   begin
      begin
         pragma Assert(Master /= Null_Widget and Length(Index) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Get_Row_Options1 test requirement violated");
      end;
      declare
         Test_Get_Row_Options_f06da0_afca59_Result: constant Column_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Row_Options
             (Master, Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Get_Row_Options1 test commitment violated");
         end;
         return Test_Get_Row_Options_f06da0_afca59_Result;
      end;
   end Wrap_Test_Get_Row_Options_f06da0_afca59;
--  end read only

--  begin read only
   procedure Test_1_Get_Row_Options_test_get_row_options1
     (Gnattest_T: in out Test);
   procedure Test_Get_Row_Options_f06da0_afca59
     (Gnattest_T: in out Test) renames
     Test_1_Get_Row_Options_test_get_row_options1;
--  id:2.2/f06da00ef3fd3889/Get_Row_Options/1/0/test_get_row_options1/
   procedure Test_1_Get_Row_Options_test_get_row_options1
     (Gnattest_T: in out Test) is
      function Get_Row_Options
        (Master: Tk_Widget; Index: Tcl_String) return Column_Options renames
        Wrap_Test_Get_Row_Options_f06da0_afca59;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_1_Get_Row_Options_test_get_row_options1;
--  end read only

--  begin read only
   function Wrap_Test_Get_Row_Options_ad0ab6_b76bf6
     (Master, Child: Tk_Widget) return Column_Options is
   begin
      begin
         pragma Assert(Master /= Null_Widget and Child /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Get_Row_Options2 test requirement violated");
      end;
      declare
         Test_Get_Row_Options_ad0ab6_b76bf6_Result: constant Column_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Get_Row_Options
             (Master, Child);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-grid.ads:0:):Test_Get_Row_Options2 test commitment violated");
         end;
         return Test_Get_Row_Options_ad0ab6_b76bf6_Result;
      end;
   end Wrap_Test_Get_Row_Options_ad0ab6_b76bf6;
--  end read only

--  begin read only
   procedure Test_2_Get_Row_Options_test_get_row_options2
     (Gnattest_T: in out Test);
   procedure Test_Get_Row_Options_ad0ab6_b76bf6
     (Gnattest_T: in out Test) renames
     Test_2_Get_Row_Options_test_get_row_options2;
--  id:2.2/ad0ab6d4166abad9/Get_Row_Options/0/0/test_get_row_options2/
   procedure Test_2_Get_Row_Options_test_get_row_options2
     (Gnattest_T: in out Test) is
      function Get_Row_Options
        (Master, Child: Tk_Widget) return Column_Options renames
        Wrap_Test_Get_Row_Options_ad0ab6_b76bf6;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Get_Row_Options_test_get_row_options2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Row_Options_192829_db509c
     (Master: Tk_Widget; Row: Natural) return Column_Options is
   begin
      begin
         pragma Assert(Master /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Get_Row_Options3 test requirement violated");
      end;
      declare
         Test_Get_Row_Options_192829_db509c_Result: constant Column_Options :=
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
                  "ens_sloc(tk-grid.ads:0:):Test_Get_Row_Options3 test commitment violated");
         end;
         return Test_Get_Row_Options_192829_db509c_Result;
      end;
   end Wrap_Test_Get_Row_Options_192829_db509c;
--  end read only

--  begin read only
   procedure Test_3_Get_Row_Options_test_get_row_options3
     (Gnattest_T: in out Test);
   procedure Test_Get_Row_Options_192829_db509c
     (Gnattest_T: in out Test) renames
     Test_3_Get_Row_Options_test_get_row_options3;
--  id:2.2/192829f3d87ab7ca/Get_Row_Options/0/0/test_get_row_options3/
   procedure Test_3_Get_Row_Options_test_get_row_options3
     (Gnattest_T: in out Test) is
      function Get_Row_Options
        (Master: Tk_Widget; Row: Natural) return Column_Options renames
        Wrap_Test_Get_Row_Options_192829_db509c;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_3_Get_Row_Options_test_get_row_options3;
--  end read only

--  begin read only
   procedure Wrap_Test_Remove_cf1782_6e3cf8(Widget: Tk_Widget) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-grid.ads:0):Test_Remove1 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Grid.Remove(Widget);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-grid.ads:0:):Test_Remove1 test commitment violated");
      end;
   end Wrap_Test_Remove_cf1782_6e3cf8;
--  end read only

--  begin read only
   procedure Test_1_Remove_test_remove1(Gnattest_T: in out Test);
   procedure Test_Remove_cf1782_6e3cf8(Gnattest_T: in out Test) renames
     Test_1_Remove_test_remove1;
--  id:2.2/cf1782113fce8963/Remove/1/0/test_remove1/
   procedure Test_1_Remove_test_remove1(Gnattest_T: in out Test) is
      procedure Remove(Widget: Tk_Widget) renames
        Wrap_Test_Remove_cf1782_6e3cf8;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

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

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Remove_test_remove2;
--  end read only

--  begin read only
   function Wrap_Test_Size_ec983b_a60758
     (Master: Tk_Widget) return Result_Array is
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
         Test_Size_ec983b_a60758_Result: constant Result_Array :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Size(Master);
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
         return Test_Size_ec983b_a60758_Result;
      end;
   end Wrap_Test_Size_ec983b_a60758;
--  end read only

--  begin read only
   procedure Test_Size_test_size(Gnattest_T: in out Test);
   procedure Test_Size_ec983b_a60758(Gnattest_T: in out Test) renames
     Test_Size_test_size;
--  id:2.2/ec983b0cc0c0c3f1/Size/1/0/test_size/
   procedure Test_Size_test_size(Gnattest_T: in out Test) is
      function Size(Master: Tk_Widget) return Result_Array renames
        Wrap_Test_Size_ec983b_a60758;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Size_test_size;
--  end read only

--  begin read only
   function Wrap_Test_Slaves_3ea16d_8c1fbf
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
         Test_Slaves_3ea16d_8c1fbf_Result: constant Widgets_Array :=
           GNATtest_Generated.GNATtest_Standard.Tk.Grid.Slaves
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
         return Test_Slaves_3ea16d_8c1fbf_Result;
      end;
   end Wrap_Test_Slaves_3ea16d_8c1fbf;
--  end read only

--  begin read only
   procedure Test_Slaves_test_slaves(Gnattest_T: in out Test);
   procedure Test_Slaves_3ea16d_8c1fbf(Gnattest_T: in out Test) renames
     Test_Slaves_test_slaves;
--  id:2.2/3ea16d2234b5d0f2/Slaves/1/0/test_slaves/
   procedure Test_Slaves_test_slaves(Gnattest_T: in out Test) is
      function Slaves
        (Master: Tk_Widget; Row, Column: Extended_Natural := -1)
         return Widgets_Array renames
        Wrap_Test_Slaves_3ea16d_8c1fbf;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Slaves_test_slaves;
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
