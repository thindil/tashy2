-- Copyright (c) 2021 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

with Ada.Characters.Handling; use Ada.Characters.Handling;
with Ada.Strings; use Ada.Strings;
with GNAT.String_Split; use GNAT.String_Split;
with Tcl.Lists; use Tcl.Lists;

package body Tk.TtkWidget is

   procedure Option_Image
     (Name: String; Value: Compound_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= EMPTY then
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & " " &
              To_Lower(Item => Compound_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Disabled_State_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= NONE then
         Append
           (Source => Options_String,
            New_Item =>
              " -" & Name & " " &
              To_Lower(Item => Disabled_State_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Ttk_Image_Option;
      Options_String: in out Unbounded_String) is
   begin
      if Value = Ttk_Image_Option'(others => <>) then
         return;
      end if;
      Append
        (Source => Options_String,
         New_Item => " -" & Name & " {" & To_String(Source => Value.Default));
      if Value.Active /= Tcl_String(Null_Unbounded_String) then
         Append
           (Source => Options_String,
            New_Item => " active " & To_String(Source => Value.Active));
      end if;
      if Value.Disabled /= Tcl_String(Null_Unbounded_String) then
         Append
           (Source => Options_String,
            New_Item => " disabled " & To_String(Source => Value.Disabled));
      end if;
      if Value.Focus /= Tcl_String(Null_Unbounded_String) then
         Append
           (Source => Options_String,
            New_Item => " focus " & To_String(Source => Value.Focus));
      end if;
      if Value.Pressed /= Tcl_String(Null_Unbounded_String) then
         Append
           (Source => Options_String,
            New_Item => " pressed " & To_String(Source => Value.Pressed));
      end if;
      if Value.Selected /= Tcl_String(Null_Unbounded_String) then
         Append
           (Source => Options_String,
            New_Item => " selected " & To_String(Source => Value.Selected));
      end if;
      if Value.Background /= Tcl_String(Null_Unbounded_String) then
         Append
           (Source => Options_String,
            New_Item =>
              " background " & To_String(Source => Value.Background));
      end if;
      if Value.Readonly /= Tcl_String(Null_Unbounded_String) then
         Append
           (Source => Options_String,
            New_Item => " readonly " & To_String(Source => Value.Readonly));
      end if;
      if Value.Alternate /= Tcl_String(Null_Unbounded_String) then
         Append
           (Source => Options_String,
            New_Item => " alternate " & To_String(Source => Value.Alternate));
      end if;
      if Value.Invalid /= Tcl_String(Null_Unbounded_String) then
         Append
           (Source => Options_String,
            New_Item => " invalid " & To_String(Source => Value.Invalid));
      end if;
      if Value.Hover /= Tcl_String(Null_Unbounded_String) then
         Append
           (Source => Options_String,
            New_Item => " hover " & To_String(Source => Value.Hover));
      end if;
      Append(Source => Options_String, New_Item => "}");
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Padding_Array;
      Options_String: in out Unbounded_String) is
      First: Boolean := True;
   begin
      Convert_Padding_Array_Loop :
      for Padding of Value loop
         if Padding.Value > -1.0 then
            if First then
               Append
                 (Source => Options_String, New_Item => " -" & Name & " {");
               First := False;
            end if;
            Append
              (Source => Options_String,
               New_Item => Pixel_Data_Image(Padding) & " ");
         end if;
      end loop Convert_Padding_Array_Loop;
      if not First then
         Trim(Options_String, Right);
         Append(Source => Options_String, New_Item => "}");
      end if;
   end Option_Image;

   function Option_Value
     (Ttk_Widgt: Ttk_Widget; Name: String) return Compound_Type is
   begin
      Execute_Widget_Command(Ttk_Widgt, "cget", "-" & Name);
      declare
         Result: constant String := Tcl_Get_Result(Tk_Interp(Ttk_Widgt));
      begin
         if Result'Length = 0 then
            return EMPTY;
         else
            return Compound_Type'Value(Result);
         end if;
      end;
   end Option_Value;

   function Option_Value
     (Ttk_Widgt: Ttk_Widget; Name: String) return Disabled_State_Type is
   begin
      Execute_Widget_Command(Ttk_Widgt, "cget", "-" & Name);
      return Disabled_State_Type'Value(Tcl_Get_Result(Tk_Interp(Ttk_Widgt)));
   end Option_Value;

   function Option_Value
     (Ttk_Widgt: Ttk_Widget; Name: String) return Ttk_Image_Option is
      Options: Ttk_Image_Option := Ttk_Image_Option'(others => <>);
   begin
      Execute_Widget_Command(Ttk_Widgt, "cget", "-" & Name);
      declare
         Options_Array: constant Array_List :=
           Split_List(Tcl_Get_Result(Tk_Interp(Ttk_Widgt)));
         Index: Positive := 2;
      begin
         if Options_Array'Length < 1 then
            return Options;
         end if;
         Options.Default :=
           To_Tcl_String(To_String(Source => Options_Array(1)));
         Set_Options_Loop :
         loop
            exit Set_Options_Loop when Index > Options_Array'Length;
            if Options_Array(Index) = To_Tcl_String("active") then
               Options.Active := Options_Array(Index + 1);
            elsif Options_Array(Index) = To_Tcl_String("disabled") then
               Options.Disabled := Options_Array(Index + 1);
            elsif Options_Array(Index) = To_Tcl_String("focus") then
               Options.Focus := Options_Array(Index + 1);
            elsif Options_Array(Index) = To_Tcl_String("pressed") then
               Options.Pressed := Options_Array(Index + 1);
            elsif Options_Array(Index) = To_Tcl_String("selected") then
               Options.Selected := Options_Array(Index + 1);
            elsif Options_Array(Index) = To_Tcl_String("background") then
               Options.Background := Options_Array(Index + 1);
            elsif Options_Array(Index) = To_Tcl_String("readonly") then
               Options.Readonly := Options_Array(Index + 1);
            elsif Options_Array(Index) = To_Tcl_String("alternate") then
               Options.Alternate := Options_Array(Index + 1);
            elsif Options_Array(Index) = To_Tcl_String("invalid") then
               Options.Invalid := Options_Array(Index + 1);
            elsif Options_Array(Index) = To_Tcl_String("hover") then
               Options.Hover := Options_Array(Index + 1);
            end if;
            Index := Index + 2;
         end loop Set_Options_Loop;
      end;
      return Options;
   end Option_Value;

   function Option_Value
     (Ttk_Widgt: Ttk_Widget; Name: String) return Padding_Array is
      Tokens: Slice_Set;
   begin
      Execute_Widget_Command(Ttk_Widgt, "cget", "-" & Name);
      Create(Tokens, Tcl_Get_Result, " ");
      return Padding: Padding_Array do
         for I in 1 .. Slice_Count(Tokens) loop
            Padding(Positive(I)) := Pixel_Data_Value(Slice(Tokens, I));
         end loop;
      end return;
   end Option_Value;

   function In_State
     (Ttk_Widgt: Ttk_Widget; State: Ttk_State_Type) return Boolean is
   begin
      Execute_Widget_Command
        (Ttk_Widgt, "instate", To_Lower(Ttk_State_Type'Image(State)));
      if Tcl_Get_Result(Tk_Interp(Ttk_Widgt)) = 1 then
         return True;
      else
         return False;
      end if;
   end In_State;

   procedure In_State
     (Ttk_Widgt: Ttk_Widget; State: Ttk_State_Type; Tcl_Script: Tcl_String) is
   begin
      Execute_Widget_Command
        (Ttk_Widgt, "instate",
         To_Lower(Ttk_State_Type'Image(State)) & " " &
         To_String(Source => Tcl_Script));
   end In_State;

   procedure State
     (Ttk_Widgt: Ttk_Widget; Widget_State: Ttk_State_Type;
      Disable: Boolean := False) is
   begin
      if Disable then
         Execute_Widget_Command
           (Ttk_Widgt, "state",
            "!" & To_Lower(Ttk_State_Type'Image(Widget_State)));
      else
         Execute_Widget_Command
           (Ttk_Widgt, "state", To_Lower(Ttk_State_Type'Image(Widget_State)));
      end if;
   end State;

   function State(Ttk_Widgt: Ttk_Widget) return Ttk_State_Array is
      Tokens: Slice_Set;
   begin
      Execute_Widget_Command(Ttk_Widgt, "state");
      Create(Tokens, Tcl_Get_Result, " ");
      return States: Ttk_State_Array(1 .. Natural(Slice_Count(Tokens))) do
         for I in 1 .. Slice_Count(Tokens) loop
            States(Positive(I)) :=
              Ttk_State_Type'Value(Slice(Tokens, Slice_Number(I)));
         end loop;
      end return;
   end State;

end Tk.TtkWidget;
