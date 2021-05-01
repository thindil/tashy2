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
with System.Address_Image;
with Tk.Button; use Tk.Button;
with Tk.Grid; use Tk.Grid;
with Tk.Labelframe; use Tk.Labelframe;
with Tk.Menu; use Tk.Menu;
with Tk.TopLevel; use Tk.TopLevel;
with Tk.TtkButton; use Tk.TtkButton;
with Tk.TtkLabel; use Tk.TtkLabel;

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
   function Wrap_Test_Pixel_Data_Value_1cddc7_342332
     (Value: String) return Pixel_Data is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Pixel_Data_Value test requirement violated");
      end;
      declare
         Test_Pixel_Data_Value_1cddc7_342332_Result: constant Pixel_Data :=
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
         return Test_Pixel_Data_Value_1cddc7_342332_Result;
      end;
   end Wrap_Test_Pixel_Data_Value_1cddc7_342332;
--  end read only

--  begin read only
   procedure Test_Pixel_Data_Value_test_pixel_data_value
     (Gnattest_T: in out Test);
   procedure Test_Pixel_Data_Value_1cddc7_342332
     (Gnattest_T: in out Test) renames
     Test_Pixel_Data_Value_test_pixel_data_value;
--  id:2.2/1cddc72f48314db2/Pixel_Data_Value/1/0/test_pixel_data_value/
   procedure Test_Pixel_Data_Value_test_pixel_data_value
     (Gnattest_T: in out Test) is
      function Pixel_Data_Value(Value: String) return Pixel_Data renames
        Wrap_Test_Pixel_Data_Value_1cddc7_342332;
--  end read only

      pragma Unreferenced(Gnattest_T);
      My_Pixel: Pixel_Data;

   begin

      My_Pixel := Pixel_Data_Value("2c");
      Assert
        (My_Pixel.Value = 2.0 and My_Pixel.Value_Unit = C,
         "Invalid value for pixel data from string conversion.");
      My_Pixel := Pixel_Data_Value("");
      Assert
        (My_Pixel.Value = -1.0 and My_Pixel.Value_Unit = PIXEL,
         "Failed to convert empty string with Pixel_Data");

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
        (Tk_Path_Name(Button) = ".mybutton",
         "Failed to get the proper widget with Get_Widget.");
      Destroy(Button);
      Button := Get_Widget(".mybutton2");
      Destroy(Button);

--  begin read only
   end Test_Get_Widget_test_get_widget;
--  end read only

--  begin read only
   function Wrap_Test_Tk_Path_Name_5c8bcc_85a34c
     (Widgt: Tk_Widget) return String is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Tk_PathName test requirement violated");
      end;
      declare
         Test_Tk_Path_Name_5c8bcc_85a34c_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Tk_Path_Name(Widgt);
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
         return Test_Tk_Path_Name_5c8bcc_85a34c_Result;
      end;
   end Wrap_Test_Tk_Path_Name_5c8bcc_85a34c;
--  end read only

--  begin read only
   procedure Test_Tk_Path_Name_test_tk_pathname(Gnattest_T: in out Test);
   procedure Test_Tk_Path_Name_5c8bcc_85a34c(Gnattest_T: in out Test) renames
     Test_Tk_Path_Name_test_tk_pathname;
--  id:2.2/5c8bcc67c7e58aca/Tk_Path_Name/1/0/test_tk_pathname/
   procedure Test_Tk_Path_Name_test_tk_pathname(Gnattest_T: in out Test) is
      function Tk_Path_Name(Widgt: Tk_Widget) return String renames
        Wrap_Test_Tk_Path_Name_5c8bcc_85a34c;
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
        (Tk_Path_Name(Button) = ".mybutton",
         "Failed to get Tk pathname for the selected widget.");
      Destroy(Button);

--  begin read only
   end Test_Tk_Path_Name_test_tk_pathname;
--  end read only

--  begin read only
   function Wrap_Test_Tk_Interp_37dfaa_a9040e
     (Widgt: Tk_Widget) return Tcl_Interpreter is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Tk_Interp test requirement violated");
      end;
      declare
         Test_Tk_Interp_37dfaa_a9040e_Result: constant Tcl_Interpreter :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Tk_Interp(Widgt);
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
         return Test_Tk_Interp_37dfaa_a9040e_Result;
      end;
   end Wrap_Test_Tk_Interp_37dfaa_a9040e;
--  end read only

