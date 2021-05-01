--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Tk.TtkLabelFrame.Ttk_Label_Frame_Options_Test_Data is

   Local_Ttk_Label_Frame_Options: aliased GNATtest_Generated.GNATtest_Standard
     .Tk
     .TtkLabelFrame
     .Ttk_Label_Frame_Options;
   procedure Set_Up(Gnattest_T: in out Test_Ttk_Label_Frame_Options) is
   begin
      GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget
        .Ttk_Widget_Options_Test_Data
        .Ttk_Widget_Options_Tests
        .Set_Up
        (GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget
           .Ttk_Widget_Options_Test_Data
           .Ttk_Widget_Options_Tests
           .Test_Ttk_Widget_Options
           (Gnattest_T));
      Gnattest_T.Fixture := Local_Ttk_Label_Frame_Options'Access;
   end Set_Up;

   procedure Tear_Down(Gnattest_T: in out Test_Ttk_Label_Frame_Options) is
   begin
      GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget
        .Ttk_Widget_Options_Test_Data
        .Ttk_Widget_Options_Tests
        .Tear_Down
        (GNATtest_Generated.GNATtest_Standard.Tk.TtkWidget
           .Ttk_Widget_Options_Test_Data
           .Ttk_Widget_Options_Tests
           .Test_Ttk_Widget_Options
           (Gnattest_T));
   end Tear_Down;

end Tk.TtkLabelFrame.Ttk_Label_Frame_Options_Test_Data;
