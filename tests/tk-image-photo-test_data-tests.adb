--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Image.Photo.Test_Data.

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
package body Tk.Image.Photo.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Blank_2c1442_30601f
     (Photo_Image: Tk_Image;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Photo_Image'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Blank_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Blank
        (Photo_Image, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Tests_Blank_Photo test commitment violated");
      end;
   end Wrap_Test_Blank_2c1442_30601f;
--  end read only

--  begin read only
   procedure Test_Blank_tests_blank_photo(Gnattest_T: in out Test);
   procedure Test_Blank_2c1442_30601f(Gnattest_T: in out Test) renames
     Test_Blank_tests_blank_photo;
--  id:2.2/2c1442a8bb75046e/Blank/1/0/tests_blank_photo/
   procedure Test_Blank_tests_blank_photo(Gnattest_T: in out Test) is
      procedure Blank
        (Photo_Image: Tk_Image;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Blank_2c1442_30601f;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Blank("myphoto");
      Assert(True, "This test can only crash.");

--  begin read only
   end Test_Blank_tests_blank_photo;
--  end read only

--  begin read only
   function Wrap_Test_Get_Option_e3d52c_8f9fe9
     (Photo_Image: Tk_Image; Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      begin
         pragma Assert
           (Photo_Image'Length > 0 and Name'Length > 0 and
            Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Get_Option_Photo test requirement violated");
      end;
      declare
         Test_Get_Option_e3d52c_8f9fe9_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Get_Option
             (Photo_Image, Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image-photo.ads:0:):Tests_Get_Option_Photo test commitment violated");
         end;
         return Test_Get_Option_e3d52c_8f9fe9_Result;
      end;
   end Wrap_Test_Get_Option_e3d52c_8f9fe9;
--  end read only

--  begin read only
   procedure Test_Get_Option_tests_get_option_photo(Gnattest_T: in out Test);
   procedure Test_Get_Option_e3d52c_8f9fe9(Gnattest_T: in out Test) renames
     Test_Get_Option_tests_get_option_photo;
--  id:2.2/e3d52c2e49e4f170/Get_Option/1/0/tests_get_option_photo/
   procedure Test_Get_Option_tests_get_option_photo(Gnattest_T: in out Test) is
      function Get_Option
        (Photo_Image: Tk_Image; Name: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Get_Option_e3d52c_8f9fe9;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Option("myphoto", "format") = "png",
         "Failed to get option of the selected image");

--  begin read only
   end Test_Get_Option_tests_get_option_photo;
--  end read only

--  begin read only
   procedure Wrap_Test_Copy_0a35cf_21de2d
     (Destination_Image, Source_Image: Tk_Image;
      From, To: Dimensions_Type := Empty_Dimension; Shrink: Boolean := False;
      Zoom, Sub_Sample: Point_Position := Empty_Point_Position;
      Compositing_Rule: Compositing_Types := NONE;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Destination_Image'Length > 0 and Source_Image'Length > 0 and
            Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Copy_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Copy
        (Destination_Image, Source_Image, From, To, Shrink, Zoom, Sub_Sample,
         Compositing_Rule, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Tests_Copy_Photo test commitment violated");
      end;
   end Wrap_Test_Copy_0a35cf_21de2d;
--  end read only

--  begin read only
   procedure Test_Copy_tests_copy_photo(Gnattest_T: in out Test);
   procedure Test_Copy_0a35cf_21de2d(Gnattest_T: in out Test) renames
     Test_Copy_tests_copy_photo;
--  id:2.2/0a35cf23b6e9723d/Copy/1/0/tests_copy_photo/
   procedure Test_Copy_tests_copy_photo(Gnattest_T: in out Test) is
      procedure Copy
        (Destination_Image, Source_Image: Tk_Image;
         From, To: Dimensions_Type := Empty_Dimension;
         Shrink: Boolean := False;
         Zoom, Sub_Sample: Point_Position := Empty_Point_Position;
         Compositing_Rule: Compositing_Types := NONE;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Copy_0a35cf_21de2d;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Create("myphoto2", Default_Photo_Options);
      Copy("myphoto2", "myphoto");
      Assert(True, "This test can only crash.");
      Delete("myphoto2");

--  begin read only
   end Test_Copy_tests_copy_photo;
--  end read only

--  begin read only
   function Wrap_Test_Get_Data_0223c5_8ba84f
     (Photo_Image: Tk_Image; Background: Tcl_String := Null_Tcl_String;
      From: Dimensions_Type := Empty_Dimension; Grayscale: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tcl_String is
   begin
      begin
         pragma Assert
           (Photo_Image'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Get_Data_Photo test requirement violated");
      end;
      declare
         Test_Get_Data_0223c5_8ba84f_Result: constant Tcl_String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Get_Data
             (Photo_Image, Background, From, Grayscale, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image-photo.ads:0:):Tests_Get_Data_Photo test commitment violated");
         end;
         return Test_Get_Data_0223c5_8ba84f_Result;
      end;
   end Wrap_Test_Get_Data_0223c5_8ba84f;
--  end read only

--  begin read only
   procedure Test_Get_Data_tests_get_data_photo(Gnattest_T: in out Test);
   procedure Test_Get_Data_0223c5_8ba84f(Gnattest_T: in out Test) renames
     Test_Get_Data_tests_get_data_photo;
--  id:2.2/0223c57fe5acff29/Get_Data/1/0/tests_get_data_photo/
   procedure Test_Get_Data_tests_get_data_photo(Gnattest_T: in out Test) is
      function Get_Data
        (Photo_Image: Tk_Image; Background: Tcl_String := Null_Tcl_String;
         From: Dimensions_Type := Empty_Dimension; Grayscale: Boolean := False;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Tcl_String renames
        Wrap_Test_Get_Data_0223c5_8ba84f;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Get_Data_tests_get_data_photo;
--  end read only

--  begin read only
   function Wrap_Test_Get_Color_6fd571_5f6b3a
     (Photo_Image: Tk_Image; X, Y: Natural;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Color_Type is
   begin
      begin
         pragma Assert
           (Photo_Image'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Get_Color_Photo test requirement violated");
      end;
      declare
         Test_Get_Color_6fd571_5f6b3a_Result: constant Color_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Get_Color
             (Photo_Image, X, Y, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image-photo.ads:0:):Tests_Get_Color_Photo test commitment violated");
         end;
         return Test_Get_Color_6fd571_5f6b3a_Result;
      end;
   end Wrap_Test_Get_Color_6fd571_5f6b3a;
--  end read only

--  begin read only
   procedure Test_Get_Color_tests_get_color_photo(Gnattest_T: in out Test);
   procedure Test_Get_Color_6fd571_5f6b3a(Gnattest_T: in out Test) renames
     Test_Get_Color_tests_get_color_photo;
--  id:2.2/6fd5718a9ddd1eec/Get_Color/1/0/tests_get_color_photo/
   procedure Test_Get_Color_tests_get_color_photo(Gnattest_T: in out Test) is
      function Get_Color
        (Photo_Image: Tk_Image; X, Y: Natural;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Color_Type renames
        Wrap_Test_Get_Color_6fd571_5f6b3a;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Get_Color_tests_get_color_photo;
--  end read only

--  begin read only
   procedure Wrap_Test_Put_Data_1f94ae_ee5695
     (Photo_Image: Tk_Image; Data: Tcl_String;
      To: Dimensions_Type := Empty_Dimension;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Photo_Image'Length > 0 and Length(Source => Data) > 0 and
            Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Put_Data_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Put_Data
        (Photo_Image, Data, To, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Tests_Put_Data_Photo test commitment violated");
      end;
   end Wrap_Test_Put_Data_1f94ae_ee5695;
--  end read only

--  begin read only
   procedure Test_Put_Data_tests_put_data_photo(Gnattest_T: in out Test);
   procedure Test_Put_Data_1f94ae_ee5695(Gnattest_T: in out Test) renames
     Test_Put_Data_tests_put_data_photo;
--  id:2.2/1f94aeeffbf7f23f/Put_Data/1/0/tests_put_data_photo/
   procedure Test_Put_Data_tests_put_data_photo(Gnattest_T: in out Test) is
      procedure Put_Data
        (Photo_Image: Tk_Image; Data: Tcl_String;
         To: Dimensions_Type := Empty_Dimension;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Put_Data_1f94ae_ee5695;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Put_Data_tests_put_data_photo;
--  end read only

--  begin read only
   procedure Wrap_Test_Read_9efbd6_24b510
     (Photo_Image: Tk_Image; File_Name: Tcl_String;
      From: Dimensions_Type := Empty_Dimension; Shrink: Boolean := False;
      To: Point_Position := Empty_Point_Position;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Photo_Image'Length > 0 and Length(Source => File_Name) > 0 and
            Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Read_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Read
        (Photo_Image, File_Name, From, Shrink, To, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Tests_Read_Photo test commitment violated");
      end;
   end Wrap_Test_Read_9efbd6_24b510;
--  end read only

--  begin read only
   procedure Test_Read_tests_read_photo(Gnattest_T: in out Test);
   procedure Test_Read_9efbd6_24b510(Gnattest_T: in out Test) renames
     Test_Read_tests_read_photo;
--  id:2.2/9efbd6a9b2a4bc8c/Read/1/0/tests_read_photo/
   procedure Test_Read_tests_read_photo(Gnattest_T: in out Test) is
      procedure Read
        (Photo_Image: Tk_Image; File_Name: Tcl_String;
         From: Dimensions_Type := Empty_Dimension; Shrink: Boolean := False;
         To: Point_Position := Empty_Point_Position;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Read_9efbd6_24b510;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Read_tests_read_photo;
--  end read only

--  begin read only
   procedure Wrap_Test_Redither_68a59f_4f3041
     (Photo_Image: Tk_Image;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Photo_Image'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Redither_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Redither
        (Photo_Image, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Tests_Redither_Photo test commitment violated");
      end;
   end Wrap_Test_Redither_68a59f_4f3041;
--  end read only

--  begin read only
   procedure Test_Redither_tests_redither_photo(Gnattest_T: in out Test);
   procedure Test_Redither_68a59f_4f3041(Gnattest_T: in out Test) renames
     Test_Redither_tests_redither_photo;
--  id:2.2/68a59f049d29ab44/Redither/1/0/tests_redither_photo/
   procedure Test_Redither_tests_redither_photo(Gnattest_T: in out Test) is
      procedure Redither
        (Photo_Image: Tk_Image;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Redither_68a59f_4f3041;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Redither_tests_redither_photo;
--  end read only

--  begin read only
   function Wrap_Test_Get_Transparency_745b2d_ffe137
     (Photo_Image: Tk_Image; X, Y: Natural;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Boolean is
   begin
      begin
         pragma Assert
           (Photo_Image'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Get_Transparency_Photo test requirement violated");
      end;
      declare
         Test_Get_Transparency_745b2d_ffe137_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Get_Transparency
             (Photo_Image, X, Y, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image-photo.ads:0:):Tests_Get_Transparency_Photo test commitment violated");
         end;
         return Test_Get_Transparency_745b2d_ffe137_Result;
      end;
   end Wrap_Test_Get_Transparency_745b2d_ffe137;
--  end read only

--  begin read only
   procedure Test_Get_Transparency_tests_get_transparency_photo
     (Gnattest_T: in out Test);
   procedure Test_Get_Transparency_745b2d_ffe137
     (Gnattest_T: in out Test) renames
     Test_Get_Transparency_tests_get_transparency_photo;
--  id:2.2/745b2d34043e9621/Get_Transparency/1/0/tests_get_transparency_photo/
   procedure Test_Get_Transparency_tests_get_transparency_photo
     (Gnattest_T: in out Test) is
      function Get_Transparency
        (Photo_Image: Tk_Image; X, Y: Natural;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Boolean renames
        Wrap_Test_Get_Transparency_745b2d_ffe137;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Get_Transparency_tests_get_transparency_photo;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Transparency_76d5d1_e76ade
     (Photo_Image: Tk_Image; X, Y: Natural; Transparent: Boolean;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Photo_Image'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Set_Transparency_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Set_Transparency
        (Photo_Image, X, Y, Transparent, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Tests_Set_Transparency_Photo test commitment violated");
      end;
   end Wrap_Test_Set_Transparency_76d5d1_e76ade;
--  end read only

--  begin read only
   procedure Test_Set_Transparency_tests_set_transparency_photo
     (Gnattest_T: in out Test);
   procedure Test_Set_Transparency_76d5d1_e76ade
     (Gnattest_T: in out Test) renames
     Test_Set_Transparency_tests_set_transparency_photo;
--  id:2.2/76d5d19d86527133/Set_Transparency/1/0/tests_set_transparency_photo/
   procedure Test_Set_Transparency_tests_set_transparency_photo
     (Gnattest_T: in out Test) is
      procedure Set_Transparency
        (Photo_Image: Tk_Image; X, Y: Natural; Transparent: Boolean;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Set_Transparency_76d5d1_e76ade;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Set_Transparency_tests_set_transparency_photo;
--  end read only

--  begin read only
   procedure Wrap_Test_Write_f4e43e_96f97b
     (Photo_Image: Tk_Image; File_Name: Tcl_String;
      Background: Tcl_String := Null_Tcl_String;
      From: Dimensions_Type := Empty_Dimension; Grayscale: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Photo_Image'Length > 0 and Length(Source => File_Name) > 0 and
            Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Write_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Write
        (Photo_Image, File_Name, Background, From, Grayscale, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Tests_Write_Photo test commitment violated");
      end;
   end Wrap_Test_Write_f4e43e_96f97b;
--  end read only

--  begin read only
   procedure Test_Write_tests_write_photo(Gnattest_T: in out Test);
   procedure Test_Write_f4e43e_96f97b(Gnattest_T: in out Test) renames
     Test_Write_tests_write_photo;
--  id:2.2/f4e43e1d022739b8/Write/1/0/tests_write_photo/
   procedure Test_Write_tests_write_photo(Gnattest_T: in out Test) is
      procedure Write
        (Photo_Image: Tk_Image; File_Name: Tcl_String;
         Background: Tcl_String := Null_Tcl_String;
         From: Dimensions_Type := Empty_Dimension; Grayscale: Boolean := False;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Write_f4e43e_96f97b;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Write_tests_write_photo;
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
end Tk.Image.Photo.Test_Data.Tests;
