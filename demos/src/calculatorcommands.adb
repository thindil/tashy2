with Ada.Strings; use Ada.Strings;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Tcl.Strings; use Tcl.Strings;
with Tk.TtkButton; use Tk.TtkButton;
with Tk.TtkLabel; use Tk.TtkLabel;
with Tk.Widget; use Tk.Widget;

package body CalculatorCommands is

   function On_Click
     (Client_Data: System.Address; Interpreter: Tcl_Interpreter;
      Argc: Positive; Argv: Argv_Pointer.Pointer) return Tcl_Results is
      pragma Unreferenced(Client_Data, Argc);
      Button: constant Ttk_Button :=
        Get_Widget
          (Path_Name => Get_Argument(Arguments_Pointer => Argv, Index => 1),
           Interpreter => Interpreter);
      Display_Label: constant Ttk_Label :=
        Get_Widget
          (Path_Name => Get_Argument(Arguments_Pointer => Argv, Index => 2),
           Interpreter => Interpreter);
      Label_Options: Ttk_Label_Options := Get_Options(Label => Display_Label);
      Button_Options: constant Ttk_Button_Options :=
        Get_Options(Button => Button);
      Operators_Set: constant Character_Set := To_Set(Sequence => "*+/-");
      Result: Float := 0.0;
      StartIndex: Positive := 1;
      SignIndex: Natural := 0;
      Expression: constant String := To_Ada_String(Label_Options.Text);
      Result_String: String(1 .. 30);
   begin
      if Label_Options.Text = To_Tcl_String(Source => "0") then
         Label_Options.Text := Null_Tcl_String;
      end if;
      if Button_Options.Text = To_Unbounded_String(Source => "=") then
         SignIndex := Index(Expression, Operators_Set, StartIndex);
         if SignIndex = 0 then
            Result := Float'Value(Expression);
         else
            Result := Float'Value(Expression(StartIndex .. SignIndex - 1));
            StartIndex := SignIndex + 1;
         end if;
         while SignIndex > 0 or StartIndex < Expression'Last loop
            SignIndex := Index(Expression, Operators_Set, StartIndex);
            if SignIndex = 0 then
               SignIndex := Expression'Last + 1;
            end if;
            case Expression(StartIndex - 1) is
               when '+' =>
                  Result :=
                    Result +
                    Float'Value(Expression(StartIndex .. SignIndex - 1));
               when '-' =>
                  Result :=
                    Result -
                    Float'Value(Expression(StartIndex .. SignIndex - 1));
               when '*' =>
                  Result :=
                    Result *
                    Float'Value(Expression(StartIndex .. SignIndex - 1));
               when '/' =>
                  Result :=
                    Result /
                    Float'Value(Expression(StartIndex .. SignIndex - 1));
               when others =>
                  null;
            end case;
            StartIndex := SignIndex + 1;
            exit when StartIndex > Expression'Last;
         end loop;
         Put(To => Result_String, Item => Result, Aft => 5, Exp => 0);
         Trim
           (Source => Result_String, Left => Null_Set,
            Right => To_Set(Sequence => ".0"));
         Configure
           (Label => Display_Label,
            Options =>
              (Text => To_Tcl_String(Source => Trim(Result_String, Both)),
               others => <>));
         return TCL_OK;
      end if;
      Configure
        (Label => Display_Label,
         Options =>
           (Text => Label_Options.Text & Button_Options.Text, others => <>));
      return TCL_OK;
   end On_Click;

   function Clear_Display
     (Client_Data: System.Address; Interpreter: Tcl_Interpreter;
      Argc: Positive; Argv: Argv_Pointer.Pointer) return Tcl_Results is
      pragma Unreferenced(Client_Data, Argc);
      Display_Label: constant Ttk_Label :=
        Get_Widget
          (Path_Name => Get_Argument(Arguments_Pointer => Argv, Index => 1),
           Interpreter => Interpreter);
   begin
      Configure
        (Label => Display_Label,
         Options => (Text => To_Tcl_String(Source => "0"), others => <>));
      return TCL_OK;
   end Clear_Display;

end CalculatorCommands;
