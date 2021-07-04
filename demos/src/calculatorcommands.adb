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
        Get_Widget(Get_Argument(Argv, 1), Interpreter);
      Display_Label: constant Ttk_Label :=
        Get_Widget(Get_Argument(Argv, 2), Interpreter);
      Label_Options: Ttk_Label_Options := Get_Options(Label => Display_Label);
      Button_Options: constant Ttk_Button_Options := Get_Options(Button);
   begin
      if Label_Options.Text = To_Tcl_String("0") then
         Label_Options.Text := Null_Tcl_String;
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
        Get_Widget(Get_Argument(Argv, 1), Interpreter);
   begin
      Configure
        (Label => Display_Label,
         Options => (Text => To_Tcl_String("0"), others => <>));
      return TCL_OK;
   end Clear_Display;

end CalculatorCommands;
