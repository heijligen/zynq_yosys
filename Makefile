name = blink
board = pynq

all : build/$(name).bit.bin

build/$(name).edif: $(name)/*
	@yosys -p "read_verilog +/xilinx/cells_xtra.v $(name)/*.v; synth_xilinx -edif build/$(name).edif -top $(name)"

build/$(name).bin: build/$(name).edif
	@vivado -nolog -nojournal -mode batch -source run_vivado-tcl -tclargs $(board).xdc build/$(name).edif build/$(name).bit

build/$(name).bit.bin: build/$(name).bit
	@bit2bitbin build/$(name).bit build/$(name).bit.bin

clean:
	@rm -rf build/$(name).*
