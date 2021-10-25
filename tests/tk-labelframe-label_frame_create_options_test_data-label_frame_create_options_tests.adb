--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Labelframe.Label_Frame_Create_Options_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Ada.Environment_Variables; use Ada.Environment_Variables;

--  begin read only
--  end read only
package body Tk.Labelframe.Label_Frame_Create_Options_Test_Data
  .Label_Frame_Create_Options_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Options_To_String_0a74e5_498c45
     (Options: Label_Frame_Create_Options) return String is
   begin
      declare
         Test_Options_To_String_0a74e5_498c45_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Labelframe.Options_To_String
             (Options);
      begin
         return Test_Options_To_String_0a74e5_498c45_Result;
      end;
   end Wrap_Test_Options_To_String_0a74e5_498c45;
--  end read only

--  begin read only
   procedure Test_Options_To_String_test_options_to_string
     (Gnattest_T: in out Test_Label_Frame_Create_Options);
   procedure Test_Options_To_String_0a74e5_498c45
     (Gnattest_T: in out Test_Label_Frame_Create_Options) renames
     Test_Options_To_String_test_options_to_string;
--  id:2.2/0a74e5bf046dd82b/Options_To_String/1/0/test_options_to_string/
   procedure Test_Options_To_String_test_options_to_string
     (Gnattest_T: in out Test_Label_Frame_Create_Options) is
      function Options_To_String
        (Options: Label_Frame_Create_Options) return String renames
        Wrap_Test_Options_To_String_0a74e5_498c45;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (Options_To_String(Label_Frame_Create_Options'(others => <>)) = "",
         "Failed to convert default Label_Frame_Create_Options to Tcl command.");
      Assert
        (Options_To_String
           (Label_Frame_Create_Options'(Relief => RAISED, others => <>)) =
         " -relief raised",
         "Failed to convert Label_Frame_Create_Options to Tcl command.");

--  begin read only
   end Test_Options_To_String_test_options_to_string;
--  end read only

--  begin read only
   function Wrap_Test_Create_32e405_0563f1
     (Path_Name: Tk_Path_String; Options: Label_Frame_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tk_Label_Frame is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-labelframe.ads:0):Test_Create_Label_Frame1 test requirement violated");
      end;
      declare
         Test_Create_32e405_0563f1_Result: constant Tk_Label_Frame :=
           GNATtest_Generated.GNATtest_Standard.Tk.Labelframe.Create
             (Path_Name, Options, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-labelframe.ads:0:):Test_Create_Label_Frame1 test commitment violated");
         end;
         return Test_Create_32e405_0563f1_Result;
      end;
   end Wrap_Test_Create_32e405_0563f1;
--  end read only

--  begin read only
   procedure Test_1_Create_test_create_label_frame1
     (Gnattest_T: in out Test_Label_Frame_Create_Options);
   procedure Test_Create_32e405_0563f1
     (Gnattest_T: in out Test_Label_Frame_Create_Options) renames
     Test_1_Create_test_create_label_frame1;
--  id:2.2/32e405543423d7b8/Create/1/0/test_create_label_frame1/
   procedure Test_1_Create_test_create_label_frame1
     (Gnattest_T: in out Test_Label_Frame_Create_Options) is
      function Create
        (Path_Name: Tk_Path_String; Options: Label_Frame_Create_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Tk_Label_Frame renames
        Wrap_Test_Create_32e405_0563f1;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Frame: Tk_Label_Frame;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create(Frame, ".myframe", Label_Frame_Create_Options'(others => <>));
      Assert(Frame /= Null_Widget, "Failed to create a new labelframe.");
      Destroy(Frame);

--  begin read only
   end Test_1_Create_test_create_label_frame1;
--  end read only

--  begin read only
   procedure Wrap_Test_Create_ebbdc1_776696
     (Frame_Widget: out Tk_Label_Frame; Path_Name: Tk_Path_String;
      Options: Label_Frame_Create_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-labelframe.ads:0):Test_Create_Label_Frame2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Labelframe.Create
        (Frame_Widget, Path_Name, Options, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-labelframe.ads:0:):Test_Create_Label_Frame2 test commitment violated");
      end;
   end Wrap_Test_Create_ebbdc1_776696;
--  end read only

--  begin read only
   procedure Test_2_Create_test_create_label_frame2
     (Gnattest_T: in out Test_Label_Frame_Create_Options);
   procedure Test_Create_ebbdc1_776696
     (Gnattest_T: in out Test_Label_Frame_Create_Options) renames
     Test_2_Create_test_create_label_frame2;
--  id:2.2/ebbdc1934f0fa33d/Create/0/0/test_create_label_frame2/
   procedure Test_2_Create_test_create_label_frame2
     (Gnattest_T: in out Test_Label_Frame_Create_Options) is
      procedure Create
        (Frame_Widget: out Tk_Label_Frame; Path_Name: Tk_Path_String;
         Options: Label_Frame_Create_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Create_ebbdc1_776696;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Frame: Tk_Label_Frame;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Frame := Create(".myframe", Label_Frame_Create_Options'(others => <>));
      Assert(Frame /= Null_Widget, "Failed to create a new labelframe.");
      Destroy(Frame);

--  begin read only
   end Test_2_Create_test_create_label_frame2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Options_ded36e_6d2dd5
     (Frame_Widget: Tk_Label_Frame) return Label_Frame_Create_Options is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-labelframe.ads:0):Test_Get_Options_Label_Frame test requirement violated");
      end;
      declare
         Test_Get_Options_ded36e_6d2dd5_Result: constant Label_Frame_Create_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Labelframe.Get_Options
             (Frame_Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-labelframe.ads:0:):Test_Get_Options_Label_Frame test commitment violated");
         end;
         return Test_Get_Options_ded36e_6d2dd5_Result;
      end;
   end Wrap_Test_Get_Options_ded36e_6d2dd5;
--  end read only

--  begin read only
   procedure Test_Get_Options_test_get_options_label_frame
     (Gnattest_T: in out Test_Label_Frame_Create_Options);
   procedure Test_Get_Options_ded36e_6d2dd5
     (Gnattest_T: in out Test_Label_Frame_Create_Options) renames
     Test_Get_Options_test_get_options_label_frame;
--  id:2.2/ded36e34d54c20f9/Get_Options/1/0/test_get_options_label_frame/
   procedure Test_Get_Options_test_get_options_label_frame
     (Gnattest_T: in out Test_Label_Frame_Create_Options) is
      function Get_Options
        (Frame_Widget: Tk_Label_Frame)
         return Label_Frame_Create_Options renames
        Wrap_Test_Get_Options_ded36e_6d2dd5;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Frame: Tk_Label_Frame;
      Options: Label_Frame_Create_Options;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        (Frame, ".myframe",
         Label_Frame_Create_Options'(Relief => RAISED, others => <>));
      Options := Get_Options(Frame);
      Assert(Options.Relief = RAISED, "Failed to get labelframe options.");
      Destroy(Frame);

--  begin read only
   end Test_Get_Options_test_get_options_label_frame;
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
end Tk.Labelframe.Label_Frame_Create_Options_Test_Data
  .Label_Frame_Create_Options_Tests;
