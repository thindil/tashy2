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
         "Failed to get bounding box of ttk::entry.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_Get_Bounding_Box_test_bounding_box;
--  end read only

--  begin read only
   procedure Wrap_Test_Delete_7e606b_442b94
     (Entry_Widget: Ttk_Entry; First: String; Last: String := "") is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget and First'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Delete test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Delete
        (Entry_Widget, First, Last);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Delete test commitment violated");
      end;
   end Wrap_Test_Delete_7e606b_442b94;
--  end read only

--  begin read only
   procedure Test_Delete_test_delete(Gnattest_T: in out Test);
   procedure Test_Delete_7e606b_442b94(Gnattest_T: in out Test) renames
     Test_Delete_test_delete;
--  id:2.2/7e606bfd7f09e8b3/Delete/1/0/test_delete/
   procedure Test_Delete_test_delete(Gnattest_T: in out Test) is
      procedure Delete
        (Entry_Widget: Ttk_Entry; First: String; Last: String := "") renames
        Wrap_Test_Delete_7e606b_442b94;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Insert_Text(Entry_Widget, "end", To_Tcl_String("my text"));
      Delete(Entry_Widget, "2", "end");
      Assert
        (Get_Text(Entry_Widget) = "my", "Failed to delete ttk::entry text.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_Delete_test_delete;
--  end read only

--  begin read only
   function Wrap_Test_Get_Text_85804d_23b61d
     (Entry_Widget: Ttk_Entry) return String is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Get_Text test requirement violated");
      end;
      declare
         Test_Get_Text_85804d_23b61d_Result: constant String :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Get_Text
             (Entry_Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkentry.ads:0:):Test_Get_Text test commitment violated");
         end;
         return Test_Get_Text_85804d_23b61d_Result;
      end;
   end Wrap_Test_Get_Text_85804d_23b61d;
--  end read only

--  begin read only
   procedure Test_Get_Text_test_get_text(Gnattest_T: in out Test);
   procedure Test_Get_Text_85804d_23b61d(Gnattest_T: in out Test) renames
     Test_Get_Text_test_get_text;
--  id:2.2/85804da38fac7312/Get_Text/1/0/test_get_text/
   procedure Test_Get_Text_test_get_text(Gnattest_T: in out Test) is
      function Get_Text(Entry_Widget: Ttk_Entry) return String renames
        Wrap_Test_Get_Text_85804d_23b61d;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Insert_Text(Entry_Widget, "end", To_Tcl_String("my entry"));
      Assert
        (Get_Text(Entry_Widget) = "my entry",
         "Failed to get text of ttk::entry.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_Get_Text_test_get_text;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Insert_Cursor_4388d5_03ad1f
     (Entry_Widget: Ttk_Entry; Index: String) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget and Index'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Set_Insert_Cursor test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Set_Insert_Cursor
        (Entry_Widget, Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Set_Insert_Cursor test commitment violated");
      end;
   end Wrap_Test_Set_Insert_Cursor_4388d5_03ad1f;
--  end read only

--  begin read only
   procedure Test_Set_Insert_Cursor_test_set_insert_cursor
     (Gnattest_T: in out Test);
   procedure Test_Set_Insert_Cursor_4388d5_03ad1f
     (Gnattest_T: in out Test) renames
     Test_Set_Insert_Cursor_test_set_insert_cursor;
--  id:2.2/4388d54f7dfa527a/Set_Insert_Cursor/1/0/test_set_insert_cursor/
   procedure Test_Set_Insert_Cursor_test_set_insert_cursor
     (Gnattest_T: in out Test) is
      procedure Set_Insert_Cursor
        (Entry_Widget: Ttk_Entry; Index: String) renames
        Wrap_Test_Set_Insert_Cursor_4388d5_03ad1f;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Set_Insert_Cursor(Entry_Widget, "end");
      Assert(True, "This test can only crash.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_Set_Insert_Cursor_test_set_insert_cursor;
--  end read only

--  begin read only
   function Wrap_Test_Get_Index_bb67b1_863454
     (Entry_Widget: Ttk_Entry; Index: String) return Natural is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget and Index'Length > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Get_Index test requirement violated");
      end;
      declare
         Test_Get_Index_bb67b1_863454_Result: constant Natural :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Get_Index
             (Entry_Widget, Index);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkentry.ads:0:):Test_Get_Index test commitment violated");
         end;
         return Test_Get_Index_bb67b1_863454_Result;
      end;
   end Wrap_Test_Get_Index_bb67b1_863454;
--  end read only

--  begin read only
   procedure Test_Get_Index_test_get_index(Gnattest_T: in out Test);
   procedure Test_Get_Index_bb67b1_863454(Gnattest_T: in out Test) renames
     Test_Get_Index_test_get_index;
--  id:2.2/bb67b1396d06ad38/Get_Index/1/0/test_get_index/
   procedure Test_Get_Index_test_get_index(Gnattest_T: in out Test) is
      function Get_Index
        (Entry_Widget: Ttk_Entry; Index: String) return Natural renames
        Wrap_Test_Get_Index_bb67b1_863454;
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
        (Get_Index(Entry_Widget, "end") = 0,
         "Failed to get index in ttk::entry.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_Get_Index_test_get_index;
--  end read only

--  begin read only
   procedure Wrap_Test_Insert_Text_23cb11_c46745
     (Entry_Widget: Ttk_Entry; Index: String; Text: Tcl_String) is
   begin
      begin
         pragma Assert
           (Entry_Widget /= Null_Widget and Index'Length > 0 and
            Length(Text) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Insert_Text test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Insert_Text
        (Entry_Widget, Index, Text);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Insert_Text test commitment violated");
      end;
   end Wrap_Test_Insert_Text_23cb11_c46745;
--  end read only

--  begin read only
   procedure Test_Insert_Text_test_insert_text(Gnattest_T: in out Test);
   procedure Test_Insert_Text_23cb11_c46745(Gnattest_T: in out Test) renames
     Test_Insert_Text_test_insert_text;
--  id:2.2/23cb1103dd879a17/Insert_Text/1/0/test_insert_text/
   procedure Test_Insert_Text_test_insert_text(Gnattest_T: in out Test) is
      procedure Insert_Text
        (Entry_Widget: Ttk_Entry; Index: String; Text: Tcl_String) renames
        Wrap_Test_Insert_Text_23cb11_c46745;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Insert_Text(Entry_Widget, "end", To_Tcl_String("my text"));
      Assert
        (Get_Text(Entry_Widget) = "my text",
         "Failed to insert text to ttk::entry.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_Insert_Text_test_insert_text;
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
