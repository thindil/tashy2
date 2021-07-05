with Ada.Strings.Maps; use Ada.Strings.Maps;
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
   begin
      if Label_Options.Text = To_Tcl_String(Source => "0") then
         Label_Options.Text := Null_Tcl_String;
      end if;
      if Button_Options.Text = To_Unbounded_String(Source => "=") then
         Configure
           (Label => Display_Label,
            Options =>
              (Text =>
                 To_Tcl_String
                   (Source =>
                      Tcl_Eval
                        (Tcl_Script =>
                           "expr " &
                           To_Ada_String(Source => Label_Options.Text))),
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
