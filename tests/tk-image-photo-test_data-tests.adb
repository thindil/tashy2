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