--  begin read only
   procedure Test_Tk_Interp_test_tk_interp(Gnattest_T: in out Test);
   procedure Test_Tk_Interp_37dfaa_a9040e(Gnattest_T: in out Test) renames
     Test_Tk_Interp_test_tk_interp;
--  id:2.2/37dfaac7975d5a6d/Tk_Interp/1/0/test_tk_interp/
   procedure Test_Tk_Interp_test_tk_interp(Gnattest_T: in out Test) is
      function Tk_Interp(Widgt: Tk_Widget) return Tcl_Interpreter renames
        Wrap_Test_Tk_Interp_37dfaa_a9040e;
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
   function Wrap_Test_Tk_Window_Id_08bdcd_2020b9
     (Widgt: Tk_Widget) return Tk_Window is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Tk_Window_Id test requirement violated");
      end;
      declare
         Test_Tk_Window_Id_08bdcd_2020b9_Result: constant Tk_Window :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Tk_Window_Id(Widgt);
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
         return Test_Tk_Window_Id_08bdcd_2020b9_Result;
      end;
   end Wrap_Test_Tk_Window_Id_08bdcd_2020b9;
--  end read only

--  begin read only
   procedure Test_Tk_Window_Id_test_tk_window_id(Gnattest_T: in out Test);
   procedure Test_Tk_Window_Id_08bdcd_2020b9(Gnattest_T: in out Test) renames
     Test_Tk_Window_Id_test_tk_window_id;
