#yosys_cmd   = yosys -p 'read_verilog +/xilinx/cells_xtra.v $(1)/*.v; synth_xilinx -edif $(1).edif -top $(1)'
yosys_cmd   = yosys -p 'read_verilog $(1)/*.v; synth_xilinx -edif $(1).edif -top $(1)'
vivado_cmd  = vivado -nolog -nojournal -mode batch -source $(1).tcl
vivado_tcl  = echo -e "read_xdc pynq.xdc\n\
	     read_edif $(1).edif\n\
	     link_design -part xc7z020clg400 -top $(1)\n\
	     place_design\n\
	     route_design\n\
	     write_bitstream -force $(1).bit" > $(1).tcl
bootgen_cmd = bootgen -arch zynq -image $(1).bif -process_bitstream bin
bootgen_bif = echo -e  "iamge:{ $(1).bit }" > $(1).bif
				


all: blink
blink: blink.bin
axi: axi.bit

blink.tcl:
	@$(call vivado_tcl, blink)

blink.edif:
	@$(call yosys_cmd, blink)

blink.bit: blink.edif blink.tcl
	 @$(call vivado_cmd, blink)

blink.bif:
	@$(call bootgen_bif, blink)

blink.bit.bin: blink.bif blink.bit
	@$(call bootgen_cmd, blink)

blink-clean:
	@rm -rf blink.tcl blink.edif blink.bit blink.bif blink.bit.bin


axi.tcl:
	@$(call vivado_tcl, axi)

axi.edif:
	@$(call yosys_cmd, axi)

axi.bit: axi.edif axi.tcl
	@$(call vivado_cmd, axi)

axi-clean:
	@rm -rf axi.tcl axi.edif axi.bit

clean: blink-clean axi-clean
