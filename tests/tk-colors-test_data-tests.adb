--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Colors.Test_Data.

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
package body Tk.Colors.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Colors_Names_Image_3b8ed4_e35b62
     (Name: Colors_Names) return String is
   begin
      declare
         Test_Colors_Names_Image_3b8ed4_e35b62_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Colors.Colors_Names_Image
             (Name);
      begin
         return Test_Colors_Names_Image_3b8ed4_e35b62_Result;
      end;
   end Wrap_Test_Colors_Names_Image_3b8ed4_e35b62;
--  end read only

--  begin read only
   procedure Test_Colors_Names_Image_test_colors_names_image
     (Gnattest_T: in out Test);
   procedure Test_Colors_Names_Image_3b8ed4_e35b62
     (Gnattest_T: in out Test) renames
     Test_Colors_Names_Image_test_colors_names_image;
--  id:2.2/3b8ed48cb3b641ca/Colors_Names_Image/1/0/test_colors_names_image/
   procedure Test_Colors_Names_Image_test_colors_names_image
     (Gnattest_T: in out Test) is
      function Colors_Names_Image(Name: Colors_Names) return String renames
        Wrap_Test_Colors_Names_Image_3b8ed4_e35b62;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      Assert
        (Colors_Names_Image(RED) = "red", "Failed to get image of red color.");

--  begin read only
   end Test_Colors_Names_Image_test_colors_names_image;
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
end Tk.Colors.Test_Data.Tests;