--  id:2.2/08bdcd5144a32481/Tk_Window_Id/1/0/test_tk_window_id/
   procedure Test_Tk_Window_Id_test_tk_window_id(Gnattest_T: in out Test) is
      function Tk_Window_Id(Widgt: Tk_Widget) return Tk_Window renames
        Wrap_Test_Tk_Window_Id_08bdcd_2020b9;
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
      Options_String: Unbounded_String;

   begin

      Option_Image
        ("myoption", Pixel_Data'(Value => 2.0, Value_Unit => C),
         Options_String);
      Assert
        (To_String(Options_String) = " -myoption 2.00c",
         "Failed to get image for Pixel_Data option");

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
      Options_String: Unbounded_String;

   begin

      Option_Image("myoption", RAISED, Options_String);
      Assert
        (To_String(Options_String) = " -myoption raised",
         "Failed to get image for Relief_Type option");

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
      Options_String: Unbounded_String;

   begin

      Option_Image("myoption", ACTIVE, Options_String);
      Assert
        (To_String(Options_String) = " -myoption active",
         "Failed to get image for State_Type option");

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
      Options_String: Unbounded_String;

   begin

      Option_Image("myoption", Directions_Type'(SE), Options_String);
      Assert
        (To_String(Options_String) = " -myoption se",
         "Failed to get image for Directions_Type option");

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
      Options_String: Unbounded_String;

   begin

      Option_Image("myoption", BOTTOM, Options_String);
      Assert
        (To_String(Options_String) = " -myoption bottom",
         "Failed to get image for Place_Type option");

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
      Options_String: Unbounded_String;

   begin

      Option_Image("myoption", Justify_Type'(CENTER), Options_String);
      Assert
        (To_String(Options_String) = " -myoption center",
         "Failed to get image for Justify_Type option");

--  begin read only
   end Test_8_Option_Image_test_option_image_justify_type;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_26a8f7_f0d5d6
     (Name: String; Value: Pad_Data;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_Pad_Data test requirement violated");
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
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_Pad_Data test commitment violated");
      end;
   end Wrap_Test_Option_Image_26a8f7_f0d5d6;
--  end read only

--  begin read only
   procedure Test_9_Option_Image_test_option_image_pad_data
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_26a8f7_f0d5d6(Gnattest_T: in out Test) renames
     Test_9_Option_Image_test_option_image_pad_data;
--  id:2.2/26a8f79d8b2d466a/Option_Image/0/0/test_option_image_pad_data/
   procedure Test_9_Option_Image_test_option_image_pad_data
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Pad_Data;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_26a8f7_f0d5d6;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Options_String: Unbounded_String;

   begin

      Option_Image
        ("myoption", Pad_Data'((2.0, PIXEL), (5.0, PIXEL)), Options_String);
      Assert
        (To_String(Options_String) = " -myoption {2.00 5.00}",
         "Failed to get image for Pad_Array option");

--  begin read only
   end Test_9_Option_Image_test_option_image_pad_data;
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
      Button: Tk_Button;
      Options_String: Unbounded_String;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Add(Button);
      Tcl_Eval("update");
      Option_Image("myoption", Button, Options_String);
      Assert
        (To_String(Options_String) = " -myoption .mybutton",
         "Failed to get image for Tk_Widget option");
      Destroy(Button);

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
      Options_String: Unbounded_String;

   begin

      Option_Image("myoption", TRUE, Options_String);
      Assert
        (To_String(Options_String) = " -myoption 1",
         "Failed to get image for Extended_Boolean option");

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
      Button: Tk_Button;
      Options_String: Unbounded_String;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Add(Button);
      Tcl_Eval("update");
      Option_Image("myoption", Tk_Window_Id(Button), Options_String);
      Tcl_Eval("winfo id .mybutton");
      Assert
        (To_String(Options_String) = " -myoption " & Tcl_Get_Result,
         "Failed to get image for Tk_Widget option");
      Destroy(Button);

--  begin read only
   end Test_12_Option_Image_test_option_image_tk_window;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_183a44_55069e
     (Name: String; Value: Anchor_Directions;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Image_Anchor_Directions test requirement violated");
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
               "ens_sloc(tk-widget.ads:0:):Test_Option_Image_Anchor_Directions test commitment violated");
      end;
   end Wrap_Test_Option_Image_183a44_55069e;
--  end read only

--  begin read only
   procedure Test_13_Option_Image_test_option_image_anchor_directions
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_183a44_55069e(Gnattest_T: in out Test) renames
     Test_13_Option_Image_test_option_image_anchor_directions;
--  id:2.2/183a44bf51805f78/Option_Image/0/0/test_option_image_anchor_directions/
   procedure Test_13_Option_Image_test_option_image_anchor_directions
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Anchor_Directions;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_183a44_55069e;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Options_String: Unbounded_String;

   begin

      Option_Image("myoption", WN, Options_String);
      Assert
        (To_String(Options_String) = " -myoption wn",
         "Failed to get image for Anchor_Directions option");

--  begin read only
   end Test_13_Option_Image_test_option_image_anchor_directions;
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
   procedure Test_14_Option_Image_test_option_image_integer
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_e5f273_81a16f(Gnattest_T: in out Test) renames
     Test_14_Option_Image_test_option_image_integer;
--  id:2.2/e5f273869df45ad5/Option_Image/0/0/test_option_image_integer/
   procedure Test_14_Option_Image_test_option_image_integer
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Integer; Options_String: in out Unbounded_String;
         Base: Positive := 10) renames
        Wrap_Test_Option_Image_e5f273_81a16f;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Options_String: Unbounded_String;

   begin

      Option_Image("myoption", Integer(10), Options_String);
      Assert
        (To_String(Options_String) = " -myoption 10",
         "Failed to get image for Integer option");

--  begin read only
   end Test_14_Option_Image_test_option_image_integer;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_7653ac_8290b8
     (Widgt: Tk_Widget; Name: String) return Tcl_String is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Tcl_String test requirement violated");
      end;
      declare
         Test_Option_Value_7653ac_8290b8_Result: constant Tcl_String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widgt, Name);
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
         return Test_Option_Value_7653ac_8290b8_Result;
      end;
   end Wrap_Test_Option_Value_7653ac_8290b8;
--  end read only

--  begin read only
   procedure Test_1_Option_Value_test_option_value_tcl_string
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_7653ac_8290b8(Gnattest_T: in out Test) renames
     Test_1_Option_Value_test_option_value_tcl_string;
--  id:2.2/7653ac7cbd9fae0e/Option_Value/1/0/test_option_value_tcl_string/
   procedure Test_1_Option_Value_test_option_value_tcl_string
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widgt: Tk_Widget; Name: String) return Tcl_String renames
        Wrap_Test_Option_Value_7653ac_8290b8;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Result: Tcl_String;
      Button: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Button, ".mybutton",
         Button_Options'(Text => To_Tcl_String("Test"), others => <>));
      Add(Button);
      Tcl_Eval("update");
      Result := Option_Value(Button, "text");
      Assert
        (Result = To_Tcl_String("Test"),
         "Failed to get value for Tcl_String widget option");
      Destroy(Button);

--  begin read only
   end Test_1_Option_Value_test_option_value_tcl_string;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_233bf0_aec4d0
     (Widgt: Tk_Widget; Name: String) return Directions_Type is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Direction_Type test requirement violated");
      end;
      declare
         Test_Option_Value_233bf0_aec4d0_Result: constant Directions_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widgt, Name);
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
         return Test_Option_Value_233bf0_aec4d0_Result;
      end;
   end Wrap_Test_Option_Value_233bf0_aec4d0;
