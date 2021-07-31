--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Tk.TtkEntry.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Ada.Environment_Variables; use Ada.Environment_Variables;

--  begin read only
--  end read only
package body Tk.TtkEntry.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only
--  begin read only
   function Wrap_Test_Get_Bounding_Box_ec11f6_e40b4e
     (Entry_Widget: Ttk_Entry; Index: Natural) return Bbox_Data is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Bounding_Box test requirement violated");
      end;
      declare
         Test_Get_Bounding_Box_ec11f6_e40b4e_Result: constant Bbox_Data :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Get_Bounding_Box
             (Entry_Widget, Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkentry.ads:0:):Test_Bounding_Box test commitment violated");
         end;
         return Test_Get_Bounding_Box_ec11f6_e40b4e_Result;
      end;
   end Wrap_Test_Get_Bounding_Box_ec11f6_e40b4e;
--  end read only

--  begin read only
   procedure Test_Get_Bounding_Box_test_bounding_box(Gnattest_T: in out Test);
   procedure Test_Get_Bounding_Box_ec11f6_e40b4e
     (Gnattest_T: in out Test) renames
     Test_Get_Bounding_Box_test_bounding_box;
--  id:2.2/ec11f60ea0cb7a48/Get_Bounding_Box/1/0/test_bounding_box/
   procedure Test_Get_Bounding_Box_test_bounding_box
     (Gnattest_T: in out Test) is
      function Get_Bounding_Box
        (Entry_Widget: Ttk_Entry; Index: Natural) return Bbox_Data renames
        Wrap_Test_Get_Bounding_Box_ec11f6_e40b4e;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Assert
        (Get_Bounding_Box(Entry_Widget, 0).Start_X = 0,
         "Failed to get bounding box of ttk entry.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_Get_Bounding_Box_test_bounding_box;
--  end read only

--  begin read only
--  id:2.2/02/
--
--  This section can be used to add elaboration code for the global state.
--
begin
--  end read only
   null;
--  begin read only
--  end read only
end Tk.TtkEntry.Test_Data.Tests;
