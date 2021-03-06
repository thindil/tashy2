--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

with Ada.Environment_Variables; use Ada.Environment_Variables;
with Tcl.Info; use Tcl.Info;

package body Tk.TtkWidget.Test_Data is

   procedure Set_Up(Gnattest_T: in out Test) is
      pragma Unreferenced(Gnattest_T);
   begin
      null;
   end Set_Up;

   procedure Tear_Down(Gnattest_T: in out Test) is
      pragma Unreferenced(Gnattest_T);
      Button: Ttk_Widget;
   begin
      if Value("DISPLAY", "")'Length = 0 then
         return;
      end if;
      Button := Get_Widget(".test");
      if Button /= Null_Widget then
         Destroy(Button);
      end if;
   end Tear_Down;
end Tk.TtkWidget.Test_Data;