--  end read only

--  begin read only
   procedure Test_2_Option_Value_test_option_value_direction_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_233bf0_aec4d0(Gnattest_T: in out Test) renames
     Test_2_Option_Value_test_option_value_direction_type;
--  id:2.2/233bf0449cc91e05/Option_Value/0/0/test_option_value_direction_type/
   procedure Test_2_Option_Value_test_option_value_direction_type
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widgt: Tk_Widget; Name: String) return Directions_Type renames
        Wrap_Test_Option_Value_233bf0_aec4d0;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Result: Directions_Type;
      Label: Ttk_Label;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(Anchor => N, others => <>));
      Add(Button);
      Tcl_Eval("update");
      Result := Option_Value(Button, "anchor");
      Assert
        (Result = N, "Failed to get value for Directions_Type widget option");
      Destroy(Button);
      Create(Label, ".mylabel", Ttk_Label_Options'(others => <>));
      Result := Option_Value(Label, "anchor");
      Assert
        (Result = NONE,
         "Failed to get empty value for Directions_Type widget option");
      Destroy(Label);

--  begin read only
   end Test_2_Option_Value_test_option_value_direction_type;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_5928a5_91f6f6
     (Widgt: Tk_Widget; Name: String) return Pixel_Data is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Pixel_Data test requirement violated");
      end;
      declare
         Test_Option_Value_5928a5_91f6f6_Result: constant Pixel_Data :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widgt, Name);
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
         return Test_Option_Value_5928a5_91f6f6_Result;
      end;
   end Wrap_Test_Option_Value_5928a5_91f6f6;
--  end read only

--  begin read only
   procedure Test_3_Option_Value_test_option_value_pixel_data
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_5928a5_91f6f6(Gnattest_T: in out Test) renames
     Test_3_Option_Value_test_option_value_pixel_data;
--  id:2.2/5928a584ab6c8004/Option_Value/0/0/test_option_value_pixel_data/
   procedure Test_3_Option_Value_test_option_value_pixel_data
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widgt: Tk_Widget; Name: String) return Pixel_Data renames
        Wrap_Test_Option_Value_5928a5_91f6f6;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Result: Pixel_Data;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Button, ".mybutton",
         Button_Options'(Border_Width => (2.0, PIXEL), others => <>));
      Add(Button);
      Tcl_Eval("update");
      Result := Option_Value(Button, "borderwidth");
      Assert
        (Result = (2.0, PIXEL),
         "Failed to get value for Pixel_Data widget option");
      Destroy(Button);

--  begin read only
   end Test_3_Option_Value_test_option_value_pixel_data;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_28b181_505a65
     (Widgt: Tk_Widget; Name: String) return Place_Type is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Place_Type test requirement violated");
      end;
      declare
         Test_Option_Value_28b181_505a65_Result: constant Place_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widgt, Name);
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
         return Test_Option_Value_28b181_505a65_Result;
      end;
   end Wrap_Test_Option_Value_28b181_505a65;
--  end read only

--  begin read only
   procedure Test_4_Option_Value_test_option_value_place_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_28b181_505a65(Gnattest_T: in out Test) renames
     Test_4_Option_Value_test_option_value_place_type;
--  id:2.2/28b1817b22e294d8/Option_Value/0/0/test_option_value_place_type/
   procedure Test_4_Option_Value_test_option_value_place_type
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widgt: Tk_Widget; Name: String) return Place_Type renames
        Wrap_Test_Option_Value_28b181_505a65;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Result: Place_Type;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Button, ".mybutton",
         Button_Options'(Compound => BOTTOM, others => <>));
      Add(Button);
      Tcl_Eval("update");
      Result := Option_Value(Button, "compound");
      Assert
        (Result = BOTTOM, "Failed to get value for Place_Type widget option");
      Destroy(Button);

--  begin read only
   end Test_4_Option_Value_test_option_value_place_type;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_f5b002_a22b94
     (Widgt: Tk_Widget; Name: String) return State_Type is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_State_Type test requirement violated");
      end;
      declare
         Test_Option_Value_f5b002_a22b94_Result: constant State_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widgt, Name);
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
         return Test_Option_Value_f5b002_a22b94_Result;
      end;
   end Wrap_Test_Option_Value_f5b002_a22b94;
--  end read only

