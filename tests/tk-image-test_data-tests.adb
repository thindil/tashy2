--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.Image.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Ada.Environment_Variables; use Ada.Environment_Variables;
with Tcl.Lists; use Tcl.Lists;
with Tcl.Strings; use Tcl.Strings;

--  begin read only
--  end read only
package body Tk.Image.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   procedure Wrap_Test_Delete_18cc03_780c83
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert
           (Image_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_Delete test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Delete
        (Image_Name, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image.ads:0:):Test_Image_Delete test commitment violated");
      end;
   end Wrap_Test_Delete_18cc03_780c83;
--  end read only

--  begin read only
   procedure Test_1_Delete_test_image_delete(Gnattest_T: in out Test);
   procedure Test_Delete_18cc03_780c83(Gnattest_T: in out Test) renames
     Test_1_Delete_test_image_delete;
--  id:2.2/18cc033703c4a107/Delete/1/0/test_image_delete/
   procedure Test_1_Delete_test_image_delete(Gnattest_T: in out Test) is
      procedure Delete
        (Image_Name: Tk_Image;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Delete_18cc03_780c83;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Tcl_Eval("image create bitmap mybitmap -background red");
      Delete("mybitmap");
      Assert(True, "This test can only crash.");

--  begin read only
   end Test_1_Delete_test_image_delete;
--  end read only

--  begin read only
   procedure Wrap_Test_Delete_c4bccc_dad5cd
     (Images: Array_List; Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(Images'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_Delete2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Delete
        (Images, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image.ads:0:):Test_Image_Delete2 test commitment violated");
      end;
   end Wrap_Test_Delete_c4bccc_dad5cd;
--  end read only

--  begin read only
   procedure Test_2_Delete_test_image_delete2(Gnattest_T: in out Test);
   procedure Test_Delete_c4bccc_dad5cd(Gnattest_T: in out Test) renames
     Test_2_Delete_test_image_delete2;
--  id:2.2/c4bccce0d4280cf5/Delete/0/0/test_image_delete2/
   procedure Test_2_Delete_test_image_delete2(Gnattest_T: in out Test) is
      procedure Delete
        (Images: Array_List;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Delete_c4bccc_dad5cd;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Tcl_Eval("image create bitmap mybitmap -background red");
      Tcl_Eval("image create bitmap mybitmap2 -background red");
      Delete
        (Array_List'(To_Tcl_String("mybitmap"), To_Tcl_String("mybitmap2")));
      Assert(True, "This test can only crash.");

--  begin read only
   end Test_2_Delete_test_image_delete2;
--  end read only

--  begin read only
   function Wrap_Test_Height_80fc6b_1986ce
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Natural is
   begin
      begin
         pragma Assert
           (Image_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_Height test requirement violated");
      end;
      declare
         Test_Height_80fc6b_1986ce_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Height
             (Image_Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image.ads:0:):Test_Image_Height test commitment violated");
         end;
         return Test_Height_80fc6b_1986ce_Result;
      end;
   end Wrap_Test_Height_80fc6b_1986ce;
--  end read only

--  begin read only
   procedure Test_Height_test_image_height(Gnattest_T: in out Test);
   procedure Test_Height_80fc6b_1986ce(Gnattest_T: in out Test) renames
     Test_Height_test_image_height;
--  id:2.2/80fc6bcf066b498a/Height/1/0/test_image_height/
   procedure Test_Height_test_image_height(Gnattest_T: in out Test) is
      function Height
        (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Natural renames
        Wrap_Test_Height_80fc6b_1986ce;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Tcl_Eval("image create bitmap mybitmap -background red");
      Assert(Height("mybitmap") = 0, "Failed to get height of the image.");
      Delete("mybitmap");

--  begin read only
   end Test_Height_test_image_height;
--  end read only

--  begin read only
   function Wrap_Test_In_Use_ce6448_db6496
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Boolean is
   begin
      begin
         pragma Assert
           (Image_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_In_Use test requirement violated");
      end;
      declare
         Test_In_Use_ce6448_db6496_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.In_Use
             (Image_Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image.ads:0:):Test_Image_In_Use test commitment violated");
         end;
         return Test_In_Use_ce6448_db6496_Result;
      end;
   end Wrap_Test_In_Use_ce6448_db6496;
--  end read only

--  begin read only
   procedure Test_In_Use_test_image_in_use(Gnattest_T: in out Test);
   procedure Test_In_Use_ce6448_db6496(Gnattest_T: in out Test) renames
     Test_In_Use_test_image_in_use;
--  id:2.2/ce6448e619bec13f/In_Use/1/0/test_image_in_use/
   procedure Test_In_Use_test_image_in_use(Gnattest_T: in out Test) is
      function In_Use
        (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Boolean renames
        Wrap_Test_In_Use_ce6448_db6496;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Tcl_Eval("image create bitmap mybitmap -background red");
      Assert(not In_Use("mybitmap"), "Failed to get image in use state.");
      Delete("mybitmap");

--  begin read only
   end Test_In_Use_test_image_in_use;
--  end read only

--  begin read only
   function Wrap_Test_Names_eadae1_91e953
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List is
   begin
      begin
         pragma Assert(Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_Names test requirement violated");
      end;
      declare
         Test_Names_eadae1_91e953_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Names(Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image.ads:0:):Test_Image_Names test commitment violated");
         end;
         return Test_Names_eadae1_91e953_Result;
      end;
   end Wrap_Test_Names_eadae1_91e953;
--  end read only

--  begin read only
   procedure Test_Names_test_image_names(Gnattest_T: in out Test);
   procedure Test_Names_eadae1_91e953(Gnattest_T: in out Test) renames
     Test_Names_test_image_names;
--  id:2.2/eadae19ee57308fa/Names/1/0/test_image_names/
   procedure Test_Names_test_image_names(Gnattest_T: in out Test) is
      function Names
        (Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Array_List renames
        Wrap_Test_Names_eadae1_91e953;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert(Names'Length > 0, "Failed to get images names.");

--  begin read only
   end Test_Names_test_image_names;
--  end read only

--  begin read only
   function Wrap_Test_Image_Type_2e187d_7648ef
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return String is
   begin
      begin
         pragma Assert
           (Image_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_Type test requirement violated");
      end;
      declare
         Test_Image_Type_2e187d_7648ef_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Image_Type
             (Image_Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image.ads:0:):Test_Image_Type test commitment violated");
         end;
         return Test_Image_Type_2e187d_7648ef_Result;
      end;
   end Wrap_Test_Image_Type_2e187d_7648ef;
--  end read only

--  begin read only
   procedure Test_Image_Type_test_image_type(Gnattest_T: in out Test);
   procedure Test_Image_Type_2e187d_7648ef(Gnattest_T: in out Test) renames
     Test_Image_Type_test_image_type;
--  id:2.2/2e187dd659bbd28b/Image_Type/1/0/test_image_type/
   procedure Test_Image_Type_test_image_type(Gnattest_T: in out Test) is
      function Image_Type
        (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return String renames
        Wrap_Test_Image_Type_2e187d_7648ef;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Tcl_Eval("image create bitmap mybitmap -background red");
      Assert(Image_Type("mybitmap") = "bitmap", "Failed to get image type.");
      Delete("mybitmap");

--  begin read only
   end Test_Image_Type_test_image_type;
--  end read only

--  begin read only
   function Wrap_Test_Types_efe030_6aacf5
     (Interpreter: Tcl_Interpreter := Get_Interpreter) return Array_List is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_Types test requirement violated");
      end;
      declare
         Test_Types_efe030_6aacf5_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Types(Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image.ads:0:):Test_Image_Types test commitment violated");
         end;
         return Test_Types_efe030_6aacf5_Result;
      end;
   end Wrap_Test_Types_efe030_6aacf5;
--  end read only

--  begin read only
   procedure Test_Types_test_image_types(Gnattest_T: in out Test);
   procedure Test_Types_efe030_6aacf5(Gnattest_T: in out Test) renames
     Test_Types_test_image_types;
--  id:2.2/efe03054d1e26056/Types/1/0/test_image_types/
   procedure Test_Types_test_image_types(Gnattest_T: in out Test) is
      function Types
        (Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Array_List renames
        Wrap_Test_Types_efe030_6aacf5;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Assert(Types'Length >= 2, "Failed to get images types.");

--  begin read only
   end Test_Types_test_image_types;
--  end read only

--  begin read only
   function Wrap_Test_Width_f67773_737c00
     (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Natural is
   begin
      begin
         pragma Assert
           (Image_Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_Width test requirement violated");
      end;
      declare
         Test_Width_f67773_737c00_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Width
             (Image_Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image.ads:0:):Test_Image_Width test commitment violated");
         end;
         return Test_Width_f67773_737c00_Result;
      end;
   end Wrap_Test_Width_f67773_737c00;
--  end read only

--  begin read only
   procedure Test_Width_test_image_width(Gnattest_T: in out Test);
   procedure Test_Width_f67773_737c00(Gnattest_T: in out Test) renames
     Test_Width_test_image_width;
--  id:2.2/f6777397a6522bab/Width/1/0/test_image_width/
   procedure Test_Width_test_image_width(Gnattest_T: in out Test) is
      function Width
        (Image_Name: Tk_Image; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Natural renames
        Wrap_Test_Width_f67773_737c00;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Tcl_Eval("image create bitmap mybitmap -background red");
      Assert(Width("mybitmap") = 0, "Failed to get width of the image.");
      Delete("mybitmap");

--  begin read only
   end Test_Width_test_image_width;
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
end Tk.Image.Test_Data.Tests;
