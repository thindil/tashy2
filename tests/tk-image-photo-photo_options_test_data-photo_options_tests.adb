--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Image.Photo.Photo_Options_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Ada.Environment_Variables; use Ada.Environment_Variables;
with GNAT.Directory_Operations; use GNAT.Directory_Operations;

--  begin read only
--  end read only
package body Tk.Image.Photo.Photo_Options_Test_Data.Photo_Options_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Options_To_String_5fc431_498c45
     (Options: Photo_Options) return String is
   begin
      declare
         Test_Options_To_String_5fc431_498c45_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo
             .Options_To_String
             (Options);
      begin
         return Test_Options_To_String_5fc431_498c45_Result;
      end;
   end Wrap_Test_Options_To_String_5fc431_498c45;
--  end read only

--  begin read only
   procedure Test_Options_To_String_test_options_to_string
     (Gnattest_T: in out Test_Photo_Options);
   procedure Test_Options_To_String_5fc431_498c45
     (Gnattest_T: in out Test_Photo_Options) renames
     Test_Options_To_String_test_options_to_string;
--  id:2.2/5fc431b6a7fd2e99/Options_To_String/1/0/test_options_to_string/
   procedure Test_Options_To_String_test_options_to_string
     (Gnattest_T: in out Test_Photo_Options) is
      function Options_To_String(Options: Photo_Options) return String renames
        Wrap_Test_Options_To_String_5fc431_498c45;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (Options_To_String(Photo_Options'(others => <>)) = "",
         "Failed to convert default Photo_Options to Tcl command.");
      Assert
        (Options_To_String(Photo_Options'(Height => 10, others => <>)) =
         " -height 10",
         "Failed to convert Photo_Options to Tcl command.");

--  begin read only
   end Test_Options_To_String_test_options_to_string;
--  end read only

--  begin read only
   procedure Wrap_Test_Create_22037c_8377bb
     (Photo_Image: Tk_Image; Options: Photo_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Create_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Create
        (Photo_Image, Options, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Tests_Create_Photo test commitment violated");
      end;
   end Wrap_Test_Create_22037c_8377bb;
--  end read only

--  begin read only
   procedure Test_1_Create_tests_create_photo
     (Gnattest_T: in out Test_Photo_Options);
   procedure Test_Create_22037c_8377bb
     (Gnattest_T: in out Test_Photo_Options) renames
     Test_1_Create_tests_create_photo;
--  id:2.2/22037c1fbc7ae682/Create/1/0/tests_create_photo/
   procedure Test_1_Create_tests_create_photo
     (Gnattest_T: in out Test_Photo_Options) is
      procedure Create
        (Photo_Image: Tk_Image; Options: Photo_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Create_22037c_8377bb;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create
        ("myphoto",
         (Format => To_Tcl_String("png"),
          File => To_Tcl_String(".." & Dir_Separator & "test.png"),
          others => <>));
      Assert
        (Image_Type("myphoto") = "photo",
         "Failed to create a photo image with selected name from file.");

--  begin read only
   end Test_1_Create_tests_create_photo;
--  end read only

--  begin read only
   function Wrap_Test_Create_fa334a_6f3d65
     (Options: Photo_Options; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Tk_Image is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Create2_Photo test requirement violated");
      end;
      declare
         Test_Create_fa334a_6f3d65_Result: constant Tk_Image :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Create
             (Options, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image-photo.ads:0:):Tests_Create2_Photo test commitment violated");
         end;
         return Test_Create_fa334a_6f3d65_Result;
      end;
   end Wrap_Test_Create_fa334a_6f3d65;
--  end read only

--  begin read only
   procedure Test_2_Create_tests_create2_photo
     (Gnattest_T: in out Test_Photo_Options);
   procedure Test_Create_fa334a_6f3d65
     (Gnattest_T: in out Test_Photo_Options) renames
     Test_2_Create_tests_create2_photo;
--  id:2.2/fa334a87cdcf0776/Create/0/0/tests_create2_photo/
   procedure Test_2_Create_tests_create2_photo
     (Gnattest_T: in out Test_Photo_Options) is
      function Create
        (Options: Photo_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Tk_Image renames
        Wrap_Test_Create_fa334a_6f3d65;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      declare
         Photo_Image: constant Tk_Image :=
           Create((Format => To_Tcl_String("png"), others => <>));
      begin
         Assert
           (Photo_Image'Length > 0,
            "Failed to create photo image with random name.");
         Delete(Photo_Image);
      end;

--  begin read only
   end Test_2_Create_tests_create2_photo;
--  end read only

--  begin read only
   procedure Wrap_Test_Configure_6e2ac0_462460
     (Photo_Image: Tk_Image; Options: Photo_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Configure_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Configure
        (Photo_Image, Options, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Tests_Configure_Photo test commitment violated");
      end;
   end Wrap_Test_Configure_6e2ac0_462460;
--  end read only

--  begin read only
   procedure Test_Configure_tests_configure_photo
     (Gnattest_T: in out Test_Photo_Options);
   procedure Test_Configure_6e2ac0_462460
     (Gnattest_T: in out Test_Photo_Options) renames
     Test_Configure_tests_configure_photo;
--  id:2.2/6e2ac08c4cd9ce38/Configure/1/0/tests_configure_photo/
   procedure Test_Configure_tests_configure_photo
     (Gnattest_T: in out Test_Photo_Options) is
      procedure Configure
        (Photo_Image: Tk_Image; Options: Photo_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Configure_6e2ac0_462460;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Configure("myphoto", Photo_Options'(Height => 12, others => <>));
      Assert
        (Get_Option("myphoto", "height") = "12",
         "Failed to set options for photo image.");
      Configure("myphoto", Photo_Options'(Height => 11, others => <>));

--  begin read only
   end Test_Configure_tests_configure_photo;
--  end read only

--  begin read only
   function Wrap_Test_Get_Options_5c7a9c_d39689
     (Photo_Image: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Photo_Options is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Get_Options_Photo test requirement violated");
      end;
      declare
         Test_Get_Options_5c7a9c_d39689_Result: constant Photo_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Get_Options
             (Photo_Image, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image-photo.ads:0:):Tests_Get_Options_Photo test commitment violated");
         end;
         return Test_Get_Options_5c7a9c_d39689_Result;
      end;
   end Wrap_Test_Get_Options_5c7a9c_d39689;
--  end read only

--  begin read only
   procedure Test_Get_Options_tests_get_options_photo
     (Gnattest_T: in out Test_Photo_Options);
   procedure Test_Get_Options_5c7a9c_d39689
     (Gnattest_T: in out Test_Photo_Options) renames
     Test_Get_Options_tests_get_options_photo;
--  id:2.2/5c7a9c2ff87b2567/Get_Options/1/0/tests_get_options_photo/
   procedure Test_Get_Options_tests_get_options_photo
     (Gnattest_T: in out Test_Photo_Options) is
      function Get_Options
        (Photo_Image: Tk_Image;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Photo_Options renames
        Wrap_Test_Get_Options_5c7a9c_d39689;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Options("myphoto").Format = "png",
         "Failed to get options for photo image.");

--  begin read only
   end Test_Get_Options_tests_get_options_photo;
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
end Tk.Image.Photo.Photo_Options_Test_Data.Photo_Options_Tests;