--  begin read only
   procedure Test_5_Option_Value_test_option_value_state_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_f5b002_a22b94(Gnattest_T: in out Test) renames
     Test_5_Option_Value_test_option_value_state_type;
--  id:2.2/f5b002d7d9b49b26/Option_Value/0/0/test_option_value_state_type/
   procedure Test_5_Option_Value_test_option_value_state_type
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widgt: Tk_Widget; Name: String) return State_Type renames
        Wrap_Test_Option_Value_f5b002_a22b94;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Result: State_Type;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Button, ".mybutton",
         Button_Options'(Default => ACTIVE, others => <>));
      Add(Button);
      Tcl_Eval("update");
      Result := Option_Value(Button, "default");
      Assert
        (Result = ACTIVE, "Failed to get value for State_Type widget option");
      Destroy(Button);

--  begin read only
   end Test_5_Option_Value_test_option_value_state_type;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_0d429d_011a37
     (Widgt: Tk_Widget; Name: String) return Justify_Type is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Justify_Type test requirement violated");
      end;
      declare
         Test_Option_Value_0d429d_011a37_Result: constant Justify_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widgt, Name);
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
         return Test_Option_Value_0d429d_011a37_Result;
      end;
   end Wrap_Test_Option_Value_0d429d_011a37;
--  end read only

--  begin read only
   procedure Test_6_Option_Value_test_option_value_justify_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_0d429d_011a37(Gnattest_T: in out Test) renames
     Test_6_Option_Value_test_option_value_justify_type;
--  id:2.2/0d429d825d130717/Option_Value/0/0/test_option_value_justify_type/
   procedure Test_6_Option_Value_test_option_value_justify_type
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widgt: Tk_Widget; Name: String) return Justify_Type renames
        Wrap_Test_Option_Value_0d429d_011a37;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Result: Justify_Type;
      Label: Ttk_Label;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Button, ".mybutton",
         Button_Options'(Justify => CENTER, others => <>));
      Add(Button);
      Tcl_Eval("update");
      Result := Option_Value(Button, "justify");
      Assert
        (Result = CENTER,
         "Failed to get value for Justify_Type widget option");
      Destroy(Button);
      Create(Label, ".mylabel", Ttk_Label_Options'(others => <>));
      Result := Option_Value(Label, "anchor");
      Assert
        (Result = NONE,
         "Failed to get empty value for Justify_Type widget option");
      Destroy(Label);

--  begin read only
   end Test_6_Option_Value_test_option_value_justify_type;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_433a71_606e95
     (Widgt: Tk_Widget; Name: String) return Relief_Type is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Relief_Type test requirement violated");
      end;
      declare
         Test_Option_Value_433a71_606e95_Result: constant Relief_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widgt, Name);
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
         return Test_Option_Value_433a71_606e95_Result;
      end;
   end Wrap_Test_Option_Value_433a71_606e95;
--  end read only

--  begin read only
   procedure Test_7_Option_Value_test_option_value_relief_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_433a71_606e95(Gnattest_T: in out Test) renames
     Test_7_Option_Value_test_option_value_relief_type;
--  id:2.2/433a71288d1580d9/Option_Value/0/0/test_option_value_relief_type/
   procedure Test_7_Option_Value_test_option_value_relief_type
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widgt: Tk_Widget; Name: String) return Relief_Type renames
        Wrap_Test_Option_Value_433a71_606e95;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Result: Relief_Type;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Button, ".mybutton", Button_Options'(Relief => RAISED, others => <>));
      Add(Button);
      Tcl_Eval("update");
      Assert
        (Option_Value(Button, "relief") = RAISED,
         "Failed to get value for Relief_Type widget option");
      Assert
        (Option_Value(Button, "overrelief") = Relief_Type'(NONE),
         "Failed to get value for empty Relief_Type widget option");
      Destroy(Button);

--  begin read only
   end Test_7_Option_Value_test_option_value_relief_type;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_c23604_f3a6bc
     (Widgt: Tk_Widget; Name: String) return Extended_Natural is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Extended_Natural test requirement violated");
      end;
      declare
         Test_Option_Value_c23604_f3a6bc_Result: constant Extended_Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widgt, Name);
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
         return Test_Option_Value_c23604_f3a6bc_Result;
      end;
   end Wrap_Test_Option_Value_c23604_f3a6bc;
--  end read only

--  begin read only
   procedure Test_8_Option_Value_test_option_value_extended_natural
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_c23604_f3a6bc(Gnattest_T: in out Test) renames
     Test_8_Option_Value_test_option_value_extended_natural;
