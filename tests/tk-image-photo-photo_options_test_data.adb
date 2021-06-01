--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Tk.Image.Photo.Photo_Options_Test_Data is

   --  Local_Photo_Options : aliased GNATtest_Generated.GNATtest_Standard.Tk.Image.Photo.Photo_Options;
   procedure Set_Up(Gnattest_T: in out Test_Photo_Options) is
   begin
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Image_Options_Test_Data
        .Image_Options_Tests
        .Set_Up
        (GNATtest_Generated.GNATtest_Standard.Tk.Image.Image_Options_Test_Data
           .Image_Options_Tests
           .Test_Image_Options
           (Gnattest_T));
      null;
      --  Gnattest_T.Fixture := Local_Photo_Options'Access;
   end Set_Up;

   procedure Tear_Down(Gnattest_T: in out Test_Photo_Options) is
   begin
      GNATtest_Generated.GNATtest_Standard.Tk.Image.Image_Options_Test_Data
        .Image_Options_Tests
        .Tear_Down
        (GNATtest_Generated.GNATtest_Standard.Tk.Image.Image_Options_Test_Data
           .Image_Options_Tests
           .Test_Image_Options
           (Gnattest_T));
   end Tear_Down;

end Tk.Image.Photo.Photo_Options_Test_Data;
