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
   function Wrap_Test_Get_Bounding_Box_3f26de_e40b4e
     (Entry_Widget: Ttk_Entry; Index: Natural; Is_Index: Boolean := True)
      return Bbox_Data is
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
         Test_Get_Bounding_Box_3f26de_e40b4e_Result: constant Bbox_Data :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Get_Bounding_Box
             (Entry_Widget, Index, Is_Index);
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
         return Test_Get_Bounding_Box_3f26de_e40b4e_Result;
      end;
   end Wrap_Test_Get_Bounding_Box_3f26de_e40b4e;
--  end read only

--  begin read only
   procedure Test_1_Get_Bounding_Box_test_bounding_box
     (Gnattest_T: in out Test);
   procedure Test_Get_Bounding_Box_3f26de_e40b4e
     (Gnattest_T: in out Test) renames
     Test_1_Get_Bounding_Box_test_bounding_box;
--  id:2.2/3f26deb6a64de62e/Get_Bounding_Box/1/0/test_bounding_box/
   procedure Test_1_Get_Bounding_Box_test_bounding_box
     (Gnattest_T: in out Test) is
      function Get_Bounding_Box
        (Entry_Widget: Ttk_Entry; Index: Natural; Is_Index: Boolean := True)
         return Bbox_Data renames
        Wrap_Test_Get_Bounding_Box_3f26de_e40b4e;
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
         "Failed to get bounding box of ttk::entry from numerical index.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_1_Get_Bounding_Box_test_bounding_box;
--  end read only

--  begin read only
   function Wrap_Test_Get_Bounding_Box_2eefca_9bb42f
     (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type) return Bbox_Data is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Bounding_Box2 test requirement violated");
      end;
      declare
         Test_Get_Bounding_Box_2eefca_9bb42f_Result: constant Bbox_Data :=
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
                  "ens_sloc(tk-ttkentry.ads:0:):Test_Bounding_Box2 test commitment violated");
         end;
         return Test_Get_Bounding_Box_2eefca_9bb42f_Result;
      end;
   end Wrap_Test_Get_Bounding_Box_2eefca_9bb42f;
--  end read only

--  begin read only
   procedure Test_2_Get_Bounding_Box_test_bounding_box2
     (Gnattest_T: in out Test);
   procedure Test_Get_Bounding_Box_2eefca_9bb42f
     (Gnattest_T: in out Test) renames
     Test_2_Get_Bounding_Box_test_bounding_box2;
