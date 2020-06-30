name = demo
board = pynq

all : build/$(name).bit.bin

#$(name)/work-obj08.cf: $(shell ls $(name)/*.vhd)
#	ghdl -a --workdir=$(name)/ --std=08 $@

#build/$(name).edif: $(shell ls $(name)/*vhd)
#	@yosys -m ghdl -p "read_verilog +/xilinx/cells_xtra.v; ghdl $^ -e top; synth_xilinx -top top -edif $@"

build/$(name).edif: #$(name)/*
	@yosys -p "read_verilog +/xilinx/cells_xtra.v $(name)/*.v; synth_xilinx -edif build/$(name).edif -top $(name)"

build/$(name).bit: build/$(name).edif
	@./vivado -nolog -nojournal -mode batch -source run_vivado.tcl -tclargs $(board).xdc $^ $@

build/$(name).bit.bin: build/$(name).bit
	@bit2bitbin $^ $@

clean:
	@rm -rf build/$(name).*
