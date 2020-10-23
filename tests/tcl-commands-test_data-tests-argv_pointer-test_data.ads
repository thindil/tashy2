--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with Interfaces.C.Pointers.Test_Data;
with Interfaces.C.Pointers.Test_Data.Tests;

package Tcl.Commands.Test_Data.Tests.Argv_Pointer.Test_Data is

--  begin read only
   type Test is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with null record;

   procedure Set_Up(Gnattest_T: in out Test);
   procedure Tear_Down(Gnattest_T: in out Test);

--  begin read only
   package Gnattest_Data_Inst is new GNATtest_Generated.GNATtest_Standard.Tcl
     .Commands
     .Argv_Pointer
     .Test_Data
     (Test);
   package Gnattest_Tests_Inst is new Gnattest_Data_Inst.Tests;

   type New_Test is new Gnattest_Tests_Inst.Test with null record;
--  end read only

   procedure User_Set_Up(Gnattest_T: in out New_Test);
   procedure User_Tear_Down(Gnattest_T: in out New_Test);

end Tcl.Commands.Test_Data.Tests.Argv_Pointer.Test_Data;