--  id:2.2/2eefcaa400b4f92b/Get_Bounding_Box/0/0/test_bounding_box2/
   procedure Test_2_Get_Bounding_Box_test_bounding_box2
     (Gnattest_T: in out Test) is
      function Get_Bounding_Box
        (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type)
         return Bbox_Data renames
        Wrap_Test_Get_Bounding_Box_2eefca_9bb42f;
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
        (Get_Bounding_Box(Entry_Widget, LAST).Start_X = 0,
         "Failed to get bounding box of ttk::entry from Entry_Index_Type.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_2_Get_Bounding_Box_test_bounding_box2;
--  end read only

--  begin read only
   procedure Wrap_Test_Delete_50540f_6a08ac
     (Entry_Widget: Ttk_Entry; First: Natural; Last: Natural := 0;
      Is_First_Index, Is_Last_Index: Boolean := True) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Delete test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Delete
        (Entry_Widget, First, Last, Is_First_Index, Is_Last_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Delete test commitment violated");
      end;
   end Wrap_Test_Delete_50540f_6a08ac;
--  end read only

--  begin read only
   procedure Test_1_Delete_test_delete(Gnattest_T: in out Test);
   procedure Test_Delete_50540f_6a08ac(Gnattest_T: in out Test) renames
     Test_1_Delete_test_delete;
--  id:2.2/50540f228ec47939/Delete/1/0/test_delete/
   procedure Test_1_Delete_test_delete(Gnattest_T: in out Test) is
      procedure Delete
        (Entry_Widget: Ttk_Entry; First: Natural; Last: Natural := 0;
         Is_First_Index, Is_Last_Index: Boolean := True) renames
        Wrap_Test_Delete_50540f_6a08ac;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Insert_Text(Entry_Widget, 0, To_Tcl_String("my text"));
      Delete(Entry_Widget, 2, 7);
      Assert
        (Get_Text(Entry_Widget) = "my",
         "Failed to delete ttk::entry text with numerical indexes.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_1_Delete_test_delete;
--  end read only

--  begin read only
   procedure Wrap_Test_Delete_3b495c_262e03
     (Entry_Widget: Ttk_Entry; First: Entry_Index_Type;
      Last: Entry_Index_Type := NONE) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Delete2 test requirement violated");
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
               "ens_sloc(tk-ttkentry.ads:0:):Test_Delete2 test commitment violated");
      end;
   end Wrap_Test_Delete_3b495c_262e03;
--  end read only

--  begin read only
   procedure Test_2_Delete_test_delete2(Gnattest_T: in out Test);
   procedure Test_Delete_3b495c_262e03(Gnattest_T: in out Test) renames
     Test_2_Delete_test_delete2;
--  id:2.2/3b495c6da5020278/Delete/0/0/test_delete2/
   procedure Test_2_Delete_test_delete2(Gnattest_T: in out Test) is
      procedure Delete
        (Entry_Widget: Ttk_Entry; First: Entry_Index_Type;
         Last: Entry_Index_Type := NONE) renames
        Wrap_Test_Delete_3b495c_262e03;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Insert_Text(Entry_Widget, 0, To_Tcl_String("my text"));
      Set_Insert_Cursor(Entry_Widget, 2);
      Delete(Entry_Widget, INSERT, LAST);
      Assert
        (Get_Text(Entry_Widget) = "my",
         "Failed to delete ttk::entry text with Entry_Index_Type indexes.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_2_Delete_test_delete2;
--  end read only

--  begin read only
   procedure Wrap_Test_Delete_f1c89f_42ab10
     (Entry_Widget: Ttk_Entry; First: Natural; Last: Entry_Index_Type := NONE;
      Is_First_Index: Boolean := True) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Delete3 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Delete
        (Entry_Widget, First, Last, Is_First_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Delete3 test commitment violated");
      end;
   end Wrap_Test_Delete_f1c89f_42ab10;
--  end read only

--  begin read only
   procedure Test_3_Delete_test_delete3(Gnattest_T: in out Test);
   procedure Test_Delete_f1c89f_42ab10(Gnattest_T: in out Test) renames
     Test_3_Delete_test_delete3;
--  id:2.2/f1c89faaf00d8a74/Delete/0/0/test_delete3/
   procedure Test_3_Delete_test_delete3(Gnattest_T: in out Test) is
      procedure Delete
        (Entry_Widget: Ttk_Entry; First: Natural;
         Last: Entry_Index_Type := NONE;
         Is_First_Index: Boolean := True) renames
        Wrap_Test_Delete_f1c89f_42ab10;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Insert_Text(Entry_Widget, 0, To_Tcl_String("my text"));
      Delete(Entry_Widget, 2, LAST);
      Assert
        (Get_Text(Entry_Widget) = "my",
         "Failed to delete ttk::entry text with numerical and Entry_Index_Type indexes.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_3_Delete_test_delete3;
--  end read only

--  begin read only
   procedure Wrap_Test_Delete_3540bf_3e9e54
     (Entry_Widget: Ttk_Entry; First: Entry_Index_Type; Last: Natural := 0;
      Is_Last_Index: Boolean := True) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Delete4 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Delete
        (Entry_Widget, First, Last, Is_Last_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Delete4 test commitment violated");
      end;
   end Wrap_Test_Delete_3540bf_3e9e54;
--  end read only

--  begin read only
   procedure Test_4_Delete_test_delete4(Gnattest_T: in out Test);
   procedure Test_Delete_3540bf_3e9e54(Gnattest_T: in out Test) renames
     Test_4_Delete_test_delete4;
--  id:2.2/3540bff6c37bc974/Delete/0/0/test_delete4/
   procedure Test_4_Delete_test_delete4(Gnattest_T: in out Test) is
      procedure Delete
        (Entry_Widget: Ttk_Entry; First: Entry_Index_Type; Last: Natural := 0;
         Is_Last_Index: Boolean := True) renames
        Wrap_Test_Delete_3540bf_3e9e54;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Insert_Text(Entry_Widget, 0, To_Tcl_String("my text"));
      Set_Insert_Cursor(Entry_Widget, 2);
      Delete(Entry_Widget, INSERT, 7);
      Assert
        (Get_Text(Entry_Widget) = "my",
         "Failed to delete ttk::entry text with Entry_Index_Type and numerical indexes.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_4_Delete_test_delete4;
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
      Insert_Text(Entry_Widget, 0, To_Tcl_String("my entry"));
      Assert
        (Get_Text(Entry_Widget) = "my entry",
         "Failed to get text of ttk::entry.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_Get_Text_test_get_text;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Insert_Cursor_52b496_42a5d1
     (Entry_Widget: Ttk_Entry; Index: Natural; Is_Index: Boolean := True) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Set_Insert_Cursor test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Set_Insert_Cursor
        (Entry_Widget, Index, Is_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Set_Insert_Cursor test commitment violated");
      end;
   end Wrap_Test_Set_Insert_Cursor_52b496_42a5d1;
--  end read only

--  begin read only
   procedure Test_Set_Insert_Cursor_test_set_insert_cursor
     (Gnattest_T: in out Test);
   procedure Test_Set_Insert_Cursor_52b496_42a5d1
     (Gnattest_T: in out Test) renames
     Test_Set_Insert_Cursor_test_set_insert_cursor;
--  id:2.2/52b4963c893e9549/Set_Insert_Cursor/1/0/test_set_insert_cursor/
   procedure Test_Set_Insert_Cursor_test_set_insert_cursor
     (Gnattest_T: in out Test) is
      procedure Set_Insert_Cursor
        (Entry_Widget: Ttk_Entry; Index: Natural;
         Is_Index: Boolean := True) renames
        Wrap_Test_Set_Insert_Cursor_52b496_42a5d1;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Set_Insert_Cursor(Entry_Widget, 0);
      Assert(True, "This test can only crash.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_Set_Insert_Cursor_test_set_insert_cursor;
--  end read only

--  begin read only
   function Wrap_Test_Get_Index_421652_13e4f7
     (Entry_Widget: Ttk_Entry; Index: Natural) return Natural is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Get_Index test requirement violated");
      end;
      declare
         Test_Get_Index_421652_13e4f7_Result: constant Natural :=
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
         return Test_Get_Index_421652_13e4f7_Result;
      end;
   end Wrap_Test_Get_Index_421652_13e4f7;
--  end read only

--  begin read only
   procedure Test_Get_Index_test_get_index(Gnattest_T: in out Test);
   procedure Test_Get_Index_421652_13e4f7(Gnattest_T: in out Test) renames
     Test_Get_Index_test_get_index;
--  id:2.2/42165254b3e9093e/Get_Index/1/0/test_get_index/
   procedure Test_Get_Index_test_get_index(Gnattest_T: in out Test) is
      function Get_Index
        (Entry_Widget: Ttk_Entry; Index: Natural) return Natural renames
        Wrap_Test_Get_Index_421652_13e4f7;
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
        (Get_Index(Entry_Widget, 0) = 0, "Failed to get index in ttk::entry.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_Get_Index_test_get_index;
--  end read only

--  begin read only
   procedure Wrap_Test_Insert_Text_f548e1_0216f7
     (Entry_Widget: Ttk_Entry; Index: Natural; Text: Tcl_String;
      Is_Index: Boolean := True) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget and Length(Text) > 0);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Insert_Text test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Insert_Text
        (Entry_Widget, Index, Text, Is_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Insert_Text test commitment violated");
      end;
   end Wrap_Test_Insert_Text_f548e1_0216f7;
--  end read only

--  begin read only
   procedure Test_Insert_Text_test_insert_text(Gnattest_T: in out Test);
   procedure Test_Insert_Text_f548e1_0216f7(Gnattest_T: in out Test) renames
     Test_Insert_Text_test_insert_text;
--  id:2.2/f548e1ba01a17a97/Insert_Text/1/0/test_insert_text/
   procedure Test_Insert_Text_test_insert_text(Gnattest_T: in out Test) is
      procedure Insert_Text
        (Entry_Widget: Ttk_Entry; Index: Natural; Text: Tcl_String;
         Is_Index: Boolean := True) renames
        Wrap_Test_Insert_Text_f548e1_0216f7;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Insert_Text(Entry_Widget, 0, To_Tcl_String("my text"));
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
