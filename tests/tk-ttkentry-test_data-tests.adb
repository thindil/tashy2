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
        (Get_Bounding_Box(Entry_Widget, LASTCHARACTER).Start_X = 0,
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
      Delete(Entry_Widget, INSERT, LASTCHARACTER);
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
      Delete(Entry_Widget, 2, LASTCHARACTER);
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
   procedure Test_1_Set_Insert_Cursor_test_set_insert_cursor
     (Gnattest_T: in out Test);
   procedure Test_Set_Insert_Cursor_52b496_42a5d1
     (Gnattest_T: in out Test) renames
     Test_1_Set_Insert_Cursor_test_set_insert_cursor;
--  id:2.2/52b4963c893e9549/Set_Insert_Cursor/1/0/test_set_insert_cursor/
   procedure Test_1_Set_Insert_Cursor_test_set_insert_cursor
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
   end Test_1_Set_Insert_Cursor_test_set_insert_cursor;
--  end read only

--  begin read only
   procedure Wrap_Test_Set_Insert_Cursor_60c8aa_e28574
     (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Set_Insert_Cursor2 test requirement violated");
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
               "ens_sloc(tk-ttkentry.ads:0:):Test_Set_Insert_Cursor2 test commitment violated");
      end;
   end Wrap_Test_Set_Insert_Cursor_60c8aa_e28574;
--  end read only

--  begin read only
   procedure Test_2_Set_Insert_Cursor_test_set_insert_cursor2
     (Gnattest_T: in out Test);
   procedure Test_Set_Insert_Cursor_60c8aa_e28574
     (Gnattest_T: in out Test) renames
     Test_2_Set_Insert_Cursor_test_set_insert_cursor2;
--  id:2.2/60c8aab4afb0817e/Set_Insert_Cursor/0/0/test_set_insert_cursor2/
   procedure Test_2_Set_Insert_Cursor_test_set_insert_cursor2
     (Gnattest_T: in out Test) is
      procedure Set_Insert_Cursor
        (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type) renames
        Wrap_Test_Set_Insert_Cursor_60c8aa_e28574;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Set_Insert_Cursor(Entry_Widget, LASTCHARACTER);
      Assert(True, "This test can only crash.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_2_Set_Insert_Cursor_test_set_insert_cursor2;
--  end read only

--  begin read only
   function Wrap_Test_Get_Index_421652_13e4f7
     (Entry_Widget: Ttk_Entry; X: Natural) return Natural is
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
             (Entry_Widget, X);
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
   procedure Test_1_Get_Index_test_get_index(Gnattest_T: in out Test);
   procedure Test_Get_Index_421652_13e4f7(Gnattest_T: in out Test) renames
     Test_1_Get_Index_test_get_index;
--  id:2.2/42165254b3e9093e/Get_Index/1/0/test_get_index/
   procedure Test_1_Get_Index_test_get_index(Gnattest_T: in out Test) is
      function Get_Index
        (Entry_Widget: Ttk_Entry; X: Natural) return Natural renames
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
        (Get_Index(Entry_Widget, 0) = 0,
         "Failed to get index from X coordinate in ttk::entry.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_1_Get_Index_test_get_index;
--  end read only

--  begin read only
   function Wrap_Test_Get_Index_ad8c06_595b62
     (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type) return Natural is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Get_Index2 test requirement violated");
      end;
      declare
         Test_Get_Index_ad8c06_595b62_Result: constant Natural :=
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
                  "ens_sloc(tk-ttkentry.ads:0:):Test_Get_Index2 test commitment violated");
         end;
         return Test_Get_Index_ad8c06_595b62_Result;
      end;
   end Wrap_Test_Get_Index_ad8c06_595b62;
--  end read only

--  begin read only
   procedure Test_2_Get_Index_test_get_index2(Gnattest_T: in out Test);
   procedure Test_Get_Index_ad8c06_595b62(Gnattest_T: in out Test) renames
     Test_2_Get_Index_test_get_index2;
--  id:2.2/ad8c06ac0c9ff43a/Get_Index/0/0/test_get_index2/
   procedure Test_2_Get_Index_test_get_index2(Gnattest_T: in out Test) is
      function Get_Index
        (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type)
         return Natural renames
        Wrap_Test_Get_Index_ad8c06_595b62;
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
        (Get_Index(Entry_Widget, LASTCHARACTER) = 0,
         "Failed to get index from Entry_Index_Type in ttk::entry.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_2_Get_Index_test_get_index2;
--  end read only

--  begin read only
   procedure Wrap_Test_Insert_Text_f548e1_a4d8a8
     (Entry_Widget: Ttk_Entry; Index: Natural; Text: Tcl_String;
      Is_Index: Boolean := True) is
   begin
      begin
         pragma Assert
           (Entry_Widget /= Null_Widget and Length(Source => Text) > 0);
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
   end Wrap_Test_Insert_Text_f548e1_a4d8a8;
--  end read only

--  begin read only
   procedure Test_1_Insert_Text_test_insert_text(Gnattest_T: in out Test);
   procedure Test_Insert_Text_f548e1_a4d8a8(Gnattest_T: in out Test) renames
     Test_1_Insert_Text_test_insert_text;
--  id:2.2/f548e1ba01a17a97/Insert_Text/1/0/test_insert_text/
   procedure Test_1_Insert_Text_test_insert_text(Gnattest_T: in out Test) is
      procedure Insert_Text
        (Entry_Widget: Ttk_Entry; Index: Natural; Text: Tcl_String;
         Is_Index: Boolean := True) renames
        Wrap_Test_Insert_Text_f548e1_a4d8a8;
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
         "Failed to insert text to ttk::entry with numeric index.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_1_Insert_Text_test_insert_text;
--  end read only

--  begin read only
   procedure Wrap_Test_Insert_Text_a9d4de_a4d8a8
     (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type; Text: Tcl_String) is
   begin
      begin
         pragma Assert
           (Entry_Widget /= Null_Widget and Length(Source => Text) > 0);
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
   end Wrap_Test_Insert_Text_a9d4de_a4d8a8;
--  end read only

--  begin read only
   procedure Test_2_Insert_Text_test_insert_text(Gnattest_T: in out Test);
   procedure Test_Insert_Text_a9d4de_a4d8a8(Gnattest_T: in out Test) renames
     Test_2_Insert_Text_test_insert_text;
--  id:2.2/a9d4def153cb94e2/Insert_Text/0/0/test_insert_text/
   procedure Test_2_Insert_Text_test_insert_text(Gnattest_T: in out Test) is
      procedure Insert_Text
        (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type;
         Text: Tcl_String) renames
        Wrap_Test_Insert_Text_a9d4de_a4d8a8;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Insert_Text(Entry_Widget, LASTCHARACTER, To_Tcl_String("my text"));
      Assert
        (Get_Text(Entry_Widget) = "my text",
         "Failed to insert text to ttk::entry with Entry_Index_Type index.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_2_Insert_Text_test_insert_text;
--  end read only

--  begin read only
   procedure Wrap_Test_Selection_Clear_7c6919_401526
     (Entry_Widget: Ttk_Entry) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Selection_Clear test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Selection_Clear
        (Entry_Widget);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Selection_Clear test commitment violated");
      end;
   end Wrap_Test_Selection_Clear_7c6919_401526;
--  end read only

--  begin read only
   procedure Test_Selection_Clear_test_selection_clear
     (Gnattest_T: in out Test);
   procedure Test_Selection_Clear_7c6919_401526
     (Gnattest_T: in out Test) renames
     Test_Selection_Clear_test_selection_clear;
--  id:2.2/7c691965dadcc4a1/Selection_Clear/1/0/test_selection_clear/
   procedure Test_Selection_Clear_test_selection_clear
     (Gnattest_T: in out Test) is
      procedure Selection_Clear(Entry_Widget: Ttk_Entry) renames
        Wrap_Test_Selection_Clear_7c6919_401526;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Selection_Clear(Entry_Widget);
      Assert
        (not Selection_Present(Entry_Widget),
         "Failed to clear ttk::entry selection.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_Selection_Clear_test_selection_clear;
--  end read only

--  begin read only
   function Wrap_Test_Selection_Present_43ac3d_c0789f
     (Entry_Widget: Ttk_Entry) return Boolean is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Selection_Present test requirement violated");
      end;
      declare
         Test_Selection_Present_43ac3d_c0789f_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Selection_Present
             (Entry_Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkentry.ads:0:):Test_Selection_Present test commitment violated");
         end;
         return Test_Selection_Present_43ac3d_c0789f_Result;
      end;
   end Wrap_Test_Selection_Present_43ac3d_c0789f;
--  end read only

--  begin read only
   procedure Test_Selection_Present_test_selection_present
     (Gnattest_T: in out Test);
   procedure Test_Selection_Present_43ac3d_c0789f
     (Gnattest_T: in out Test) renames
     Test_Selection_Present_test_selection_present;
--  id:2.2/43ac3df9d942d245/Selection_Present/1/0/test_selection_present/
   procedure Test_Selection_Present_test_selection_present
     (Gnattest_T: in out Test) is
      function Selection_Present
        (Entry_Widget: Ttk_Entry) return Boolean renames
        Wrap_Test_Selection_Present_43ac3d_c0789f;
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
        (not Selection_Present(Entry_Widget),
         "Failed to check if ttk::entry selection exists.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_Selection_Present_test_selection_present;
--  end read only

--  begin read only
   procedure Wrap_Test_Selection_Range_212aed_bae09d
     (Entry_Widget: Ttk_Entry; Start_Index, End_Index: Natural;
      Is_Start_Index, Is_End_Index: Boolean := True) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Selection_Range test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Selection_Range
        (Entry_Widget, Start_Index, End_Index, Is_Start_Index, Is_End_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Selection_Range test commitment violated");
      end;
   end Wrap_Test_Selection_Range_212aed_bae09d;
--  end read only

--  begin read only
   procedure Test_1_Selection_Range_test_selection_range
     (Gnattest_T: in out Test);
   procedure Test_Selection_Range_212aed_bae09d
     (Gnattest_T: in out Test) renames
     Test_1_Selection_Range_test_selection_range;
--  id:2.2/212aedb28c13ceb2/Selection_Range/1/0/test_selection_range/
   procedure Test_1_Selection_Range_test_selection_range
     (Gnattest_T: in out Test) is
      procedure Selection_Range
        (Entry_Widget: Ttk_Entry; Start_Index, End_Index: Natural;
         Is_Start_Index, Is_End_Index: Boolean := True) renames
        Wrap_Test_Selection_Range_212aed_bae09d;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Insert_Text(Entry_Widget, 0, To_Tcl_String("new text"));
      Selection_Range(Entry_Widget, 0, 1);
      Assert
        (Selection_Present(Entry_Widget),
         "Failed to set range for selection in ttk::entry with numerical indexes.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_1_Selection_Range_test_selection_range;
--  end read only

--  begin read only
   procedure Wrap_Test_Selection_Range_b08707_09cc67
     (Entry_Widget: Ttk_Entry; Start_Index, End_Index: Entry_Index_Type) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Selection_Range2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Selection_Range
        (Entry_Widget, Start_Index, End_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Selection_Range2 test commitment violated");
      end;
   end Wrap_Test_Selection_Range_b08707_09cc67;
--  end read only

--  begin read only
   procedure Test_2_Selection_Range_test_selection_range2
     (Gnattest_T: in out Test);
   procedure Test_Selection_Range_b08707_09cc67
     (Gnattest_T: in out Test) renames
     Test_2_Selection_Range_test_selection_range2;
--  id:2.2/b08707d6a2ab7c31/Selection_Range/0/0/test_selection_range2/
   procedure Test_2_Selection_Range_test_selection_range2
     (Gnattest_T: in out Test) is
      procedure Selection_Range
        (Entry_Widget: Ttk_Entry;
         Start_Index, End_Index: Entry_Index_Type) renames
        Wrap_Test_Selection_Range_b08707_09cc67;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Insert_Text(Entry_Widget, 0, To_Tcl_String("new text"));
      Set_Insert_Cursor(Entry_Widget, 0);
      Selection_Range(Entry_Widget, INSERT, LASTCHARACTER);
      Assert
        (Selection_Present(Entry_Widget),
         "Failed to set range for selection in ttk::entry with Entry_Index_Type indexes.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_2_Selection_Range_test_selection_range2;
--  end read only

--  begin read only
   procedure Wrap_Test_Selection_Range_4b6a3d_907ebb
     (Entry_Widget: Ttk_Entry; Start_Index: Natural;
      End_Index: Entry_Index_Type; Is_Start_Index: Boolean := True) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Selection_Range3 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Selection_Range
        (Entry_Widget, Start_Index, End_Index, Is_Start_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Selection_Range3 test commitment violated");
      end;
   end Wrap_Test_Selection_Range_4b6a3d_907ebb;
--  end read only

--  begin read only
   procedure Test_3_Selection_Range_test_selection_range3
     (Gnattest_T: in out Test);
   procedure Test_Selection_Range_4b6a3d_907ebb
     (Gnattest_T: in out Test) renames
     Test_3_Selection_Range_test_selection_range3;
--  id:2.2/4b6a3d1f5633e0ef/Selection_Range/0/0/test_selection_range3/
   procedure Test_3_Selection_Range_test_selection_range3
     (Gnattest_T: in out Test) is
      procedure Selection_Range
        (Entry_Widget: Ttk_Entry; Start_Index: Natural;
         End_Index: Entry_Index_Type; Is_Start_Index: Boolean := True) renames
        Wrap_Test_Selection_Range_4b6a3d_907ebb;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Insert_Text(Entry_Widget, 0, To_Tcl_String("new text"));
      Selection_Range(Entry_Widget, 0, LASTCHARACTER);
      Assert
        (Selection_Present(Entry_Widget),
         "Failed to set range for selection in ttk::entry with numerical and Entry_Index_Type indexes.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_3_Selection_Range_test_selection_range3;
--  end read only

--  begin read only
   procedure Wrap_Test_Selection_Range_d3f0c4_0118df
     (Entry_Widget: Ttk_Entry; Start_Index: Entry_Index_Type;
      End_Index: Natural; Is_End_Index: Boolean := True) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Selection_Range4 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Selection_Range
        (Entry_Widget, Start_Index, End_Index, Is_End_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_Selection_Range4 test commitment violated");
      end;
   end Wrap_Test_Selection_Range_d3f0c4_0118df;
--  end read only

--  begin read only
   procedure Test_4_Selection_Range_test_selection_range4
     (Gnattest_T: in out Test);
   procedure Test_Selection_Range_d3f0c4_0118df
     (Gnattest_T: in out Test) renames
     Test_4_Selection_Range_test_selection_range4;
--  id:2.2/d3f0c4420d83b926/Selection_Range/0/0/test_selection_range4/
   procedure Test_4_Selection_Range_test_selection_range4
     (Gnattest_T: in out Test) is
      procedure Selection_Range
        (Entry_Widget: Ttk_Entry; Start_Index: Entry_Index_Type;
         End_Index: Natural; Is_End_Index: Boolean := True) renames
        Wrap_Test_Selection_Range_d3f0c4_0118df;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      Insert_Text(Entry_Widget, 0, To_Tcl_String("new text"));
      Set_Insert_Cursor(Entry_Widget, 0);
      Selection_Range(Entry_Widget, INSERT, 1);
      Assert
        (Selection_Present(Entry_Widget),
         "Failed to set range for selection in ttk::entry with Entry_Index_Type and numerical indexes.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_4_Selection_Range_test_selection_range4;
--  end read only

--  begin read only
   function Wrap_Test_Validate_deb16a_7d02a7
     (Entry_Widget: Ttk_Entry) return Boolean is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_Validate test requirement violated");
      end;
      declare
         Test_Validate_deb16a_7d02a7_Result: constant Boolean :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.Validate
             (Entry_Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkentry.ads:0:):Test_Validate test commitment violated");
         end;
         return Test_Validate_deb16a_7d02a7_Result;
      end;
   end Wrap_Test_Validate_deb16a_7d02a7;
--  end read only

--  begin read only
   procedure Test_Validate_test_validate(Gnattest_T: in out Test);
   procedure Test_Validate_deb16a_7d02a7(Gnattest_T: in out Test) renames
     Test_Validate_test_validate;
--  id:2.2/deb16a07cfd049ba/Validate/1/0/test_validate/
   procedure Test_Validate_test_validate(Gnattest_T: in out Test) is
      function Validate(Entry_Widget: Ttk_Entry) return Boolean renames
        Wrap_Test_Validate_deb16a_7d02a7;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget :=
        Create
          (".myentry",
           Ttk_Entry_Options'
             (Validation => KEY, Validate_Command => To_Tcl_String("return 1"),
              others => <>));
      Assert
        (Validate(Entry_Widget), "Failed to validate value of ttk::entry.");

--  begin read only
   end Test_Validate_test_validate;
--  end read only

--  begin read only
   function Wrap_Test_X_View_2a360c_fac801
     (Entry_Widget: Ttk_Entry) return Fractions_Array is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_X_View test requirement violated");
      end;
      declare
         Test_X_View_2a360c_fac801_Result: constant Fractions_Array :=
           GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.X_View
             (Entry_Widget);
      begin
         begin
            pragma Assert(True);
            null;
         exception
            when System.Assertions.Assert_Failure =>
               AUnit.Assertions.Assert
                 (False,
                  "ens_sloc(tk-ttkentry.ads:0:):Test_X_View test commitment violated");
         end;
         return Test_X_View_2a360c_fac801_Result;
      end;
   end Wrap_Test_X_View_2a360c_fac801;
--  end read only

--  begin read only
   procedure Test_X_View_test_x_view(Gnattest_T: in out Test);
   procedure Test_X_View_2a360c_fac801(Gnattest_T: in out Test) renames
     Test_X_View_test_x_view;
--  id:2.2/2a360cb9bfcd4c30/X_View/1/0/test_x_view/
   procedure Test_X_View_test_x_view(Gnattest_T: in out Test) is
      function X_View(Entry_Widget: Ttk_Entry) return Fractions_Array renames
        Wrap_Test_X_View_2a360c_fac801;
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
        (X_View(Entry_Widget) = (0.0, 1.0),
         "Failed to get visible range for ttk::entry.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_X_View_test_x_view;
--  end read only

--  begin read only
   procedure Wrap_Test_X_View_Adjust_4d030c_ce5610
     (Entry_Widget: Ttk_Entry; Index: Natural; Is_Index: Boolean := True) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_X_View_Adjust test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.X_View_Adjust
        (Entry_Widget, Index, Is_Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_X_View_Adjust test commitment violated");
      end;
   end Wrap_Test_X_View_Adjust_4d030c_ce5610;
--  end read only

--  begin read only
   procedure Test_1_X_View_Adjust_test_x_view_adjust(Gnattest_T: in out Test);
   procedure Test_X_View_Adjust_4d030c_ce5610(Gnattest_T: in out Test) renames
     Test_1_X_View_Adjust_test_x_view_adjust;
--  id:2.2/4d030cc7e64ce228/X_View_Adjust/1/0/test_x_view_adjust/
   procedure Test_1_X_View_Adjust_test_x_view_adjust
     (Gnattest_T: in out Test) is
      procedure X_View_Adjust
        (Entry_Widget: Ttk_Entry; Index: Natural;
         Is_Index: Boolean := True) renames
        Wrap_Test_X_View_Adjust_4d030c_ce5610;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      X_View_Adjust(Entry_Widget, 0);
      Assert(True, "This test can only crash.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_1_X_View_Adjust_test_x_view_adjust;
--  end read only

--  begin read only
   procedure Wrap_Test_X_View_Adjust_9b5765_53940a
     (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_X_View_Adjust2 test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.X_View_Adjust
        (Entry_Widget, Index);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_X_View_Adjust2 test commitment violated");
      end;
   end Wrap_Test_X_View_Adjust_9b5765_53940a;
--  end read only

--  begin read only
   procedure Test_2_X_View_Adjust_test_x_view_adjust2(Gnattest_T: in out Test);
   procedure Test_X_View_Adjust_9b5765_53940a(Gnattest_T: in out Test) renames
     Test_2_X_View_Adjust_test_x_view_adjust2;
--  id:2.2/9b576515d26272f3/X_View_Adjust/0/0/test_x_view_adjust2/
   procedure Test_2_X_View_Adjust_test_x_view_adjust2
     (Gnattest_T: in out Test) is
      procedure X_View_Adjust
        (Entry_Widget: Ttk_Entry; Index: Entry_Index_Type) renames
        Wrap_Test_X_View_Adjust_9b5765_53940a;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      X_View_Adjust(Entry_Widget, LASTCHARACTER);
      Assert(True, "This test can only crash.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_2_X_View_Adjust_test_x_view_adjust2;
--  end read only

--  begin read only
   procedure Wrap_Test_X_View_Move_To_e93a2e_470a38
     (Entry_Widget: Ttk_Entry; Fraction: Fraction_Type) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_X_View_Move_To test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.X_View_Move_To
        (Entry_Widget, Fraction);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_X_View_Move_To test commitment violated");
      end;
   end Wrap_Test_X_View_Move_To_e93a2e_470a38;
--  end read only

--  begin read only
   procedure Test_X_View_Move_To_test_x_view_move_to(Gnattest_T: in out Test);
   procedure Test_X_View_Move_To_e93a2e_470a38(Gnattest_T: in out Test) renames
     Test_X_View_Move_To_test_x_view_move_to;
--  id:2.2/e93a2ede4a3360c1/X_View_Move_To/1/0/test_x_view_move_to/
   procedure Test_X_View_Move_To_test_x_view_move_to
     (Gnattest_T: in out Test) is
      procedure X_View_Move_To
        (Entry_Widget: Ttk_Entry; Fraction: Fraction_Type) renames
        Wrap_Test_X_View_Move_To_e93a2e_470a38;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      X_View_Move_To(Entry_Widget, 0.5);
      Assert(True, "This test can only crash.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_X_View_Move_To_test_x_view_move_to;
--  end read only

--  begin read only
   procedure Wrap_Test_X_View_Scroll_84331f_ff6390
     (Entry_Widget: Ttk_Entry; Number: Integer; What: Scroll_Unit_Type) is
   begin
      begin
         pragma Assert(Entry_Widget /= Null_Widget);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "req_sloc(tk-ttkentry.ads:0):Test_X_View_Scroll test requirement violated");
      end;
      GNATtest_Generated.GNATtest_Standard.Tk.TtkEntry.X_View_Scroll
        (Entry_Widget, Number, What);
      begin
         pragma Assert(True);
         null;
      exception
         when System.Assertions.Assert_Failure =>
            AUnit.Assertions.Assert
              (False,
               "ens_sloc(tk-ttkentry.ads:0:):Test_X_View_Scroll test commitment violated");
      end;
   end Wrap_Test_X_View_Scroll_84331f_ff6390;
--  end read only

--  begin read only
   procedure Test_X_View_Scroll_test_x_view_scroll(Gnattest_T: in out Test);
   procedure Test_X_View_Scroll_84331f_ff6390(Gnattest_T: in out Test) renames
     Test_X_View_Scroll_test_x_view_scroll;
--  id:2.2/84331fc34c539da3/X_View_Scroll/1/0/test_x_view_scroll/
   procedure Test_X_View_Scroll_test_x_view_scroll(Gnattest_T: in out Test) is
      procedure X_View_Scroll
        (Entry_Widget: Ttk_Entry; Number: Integer;
         What: Scroll_Unit_Type) renames
        Wrap_Test_X_View_Scroll_84331f_ff6390;
--  end read only

      pragma Unreferenced(Gnattest_T);
      Entry_Widget: Ttk_Entry;

   begin

      if Value("DISPLAY", "")'Length = 0 then
         Assert(True, "No display, can't test");
         return;
      end if;
      Entry_Widget := Create(".myentry", Ttk_Entry_Options'(others => <>));
      X_View_Scroll(Entry_Widget, 1, UNITS);
      Assert(True, "This test can only crash.");
      Destroy(Entry_Widget);

--  begin read only
   end Test_X_View_Scroll_test_x_view_scroll;
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
