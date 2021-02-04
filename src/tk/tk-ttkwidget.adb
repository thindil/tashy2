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
with GNAT.String_Split; use GNAT.String_Split;

package body Tk.TtkWidget is

   procedure Option_Image
     (Name: String; Value: Compound_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= EMPTY then
         Append
           (Options_String,
            " -" & Name & " " & To_Lower(Compound_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Disabled_State_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= NONE then
         Append
           (Options_String,
            " -" & Name & " " & To_Lower(Disabled_State_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String; Value: Ttk_Image_Option;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= Ttk_Image_Option'(others => <>) then
         Append(Options_String, " -" & Name);
      end if;
      if Value.Default /= Tcl_String(Null_Unbounded_String) then
         Append(Options_String, " " & To_String(Value.Default));
      end if;
      if Value.Active /= Tcl_String(Null_Unbounded_String) then
         Append(Options_String, " " & To_String(Value.Active));
      end if;
      if Value.Disabled /= Tcl_String(Null_Unbounded_String) then
         Append(Options_String, " " & To_String(Value.Disabled));
      end if;
      if Value.Focus /= Tcl_String(Null_Unbounded_String) then
         Append(Options_String, " " & To_String(Value.Focus));
      end if;
      if Value.Pressed /= Tcl_String(Null_Unbounded_String) then
         Append(Options_String, " " & To_String(Value.Pressed));
      end if;
      if Value.Selected /= Tcl_String(Null_Unbounded_String) then
         Append(Options_String, " " & To_String(Value.Selected));
      end if;
      if Value.Background /= Tcl_String(Null_Unbounded_String) then
         Append(Options_String, " " & To_String(Value.Background));
      end if;
      if Value.Readonly /= Tcl_String(Null_Unbounded_String) then
         Append(Options_String, " " & To_String(Value.Readonly));
      end if;
      if Value.Alternate /= Tcl_String(Null_Unbounded_String) then
         Append(Options_String, " " & To_String(Value.Alternate));
      end if;
      if Value.Invalid /= Tcl_String(Null_Unbounded_String) then
         Append(Options_String, " " & To_String(Value.Invalid));
      end if;
      if Value.Hover /= Tcl_String(Null_Unbounded_String) then
         Append(Options_String, " " & To_String(Value.Hover));
      end if;
   end Option_Image;

   function In_State
     (Widget: Ttk_Widget; State: Ttk_State_Type) return Boolean is
   begin
      Execute_Widget_Command
        (Widget, "instate", To_Lower(Ttk_State_Type'Image(State)));
      if Tcl_GetResult(Tk_Interp(Widget)) = 1 then
         return True;
      else
         return False;
      end if;
   end In_State;

   procedure In_State
     (Widget: Ttk_Widget; State: Ttk_State_Type; Tcl_Script: Tcl_String) is
   begin
      Execute_Widget_Command
        (Widget, "instate",
         To_Lower(Ttk_State_Type'Image(State)) & " " & To_String(Tcl_Script));
   end In_State;

   procedure State
     (Widget: Ttk_Widget; State: Ttk_State_Type; Disable: Boolean := False) is
   begin
      if Disable then
         Execute_Widget_Command
           (Widget, "state", "!" & To_Lower(Ttk_State_Type'Image(State)));
      else
         Execute_Widget_Command
           (Widget, "state", To_Lower(Ttk_State_Type'Image(State)));
      end if;
   end State;

   function State(Widget: Ttk_Widget) return Ttk_State_Array is
      Tokens: Slice_Set;
   begin
      Execute_Widget_Command(Widget, "state");
      Create(Tokens, Tcl_GetResult, " ");
      return States: Ttk_State_Array(1 .. Natural(Slice_Count(Tokens))) do
         for I in 1 .. Slice_Count(Tokens) loop
            States(Positive(I)) :=
              Ttk_State_Type'Value(Slice(Tokens, Slice_Number(I)));
         end loop;
      end return;
   end State;

end Tk.TtkWidget;
