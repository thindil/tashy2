--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with Ada.Environment_Variables; use Ada.Environment_Variables;

package body Tk.TtkEntry.Test_Data is

   procedure Set_Up(Gnattest_T: in out Test) is
      pragma Unreferenced(Gnattest_T);
   begin
      null;
   end Set_Up;

   procedure Tear_Down(Gnattest_T: in out Test) is
      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;
   begin
      if Value("DISPLAY", "")'Length = 0 then
         return;
      end if;
      Entry_Widget := Get_Widget(".myentry");
      if Entry_Widget /= Null_Widget then
         Destroy(Entry_Widget);
      end if;
   end Tear_Down;
end Tk.TtkEntry.Test_Data;