--  id:2.2/c2360441dc017b3b/Option_Value/0/0/test_option_value_extended_natural/
   procedure Test_8_Option_Value_test_option_value_extended_natural
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widgt: Tk_Widget; Name: String) return Extended_Natural renames
        Wrap_Test_Option_Value_c23604_f3a6bc;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;
      Result: Extended_Natural;
      Label: Ttk_Label;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Button, ".mybutton",
         Button_Options'(Repeat_Delay => 10, others => <>));
      Add(Button);
      Tcl_Eval("update");
      Result := Option_Value(Button, "repeatdelay");
      Assert
        (Result = 10,
         "Failed to get value for Extended_Natural widget option");
      Destroy(Button);
      Create(Label, ".mylabel", Ttk_Label_Options'(others => <>));
      Result := Option_Value(Label, "wraplength");
      Assert
        (Result = -1,
         "Failed to get value for empty Extended_Natural widget option");
      Destroy(Label);

--  begin read only
   end Test_8_Option_Value_test_option_value_extended_natural;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_4261cf_d0c79a
     (Widgt: Tk_Widget; Name: String) return Extended_Boolean is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Extended_Boolean test requirement violated");
      end;
      declare
         Test_Option_Value_4261cf_d0c79a_Result: constant Extended_Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widgt, Name);
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
         return Test_Option_Value_4261cf_d0c79a_Result;
      end;
   end Wrap_Test_Option_Value_4261cf_d0c79a;
--  end read only

--  begin read only
   procedure Test_9_Option_Value_test_option_value_extended_boolean
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_4261cf_d0c79a(Gnattest_T: in out Test) renames
     Test_9_Option_Value_test_option_value_extended_boolean;
--  id:2.2/4261cff0a1c9a280/Option_Value/0/0/test_option_value_extended_boolean/
   procedure Test_9_Option_Value_test_option_value_extended_boolean
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widgt: Tk_Widget; Name: String) return Extended_Boolean renames
        Wrap_Test_Option_Value_4261cf_d0c79a;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Widget: Tk_Toplevel;
      Result: Extended_Boolean;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Widget, ".mydialog",
         Toplevel_Create_Options'(Container => TRUE, others => <>));
      Tcl_Eval("update");
      Result := Option_Value(Widget, "container");
      Assert
        (Result = True,
         "Failed to get value for Extended_Boolean widget option");
      Destroy(Widget);

--  begin read only
   end Test_9_Option_Value_test_option_value_extended_boolean;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_6c79cd_4a4c5a
     (Widgt: Tk_Widget; Name: String) return Tk_Widget is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Tk_Widget test requirement violated");
      end;
      declare
         Test_Option_Value_6c79cd_4a4c5a_Result: constant Tk_Widget :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widgt, Name);
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
         return Test_Option_Value_6c79cd_4a4c5a_Result;
      end;
   end Wrap_Test_Option_Value_6c79cd_4a4c5a;
--  end read only

--  begin read only
   procedure Test_10_Option_Value_test_option_value_tk_widget
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_6c79cd_4a4c5a(Gnattest_T: in out Test) renames
     Test_10_Option_Value_test_option_value_tk_widget;
--  id:2.2/6c79cde7e8b52cd2/Option_Value/0/0/test_option_value_tk_widget/
   procedure Test_10_Option_Value_test_option_value_tk_widget
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widgt: Tk_Widget; Name: String) return Tk_Widget renames
        Wrap_Test_Option_Value_6c79cd_4a4c5a;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Widget: Tk_Toplevel;
      Menu: Tk_Menu;
      Result: Tk_Widget;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Menu, ".mymenu", Menu_Options'(others => <>));
      Create
        (Widget, ".mydialog",
         Toplevel_Create_Options'(Menu => Menu, others => <>));
      Tcl_Eval("update");
      Result := Option_Value(Widget, "menu");
      Assert(Result = Menu, "Failed to get value for Tk_Widget widget option");
      Destroy(Widget);
      Destroy(Menu);

--  begin read only
   end Test_10_Option_Value_test_option_value_tk_widget;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_eba58c_c374e8
     (Widgt: Tk_Widget; Name: String) return Tk_Window is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Tk_Window test requirement violated");
      end;
      declare
         Test_Option_Value_eba58c_c374e8_Result: constant Tk_Window :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widgt, Name);
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
         return Test_Option_Value_eba58c_c374e8_Result;
      end;
   end Wrap_Test_Option_Value_eba58c_c374e8;
