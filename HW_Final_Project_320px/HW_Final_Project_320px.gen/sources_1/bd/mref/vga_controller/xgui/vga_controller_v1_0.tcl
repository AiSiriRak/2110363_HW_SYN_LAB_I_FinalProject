# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "HSYNC_END" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HSYNC_START" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_BP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_DISP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_FP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_PW" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H_S" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VSYNC_END" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VSYNC_START" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_BP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_DISP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_FP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_PW" -parent ${Page_0}
  ipgui::add_param $IPINST -name "V_S" -parent ${Page_0}


}

proc update_PARAM_VALUE.HSYNC_END { PARAM_VALUE.HSYNC_END } {
	# Procedure called to update HSYNC_END when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HSYNC_END { PARAM_VALUE.HSYNC_END } {
	# Procedure called to validate HSYNC_END
	return true
}

proc update_PARAM_VALUE.HSYNC_START { PARAM_VALUE.HSYNC_START } {
	# Procedure called to update HSYNC_START when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HSYNC_START { PARAM_VALUE.HSYNC_START } {
	# Procedure called to validate HSYNC_START
	return true
}

proc update_PARAM_VALUE.H_BP { PARAM_VALUE.H_BP } {
	# Procedure called to update H_BP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_BP { PARAM_VALUE.H_BP } {
	# Procedure called to validate H_BP
	return true
}

proc update_PARAM_VALUE.H_DISP { PARAM_VALUE.H_DISP } {
	# Procedure called to update H_DISP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_DISP { PARAM_VALUE.H_DISP } {
	# Procedure called to validate H_DISP
	return true
}

proc update_PARAM_VALUE.H_FP { PARAM_VALUE.H_FP } {
	# Procedure called to update H_FP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_FP { PARAM_VALUE.H_FP } {
	# Procedure called to validate H_FP
	return true
}

proc update_PARAM_VALUE.H_PW { PARAM_VALUE.H_PW } {
	# Procedure called to update H_PW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_PW { PARAM_VALUE.H_PW } {
	# Procedure called to validate H_PW
	return true
}

proc update_PARAM_VALUE.H_S { PARAM_VALUE.H_S } {
	# Procedure called to update H_S when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H_S { PARAM_VALUE.H_S } {
	# Procedure called to validate H_S
	return true
}

proc update_PARAM_VALUE.VSYNC_END { PARAM_VALUE.VSYNC_END } {
	# Procedure called to update VSYNC_END when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VSYNC_END { PARAM_VALUE.VSYNC_END } {
	# Procedure called to validate VSYNC_END
	return true
}

proc update_PARAM_VALUE.VSYNC_START { PARAM_VALUE.VSYNC_START } {
	# Procedure called to update VSYNC_START when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VSYNC_START { PARAM_VALUE.VSYNC_START } {
	# Procedure called to validate VSYNC_START
	return true
}

proc update_PARAM_VALUE.V_BP { PARAM_VALUE.V_BP } {
	# Procedure called to update V_BP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_BP { PARAM_VALUE.V_BP } {
	# Procedure called to validate V_BP
	return true
}

proc update_PARAM_VALUE.V_DISP { PARAM_VALUE.V_DISP } {
	# Procedure called to update V_DISP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_DISP { PARAM_VALUE.V_DISP } {
	# Procedure called to validate V_DISP
	return true
}

proc update_PARAM_VALUE.V_FP { PARAM_VALUE.V_FP } {
	# Procedure called to update V_FP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_FP { PARAM_VALUE.V_FP } {
	# Procedure called to validate V_FP
	return true
}

proc update_PARAM_VALUE.V_PW { PARAM_VALUE.V_PW } {
	# Procedure called to update V_PW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_PW { PARAM_VALUE.V_PW } {
	# Procedure called to validate V_PW
	return true
}

proc update_PARAM_VALUE.V_S { PARAM_VALUE.V_S } {
	# Procedure called to update V_S when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.V_S { PARAM_VALUE.V_S } {
	# Procedure called to validate V_S
	return true
}


proc update_MODELPARAM_VALUE.H_S { MODELPARAM_VALUE.H_S PARAM_VALUE.H_S } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_S}] ${MODELPARAM_VALUE.H_S}
}

proc update_MODELPARAM_VALUE.H_DISP { MODELPARAM_VALUE.H_DISP PARAM_VALUE.H_DISP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_DISP}] ${MODELPARAM_VALUE.H_DISP}
}

proc update_MODELPARAM_VALUE.H_PW { MODELPARAM_VALUE.H_PW PARAM_VALUE.H_PW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_PW}] ${MODELPARAM_VALUE.H_PW}
}

proc update_MODELPARAM_VALUE.H_FP { MODELPARAM_VALUE.H_FP PARAM_VALUE.H_FP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_FP}] ${MODELPARAM_VALUE.H_FP}
}

proc update_MODELPARAM_VALUE.H_BP { MODELPARAM_VALUE.H_BP PARAM_VALUE.H_BP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H_BP}] ${MODELPARAM_VALUE.H_BP}
}

proc update_MODELPARAM_VALUE.V_S { MODELPARAM_VALUE.V_S PARAM_VALUE.V_S } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_S}] ${MODELPARAM_VALUE.V_S}
}

proc update_MODELPARAM_VALUE.V_DISP { MODELPARAM_VALUE.V_DISP PARAM_VALUE.V_DISP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_DISP}] ${MODELPARAM_VALUE.V_DISP}
}

proc update_MODELPARAM_VALUE.V_PW { MODELPARAM_VALUE.V_PW PARAM_VALUE.V_PW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_PW}] ${MODELPARAM_VALUE.V_PW}
}

proc update_MODELPARAM_VALUE.V_FP { MODELPARAM_VALUE.V_FP PARAM_VALUE.V_FP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_FP}] ${MODELPARAM_VALUE.V_FP}
}

proc update_MODELPARAM_VALUE.V_BP { MODELPARAM_VALUE.V_BP PARAM_VALUE.V_BP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.V_BP}] ${MODELPARAM_VALUE.V_BP}
}

proc update_MODELPARAM_VALUE.HSYNC_START { MODELPARAM_VALUE.HSYNC_START PARAM_VALUE.HSYNC_START } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HSYNC_START}] ${MODELPARAM_VALUE.HSYNC_START}
}

proc update_MODELPARAM_VALUE.HSYNC_END { MODELPARAM_VALUE.HSYNC_END PARAM_VALUE.HSYNC_END } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HSYNC_END}] ${MODELPARAM_VALUE.HSYNC_END}
}

proc update_MODELPARAM_VALUE.VSYNC_START { MODELPARAM_VALUE.VSYNC_START PARAM_VALUE.VSYNC_START } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VSYNC_START}] ${MODELPARAM_VALUE.VSYNC_START}
}

proc update_MODELPARAM_VALUE.VSYNC_END { MODELPARAM_VALUE.VSYNC_END PARAM_VALUE.VSYNC_END } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VSYNC_END}] ${MODELPARAM_VALUE.VSYNC_END}
}

