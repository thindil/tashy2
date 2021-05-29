--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with AUnit.Test_Fixtures;

with GNATtest_Generated;

package Tk.Image.Image_Options_Test_Data is

   type Image_Options_Access is
     access all GNATtest_Generated.GNATtest_Standard.Tk.Image.Image_Options'
       Class;

--  begin read only
   type Test_Image_Options is abstract new AUnit.Test_Fixtures
     .Test_Fixture
--  end read only
      with
   record
      Fixture: Image_Options_Access;
   end record;

end Tk.Image.Image_Options_Test_Data;
