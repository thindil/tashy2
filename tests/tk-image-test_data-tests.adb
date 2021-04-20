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
   procedure Wrap_Test_Delete_b97706_7e380b(Image: Tk_Image) is
   begin
      begin
         pragma Assert(Image'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_Delete test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Delete(Image);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image.ads:0:):Test_Image_Delete test commitment violated");
      end;
   end Wrap_Test_Delete_b97706_7e380b;
--  end read only

--  begin read only
   procedure Test_1_Delete_test_image_delete(Gnattest_T: in out Test);
   procedure Test_Delete_b97706_7e380b(Gnattest_T: in out Test) renames
     Test_1_Delete_test_image_delete;
--  id:2.2/b97706006ddde954/Delete/1/0/test_image_delete/
   procedure Test_1_Delete_test_image_delete(Gnattest_T: in out Test) is
      procedure Delete(Image: Tk_Image) renames Wrap_Test_Delete_b97706_7e380b;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_1_Delete_test_image_delete;
--  end read only

--  begin read only
   procedure Wrap_Test_Delete_2a8343_2d1cc0(Images: Array_List) is
   begin
      begin
         pragma Assert(Images'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_Delete2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Delete(Images);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image.ads:0:):Test_Image_Delete2 test commitment violated");
      end;
   end Wrap_Test_Delete_2a8343_2d1cc0;
--  end read only

--  begin read only
   procedure Test_2_Delete_test_image_delete2(Gnattest_T: in out Test);
   procedure Test_Delete_2a8343_2d1cc0(Gnattest_T: in out Test) renames
     Test_2_Delete_test_image_delete2;
--  id:2.2/2a83436cb1332dfa/Delete/0/0/test_image_delete2/
   procedure Test_2_Delete_test_image_delete2(Gnattest_T: in out Test) is
      procedure Delete(Images: Array_List) renames
        Wrap_Test_Delete_2a8343_2d1cc0;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_2_Delete_test_image_delete2;
--  end read only

--  begin read only
   function Wrap_Test_Height_f068d4_56791f(Image: Tk_Image) return Natural is
   begin
      begin
         pragma Assert(Image'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_Height test requirement violated");
      end;
      declare
         Test_Height_f068d4_56791f_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Height(Image);
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
         return Test_Height_f068d4_56791f_Result;
      end;
   end Wrap_Test_Height_f068d4_56791f;
--  end read only

--  begin read only
   procedure Test_Height_test_image_height(Gnattest_T: in out Test);
   procedure Test_Height_f068d4_56791f(Gnattest_T: in out Test) renames
     Test_Height_test_image_height;
--  id:2.2/f068d4307b9c7258/Height/1/0/test_image_height/
   procedure Test_Height_test_image_height(Gnattest_T: in out Test) is
      function Height(Image: Tk_Image) return Natural renames
        Wrap_Test_Height_f068d4_56791f;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Height_test_image_height;
--  end read only

--  begin read only
   function Wrap_Test_In_Use_875a8e_af3ec4(Image: Tk_Image) return Boolean is
   begin
      begin
         pragma Assert(Image'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_In_Use test requirement violated");
      end;
      declare
         Test_In_Use_875a8e_af3ec4_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.In_Use(Image);
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
         return Test_In_Use_875a8e_af3ec4_Result;
      end;
   end Wrap_Test_In_Use_875a8e_af3ec4;
--  end read only

--  begin read only
   procedure Test_In_Use_test_image_in_use(Gnattest_T: in out Test);
   procedure Test_In_Use_875a8e_af3ec4(Gnattest_T: in out Test) renames
     Test_In_Use_test_image_in_use;
--  id:2.2/875a8e1aa0909f6c/In_Use/1/0/test_image_in_use/
   procedure Test_In_Use_test_image_in_use(Gnattest_T: in out Test) is
      function In_Use(Image: Tk_Image) return Boolean renames
        Wrap_Test_In_Use_875a8e_af3ec4;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_In_Use_test_image_in_use;
--  end read only

--  begin read only
   function Wrap_Test_Names_57ef5a_264ce7 return Array_List is
   begin
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_Names test requirement violated");
      end;
      declare
         Test_Names_57ef5a_264ce7_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Names;
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
         return Test_Names_57ef5a_264ce7_Result;
      end;
   end Wrap_Test_Names_57ef5a_264ce7;
--  end read only

--  begin read only
   procedure Test_Names_test_image_names(Gnattest_T: in out Test);
   procedure Test_Names_57ef5a_264ce7(Gnattest_T: in out Test) renames
     Test_Names_test_image_names;
--  id:2.2/57ef5af432727fcc/Names/1/0/test_image_names/
   procedure Test_Names_test_image_names(Gnattest_T: in out Test) is
      function Names return Array_List renames Wrap_Test_Names_57ef5a_264ce7;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Names_test_image_names;
--  end read only

--  begin read only
   function Wrap_Test_Image_Type_60ce82_23a77d
     (Image: Tk_Image) return String is
   begin
      begin
         pragma Assert(Image'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_Type test requirement violated");
      end;
      declare
         Test_Image_Type_60ce82_23a77d_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Image_Type(Image);
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
         return Test_Image_Type_60ce82_23a77d_Result;
      end;
   end Wrap_Test_Image_Type_60ce82_23a77d;
--  end read only

--  begin read only
   procedure Test_Image_Type_test_image_type(Gnattest_T: in out Test);
   procedure Test_Image_Type_60ce82_23a77d(Gnattest_T: in out Test) renames
     Test_Image_Type_test_image_type;
--  id:2.2/60ce82789c1d9312/Image_Type/1/0/test_image_type/
   procedure Test_Image_Type_test_image_type(Gnattest_T: in out Test) is
      function Image_Type(Image: Tk_Image) return String renames
        Wrap_Test_Image_Type_60ce82_23a77d;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Image_Type_test_image_type;
--  end read only

--  begin read only
   function Wrap_Test_Types_0cdb5f_6aacf5 return Array_List is
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
         Test_Types_0cdb5f_6aacf5_Result: constant Array_List :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Types;
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
         return Test_Types_0cdb5f_6aacf5_Result;
      end;
   end Wrap_Test_Types_0cdb5f_6aacf5;
--  end read only

--  begin read only
   procedure Test_Types_test_image_types(Gnattest_T: in out Test);
   procedure Test_Types_0cdb5f_6aacf5(Gnattest_T: in out Test) renames
     Test_Types_test_image_types;
--  id:2.2/0cdb5f8662d081e8/Types/1/0/test_image_types/
   procedure Test_Types_test_image_types(Gnattest_T: in out Test) is
      function Types return Array_List renames Wrap_Test_Types_0cdb5f_6aacf5;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Types_test_image_types;
--  end read only

--  begin read only
   function Wrap_Test_Width_16447c_88856b(Image: Tk_Image) return Natural is
   begin
      begin
         pragma Assert(Image'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image.ads:0):Test_Image_Width test requirement violated");
      end;
      declare
         Test_Width_16447c_88856b_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Width(Image);
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
         return Test_Width_16447c_88856b_Result;
      end;
   end Wrap_Test_Width_16447c_88856b;
--  end read only

--  begin read only
   procedure Test_Width_test_image_width(Gnattest_T: in out Test);
   procedure Test_Width_16447c_88856b(Gnattest_T: in out Test) renames
     Test_Width_test_image_width;
--  id:2.2/16447cb0edb05202/Width/1/0/test_image_width/
   procedure Test_Width_test_image_width(Gnattest_T: in out Test) is
      function Width(Image: Tk_Image) return Natural renames
        Wrap_Test_Width_16447c_88856b;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

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
