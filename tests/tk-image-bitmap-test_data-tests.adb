--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Image.Bitmap.Test_Data.

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
package body Tk.Image.Bitmap.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Get_Option_e3d52c_aaa578
     (Bitmap_Image: Tk_Image; Name: String;
      Interpreter: Tcl_Interpreter := Get_Interpreter) return String is
   begin
      begin
         pragma Assert
           (Bitmap_Image'Length > 0 and Name'Length > 0 and
            Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-bitmap.ads:0):Tests_Get_Option_Bitmap test requirement violated");
      end;
      declare
         Test_Get_Option_e3d52c_aaa578_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Bitmap.Get_Option
             (Bitmap_Image, Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image-bitmap.ads:0:):Tests_Get_Option_Bitmap test commitment violated");
         end;
         return Test_Get_Option_e3d52c_aaa578_Result;
      end;
   end Wrap_Test_Get_Option_e3d52c_aaa578;
--  end read only

--  begin read only
   procedure Test_Get_Option_tests_get_option_bitmap(Gnattest_T: in out Test);
   procedure Test_Get_Option_e3d52c_aaa578(Gnattest_T: in out Test) renames
     Test_Get_Option_tests_get_option_bitmap;
--  id:2.2/e3d52c2e49e4f170/Get_Option/1/0/tests_get_option_bitmap/
   procedure Test_Get_Option_tests_get_option_bitmap
     (Gnattest_T: in out Test) is
      function Get_Option
        (Bitmap_Image: Tk_Image; Name: String;
         Interpreter: Tcl_Interpreter := Get_Interpreter) return String renames
        Wrap_Test_Get_Option_e3d52c_aaa578;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert
        (Get_Option("mybitmap", "background") = "#000000000",
         "Failed to get option of the selected image");

--  begin read only
   end Test_Get_Option_tests_get_option_bitmap;
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
end Tk.Image.Bitmap.Test_Data.Tests;
