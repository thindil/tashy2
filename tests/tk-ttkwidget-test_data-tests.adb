--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.TtkWidget.Test_Data.

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
package body Tk.TtkWidget.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Option_Image_a3facf_ddcb4f
     (Name: String; Value: Compound_Type;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Option_Image_Compound_Type test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkwidget.ads:0:):Test_Option_Image_Compound_Type test commitment violated");
      end;
   end Wrap_Test_Option_Image_a3facf_ddcb4f;
--  end read only

--  begin read only
   procedure Test_1_Option_Image_test_option_image_compound_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_a3facf_ddcb4f(Gnattest_T: in out Test) renames
     Test_1_Option_Image_test_option_image_compound_type;
--  id:2.2/a3facf0235c97b50/Option_Image/1/0/test_option_image_compound_type/
   procedure Test_1_Option_Image_test_option_image_compound_type
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Compound_Type;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_a3facf_ddcb4f;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Options: Unbounded_String;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Option_Image("compound", Compound_Type'(NONE), Options);
      Assert
        (Options = To_Unbounded_String(" -compound none"),
         "Failed to get image for Compound_Type option");

--  begin read only
   end Test_1_Option_Image_test_option_image_compound_type;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_5ac754_8ca289
     (Name: String; Value: Disabled_State_Type;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Option_Image_Distabled_State_Type test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkwidget.ads:0:):Test_Option_Image_Distabled_State_Type test commitment violated");
      end;
   end Wrap_Test_Option_Image_5ac754_8ca289;
--  end read only

--  begin read only
   procedure Test_2_Option_Image_test_option_image_distabled_state_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_5ac754_8ca289(Gnattest_T: in out Test) renames
     Test_2_Option_Image_test_option_image_distabled_state_type;
--  id:2.2/5ac754e1ee99f3f1/Option_Image/0/0/test_option_image_distabled_state_type/
   procedure Test_2_Option_Image_test_option_image_distabled_state_type
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Disabled_State_Type;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_5ac754_8ca289;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Options: Unbounded_String;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Option_Image("state", Disabled_State_Type'(NORMAL), Options);
      Assert
        (Options = To_Unbounded_String(" -state normal"),
         "Failed to get image for Disabled_State_Type option");

--  begin read only
   end Test_2_Option_Image_test_option_image_distabled_state_type;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_a0749a_9522a2
     (Name: String; Value: Ttk_Image_Option;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Option_Image_Image_Option test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkwidget.ads:0:):Test_Option_Image_Image_Option test commitment violated");
      end;
   end Wrap_Test_Option_Image_a0749a_9522a2;
--  end read only

--  begin read only
   procedure Test_3_Option_Image_test_option_image_image_option
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_a0749a_9522a2(Gnattest_T: in out Test) renames
     Test_3_Option_Image_test_option_image_image_option;
--  id:2.2/a0749a45436a2e7b/Option_Image/0/0/test_option_image_image_option/
   procedure Test_3_Option_Image_test_option_image_image_option
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Ttk_Image_Option;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_a0749a_9522a2;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Options: Unbounded_String;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Option_Image
        ("image",
         Ttk_Image_Option'(Default => To_Tcl_String("MyImage"), others => <>),
         Options);
      Assert
        (Options = To_Unbounded_String(" -image {MyImage}"),
         "Failed to get image for Ttk_Image_Type option");

--  begin read only
   end Test_3_Option_Image_test_option_image_image_option;
--  end read only

--  begin read only
   procedure Wrap_Test_Option_Image_fac0b4_5f511f
     (Name: String; Value: Padding_Data;
      Options_String: in out Unbounded_String) is
   begin
      begin
         pragma Assert(Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Option_Image_Padding_Data test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.Option_Image
        (Name, Value, Options_String);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkwidget.ads:0:):Test_Option_Image_Padding_Data test commitment violated");
      end;
   end Wrap_Test_Option_Image_fac0b4_5f511f;
--  end read only

--  begin read only
   procedure Test_4_Option_Image_test_option_image_padding_data
     (Gnattest_T: in out Test);
   procedure Test_Option_Image_fac0b4_5f511f(Gnattest_T: in out Test) renames
     Test_4_Option_Image_test_option_image_padding_data;
--  id:2.2/fac0b4180283eb8c/Option_Image/0/0/test_option_image_padding_data/
   procedure Test_4_Option_Image_test_option_image_padding_data
     (Gnattest_T: in out Test) is
      procedure Option_Image
        (Name: String; Value: Padding_Data;
         Options_String: in out Unbounded_String) renames
        Wrap_Test_Option_Image_fac0b4_5f511f;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Options: Unbounded_String;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Option_Image
        ("padding",
         Padding_Data'((1.0, PIXEL), (2.0, PIXEL), (3.0, PIXEL), (4.0, PIXEL)),
         Options);
      Assert
        (Options = To_Unbounded_String(" -padding {1.00 2.00 3.00 4.00}"),
         "Failed to get image for Padding_Array option");

--  begin read only
   end Test_4_Option_Image_test_option_image_padding_data;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_5bd68b_a92add
     (Ttk_Widgt: Ttk_Widget; Name: String) return Compound_Type is
   begin
      begin
         pragma Assert(Ttk_Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Option_Value_Compound_Type test requirement violated");
      end;
      declare
         Test_Option_Value_5bd68b_a92add_Result: constant Compound_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.Option_Value
             (Ttk_Widgt, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkwidget.ads:0:):Test_Option_Value_Compound_Type test commitment violated");
         end;
         return Test_Option_Value_5bd68b_a92add_Result;
      end;
   end Wrap_Test_Option_Value_5bd68b_a92add;
--  end read only

--  begin read only
   procedure Test_1_Option_Value_test_option_value_compound_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_5bd68b_a92add(Gnattest_T: in out Test) renames
     Test_1_Option_Value_test_option_value_compound_type;
--  id:2.2/5bd68b7026ba67cc/Option_Value/1/0/test_option_value_compound_type/
   procedure Test_1_Option_Value_test_option_value_compound_type
     (Gnattest_T: in out Test) is
      function Option_Value
        (Ttk_Widgt: Ttk_Widget; Name: String) return Compound_Type renames
        Wrap_Test_Option_Value_5bd68b_a92add;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Widget: Ttk_Widget;
      Option: Compound_Type;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Tcl_Eval("ttk::button .test -compound text");
      Widget := Get_Widget(".test");
      Option := Option_Value(Widget, "compound");
      Assert
        (Option = TEXT,
         "Failed to get value of Ttk_Widget option Compound_Type.");
      Destroy(Widget);
      Tcl_Eval("ttk::button .test");
      Widget := Get_Widget(".test");
      Option := Option_Value(Widget, "compound");
      Assert
        (Option = EMPTY,
         "Failed to get empty value of Ttk_Widget option Compound_Type.");

--  begin read only
   end Test_1_Option_Value_test_option_value_compound_type;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_e44442_1318d9
     (Ttk_Widgt: Ttk_Widget; Name: String) return Disabled_State_Type is
   begin
      begin
         pragma Assert(Ttk_Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Option_Value_Disabled_State_Type test requirement violated");
      end;
      declare
         Test_Option_Value_e44442_1318d9_Result: constant Disabled_State_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.Option_Value
             (Ttk_Widgt, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkwidget.ads:0:):Test_Option_Value_Disabled_State_Type test commitment violated");
         end;
         return Test_Option_Value_e44442_1318d9_Result;
      end;
   end Wrap_Test_Option_Value_e44442_1318d9;
--  end read only

--  begin read only
   procedure Test_2_Option_Value_test_option_value_disabled_state_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_e44442_1318d9(Gnattest_T: in out Test) renames
     Test_2_Option_Value_test_option_value_disabled_state_type;
--  id:2.2/e4444212d9605a79/Option_Value/0/0/test_option_value_disabled_state_type/
   procedure Test_2_Option_Value_test_option_value_disabled_state_type
     (Gnattest_T: in out Test) is
      function Option_Value
        (Ttk_Widgt: Ttk_Widget; Name: String)
         return Disabled_State_Type renames
        Wrap_Test_Option_Value_e44442_1318d9;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Widget: Ttk_Widget;
      Option: Disabled_State_Type;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Tcl_Eval("ttk::button .test -state disabled");
      Widget := Get_Widget(".test");
      Option := Option_Value(Widget, "state");
      Assert
        (Option = DISABLED,
         "Failed to get value of Ttk_Widget option Disabled_State_Type.");
      Destroy(Widget);

--  begin read only
   end Test_2_Option_Value_test_option_value_disabled_state_type;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_7d1d95_d2d94b
     (Ttk_Widgt: Ttk_Widget; Name: String) return Ttk_Image_Option is
   begin
      begin
         pragma Assert(Ttk_Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Option_Value_Ttk_Image_Option test requirement violated");
      end;
      declare
         Test_Option_Value_7d1d95_d2d94b_Result: constant Ttk_Image_Option :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.Option_Value
             (Ttk_Widgt, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkwidget.ads:0:):Test_Option_Value_Ttk_Image_Option test commitment violated");
         end;
         return Test_Option_Value_7d1d95_d2d94b_Result;
      end;
   end Wrap_Test_Option_Value_7d1d95_d2d94b;
--  end read only

--  begin read only
   procedure Test_3_Option_Value_test_option_value_ttk_image_option
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_7d1d95_d2d94b(Gnattest_T: in out Test) renames
     Test_3_Option_Value_test_option_value_ttk_image_option;
--  id:2.2/7d1d95f7e386ba50/Option_Value/0/0/test_option_value_ttk_image_option/
   procedure Test_3_Option_Value_test_option_value_ttk_image_option
     (Gnattest_T: in out Test) is
      function Option_Value
        (Ttk_Widgt: Ttk_Widget; Name: String) return Ttk_Image_Option renames
        Wrap_Test_Option_Value_7d1d95_d2d94b;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Widget: Ttk_Widget;
      Option: Ttk_Image_Option;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Tcl_Eval("image create bitmap MyImage");
      Tcl_Eval("ttk::button .test -image {MyImage}");
      Widget := Get_Widget(".test");
      Option := Option_Value(Widget, "image");
      Assert
        (Option.Default = To_Unbounded_String("MyImage"),
         "Failed to get value of Ttk_Widget option Ttk_Image_Option.");
      Destroy(Widget);
      Tcl_Eval("image delete MyImage");

--  begin read only
   end Test_3_Option_Value_test_option_value_ttk_image_option;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_08ea7f_956d9f
     (Ttk_Widgt: Ttk_Widget; Name: String) return Padding_Data is
   begin
      begin
         pragma Assert(Ttk_Widgt /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Option_Value_Padding_Data test requirement violated");
      end;
      declare
         Test_Option_Value_08ea7f_956d9f_Result: constant Padding_Data :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.Option_Value
             (Ttk_Widgt, Name);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkwidget.ads:0:):Test_Option_Value_Padding_Data test commitment violated");
         end;
         return Test_Option_Value_08ea7f_956d9f_Result;
      end;
   end Wrap_Test_Option_Value_08ea7f_956d9f;
--  end read only

--  begin read only
   procedure Test_4_Option_Value_test_option_value_padding_data
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_08ea7f_956d9f(Gnattest_T: in out Test) renames
     Test_4_Option_Value_test_option_value_padding_data;
--  id:2.2/08ea7f83934101c8/Option_Value/0/0/test_option_value_padding_data/
   procedure Test_4_Option_Value_test_option_value_padding_data
     (Gnattest_T: in out Test) is
      function Option_Value
        (Ttk_Widgt: Ttk_Widget; Name: String) return Padding_Data renames
        Wrap_Test_Option_Value_08ea7f_956d9f;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Widget: Ttk_Widget;
      Option: Padding_Data;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Tcl_Eval("ttk::button .test -padding {1 2 3 4}");
      Widget := Get_Widget(".test");
      Option := Option_Value(Widget, "padding");
      Assert
        (Option = ((1.0, PIXEL), (2.0, PIXEL), (3.0, PIXEL), (4.0, PIXEL)),
         "Failed to get value of Ttk_Widget option Padding_Array.");
      Destroy(Widget);
      Tcl_Eval("ttk::label .test");
      Widget := Get_Widget(".test");
      Option := Option_Value(Widget, "padding");
      Assert
        (Option = ((-1.0, PIXEL), (-1.0, PIXEL), (-1.0, PIXEL), (-1.0, PIXEL)),
         "Failed to get empty value of Ttk_Widget option Padding_Array.");
      Destroy(Widget);

--  begin read only
   end Test_4_Option_Value_test_option_value_padding_data;
--  end read only

--  begin read only
   function Wrap_Test_In_State_46b68b_db2848
     (Ttk_Widgt: Ttk_Widget; State_Ttk: Ttk_State_Type) return Boolean is
   begin
      begin
         pragma Assert(Ttk_Widgt /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Ttk_Widget_In_State test requirement violated");
      end;
      declare
         Test_In_State_46b68b_db2848_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.In_State
             (Ttk_Widgt, State_Ttk);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkwidget.ads:0:):Test_Ttk_Widget_In_State test commitment violated");
         end;
         return Test_In_State_46b68b_db2848_Result;
      end;
   end Wrap_Test_In_State_46b68b_db2848;
--  end read only

--  begin read only
   procedure Test_1_In_State_test_ttk_widget_in_state(Gnattest_T: in out Test);
   procedure Test_In_State_46b68b_db2848(Gnattest_T: in out Test) renames
     Test_1_In_State_test_ttk_widget_in_state;
--  id:2.2/46b68bc42404b705/In_State/1/0/test_ttk_widget_in_state/
   procedure Test_1_In_State_test_ttk_widget_in_state
     (Gnattest_T: in out Test) is
      function In_State
        (Ttk_Widgt: Ttk_Widget; State_Ttk: Ttk_State_Type)
         return Boolean renames
        Wrap_Test_In_State_46b68b_db2848;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Widget: Ttk_Widget;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Tcl_Eval("ttk::button .test");
      Widget := Get_Widget(".test");
      Assert
        (not In_State(Widget, DISABLED),
         "Failed to get state of the Ttk widget.");
      Destroy(Widget);

--  begin read only
   end Test_1_In_State_test_ttk_widget_in_state;
--  end read only

--  begin read only
   procedure Wrap_Test_In_State_318f72_d83e8c
     (Ttk_Widgt: Ttk_Widget; State_Type: Ttk_State_Type;
      Tcl_Script: Tcl_String) is
   begin
      begin
         pragma Assert
           (Ttk_Widgt /= Null_Widget and Length(Source => Tcl_Script) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Ttk_Widget_In_State2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.In_State
        (Ttk_Widgt, State_Type, Tcl_Script);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkwidget.ads:0:):Test_Ttk_Widget_In_State2 test commitment violated");
      end;
   end Wrap_Test_In_State_318f72_d83e8c;
--  end read only

--  begin read only
   procedure Test_2_In_State_test_ttk_widget_in_state2
     (Gnattest_T: in out Test);
   procedure Test_In_State_318f72_d83e8c(Gnattest_T: in out Test) renames
     Test_2_In_State_test_ttk_widget_in_state2;
--  id:2.2/318f72fbc8aff9f0/In_State/0/0/test_ttk_widget_in_state2/
   procedure Test_2_In_State_test_ttk_widget_in_state2
     (Gnattest_T: in out Test) is
      procedure In_State
        (Ttk_Widgt: Ttk_Widget; State_Type: Ttk_State_Type;
         Tcl_Script: Tcl_String) renames
        Wrap_Test_In_State_318f72_d83e8c;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Widget: Ttk_Widget;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Tcl_Eval("ttk::button .test");
      Widget := Get_Widget(".test");
      Set_State(Widget, DISABLED);
      In_State(Widget, DISABLED, To_Tcl_String("set myvar true"));
      Assert
        (Tcl_Get_Var("myvar") = "true",
         "Failed to run Tcl script on Ttk widget state.");
      Destroy(Widget);

--  begin read only
   end Test_2_In_State_test_ttk_widget_in_state2;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_State_86b648_15a1a7
     (Ttk_Widgt: Ttk_Widget; Widget_State: Ttk_State_Type;
      Disable: Boolean := False) is
   begin
      begin
         pragma Assert(Ttk_Widgt /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Ttk_Widget_State test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.Set_State
        (Ttk_Widgt, Widget_State, Disable);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkwidget.ads:0:):Test_Ttk_Widget_State test commitment violated");
      end;
   end Wrap_Test_Set_State_86b648_15a1a7;
--  end read only

--  begin read only
   procedure Test_Set_State_test_ttk_widget_state(Gnattest_T: in out Test);
   procedure Test_Set_State_86b648_15a1a7(Gnattest_T: in out Test) renames
     Test_Set_State_test_ttk_widget_state;
--  id:2.2/86b648be4948fc17/Set_State/1/0/test_ttk_widget_state/
   procedure Test_Set_State_test_ttk_widget_state(Gnattest_T: in out Test) is
      procedure Set_State
        (Ttk_Widgt: Ttk_Widget; Widget_State: Ttk_State_Type;
         Disable: Boolean := False) renames
        Wrap_Test_Set_State_86b648_15a1a7;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Widget: Ttk_Widget;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Tcl_Eval("ttk::button .test");
      Widget := Get_Widget(".test");
      Set_State(Widget, DISABLED);
      Assert
        (In_State(Widget, DISABLED), "Failed to set state of the Ttk widget.");
      Destroy(Widget);

--  begin read only
   end Test_Set_State_test_ttk_widget_state;
--  end read only

--  begin read only
   function Wrap_Test_Get_States_734267_5a6282
     (Ttk_Widgt: Ttk_Widget) return Ttk_State_Array is
   begin
      begin
         pragma Assert(Ttk_Widgt /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Ttk_Widget_State2 test requirement violated");
      end;
      declare
         Test_Get_States_734267_5a6282_Result: constant Ttk_State_Array :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.Get_States
             (Ttk_Widgt);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkwidget.ads:0:):Test_Ttk_Widget_State2 test commitment violated");
         end;
         return Test_Get_States_734267_5a6282_Result;
      end;
   end Wrap_Test_Get_States_734267_5a6282;
--  end read only

--  begin read only
   procedure Test_Get_States_test_ttk_widget_state2(Gnattest_T: in out Test);
   procedure Test_Get_States_734267_5a6282(Gnattest_T: in out Test) renames
     Test_Get_States_test_ttk_widget_state2;
--  id:2.2/7342673321774030/Get_States/1/0/test_ttk_widget_state2/
   procedure Test_Get_States_test_ttk_widget_state2(Gnattest_T: in out Test) is
      function Get_States(Ttk_Widgt: Ttk_Widget) return Ttk_State_Array renames
        Wrap_Test_Get_States_734267_5a6282;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Widget: Ttk_Widget;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Tcl_Eval("ttk::button .test");
      Widget := Get_Widget(".test");
      Set_State(Widget, DISABLED);
      Set_State(Widget, READONLY);
      declare
         States: constant Ttk_State_Array := Get_States(Widget);
      begin
         Assert(States'Length = 2, "Failed to get states of the Ttk widget.");
      end;
      Destroy(Widget);

--  begin read only
   end Test_Get_States_test_ttk_widget_state2;
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
end Tk.TtkWidget.Test_Data.Tests;
