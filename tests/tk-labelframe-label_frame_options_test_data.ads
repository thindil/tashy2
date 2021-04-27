--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with Tk.Frame.Frame_Options_Test_Data.Frame_Options_Tests;

with GNATtest_Generated;

package Tk.Labelframe.Label_Frame_Options_Test_Data is

--  begin read only
   type Test_Label_Frame_Options is new GNATtest_Generated.GNATtest_Standard.Tk
     .Frame
     .Frame_Options_Test_Data
     .Frame_Options_Tests
     .Test_Frame_Options
--  end read only
   with
   null record;

   procedure Set_Up(Gnattest_T: in out Test_Label_Frame_Options);
   procedure Tear_Down(Gnattest_T: in out Test_Label_Frame_Options);

end Tk.Labelframe.Label_Frame_Options_Test_Data;
