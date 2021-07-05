with Ada.Strings.Maps; use Ada.Strings.Maps;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Tcl.Strings; use Tcl.Strings;
with Tk.TtkButton; use Tk.TtkButton;
with Tk.TtkLabel; use Tk.TtkLabel;
with Tk.Widget; use Tk.Widget;
with Ada.Text_IO;

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
      Result: Integer := 0;
      StartIndex: Positive := 1;
      SignIndex: Natural := 0;
      Expression: constant String := To_Ada_String(Label_Options.Text);
   begin
      if Label_Options.Text = To_Tcl_String(Source => "0") then
         Label_Options.Text := Null_Tcl_String;
      end if;
      if Button_Options.Text = To_Unbounded_String(Source => "=") then
         SignIndex := Index(Expression, Operators_Set, StartIndex);
         if SignIndex = 0 then
            Result := Integer'Value(Expression);
         else
            Result := Integer'Value(Expression(StartIndex .. SignIndex - 1));
            StartIndex := SignIndex + 1;
         end if;
         while SignIndex > 0 or StartIndex < Expression'Last loop
            Ada.Text_IO.Put_Line(Result'Img);
            SignIndex := Index(Expression, Operators_Set, StartIndex);
            exit when SignIndex = 0;
            StartIndex := SignIndex + 1;
         end loop;
         Configure
           (Label => Display_Label,
            Options =>
              (Text => To_Tcl_String(Source => Integer'Image(Result)),
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
