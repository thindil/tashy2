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
   procedure Wrap_Test_Create_22037c_996b58
     (Name: String; Options: Photo_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Test_Create_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Create
        (Name, Options, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Test_Create_Photo test commitment violated");
      end;
   end Wrap_Test_Create_22037c_996b58;
--  end read only

--  begin read only
   procedure Test_Create_test_create_photo
     (Gnattest_T: in out Test_Photo_Options);
   procedure Test_Create_22037c_996b58
     (Gnattest_T: in out Test_Photo_Options) renames
     Test_Create_test_create_photo;
--  id:2.2/22037c1fbc7ae682/Create/1/0/test_create_photo/
   procedure Test_Create_test_create_photo
     (Gnattest_T: in out Test_Photo_Options) is
      procedure Create
        (Name: String; Options: Photo_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Create_22037c_996b58;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Create_test_create_photo;
--  end read only

--  begin read only
   procedure Wrap_Test_Configure_6e2ac0_df8513
     (Name: String; Options: Photo_Options;
      Interpreter: Tcl_Interpreter := Get_Interpreter) is
   begin
      begin
         pragma Assert(Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Test_Configure_Photo test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Configure
        (Name, Options, Interpreter);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-image-photo.ads:0:):Test_Configure_Photo test commitment violated");
      end;
   end Wrap_Test_Configure_6e2ac0_df8513;
--  end read only

--  begin read only
   procedure Test_Configure_test_configure_photo
     (Gnattest_T: in out Test_Photo_Options);
   procedure Test_Configure_6e2ac0_df8513
     (Gnattest_T: in out Test_Photo_Options) renames
     Test_Configure_test_configure_photo;
--  id:2.2/6e2ac08c4cd9ce38/Configure/1/0/test_configure_photo/
   procedure Test_Configure_test_configure_photo
     (Gnattest_T: in out Test_Photo_Options) is
      procedure Configure
        (Name: String; Options: Photo_Options;
         Interpreter: Tcl_Interpreter := Get_Interpreter) renames
        Wrap_Test_Configure_6e2ac0_df8513;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Configure_test_configure_photo;
--  end read only

--  begin read only
   function Wrap_Test_Get_Options_5c7a9c_71523d
     (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
      return Photo_Options is
   begin
      begin
         pragma Assert(Name'Length > 0 and Interpreter /= Null_Interpreter);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-image-photo.ads:0):Test_Get_Options_Photo test requirement violated");
      end;
      declare
         Test_Get_Options_5c7a9c_71523d_Result: constant Photo_Options :=
           GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Get_Options
             (Name, Interpreter);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-image-photo.ads:0:):Test_Get_Options_Photo test commitment violated");
         end;
         return Test_Get_Options_5c7a9c_71523d_Result;
      end;
   end Wrap_Test_Get_Options_5c7a9c_71523d;
--  end read only

--  begin read only
   procedure Test_Get_Options_test_get_options_photo
     (Gnattest_T: in out Test_Photo_Options);
   procedure Test_Get_Options_5c7a9c_71523d
     (Gnattest_T: in out Test_Photo_Options) renames
     Test_Get_Options_test_get_options_photo;
--  id:2.2/5c7a9c2ff87b2567/Get_Options/1/0/test_get_options_photo/
   procedure Test_Get_Options_test_get_options_photo
     (Gnattest_T: in out Test_Photo_Options) is
      function Get_Options
        (Name: String; Interpreter: Tcl_Interpreter := Get_Interpreter)
         return Photo_Options renames
        Wrap_Test_Get_Options_5c7a9c_71523d;
--  end read only

      pragma Unreferenced(Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value, "Test not implemented.");

--  begin read only
   end Test_Get_Options_test_get_options_photo;
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