--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Tk.TopLevel.TopLevel_Create_Options_Test_Data is

   Local_TopLevel_Create_Options: aliased GNATtest_Generated.GNATtest_Standard
     .Tk
     .TopLevel
     .TopLevel_Create_Options;
   procedure Set_Up(Gnattest_T: in out Test_TopLevel_Create_Options) is
   begin
      GNATtest_Generated.GNATtest_Standard.Tk.TopLevel
        .TopLevel_Options_Test_Data
        .TopLevel_Options_Tests
        .Set_Up
        (GNATtest_Generated.GNATtest_Standard.Tk.TopLevel
           .TopLevel_Options_Test_Data
           .TopLevel_Options_Tests
           .Test_TopLevel_Options
           (Gnattest_T));
      Gnattest_T.Fixture := Local_TopLevel_Create_Options'Access;
   end Set_Up;

   procedure Tear_Down(Gnattest_T: in out Test_TopLevel_Create_Options) is
   begin
      GNATtest_Generated.GNATtest_Standard.Tk.TopLevel
        .TopLevel_Options_Test_Data
        .TopLevel_Options_Tests
        .Tear_Down
        (GNATtest_Generated.GNATtest_Standard.Tk.TopLevel
           .TopLevel_Options_Test_Data
           .TopLevel_Options_Tests
           .Test_TopLevel_Options
           (Gnattest_T));
   end Tear_Down;

end Tk.TopLevel.TopLevel_Create_Options_Test_Data;
