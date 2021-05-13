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
with Ada.Strings;
with Tcl.Lists; use Tcl.Lists;

package body Tk.TtkWidget is

   procedure Option_Image
     (Name: String;
      Value: Compound_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= EMPTY then
         Append
           (Source => Options_String,
            New_Item =>
              " -" &
              Name &
              " " &
              To_Lower(Item => Compound_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String;
      Value: Disabled_State_Type;
      Options_String: in out Unbounded_String) is
   begin
      if Value /= NONE then
         Append
           (Source => Options_String,
            New_Item =>
              " -" &
              Name &
              " " &
              To_Lower(Item => Disabled_State_Type'Image(Value)));
      end if;
   end Option_Image;

   procedure Option_Image
     (Name: String;
      Value: Ttk_Image_Option;
      Options_String: in out Unbounded_String) is
   begin
      if Value = Default_Ttk_Image_Option then
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
     (Name: String;
      Value: Padding_Data;
      Options_String: in out Unbounded_String) is
      use Ada.Strings;

      First: Boolean := True;
      procedure Append_Value
        (New_Value: Pixel_Data;
         Is_First: in out Boolean) is
      begin
         if New_Value.Value > -1.0 then
            if Is_First then
               Append
                 (Source => Options_String,
                  New_Item => " -" & Name & " {");
               Is_First := False;
            end if;
            Append
              (Source => Options_String,
               New_Item => Pixel_Data_Image(Value => New_Value) & " ");
         end if;
      end Append_Value;
   begin
      Append_Value(New_Value => Value.Left, Is_First => First);
      Append_Value(New_Value => Value.Top, Is_First => First);
      Append_Value(New_Value => Value.Right, Is_First => First);
      Append_Value(New_Value => Value.Bottom, Is_First => First);
      if not First then
         Trim(Source => Options_String, Side => Right);
         Append(Source => Options_String, New_Item => "}");
      end if;
   end Option_Image;

   function Option_Value
     (Ttk_Widgt: Ttk_Widget;
      Name: String) return Compound_Type is
      Result: constant String :=
        Execute_Widget_Command
          (Widgt => Ttk_Widgt,
           Command_Name => "cget",
           Options => "-" & Name);
   begin
      if Result'Length = 0 then
         return EMPTY;
      end if;
      return Compound_Type'Value(Result);
   end Option_Value;

   function Option_Value
     (Ttk_Widgt: Ttk_Widget;
      Name: String) return Disabled_State_Type is
   begin
      return Disabled_State_Type'Value
          (Execute_Widget_Command
             (Widgt => Ttk_Widgt,
              Command_Name => "cget",
              Options => "-" & Name));
   end Option_Value;

   function Option_Value
     (Ttk_Widgt: Ttk_Widget;
      Name: String) return Ttk_Image_Option is
      Options: Ttk_Image_Option := Default_Ttk_Image_Option;
      Options_Array: constant Array_List :=
        Split_List
          (List =>
             Execute_Widget_Command
               (Widgt => Ttk_Widgt,
                Command_Name => "cget",
                Options => "-" & Name),
           Interpreter => Tk_Interp(Widgt => Ttk_Widgt));
      Index: Positive := 2;
   begin
      if Options_Array'Length < 1 then
         return Options;
      end if;
      Options.Default :=
        To_Tcl_String(Source => To_String(Source => Options_Array(1)));
      Set_Options_Loop:
      while Index <= Options_Array'Length loop
         if Options_Array(Index) = To_Tcl_String(Source => "active") then
            Options.Active := Options_Array(Index + 1);
         elsif Options_Array(Index) = To_Tcl_String(Source => "disabled") then
            Options.Disabled := Options_Array(Index + 1);
         elsif Options_Array(Index) = To_Tcl_String(Source => "focus") then
            Options.Focus := Options_Array(Index + 1);
         elsif Options_Array(Index) = To_Tcl_String(Source => "pressed") then
            Options.Pressed := Options_Array(Index + 1);
         elsif Options_Array(Index) = To_Tcl_String(Source => "selected") then
            Options.Selected := Options_Array(Index + 1);
         elsif Options_Array(Index) =
           To_Tcl_String(Source => "background") then
            Options.Background := Options_Array(Index + 1);
         elsif Options_Array(Index) = To_Tcl_String(Source => "readonly") then
            Options.Readonly := Options_Array(Index + 1);
         elsif Options_Array(Index) = To_Tcl_String(Source => "alternate") then
            Options.Alternate := Options_Array(Index + 1);
         elsif Options_Array(Index) = To_Tcl_String(Source => "invalid") then
            Options.Invalid := Options_Array(Index + 1);
         elsif Options_Array(Index) = To_Tcl_String(Source => "hover") then
            Options.Hover := Options_Array(Index + 1);
         end if;
         Index := Index + 2;
      end loop Set_Options_Loop;
      return Options;
   end Option_Value;

   function Option_Value
     (Ttk_Widgt: Ttk_Widget;
      Name: String) return Padding_Data is
      Result_List: constant Array_List :=
        Split_List
          (List =>
             Execute_Widget_Command
               (Widgt => Ttk_Widgt,
                Command_Name => "cget",
                Options => "-" & Name),
           Interpreter => Tk_Interp(Widgt => Ttk_Widgt));
   begin
      if Result_List'Length = 0 then
         return Empty_Padding_Data;
      end if;
      return Padding: Padding_Data := Empty_Padding_Data do
         Padding.Left :=
           Pixel_Data_Value(Value => To_Ada_String(Source => Result_List(1)));
         if Result_List'Length > 1 then
            Padding.Top :=
              Pixel_Data_Value
                (Value => To_Ada_String(Source => Result_List(2)));
         end if;
         if Result_List'Length > 2 then
            Padding.Right :=
              Pixel_Data_Value
                (Value => To_Ada_String(Source => Result_List(3)));
         end if;
         if Result_List'Length = 4 then
            Padding.Bottom :=
              Pixel_Data_Value
                (Value => To_Ada_String(Source => Result_List(4)));
         end if;
      end return;
   end Option_Value;

   function In_State
     (Ttk_Widgt: Ttk_Widget;
      State_Ttk: Ttk_State_Type) return Boolean is
      function Get_Result is new Generic_Scalar_Tcl_Get_Result
        (Result_Type => Integer);
   begin
      Execute_Widget_Command
        (Widgt => Ttk_Widgt,
         Command_Name => "instate",
         Options => To_Lower(Item => Ttk_State_Type'Image(State_Ttk)));
      if Get_Result(Interpreter => Tk_Interp(Widgt => Ttk_Widgt)) = 1 then
         return True;
      end if;
      return False;
   end In_State;

   procedure In_State
     (Ttk_Widgt: Ttk_Widget;
      State_Type: Ttk_State_Type;
      Tcl_Script: Tcl_String) is
   begin
      Execute_Widget_Command
        (Widgt => Ttk_Widgt,
         Command_Name => "instate",
         Options =>
           To_Lower(Item => Ttk_State_Type'Image(State_Type)) &
           " " &
           To_String(Source => Tcl_Script));
   end In_State;

   procedure State
     (Ttk_Widgt: Ttk_Widget;
      Widget_State: Ttk_State_Type;
      Disable: Boolean := False) is
   begin
      if Disable then
         Execute_Widget_Command
           (Widgt => Ttk_Widgt,
            Command_Name => "state",
            Options =>
              "!" & To_Lower(Item => Ttk_State_Type'Image(Widget_State)));
      else
         Execute_Widget_Command
           (Widgt => Ttk_Widgt,
            Command_Name => "state",
            Options => To_Lower(Item => Ttk_State_Type'Image(Widget_State)));
      end if;
   end State;

   function State(Ttk_Widgt: Ttk_Widget) return Ttk_State_Array is
      Result_List: constant Array_List :=
        Split_List
          (List =>
             Execute_Widget_Command
               (Widgt => Ttk_Widgt,
                Command_Name => "state"),
           Interpreter => Tk_Interp(Widgt => Ttk_Widgt));
   begin
      return
        States: Ttk_State_Array(1 .. Result_List'Last) :=
          (others => Default_Ttk_State)
      do
         Fill_Return_Value_Loop:
         for I in 1 .. Result_List'Last loop
            States(I) :=
              Ttk_State_Type'Value(To_Ada_String(Source => Result_List(I)));
         end loop Fill_Return_Value_Loop;
      end return;
   end State;

end Tk.TtkWidget;
