--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Tk.TtkButton.Ttk_Button_Options_Test_Data is

   Local_Ttk_Button_Options: aliased GNATtest_Generated.GNATtest_Standard.Tk
     .TtkButton
     .Ttk_Button_Options;
   procedure Set_Up(Gnattest_T: in out Test_Ttk_Button_Options) is
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
      Gnattest_T.Fixture := Local_Ttk_Button_Options'Access;
   end Set_Up;

   procedure Tear_Down(Gnattest_T: in out Test_Ttk_Button_Options) is
      Button: Ttk_Button;
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
      Button := Get_Widget(".mybutton");
      if Button /= Null_Widget then
         Destroy(Button);
      end if;
   end Tear_Down;

end Tk.TtkButton.Ttk_Button_Options_Test_Data;
