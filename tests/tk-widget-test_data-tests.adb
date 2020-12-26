--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Widget.Test_Data.

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

--  begin read only
--  end read only
package body Tk.Widget.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Widgets_Array_Image_8ee9dc_b1233a
     (Widgets: Widgets_Array) return String is
   begin
      begin
         pragma Assert(Widgets'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Widgets_Array_Image test requirement violated");
      end;
      declare
         Test_Widgets_Array_Image_8ee9dc_b1233a_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Widgets_Array_Image
             (Widgets);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Widgets_Array_Image test commitment violated");
         end;
         return Test_Widgets_Array_Image_8ee9dc_b1233a_Result;
      end;
   end Wrap_Test_Widgets_Array_Image_8ee9dc_b1233a;
--  end read only

--  begin read only
   procedure Test_Widgets_Array_Image_test_widgets_array_image
     (Gnattest_T: in out Test);
   procedure Test_Widgets_Array_Image_8ee9dc_b1233a
     (Gnattest_T: in out Test) renames
     Test_Widgets_Array_Image_test_widgets_array_image;
--  id:2.2/8ee9dccd40bd054f/Widgets_Array_Image/1/0/test_widgets_array_image/
   procedure Test_Widgets_Array_Image_test_widgets_array_image
     (Gnattest_T: in out Test) is
      function Widgets_Array_Image
        (Widgets: Widgets_Array) return String renames
        Wrap_Test_Widgets_Array_Image_8ee9dc_b1233a;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button1: Tk_Button;
      Button2: Tk_Button;
      Widgets: Widgets_Array(1 .. 2);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button1, ".mybutton1", Button_Options'(others => <>));
      Create(Button2, ".mybutton2", Button_Options'(others => <>));
      Widgets := (Button1, Button2);
      Assert
        (Widgets_Array_Image(Widgets) = ".mybutton1 .mybutton2",
         "Invalid image for Widgets_Array");
      Destroy(Button1);
      Destroy(Button2);

--  begin read only
   end Test_Widgets_Array_Image_test_widgets_array_image;
--  end read only

--  begin read only
   function Wrap_Test_Pixel_Data_Value_1cddc7_2c1c37
     (Value: String) return Pixel_Data is
   begin
      begin
         pragma Assert(Value'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Pixel_Data_Value test requirement violated");
      end;
      declare
         Test_Pixel_Data_Value_1cddc7_2c1c37_Result: constant Pixel_Data :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Pixel_Data_Value
             (Value);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Pixel_Data_Value test commitment violated");
         end;
         return Test_Pixel_Data_Value_1cddc7_2c1c37_Result;
      end;
   end Wrap_Test_Pixel_Data_Value_1cddc7_2c1c37;
--  end read only

--  begin read only
   procedure Test_Pixel_Data_Value_test_pixel_data_value
     (Gnattest_T: in out Test);
   procedure Test_Pixel_Data_Value_1cddc7_2c1c37
     (Gnattest_T: in out Test) renames
     Test_Pixel_Data_Value_test_pixel_data_value;
--  id:2.2/1cddc72f48314db2/Pixel_Data_Value/1/0/test_pixel_data_value/
   procedure Test_Pixel_Data_Value_test_pixel_data_value
     (Gnattest_T: in out Test) is
      function Pixel_Data_Value(Value: String) return Pixel_Data renames
        Wrap_Test_Pixel_Data_Value_1cddc7_2c1c37;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Pixel: Pixel_Data;

   begin

      Pixel := Pixel_Data_Value("2c");
      Assert
        (Pixel.Value = 2.0 and Pixel.Value_Unit = C,
         "Invalid value for pixel data from string conversion.");

--  begin read only
   end Test_Pixel_Data_Value_test_pixel_data_value;
--  end read only

--  begin read only
   function Wrap_Test_Get_Widget_331ad1_ff97b7
     (Path_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Widget is
   begin
      begin
         pragma Assert
           (Path_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Get_Widget test requirement violated");
      end;
      declare
         Test_Get_Widget_331ad1_ff97b7_Result: constant Tk_Widget :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Get_Widget
             (Path_Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Get_Widget test commitment violated");
         end;
         return Test_Get_Widget_331ad1_ff97b7_Result;
      end;
   end Wrap_Test_Get_Widget_331ad1_ff97b7;
--  end read only

--  begin read only
   procedure Test_Get_Widget_test_get_widget(Gnattest_T: in out Test);
   procedure Test_Get_Widget_331ad1_ff97b7(Gnattest_T: in out Test) renames
     Test_Get_Widget_test_get_widget;
--  id:2.2/331ad1a0fc5269a6/Get_Widget/1/0/test_get_widget/
   procedure Test_Get_Widget_test_get_widget(Gnattest_T: in out Test) is
      function Get_Widget
        (Path_Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Tk_Widget renames
        Wrap_Test_Get_Widget_331ad1_ff97b7;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Create(Button, ".mybutton2", Button_Options'(others => <>));
      Button := Get_Widget(".mybutton");
      Assert
        (Tk_PathName(Button) = ".mybutton",
         "Failed to get the proper widget with Get_Widget.");
      Destroy(Button);
      Button := Get_Widget(".mybutton2");
      Destroy(Button);

--  begin read only
   end Test_Get_Widget_test_get_widget;
--  end read only

--  begin read only
   function Wrap_Test_Tk_PathName_5d8a2d_973bfa
     (Widget: Tk_Widget) return String is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Tk_PathName test requirement violated");
      end;
      declare
         Test_Tk_PathName_5d8a2d_973bfa_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Tk_PathName(Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Tk_PathName test commitment violated");
         end;
         return Test_Tk_PathName_5d8a2d_973bfa_Result;
      end;
   end Wrap_Test_Tk_PathName_5d8a2d_973bfa;
--  end read only

--  begin read only
   procedure Test_Tk_PathName_test_tk_pathname(Gnattest_T: in out Test);
   procedure Test_Tk_PathName_5d8a2d_973bfa(Gnattest_T: in out Test) renames
     Test_Tk_PathName_test_tk_pathname;
--  id:2.2/5d8a2d6dc39e2caa/Tk_PathName/1/0/test_tk_pathname/
   procedure Test_Tk_PathName_test_tk_pathname(Gnattest_T: in out Test) is
      function Tk_PathName(Widget: Tk_Widget) return String renames
        Wrap_Test_Tk_PathName_5d8a2d_973bfa;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Assert
        (Tk_PathName(Button) = ".mybutton",
         "Failed to get Tk pathname for the selected widget.");
      Destroy(Button);

--  begin read only
   end Test_Tk_PathName_test_tk_pathname;
--  end read only

--  begin read only
   function Wrap_Test_Tk_Interp_37dfaa_524841
     (Widget: Tk_Widget) return Tcl_Interpreter is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Tk_Interp test requirement violated");
      end;
      declare
         Test_Tk_Interp_37dfaa_524841_Result: constant Tcl_Interpreter :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Tk_Interp(Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Tk_Interp test commitment violated");
         end;
         return Test_Tk_Interp_37dfaa_524841_Result;
      end;
   end Wrap_Test_Tk_Interp_37dfaa_524841;
--  end read only

--  begin read only
   procedure Test_Tk_Interp_test_tk_interp(Gnattest_T: in out Test);
   procedure Test_Tk_Interp_37dfaa_524841(Gnattest_T: in out Test) renames
     Test_Tk_Interp_test_tk_interp;
--  id:2.2/37dfaac7975d5a6d/Tk_Interp/1/0/test_tk_interp/
   procedure Test_Tk_Interp_test_tk_interp(Gnattest_T: in out Test) is
      function Tk_Interp(Widget: Tk_Widget) return Tcl_Interpreter renames
        Wrap_Test_Tk_Interp_37dfaa_524841;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton2", Button_Options'(others => <>));
      Assert
        (Tk_Interp(Button) /= Null_Interpreter,
         "Failed to get Tk interpreter for the selected widget.");
      Destroy(Button);

--  begin read only
   end Test_Tk_Interp_test_tk_interp;
--  end read only

--  begin read only
   function Wrap_Test_Tk_Window_Id_08bdcd_dcb47c
     (Widget: Tk_Widget) return Tk_Window is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Tk_Window_Id test requirement violated");
      end;
      declare
         Test_Tk_Window_Id_08bdcd_dcb47c_Result: constant Tk_Window :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Tk_Window_Id(Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Tk_Window_Id test commitment violated");
         end;
         return Test_Tk_Window_Id_08bdcd_dcb47c_Result;
      end;
   end Wrap_Test_Tk_Window_Id_08bdcd_dcb47c;
--  end read only

--  begin read only
   procedure Test_Tk_Window_Id_test_tk_window_id(Gnattest_T: in out Test);
   procedure Test_Tk_Window_Id_08bdcd_dcb47c(Gnattest_T: in out Test) renames
     Test_Tk_Window_Id_test_tk_window_id;
--  id:2.2/08bdcd5144a32481/Tk_Window_Id/1/0/test_tk_window_id/
   procedure Test_Tk_Window_Id_test_tk_window_id(Gnattest_T: in out Test) is
      function Tk_Window_Id(Widget: Tk_Widget) return Tk_Window renames
        Wrap_Test_Tk_Window_Id_08bdcd_dcb47c;
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
      Tcl_Eval("update");
      Assert
        (Tk_Window_Id(Button) /= Null_Window,
         "Failed to get pointer to Tk_Window for the selected widget.");
      Destroy(Button);

--  begin read only
   end Test_Tk_Window_Id_test_tk_window_id;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_df3576_53f0ec
     (Name: String; Value: Tcl_String;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_Tcl_String test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_Tcl_String test commitment violated");
      end;
   end Wrap_Test_Option_Image_df3576_53f0ec;
--  end read only

--  begin read only
   procedure Test_1_Option_Image_test_option_image_tcl_string
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_df3576_53f0ec(Gnattest_T: in out Test) renames
     Test_1_Option_Image_test_option_image_tcl_string;
--  id:2.2/df35765d5c552ca5/Option_Image/1/0/test_option_image_tcl_string/
   procedure Test_1_Option_Image_test_option_image_tcl_string
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Tcl_String;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_df3576_53f0ec;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Options_String: Unbounded_String;

   begin

      Option_Image("myoption", To_Tcl_String("myvalue"), Options_String);
      Assert
        (To_String(Options_String) = " -myoption myvalue",
         "Failed to get image for Tcl_String option");

--  begin read only
   end Test_1_Option_Image_test_option_image_tcl_string;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_63348c_5cc1ad
     (Name: String; Value: Extended_Natural;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_Extended_Natural test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_Extended_Natural test commitment violated");
      end;
   end Wrap_Test_Option_Image_63348c_5cc1ad;
--  end read only

--  begin read only
   procedure Test_2_Option_Image_test_option_image_extended_natural
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_63348c_5cc1ad(Gnattest_T: in out Test) renames
     Test_2_Option_Image_test_option_image_extended_natural;
--  id:2.2/63348cfcb5ac0347/Option_Image/0/0/test_option_image_extended_natural/
   procedure Test_2_Option_Image_test_option_image_extended_natural
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Extended_Natural;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_63348c_5cc1ad;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Options_String: Unbounded_String;

   begin

      Option_Image("myoption", Extended_Natural(10), Options_String);
      Assert
        (To_String(Options_String) = " -myoption 10",
         "Failed to get image for Extended_Natural option");

--  begin read only
   end Test_2_Option_Image_test_option_image_extended_natural;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_a5c722_ce612d
     (Name: String; Value: Pixel_Data;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_Pixed_Data test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_Pixed_Data test commitment violated");
      end;
   end Wrap_Test_Option_Image_a5c722_ce612d;
--  end read only

--  begin read only
   procedure Test_3_Option_Image_test_option_image_pixed_data
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_a5c722_ce612d(Gnattest_T: in out Test) renames
     Test_3_Option_Image_test_option_image_pixed_data;
--  id:2.2/a5c722c1bd7d0d8c/Option_Image/0/0/test_option_image_pixed_data/
   procedure Test_3_Option_Image_test_option_image_pixed_data
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Pixel_Data;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_a5c722_ce612d;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_3_Option_Image_test_option_image_pixed_data;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_5707c3_208fae
     (Name: String; Value: Relief_Type;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_Relief_Type test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_Relief_Type test commitment violated");
      end;
   end Wrap_Test_Option_Image_5707c3_208fae;
--  end read only

--  begin read only
   procedure Test_4_Option_Image_test_option_image_relief_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_5707c3_208fae(Gnattest_T: in out Test) renames
     Test_4_Option_Image_test_option_image_relief_type;
--  id:2.2/5707c3a9dd1ecf93/Option_Image/0/0/test_option_image_relief_type/
   procedure Test_4_Option_Image_test_option_image_relief_type
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Relief_Type;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_5707c3_208fae;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_4_Option_Image_test_option_image_relief_type;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_a39172_0792dc
     (Name: String; Value: State_Type;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_State_Type test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_State_Type test commitment violated");
      end;
   end Wrap_Test_Option_Image_a39172_0792dc;
--  end read only

--  begin read only
   procedure Test_5_Option_Image_test_option_image_state_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_a39172_0792dc(Gnattest_T: in out Test) renames
     Test_5_Option_Image_test_option_image_state_type;
--  id:2.2/a391724162d5b3c0/Option_Image/0/0/test_option_image_state_type/
   procedure Test_5_Option_Image_test_option_image_state_type
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: State_Type;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_a39172_0792dc;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_5_Option_Image_test_option_image_state_type;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_9aff01_51f5f4
     (Name: String; Value: Directions_Type;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_Directions_Type test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_Directions_Type test commitment violated");
      end;
   end Wrap_Test_Option_Image_9aff01_51f5f4;
--  end read only

--  begin read only
   procedure Test_6_Option_Image_test_option_image_directions_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_9aff01_51f5f4(Gnattest_T: in out Test) renames
     Test_6_Option_Image_test_option_image_directions_type;
--  id:2.2/9aff013d5cf41ab0/Option_Image/0/0/test_option_image_directions_type/
   procedure Test_6_Option_Image_test_option_image_directions_type
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Directions_Type;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_9aff01_51f5f4;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_6_Option_Image_test_option_image_directions_type;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_6245ae_247131
     (Name: String; Value: Place_Type;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_Place_Type test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_Place_Type test commitment violated");
      end;
   end Wrap_Test_Option_Image_6245ae_247131;
--  end read only

--  begin read only
   procedure Test_7_Option_Image_test_option_image_place_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_6245ae_247131(Gnattest_T: in out Test) renames
     Test_7_Option_Image_test_option_image_place_type;
--  id:2.2/6245aed24fd272d7/Option_Image/0/0/test_option_image_place_type/
   procedure Test_7_Option_Image_test_option_image_place_type
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Place_Type;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_6245ae_247131;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_7_Option_Image_test_option_image_place_type;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_509411_31f5ae
     (Name: String; Value: Justify_Type;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_Justify_Type test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_Justify_Type test commitment violated");
      end;
   end Wrap_Test_Option_Image_509411_31f5ae;
--  end read only

--  begin read only
   procedure Test_8_Option_Image_test_option_image_justify_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_509411_31f5ae(Gnattest_T: in out Test) renames
     Test_8_Option_Image_test_option_image_justify_type;
--  id:2.2/509411649995311a/Option_Image/0/0/test_option_image_justify_type/
   procedure Test_8_Option_Image_test_option_image_justify_type
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Justify_Type;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_509411_31f5ae;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_8_Option_Image_test_option_image_justify_type;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_219f6d_cd5c79
     (Name: String; Value: Pad_Array;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_Pad_Array test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_Pad_Array test commitment violated");
      end;
   end Wrap_Test_Option_Image_219f6d_cd5c79;
--  end read only

--  begin read only
   procedure Test_9_Option_Image_test_option_image_pad_array
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_219f6d_cd5c79(Gnattest_T: in out Test) renames
     Test_9_Option_Image_test_option_image_pad_array;
--  id:2.2/219f6dc9998e100f/Option_Image/0/0/test_option_image_pad_array/
   procedure Test_9_Option_Image_test_option_image_pad_array
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Pad_Array;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_219f6d_cd5c79;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_9_Option_Image_test_option_image_pad_array;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_22581b_a1b982
     (Name: String; Value: Tk_Widget;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_Tk_Widget test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_Tk_Widget test commitment violated");
      end;
   end Wrap_Test_Option_Image_22581b_a1b982;
--  end read only

--  begin read only
   procedure Test_10_Option_Image_test_option_image_tk_widget
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_22581b_a1b982(Gnattest_T: in out Test) renames
     Test_10_Option_Image_test_option_image_tk_widget;
--  id:2.2/22581b562d182ab3/Option_Image/0/0/test_option_image_tk_widget/
   procedure Test_10_Option_Image_test_option_image_tk_widget
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Tk_Widget;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_22581b_a1b982;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_10_Option_Image_test_option_image_tk_widget;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_08d32e_f8251b
     (Name: String; Value: Extended_Boolean;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_Extended_Boolean test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_Extended_Boolean test commitment violated");
      end;
   end Wrap_Test_Option_Image_08d32e_f8251b;
--  end read only

--  begin read only
   procedure Test_11_Option_Image_test_option_image_extended_boolean
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_08d32e_f8251b(Gnattest_T: in out Test) renames
     Test_11_Option_Image_test_option_image_extended_boolean;
--  id:2.2/08d32e5f47f51d1d/Option_Image/0/0/test_option_image_extended_boolean/
   procedure Test_11_Option_Image_test_option_image_extended_boolean
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Extended_Boolean;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_08d32e_f8251b;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_11_Option_Image_test_option_image_extended_boolean;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_5269f4_fb7043
     (Name: String; Value: Tk_Window;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_Tk_Window test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_Tk_Window test commitment violated");
      end;
   end Wrap_Test_Option_Image_5269f4_fb7043;
--  end read only

--  begin read only
   procedure Test_12_Option_Image_test_option_image_tk_window
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_5269f4_fb7043(Gnattest_T: in out Test) renames
     Test_12_Option_Image_test_option_image_tk_window;
--  id:2.2/5269f46f63b9ac48/Option_Image/0/0/test_option_image_tk_window/
   procedure Test_12_Option_Image_test_option_image_tk_window
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Tk_Window;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_5269f4_fb7043;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_12_Option_Image_test_option_image_tk_window;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_e5f273_81a16f
     (Name: String; Value: Integer; Options_String: in out Unbounded_String;
      Base: Positive := 10) is
   begin
      begin
         pragma Assert(Name'Length > 0 and Base in 10 | 16);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_Integer test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Image
        (Name, Value, Options_String, Base);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_Integer test commitment violated");
      end;
   end Wrap_Test_Option_Image_e5f273_81a16f;
--  end read only

--  begin read only
   procedure Test_13_Option_Image_test_option_image_integer
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_e5f273_81a16f(Gnattest_T: in out Test) renames
     Test_13_Option_Image_test_option_image_integer;
--  id:2.2/e5f273869df45ad5/Option_Image/0/0/test_option_image_integer/
   procedure Test_13_Option_Image_test_option_image_integer
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Integer; Options_String: in out Unbounded_String;
         Base: Positive := 10) renames
        Wrap_Test_Option_Image_e5f273_81a16f;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_13_Option_Image_test_option_image_integer;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_7653ac_3fcd8d
     (Widget: Tk_Widget; Name: String) return Tcl_String is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Tcl_String test requirement violated");
      end;
      declare
         Test_Option_Value_7653ac_3fcd8d_Result: constant Tcl_String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widget, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Option_Value_Tcl_String test commitment violated");
         end;
         return Test_Option_Value_7653ac_3fcd8d_Result;
      end;
   end Wrap_Test_Option_Value_7653ac_3fcd8d;
--  end read only

--  begin read only
   procedure Test_1_Option_Value_test_option_value_tcl_string
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_7653ac_3fcd8d(Gnattest_T: in out Test) renames
     Test_1_Option_Value_test_option_value_tcl_string;
--  id:2.2/7653ac7cbd9fae0e/Option_Value/1/0/test_option_value_tcl_string/
   procedure Test_1_Option_Value_test_option_value_tcl_string
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Tk_Widget; Name: String) return Tcl_String renames
        Wrap_Test_Option_Value_7653ac_3fcd8d;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_1_Option_Value_test_option_value_tcl_string;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_233bf0_caa3fd
     (Widget: Tk_Widget; Name: String) return Directions_Type is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Direction_Type test requirement violated");
      end;
      declare
         Test_Option_Value_233bf0_caa3fd_Result: constant Directions_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widget, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Option_Value_Direction_Type test commitment violated");
         end;
         return Test_Option_Value_233bf0_caa3fd_Result;
      end;
   end Wrap_Test_Option_Value_233bf0_caa3fd;
--  end read only

--  begin read only
   procedure Test_2_Option_Value_test_option_value_direction_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_233bf0_caa3fd(Gnattest_T: in out Test) renames
     Test_2_Option_Value_test_option_value_direction_type;
--  id:2.2/233bf0449cc91e05/Option_Value/0/0/test_option_value_direction_type/
   procedure Test_2_Option_Value_test_option_value_direction_type
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Tk_Widget; Name: String) return Directions_Type renames
        Wrap_Test_Option_Value_233bf0_caa3fd;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Option_Value_test_option_value_direction_type;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_5928a5_6d4609
     (Widget: Tk_Widget; Name: String) return Pixel_Data is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Pixel_Data test requirement violated");
      end;
      declare
         Test_Option_Value_5928a5_6d4609_Result: constant Pixel_Data :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widget, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Option_Value_Pixel_Data test commitment violated");
         end;
         return Test_Option_Value_5928a5_6d4609_Result;
      end;
   end Wrap_Test_Option_Value_5928a5_6d4609;
--  end read only

--  begin read only
   procedure Test_3_Option_Value_test_option_value_pixel_data
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_5928a5_6d4609(Gnattest_T: in out Test) renames
     Test_3_Option_Value_test_option_value_pixel_data;
--  id:2.2/5928a584ab6c8004/Option_Value/0/0/test_option_value_pixel_data/
   procedure Test_3_Option_Value_test_option_value_pixel_data
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Tk_Widget; Name: String) return Pixel_Data renames
        Wrap_Test_Option_Value_5928a5_6d4609;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_3_Option_Value_test_option_value_pixel_data;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_28b181_b0620b
     (Widget: Tk_Widget; Name: String) return Place_Type is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Place_Type test requirement violated");
      end;
      declare
         Test_Option_Value_28b181_b0620b_Result: constant Place_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widget, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Option_Value_Place_Type test commitment violated");
         end;
         return Test_Option_Value_28b181_b0620b_Result;
      end;
   end Wrap_Test_Option_Value_28b181_b0620b;
--  end read only

--  begin read only
   procedure Test_4_Option_Value_test_option_value_place_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_28b181_b0620b(Gnattest_T: in out Test) renames
     Test_4_Option_Value_test_option_value_place_type;
--  id:2.2/28b1817b22e294d8/Option_Value/0/0/test_option_value_place_type/
   procedure Test_4_Option_Value_test_option_value_place_type
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Tk_Widget; Name: String) return Place_Type renames
        Wrap_Test_Option_Value_28b181_b0620b;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_4_Option_Value_test_option_value_place_type;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_f5b002_42b5f8
     (Widget: Tk_Widget; Name: String) return State_Type is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_State_Type test requirement violated");
      end;
      declare
         Test_Option_Value_f5b002_42b5f8_Result: constant State_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widget, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Option_Value_State_Type test commitment violated");
         end;
         return Test_Option_Value_f5b002_42b5f8_Result;
      end;
   end Wrap_Test_Option_Value_f5b002_42b5f8;
--  end read only

--  begin read only
   procedure Test_5_Option_Value_test_option_value_state_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_f5b002_42b5f8(Gnattest_T: in out Test) renames
     Test_5_Option_Value_test_option_value_state_type;
--  id:2.2/f5b002d7d9b49b26/Option_Value/0/0/test_option_value_state_type/
   procedure Test_5_Option_Value_test_option_value_state_type
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Tk_Widget; Name: String) return State_Type renames
        Wrap_Test_Option_Value_f5b002_42b5f8;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_5_Option_Value_test_option_value_state_type;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_0d429d_d5c707
     (Widget: Tk_Widget; Name: String) return Justify_Type is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Justify_Type test requirement violated");
      end;
      declare
         Test_Option_Value_0d429d_d5c707_Result: constant Justify_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widget, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Option_Value_Justify_Type test commitment violated");
         end;
         return Test_Option_Value_0d429d_d5c707_Result;
      end;
   end Wrap_Test_Option_Value_0d429d_d5c707;
--  end read only

--  begin read only
   procedure Test_6_Option_Value_test_option_value_justify_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_0d429d_d5c707(Gnattest_T: in out Test) renames
     Test_6_Option_Value_test_option_value_justify_type;
--  id:2.2/0d429d825d130717/Option_Value/0/0/test_option_value_justify_type/
   procedure Test_6_Option_Value_test_option_value_justify_type
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Tk_Widget; Name: String) return Justify_Type renames
        Wrap_Test_Option_Value_0d429d_d5c707;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_6_Option_Value_test_option_value_justify_type;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_433a71_21d747
     (Widget: Tk_Widget; Name: String) return Relief_Type is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Relief_Type test requirement violated");
      end;
      declare
         Test_Option_Value_433a71_21d747_Result: constant Relief_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widget, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Option_Value_Relief_Type test commitment violated");
         end;
         return Test_Option_Value_433a71_21d747_Result;
      end;
   end Wrap_Test_Option_Value_433a71_21d747;
--  end read only

--  begin read only
   procedure Test_7_Option_Value_test_option_value_relief_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_433a71_21d747(Gnattest_T: in out Test) renames
     Test_7_Option_Value_test_option_value_relief_type;
--  id:2.2/433a71288d1580d9/Option_Value/0/0/test_option_value_relief_type/
   procedure Test_7_Option_Value_test_option_value_relief_type
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Tk_Widget; Name: String) return Relief_Type renames
        Wrap_Test_Option_Value_433a71_21d747;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_7_Option_Value_test_option_value_relief_type;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_c23604_00522d
     (Widget: Tk_Widget; Name: String) return Extended_Natural is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Extended_Natural test requirement violated");
      end;
      declare
         Test_Option_Value_c23604_00522d_Result: constant Extended_Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widget, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Option_Value_Extended_Natural test commitment violated");
         end;
         return Test_Option_Value_c23604_00522d_Result;
      end;
   end Wrap_Test_Option_Value_c23604_00522d;
--  end read only

--  begin read only
   procedure Test_8_Option_Value_test_option_value_extended_natural
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_c23604_00522d(Gnattest_T: in out Test) renames
     Test_8_Option_Value_test_option_value_extended_natural;
--  id:2.2/c2360441dc017b3b/Option_Value/0/0/test_option_value_extended_natural/
   procedure Test_8_Option_Value_test_option_value_extended_natural
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Tk_Widget; Name: String) return Extended_Natural renames
        Wrap_Test_Option_Value_c23604_00522d;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_8_Option_Value_test_option_value_extended_natural;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_4261cf_e7c319
     (Widget: Tk_Widget; Name: String) return Extended_Boolean is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Extended_Boolean test requirement violated");
      end;
      declare
         Test_Option_Value_4261cf_e7c319_Result: constant Extended_Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widget, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Option_Value_Extended_Boolean test commitment violated");
         end;
         return Test_Option_Value_4261cf_e7c319_Result;
      end;
   end Wrap_Test_Option_Value_4261cf_e7c319;
--  end read only

--  begin read only
   procedure Test_9_Option_Value_test_option_value_extended_boolean
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_4261cf_e7c319(Gnattest_T: in out Test) renames
     Test_9_Option_Value_test_option_value_extended_boolean;
--  id:2.2/4261cff0a1c9a280/Option_Value/0/0/test_option_value_extended_boolean/
   procedure Test_9_Option_Value_test_option_value_extended_boolean
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Tk_Widget; Name: String) return Extended_Boolean renames
        Wrap_Test_Option_Value_4261cf_e7c319;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_9_Option_Value_test_option_value_extended_boolean;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_f2311c_4bf929
     (Widget: Tk_Widget; Name: String) return Integer is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Integer test requirement violated");
      end;
      declare
         Test_Option_Value_f2311c_4bf929_Result: constant Integer :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widget, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Option_Value_Integer test commitment violated");
         end;
         return Test_Option_Value_f2311c_4bf929_Result;
      end;
   end Wrap_Test_Option_Value_f2311c_4bf929;
--  end read only

--  begin read only
   procedure Test_10_Option_Value_test_option_value_integer
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_f2311c_4bf929(Gnattest_T: in out Test) renames
     Test_10_Option_Value_test_option_value_integer;
--  id:2.2/f2311c8d530f5ad5/Option_Value/0/0/test_option_value_integer/
   procedure Test_10_Option_Value_test_option_value_integer
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Tk_Widget; Name: String) return Integer renames
        Wrap_Test_Option_Value_f2311c_4bf929;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_10_Option_Value_test_option_value_integer;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_6c79cd_a1c7ae
     (Widget: Tk_Widget; Name: String) return Tk_Widget is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Tk_Widget test requirement violated");
      end;
      declare
         Test_Option_Value_6c79cd_a1c7ae_Result: constant Tk_Widget :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widget, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Option_Value_Tk_Widget test commitment violated");
         end;
         return Test_Option_Value_6c79cd_a1c7ae_Result;
      end;
   end Wrap_Test_Option_Value_6c79cd_a1c7ae;
--  end read only

--  begin read only
   procedure Test_11_Option_Value_test_option_value_tk_widget
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_6c79cd_a1c7ae(Gnattest_T: in out Test) renames
     Test_11_Option_Value_test_option_value_tk_widget;
--  id:2.2/6c79cde7e8b52cd2/Option_Value/0/0/test_option_value_tk_widget/
   procedure Test_11_Option_Value_test_option_value_tk_widget
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Tk_Widget; Name: String) return Tk_Widget renames
        Wrap_Test_Option_Value_6c79cd_a1c7ae;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_11_Option_Value_test_option_value_tk_widget;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_eba58c_92636b
     (Widget: Tk_Widget; Name: String) return Tk_Window is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Tk_Window test requirement violated");
      end;
      declare
         Test_Option_Value_eba58c_92636b_Result: constant Tk_Window :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widget, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Option_Value_Tk_Window test commitment violated");
         end;
         return Test_Option_Value_eba58c_92636b_Result;
      end;
   end Wrap_Test_Option_Value_eba58c_92636b;
--  end read only

--  begin read only
   procedure Test_12_Option_Value_test_option_value_tk_window
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_eba58c_92636b(Gnattest_T: in out Test) renames
     Test_12_Option_Value_test_option_value_tk_window;
--  id:2.2/eba58cc5c22700dd/Option_Value/0/0/test_option_value_tk_window/
   procedure Test_12_Option_Value_test_option_value_tk_window
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Tk_Widget; Name: String) return Tk_Window renames
        Wrap_Test_Option_Value_eba58c_92636b;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_12_Option_Value_test_option_value_tk_window;
--  end read only

--  begin read only
   procedure Wrap_Test_Destroy_568000_523e35(Widget: in out Tk_Widget) is
   begin
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Destroy(Widget);
   end Wrap_Test_Destroy_568000_523e35;
--  end read only

--  begin read only
   procedure Test_Destroy_test_destroy(Gnattest_T: in out Test);
   procedure Test_Destroy_568000_523e35(Gnattest_T: in out Test) renames
     Test_Destroy_test_destroy;
--  id:2.2/568000e013c6ee78/Destroy/1/0/test_destroy/
   procedure Test_Destroy_test_destroy(Gnattest_T: in out Test) is
      procedure Destroy(Widget: in out Tk_Widget) renames
        Wrap_Test_Destroy_568000_523e35;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Destroy_test_destroy;
--  end read only

--  begin read only
   procedure Wrap_Test_Execute_Widget_Command_7643c6_a33187
     (Widget: Tk_Widget; Command_Name: String; Options: String := "") is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Command_Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Execute_Widget_Command test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Execute_Widget_Command
        (Widget, Command_Name, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Execute_Widget_Command test commitment violated");
      end;
   end Wrap_Test_Execute_Widget_Command_7643c6_a33187;
--  end read only

--  begin read only
   procedure Test_Execute_Widget_Command_test_execute_widget_command
     (Gnattest_T: in out Test);
   procedure Test_Execute_Widget_Command_7643c6_a33187
     (Gnattest_T: in out Test) renames
     Test_Execute_Widget_Command_test_execute_widget_command;
--  id:2.2/7643c6ae56a5b360/Execute_Widget_Command/1/0/test_execute_widget_command/
   procedure Test_Execute_Widget_Command_test_execute_widget_command
     (Gnattest_T: in out Test) is
      procedure Execute_Widget_Command
        (Widget: Tk_Widget; Command_Name: String;
         Options: String := "") renames
        Wrap_Test_Execute_Widget_Command_7643c6_a33187;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Execute_Widget_Command_test_execute_widget_command;
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
end Tk.Widget.Test_Data.Tests;