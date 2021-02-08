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
   function Wrap_Test_Option_Value_5bd68b_10996b
     (Widget: Ttk_Widget; Name: String) return Compound_Type is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Option_Value_Compound_Type test requirement violated");
      end;
      declare
         Test_Option_Value_5bd68b_10996b_Result: constant Compound_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.Option_Value
             (Widget, Name);
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
         return Test_Option_Value_5bd68b_10996b_Result;
      end;
   end Wrap_Test_Option_Value_5bd68b_10996b;
--  end read only

--  begin read only
   procedure Test_1_Option_Value_test_option_value_compound_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_5bd68b_10996b(Gnattest_T: in out Test) renames
     Test_1_Option_Value_test_option_value_compound_type;
--  id:2.2/5bd68b7026ba67cc/Option_Value/1/0/test_option_value_compound_type/
   procedure Test_1_Option_Value_test_option_value_compound_type
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Ttk_Widget; Name: String) return Compound_Type renames
        Wrap_Test_Option_Value_5bd68b_10996b;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_1_Option_Value_test_option_value_compound_type;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_e44442_967b4b
     (Widget: Ttk_Widget; Name: String) return Disabled_State_Type is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Option_Value_Disabled_State_Type test requirement violated");
      end;
      declare
         Test_Option_Value_e44442_967b4b_Result: constant Disabled_State_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.Option_Value
             (Widget, Name);
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
         return Test_Option_Value_e44442_967b4b_Result;
      end;
   end Wrap_Test_Option_Value_e44442_967b4b;
--  end read only

--  begin read only
   procedure Test_2_Option_Value_test_option_value_disabled_state_type
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_e44442_967b4b(Gnattest_T: in out Test) renames
     Test_2_Option_Value_test_option_value_disabled_state_type;
--  id:2.2/e4444212d9605a79/Option_Value/0/0/test_option_value_disabled_state_type/
   procedure Test_2_Option_Value_test_option_value_disabled_state_type
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Ttk_Widget; Name: String) return Disabled_State_Type renames
        Wrap_Test_Option_Value_e44442_967b4b;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Option_Value_test_option_value_disabled_state_type;
--  end read only

--  begin read only
   function Wrap_Test_Option_Value_7d1d95_cbcbe2
     (Widget: Ttk_Widget; Name: String) return Ttk_Image_Option is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Name'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Option_Value_Ttk_Image_Option test requirement violated");
      end;
      declare
         Test_Option_Value_7d1d95_cbcbe2_Result: constant Ttk_Image_Option :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.Option_Value
             (Widget, Name);
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
         return Test_Option_Value_7d1d95_cbcbe2_Result;
      end;
   end Wrap_Test_Option_Value_7d1d95_cbcbe2;
--  end read only

--  begin read only
   procedure Test_3_Option_Value_test_option_value_ttk_image_option
     (Gnattest_T: in out Test);
   procedure Test_Option_Value_7d1d95_cbcbe2(Gnattest_T: in out Test) renames
     Test_3_Option_Value_test_option_value_ttk_image_option;
--  id:2.2/7d1d95f7e386ba50/Option_Value/0/0/test_option_value_ttk_image_option/
   procedure Test_3_Option_Value_test_option_value_ttk_image_option
     (Gnattest_T: in out Test) is
      function Option_Value
        (Widget: Ttk_Widget; Name: String) return Ttk_Image_Option renames
        Wrap_Test_Option_Value_7d1d95_cbcbe2;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_3_Option_Value_test_option_value_ttk_image_option;
--  end read only

--  begin read only
   function Wrap_Test_In_State_46b68b_5aa481
     (Widget: Ttk_Widget; State: Ttk_State_Type) return Boolean is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Ttk_Widget_In_State test requirement violated");
      end;
      declare
         Test_In_State_46b68b_5aa481_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.In_State
             (Widget, State);
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
         return Test_In_State_46b68b_5aa481_Result;
      end;
   end Wrap_Test_In_State_46b68b_5aa481;
--  end read only

--  begin read only
   procedure Test_1_In_State_test_ttk_widget_in_state(Gnattest_T: in out Test);
   procedure Test_In_State_46b68b_5aa481(Gnattest_T: in out Test) renames
     Test_1_In_State_test_ttk_widget_in_state;
