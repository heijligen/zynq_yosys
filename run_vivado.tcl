# vivado -nolog -nojournal -mode batch -source $(this file) -tclargs ...
# argv 0: location of xdc input file
# argv 1: location of edif input file
# argv 2: location of bit output file

if { $argc != 3} {
	exit
}

read_xdc $argv 0
read_edif  $argv 1
link_design -part xc7z020clg400
# link_design -part only if PS7 used? -top needed?
place_design
route_design
write_bitstream -force  $argv 2