--  end read only

--  begin read only
   procedure Test_11_Option_Value_test_option_value_tk_window
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_eba58c_c374e8(Gnattest_T: in out Test) renames
     Test_11_Option_Value_test_option_value_tk_window;
--  id:2.2/eba58cc5c22700dd/Option_Value/0/0/test_option_value_tk_window/
   procedure Test_11_Option_Value_test_option_value_tk_window
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widgt: Tk_Widget; Name: String) return Tk_Window renames
        Wrap_Test_Option_Value_eba58c_c374e8;
--  end read only

      pragma Unreferenced(Gnattest_T);
      TopWidget, ChildWidget: Tk_Toplevel;
      Result: Tk_Window;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (TopWidget, ".mydialog",
         Toplevel_Create_Options'(Container => TRUE, others => <>));
      Tcl_Eval("update");
      Create
        (ChildWidget, ".mychild",
         Toplevel_Create_Options'
           (Use_Container => Tk_Window_Id(TopWidget), others => <>));
      Result := Option_Value(ChildWidget, "use");
      Assert
        (Result = Tk_Window_Id(TopWidget),
         "Failed to get value for Tk_Window widget option");
      Destroy(TopWidget);
      Create(TopWidget, ".mydialog", Toplevel_Create_Options'(others => <>));
      Assert
        (Option_Value(TopWidget, "use") = Null_Window,
         "Failed to get empty value for Tk_Window widget option");
      Destroy(TopWidget);
      Destroy(ChildWidget);

--  begin read only
   end Test_11_Option_Value_test_option_value_tk_window;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_f2311c_69e413
     (Widgt: Tk_Widget; Name: String) return Integer is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Integer test requirement violated");
      end;
      declare
         Test_Option_Value_f2311c_69e413_Result: constant Integer :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widgt, Name);
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
         return Test_Option_Value_f2311c_69e413_Result;
      end;
   end Wrap_Test_Option_Value_f2311c_69e413;
--  end read only

--  begin read only
   procedure Test_12_Option_Value_test_option_value_integer
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_f2311c_69e413(Gnattest_T: in out Test) renames
     Test_12_Option_Value_test_option_value_integer;
--  id:2.2/f2311c8d530f5ad5/Option_Value/0/0/test_option_value_integer/
   procedure Test_12_Option_Value_test_option_value_integer
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widgt: Tk_Widget; Name: String) return Integer renames
        Wrap_Test_Option_Value_f2311c_69e413;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Widget: Ttk_Button;
      Result: Integer;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Widget, ".button", Ttk_Button_Options'(Width => -15, others => <>));
      Tcl_Eval("update");
      Result := Option_Value(Widget, "width");
      Assert(Result = -15, "Failed to get value for Integer widget option");
      Destroy(Widget);

--  begin read only
   end Test_12_Option_Value_test_option_value_integer;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_54a47c_6cc903
     (Widgt: Tk_Widget; Name: String) return Anchor_Directions is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Option_Value_Anchor_Directions test requirement violated");
      end;
      declare
         Test_Option_Value_54a47c_6cc903_Result: constant Anchor_Directions :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget.Option_Value
             (Widgt, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Option_Value_Anchor_Directions test commitment violated");
         end;
         return Test_Option_Value_54a47c_6cc903_Result;
      end;
   end Wrap_Test_Option_Value_54a47c_6cc903;
--  end read only

--  begin read only
   procedure Test_13_Option_Value_test_option_value_anchor_directions
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_54a47c_6cc903(Gnattest_T: in out Test) renames
     Test_13_Option_Value_test_option_value_anchor_directions;
--  id:2.2/54a47c075654f531/Option_Value/0/0/test_option_value_anchor_directions/
   procedure Test_13_Option_Value_test_option_value_anchor_directions
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widgt: Tk_Widget; Name: String) return Anchor_Directions renames
        Wrap_Test_Option_Value_54a47c_6cc903;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Frame: Tk_Label_Frame;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Frame, ".myframe",
         Label_Frame_Create_Options'(Label_Anchor => N, others => <>));
      Add(Frame);
      Tcl_Eval("update");
      Assert
        (Option_Value(Frame, "labelanchor") = Anchor_Directions'(N),
         "Failed to get value for Anchor_Directions widget option");
      Destroy(Frame);

--  begin read only
   end Test_13_Option_Value_test_option_value_anchor_directions;
--  end read only

