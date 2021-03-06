--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Tk.Frame.Frame_Options_Test_Data is

   Local_Frame_Options: aliased GNATtest_Generated.GNATtest_Standard.Tk.Frame
     .Frame_Options;
   procedure Set_Up(Gnattest_T: in out Test_Frame_Options) is
   begin
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Widget_Options_Test_Data
        .Widget_Options_Tests
        .Set_Up
        (GNATtest_Generated.GNATtest_Standard.Tk.Widget
           .Widget_Options_Test_Data
           .Widget_Options_Tests
           .Test_Widget_Options
           (Gnattest_T));
      Gnattest_T.Fixture := Local_Frame_Options'Access;
   end Set_Up;

   procedure Tear_Down(Gnattest_T: in out Test_Frame_Options) is
   begin
      GNATtest_Generated.GNATtest_Standard.Tk.Widget.Widget_Options_Test_Data
        .Widget_Options_Tests
        .Tear_Down
        (GNATtest_Generated.GNATtest_Standard.Tk.Widget
           .Widget_Options_Test_Data
           .Widget_Options_Tests
           .Test_Widget_Options
           (Gnattest_T));
   end Tear_Down;

end Tk.Frame.Frame_Options_Test_Data;
