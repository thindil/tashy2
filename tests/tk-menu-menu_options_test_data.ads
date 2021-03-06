--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with Tk.Widget.Widget_Options_Test_Data.Widget_Options_Tests;

with GNATtest_Generated;

package Tk.Menu.Menu_Options_Test_Data is

--  begin read only
   type Test_Menu_Options is new GNATtest_Generated.GNATtest_Standard.Tk.Widget
     .Widget_Options_Test_Data
     .Widget_Options_Tests
     .Test_Widget_Options
--  end read only
   with
   null record;

   procedure Set_Up(Gnattest_T: in out Test_Menu_Options);
   procedure Tear_Down(Gnattest_T: in out Test_Menu_Options);

end Tk.Menu.Menu_Options_Test_Data;
