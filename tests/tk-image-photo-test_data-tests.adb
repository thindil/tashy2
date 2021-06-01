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
   procedure Wrap_Test_Blank_2c1442_1f34c5
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Blank_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Blank
        (Name, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Tests_Blank_Photo test commitment violated");
      end;
   end Wrap_Test_Blank_2c1442_1f34c5;
--  end read only

--  begin read only
   procedure Test_Blank_tests_blank_photo(Gnattest_T: in out Test);
   procedure Test_Blank_2c1442_1f34c5(Gnattest_T: in out Test) renames
     Test_Blank_tests_blank_photo;
--  id:2.2/2c1442a8bb75046e/Blank/1/0/tests_blank_photo/
   procedure Test_Blank_tests_blank_photo(Gnattest_T: in out Test) is
      procedure Blank
        (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Blank_2c1442_1f34c5;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Blank_tests_blank_photo;
--  end read only

--  begin read only
   procedure Wrap_Test_Copy_c44a35_21de2d
     (Destination_Image, Source_Image: String; From, To: Dimensions_Type;
      Shrink: Boolean := False;
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
        (Destination_Image, Source_Image, From, To, Shrink, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Tests_Copy_Photo test commitment violated");
      end;
   end Wrap_Test_Copy_c44a35_21de2d;
--  end read only

--  begin read only
   procedure Test_Copy_tests_copy_photo(Gnattest_T: in out Test);
   procedure Test_Copy_c44a35_21de2d(Gnattest_T: in out Test) renames
     Test_Copy_tests_copy_photo;
--  id:2.2/c44a35c4494b4fe9/Copy/1/0/tests_copy_photo/
   procedure Test_Copy_tests_copy_photo(Gnattest_T: in out Test) is
      procedure Copy
        (Destination_Image, Source_Image: String; From, To: Dimensions_Type;
         Shrink: Boolean := False;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Copy_c44a35_21de2d;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Copy_tests_copy_photo;
--  end read only

--  begin read only
   function Wrap_Test_Get_Data_9275f9_ea4492
     (Name: String; Background: Tcl_String := Null_Tcl_String;
      Format: Photo_Formats := OTHER; From: Dimensions_Type := (others => <>);
      Grayscale: Boolean := False;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Tcl_String is
   begin
      begin
         pragma Assert(Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Get_Data_Photo test requirement violated");
      end;
      declare
         Test_Get_Data_9275f9_ea4492_Result: constant Tcl_String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Get_Data
             (Name, Background, Format, From, Grayscale, Interpreter);
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
         return Test_Get_Data_9275f9_ea4492_Result;
      end;
   end Wrap_Test_Get_Data_9275f9_ea4492;
--  end read only

--  begin read only
   procedure Test_Get_Data_tests_get_data_photo(Gnattest_T: in out Test);
   procedure Test_Get_Data_9275f9_ea4492(Gnattest_T: in out Test) renames
     Test_Get_Data_tests_get_data_photo;
--  id:2.2/9275f9c540cf0d84/Get_Data/1/0/tests_get_data_photo/
   procedure Test_Get_Data_tests_get_data_photo(Gnattest_T: in out Test) is
      function Get_Data
        (Name: String; Background: Tcl_String := Null_Tcl_String;
         Format: Photo_Formats := OTHER;
         From: Dimensions_Type := (others => <>); Grayscale: Boolean := False;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Tcl_String renames
        Wrap_Test_Get_Data_9275f9_ea4492;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Get_Data_tests_get_data_photo;
--  end read only

--  begin read only
   function Wrap_Test_Get_Color_6fd571_e50560
     (Name: String; X, Y: Natural;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return Color_Type is
   begin
      begin
         pragma Assert(Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Get_Color_Photo test requirement violated");
      end;
      declare
         Test_Get_Color_6fd571_e50560_Result: constant Color_Type :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Get_Color
             (Name, X, Y, Interpreter);
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
         return Test_Get_Color_6fd571_e50560_Result;
      end;
   end Wrap_Test_Get_Color_6fd571_e50560;
--  end read only

--  begin read only
   procedure Test_Get_Color_tests_get_color_photo(Gnattest_T: in out Test);
   procedure Test_Get_Color_6fd571_e50560(Gnattest_T: in out Test) renames
     Test_Get_Color_tests_get_color_photo;
--  id:2.2/6fd5718a9ddd1eec/Get_Color/1/0/tests_get_color_photo/
   procedure Test_Get_Color_tests_get_color_photo(Gnattest_T: in out Test) is
      function Get_Color
        (Name: String; X, Y: Natural;
         Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Color_Type renames
        Wrap_Test_Get_Color_6fd571_e50560;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Get_Color_tests_get_color_photo;
--  end read only

--  begin read only
   procedure Wrap_Test_Put_Data_f479a7_30a8e8
     (Name: String; Data: Tcl_String; Format: Photo_Formats := OTHER;
      To: Dimensions_Type := (0, 0, -1, -1);
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Name'Length > 0 and Length(Data) > 0 and
            Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Put_Data_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Put_Data
        (Name, Data, Format, To, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Tests_Put_Data_Photo test commitment violated");
      end;
   end Wrap_Test_Put_Data_f479a7_30a8e8;
--  end read only

--  begin read only
   procedure Test_Put_Data_tests_put_data_photo(Gnattest_T: in out Test);
   procedure Test_Put_Data_f479a7_30a8e8(Gnattest_T: in out Test) renames
     Test_Put_Data_tests_put_data_photo;
--  id:2.2/f479a7f9a5564620/Put_Data/1/0/tests_put_data_photo/
   procedure Test_Put_Data_tests_put_data_photo(Gnattest_T: in out Test) is
      procedure Put_Data
        (Name: String; Data: Tcl_String; Format: Photo_Formats := OTHER;
         To: Dimensions_Type := (0, 0, -1, -1);
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Put_Data_f479a7_30a8e8;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Put_Data_tests_put_data_photo;
--  end read only

--  begin read only
   procedure Wrap_Test_Read_a3304e_49c9ca
     (Name: String; FileName: Tcl_String; Format: Photo_Formats := OTHER;
      From: Dimensions_Type := (0, 0, -1, -1); Shrink: Boolean := False;
      To: Point_Position := (0, 0);
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Name'Length > 0 and Length(FileName) > 0 and
            Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Read_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Read
        (Name, FileName, Format, From, Shrink, To, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Tests_Read_Photo test commitment violated");
      end;
   end Wrap_Test_Read_a3304e_49c9ca;
--  end read only

--  begin read only
   procedure Test_Read_tests_read_photo(Gnattest_T: in out Test);
   procedure Test_Read_a3304e_49c9ca(Gnattest_T: in out Test) renames
     Test_Read_tests_read_photo;
--  id:2.2/a3304e8f06584694/Read/1/0/tests_read_photo/
   procedure Test_Read_tests_read_photo(Gnattest_T: in out Test) is
      procedure Read
        (Name: String; FileName: Tcl_String; Format: Photo_Formats := OTHER;
         From: Dimensions_Type := (0, 0, -1, -1); Shrink: Boolean := False;
         To: Point_Position := (0, 0);
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Read_a3304e_49c9ca;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Read_tests_read_photo;
--  end read only

--  begin read only
   procedure Wrap_Test_Redither_68a59f_5db920
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Tests_Redither_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Redither
        (Name, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Tests_Redither_Photo test commitment violated");
      end;
   end Wrap_Test_Redither_68a59f_5db920;
--  end read only

--  begin read only
   procedure Test_Redither_tests_redither_photo(Gnattest_T: in out Test);
   procedure Test_Redither_68a59f_5db920(Gnattest_T: in out Test) renames
     Test_Redither_tests_redither_photo;
--  id:2.2/68a59f049d29ab44/Redither/1/0/tests_redither_photo/
   procedure Test_Redither_tests_redither_photo(Gnattest_T: in out Test) is
      procedure Redither
        (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Redither_68a59f_5db920;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Redither_tests_redither_photo;
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