--  begin read only
   procedure Wrap_Test_Destroy_568000_523e35(Widgt: in out Tk_Widget) is
   begin
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Destroy(Widgt);
   end Wrap_Test_Destroy_568000_523e35;
--  end read only

--  begin read only
   procedure Test_Destroy_test_destroy(Gnattest_T: in out Test);
   procedure Test_Destroy_568000_523e35(Gnattest_T: in out Test) renames
     Test_Destroy_test_destroy;
--  id:2.2/568000e013c6ee78/Destroy/1/0/test_destroy/
   procedure Test_Destroy_test_destroy(Gnattest_T: in out Test) is
      procedure Destroy(Widgt: in out Tk_Widget) renames
        Wrap_Test_Destroy_568000_523e35;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Button: Tk_Button;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Button, ".mybutton", Button_Options'(others => <>));
      Destroy(Button);
      Assert(Button = Null_Widget, "Failed to destroy Tk_Widget");

--  begin read only
   end Test_Destroy_test_destroy;
--  end read only

--  begin read only
   procedure Wrap_Test_Execute_Widget_Command_7643c6_2f4d36
     (Widgt: Tk_Widget; Command_Name: String; Options: String := "") is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Command_Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Execute_Widget_Command test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Execute_Widget_Command
        (Widgt, Command_Name, Options);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-widget.ads:0:):Test_Execute_Widget_Command test commitment violated");
      end;
   end Wrap_Test_Execute_Widget_Command_7643c6_2f4d36;
--  end read only

--  begin read only
   procedure Test_1_Execute_Widget_Command_test_execute_widget_command
     (Gnattest_T: in out Test);
   procedure Test_Execute_Widget_Command_7643c6_2f4d36
     (Gnattest_T: in out Test) renames
     Test_1_Execute_Widget_Command_test_execute_widget_command;
--  id:2.2/7643c6ae56a5b360/Execute_Widget_Command/1/0/test_execute_widget_command/
   procedure Test_1_Execute_Widget_Command_test_execute_widget_command
     (Gnattest_T: in out Test) is
      procedure Execute_Widget_Command
        (Widgt: Tk_Widget; Command_Name: String; Options: String := "") renames
        Wrap_Test_Execute_Widget_Command_7643c6_2f4d36;
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
      Execute_Widget_Command(Button, "cget", "-text");
      Assert
        (Tcl_Get_Result = "Quit",
         "Failed to execute Tcl command on the selected Tk_Widget.");
      Destroy(Button);

--  begin read only
   end Test_1_Execute_Widget_Command_test_execute_widget_command;
--  end read only

--  begin read only
   function Wrap_Test_Execute_Widget_Command_fc11cd_9808c7
     (Widgt: Tk_Widget; Command_Name: String; Options: String := "")
      return String is
   begin
      begin
         pragma Assert(Widgt /= Null_Widget and Command_Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-widget.ads:0):Test_Execute_Widget_Command2 test requirement violated");
      end;
      declare
         Test_Execute_Widget_Command_fc11cd_9808c7_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Widget
             .Execute_Widget_Command
             (Widgt, Command_Name, Options);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-widget.ads:0:):Test_Execute_Widget_Command2 test commitment violated");
         end;
         return Test_Execute_Widget_Command_fc11cd_9808c7_Result;
      end;
   end Wrap_Test_Execute_Widget_Command_fc11cd_9808c7;
--  end read only

--  begin read only
   procedure Test_2_Execute_Widget_Command_test_execute_widget_command2
     (Gnattest_T: in out Test);
   procedure Test_Execute_Widget_Command_fc11cd_9808c7
     (Gnattest_T: in out Test) renames
     Test_2_Execute_Widget_Command_test_execute_widget_command2;
--  id:2.2/fc11cdf946a86007/Execute_Widget_Command/0/0/test_execute_widget_command2/
   procedure Test_2_Execute_Widget_Command_test_execute_widget_command2
     (Gnattest_T: in out Test) is
      function Execute_Widget_Command
        (Widgt: Tk_Widget; Command_Name: String; Options: String := "")
         return String renames
        Wrap_Test_Execute_Widget_Command_fc11cd_9808c7;
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
         Button_Options'(Text => To_Tcl_String("NewQuit"), others => <>));
      Assert
        (Execute_Widget_Command(Button, "cget", "-text") = "NewQuit",
         "Failed to execute and get result of Tcl command on the selected Tk_Widget.");
      Destroy(Button);

--  begin read only
   end Test_2_Execute_Widget_Command_test_execute_widget_command2;
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