--  id:2.2/46b68bc42404b705/In_State/1/0/test_ttk_widget_in_state/
   procedure Test_1_In_State_test_ttk_widget_in_state
     (Gnattest_T: in out Test) is
      function In_State
        (Widget: Ttk_Widget; State: Ttk_State_Type) return Boolean renames
        Wrap_Test_In_State_46b68b_5aa481;
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
   procedure Wrap_Test_In_State_318f72_883288
     (Widget: Ttk_Widget; State: Ttk_State_Type; Tcl_Script: Tcl_String) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget and Length(Tcl_Script) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Ttk_Widget_In_State2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.In_State
        (Widget, State, Tcl_Script);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkwidget.ads:0:):Test_Ttk_Widget_In_State2 test commitment violated");
      end;
   end Wrap_Test_In_State_318f72_883288;
--  end read only

--  begin read only
   procedure Test_2_In_State_test_ttk_widget_in_state2
     (Gnattest_T: in out Test);
   procedure Test_In_State_318f72_883288(Gnattest_T: in out Test) renames
     Test_2_In_State_test_ttk_widget_in_state2;
--  id:2.2/318f72fbc8aff9f0/In_State/0/0/test_ttk_widget_in_state2/
   procedure Test_2_In_State_test_ttk_widget_in_state2
     (Gnattest_T: in out Test) is
      procedure In_State
        (Widget: Ttk_Widget; State: Ttk_State_Type;
         Tcl_Script: Tcl_String) renames
        Wrap_Test_In_State_318f72_883288;
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
      State(Widget, DISABLED);
      In_State(Widget, DISABLED, To_Tcl_String("set myvar true"));
      Assert
        (Tcl_GetVar("myvar") = "true",
         "Failed to run Tcl script on Ttk widget state.");
      Destroy(Widget);

--  begin read only
   end Test_2_In_State_test_ttk_widget_in_state2;
--  end read only

--  begin read only
   procedure Wrap_Test_State_291199_c12173
     (Widget: Ttk_Widget; State: Ttk_State_Type; Disable: Boolean := False) is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Ttk_Widget_State test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.State
        (Widget, State, Disable);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkwidget.ads:0:):Test_Ttk_Widget_State test commitment violated");
      end;
   end Wrap_Test_State_291199_c12173;
--  end read only

--  begin read only
   procedure Test_1_State_test_ttk_widget_state(Gnattest_T: in out Test);
   procedure Test_State_291199_c12173(Gnattest_T: in out Test) renames
     Test_1_State_test_ttk_widget_state;
--  id:2.2/29119983a05a4465/State/1/0/test_ttk_widget_state/
   procedure Test_1_State_test_ttk_widget_state(Gnattest_T: in out Test) is
      procedure State
        (Widget: Ttk_Widget; State: Ttk_State_Type;
         Disable: Boolean := False) renames
        Wrap_Test_State_291199_c12173;
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
      State(Widget, DISABLED);
      Assert
        (In_State(Widget, DISABLED), "Failed to set state of the Ttk widget.");
      Destroy(Widget);

--  begin read only
   end Test_1_State_test_ttk_widget_state;
--  end read only

--  begin read only
   function Wrap_Test_State_8d49e9_039b18
     (Widget: Ttk_Widget) return Ttk_State_Array is
   begin
      begin
         pragma Assert(Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkwidget.ads:0):Test_Ttk_Widget_State2 test requirement violated");
      end;
      declare
         Test_State_8d49e9_039b18_Result: constant Ttk_State_Array :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget.State(Widget);
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
         return Test_State_8d49e9_039b18_Result;
      end;
   end Wrap_Test_State_8d49e9_039b18;
--  end read only

--  begin read only
   procedure Test_2_State_test_ttk_widget_state2(Gnattest_T: in out Test);
   procedure Test_State_8d49e9_039b18(Gnattest_T: in out Test) renames
     Test_2_State_test_ttk_widget_state2;
--  id:2.2/8d49e9dc4c0e1a81/State/0/0/test_ttk_widget_state2/
   procedure Test_2_State_test_ttk_widget_state2(Gnattest_T: in out Test) is
      function State(Widget: Ttk_Widget) return Ttk_State_Array renames
        Wrap_Test_State_8d49e9_039b18;
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
      State(Widget, DISABLED);
      State(Widget, READONLY);
      declare
         States: constant Ttk_State_Array := State(Widget);
      begin
         Assert(States'Length = 2, "Failed to get states of the Ttk widget.");
      end;
      Destroy(Widget);

--  begin read only
   end Test_2_State_test_ttk_widget_state2;
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
