--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Tk.Labelframe.Label_Frame_Options_Test_Data is

   Local_Label_Frame_Options: aliased GNATtest_Generated.GNATtest_Standard.Tk
     .Labelframe
     .Label_Frame_Options;
   procedure Set_Up(Gnattest_T: in out Test_Label_Frame_Options) is
   begin
      GNATtest_Generated.GNATtest_Standard.Tk.Frame.Frame_Options_Test_Data
        .Frame_Options_Tests
        .Set_Up
        (GNATtest_Generated.GNATtest_Standard.Tk.Frame.Frame_Options_Test_Data
           .Frame_Options_Tests
           .Test_Frame_Options
           (Gnattest_T));
      Gnattest_T.Fixture := Local_Label_Frame_Options'Access;
   end Set_Up;

   procedure Tear_Down(Gnattest_T: in out Test_Label_Frame_Options) is
      Frame: Tk_Label_Frame;
   begin
      GNATtest_Generated.GNATtest_Standard.Tk.Frame.Frame_Options_Test_Data
        .Frame_Options_Tests
        .Tear_Down
        (GNATtest_Generated.GNATtest_Standard.Tk.Frame.Frame_Options_Test_Data
           .Frame_Options_Tests
           .Test_Frame_Options
           (Gnattest_T));
      Frame := Get_Widget(".myframe");
      if Frame /= Null_Widget then
         Destroy(Frame);
      end if;
   end Tear_Down;

end Tk.Labelframe.Label_Frame_Options_Test_Data;
