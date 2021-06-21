--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Image.Bitmap.Bitmap_Options_Test_Data.

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
package body Tk.Image.Bitmap.Bitmap_Options_Test_Data.Bitmap_Options_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Create_22037c_8bd2c6
     (Bitmap_Image: Tk_Image; Options: Bitmap_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Bitmap_Image'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-bitmap.ads:0):Tests_Create_Bitmap test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Bitmap.Create
        (Bitmap_Image, Options, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-bitmap.ads:0:):Tests_Create_Bitmap test commitment violated");
      end;
   end Wrap_Test_Create_22037c_8bd2c6;
--  end read only

--  begin read only
   procedure Test_1_Create_tests_create_bitmap
     (Gnattest_T: in out Test_Bitmap_Options);
   procedure Test_Create_22037c_8bd2c6
     (Gnattest_T: in out Test_Bitmap_Options) renames
     Test_1_Create_tests_create_bitmap;
--  id:2.2/22037c1fbc7ae682/Create/1/0/tests_create_bitmap/
   procedure Test_1_Create_tests_create_bitmap
     (Gnattest_T: in out Test_Bitmap_Options) is
      procedure Create
        (Bitmap_Image: Tk_Image; Options: Bitmap_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Create_22037c_8bd2c6;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        ("mybitmap",
         Bitmap_Options'
           (Data =>
              To_Tcl_String
                ("#define test_width 16\n#define test_height 16\nstatic unsigned char test_bits[] = {\n   0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,\n   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,\n   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};",
                 True),
            others => <>));
      Assert
        (Image_Type("mybitmap") = "bitmap",
         "Failed to create a bitmap image with selected name from file.");

--  begin read only
   end Test_1_Create_tests_create_bitmap;
--  end read only

--  begin read only
   function Wrap_Test_Create_fa334a_afeffb
     (Options: Bitmap_Options; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Image is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-bitmap.ads:0):Tests_Create2_Bitmap test requirement violated");
      end;
      declare
         Test_Create_fa334a_afeffb_Result: constant Tk_Image :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Bitmap.Create
             (Options, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image-bitmap.ads:0:):Tests_Create2_Bitmap test commitment violated");
         end;
         return Test_Create_fa334a_afeffb_Result;
      end;
   end Wrap_Test_Create_fa334a_afeffb;
--  end read only

--  begin read only
   procedure Test_2_Create_tests_create2_bitmap
     (Gnattest_T: in out Test_Bitmap_Options);
   procedure Test_Create_fa334a_afeffb
     (Gnattest_T: in out Test_Bitmap_Options) renames
     Test_2_Create_tests_create2_bitmap;
--  id:2.2/fa334a87cdcf0776/Create/0/0/tests_create2_bitmap/
   procedure Test_2_Create_tests_create2_bitmap
     (Gnattest_T: in out Test_Bitmap_Options) is
      function Create
        (Options: Bitmap_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Tk_Image renames
        Wrap_Test_Create_fa334a_afeffb;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      declare
         Bitmap_Image: constant Tk_Image := Create(Default_Bitmap_Options);
      begin
         Assert
           (Bitmap_Image'Length > 0,
            "Failed to create a bitmap image with random name.");
         Delete(Bitmap_Image);
      end;

--  begin read only
   end Test_2_Create_tests_create2_bitmap;
--  end read only

--  begin read only
   procedure Wrap_Test_Configure_6e2ac0_59fc30
     (Bitmap_Image: Tk_Image; Options: Bitmap_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Bitmap_Image'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-bitmap.ads:0):Tests_Configure_Bitmap test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Bitmap.Configure
        (Bitmap_Image, Options, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-bitmap.ads:0:):Tests_Configure_Bitmap test commitment violated");
      end;
   end Wrap_Test_Configure_6e2ac0_59fc30;
--  end read only

--  begin read only
   procedure Test_Configure_tests_configure_bitmap
     (Gnattest_T: in out Test_Bitmap_Options);
   procedure Test_Configure_6e2ac0_59fc30
     (Gnattest_T: in out Test_Bitmap_Options) renames
     Test_Configure_tests_configure_bitmap;
--  id:2.2/6e2ac08c4cd9ce38/Configure/1/0/tests_configure_bitmap/
   procedure Test_Configure_tests_configure_bitmap
     (Gnattest_T: in out Test_Bitmap_Options) is
      procedure Configure
        (Bitmap_Image: Tk_Image; Options: Bitmap_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Configure_6e2ac0_59fc30;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Configure
        ("mybitmap",
         Bitmap_Options'(Background => To_Tcl_String("black"), others => <>));
      Assert
        (Get_Option("mybitmap", "background") = "black",
         "Failed to set options for bitmap image.");

--  begin read only
   end Test_Configure_tests_configure_bitmap;
--  end read only

--  begin read only
   function Wrap_Test_Get_Options_5c7a9c_1a3561
     (Bitmap_Image: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Bitmap_Options is
   begin
      begin
         pragma Assert
           (Bitmap_Image'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-bitmap.ads:0):Tests_Get_Options_Bitmap test requirement violated");
      end;
      declare
         Test_Get_Options_5c7a9c_1a3561_Result: constant Bitmap_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Bitmap.Get_Options
             (Bitmap_Image, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image-bitmap.ads:0:):Tests_Get_Options_Bitmap test commitment violated");
         end;
         return Test_Get_Options_5c7a9c_1a3561_Result;
      end;
   end Wrap_Test_Get_Options_5c7a9c_1a3561;
--  end read only

--  begin read only
   procedure Test_Get_Options_tests_get_options_bitmap
     (Gnattest_T: in out Test_Bitmap_Options);
   procedure Test_Get_Options_5c7a9c_1a3561
     (Gnattest_T: in out Test_Bitmap_Options) renames
     Test_Get_Options_tests_get_options_bitmap;
--  id:2.2/5c7a9c2ff87b2567/Get_Options/1/0/tests_get_options_bitmap/
   procedure Test_Get_Options_tests_get_options_bitmap
     (Gnattest_T: in out Test_Bitmap_Options) is
      function Get_Options
        (Bitmap_Image: Tk_Image;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Bitmap_Options renames
        Wrap_Test_Get_Options_5c7a9c_1a3561;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Options("mybitmap").Background = "black",
         "Failed to get options for bitmap image.");

--  begin read only
   end Test_Get_Options_tests_get_options_bitmap;
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
end Tk.Image.Bitmap.Bitmap_Options_Test_Data.Bitmap_Options_Tests;
