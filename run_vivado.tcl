# vivado -nolog -nojournal -mode batch -source $(this file) -tclargs ...
# argv 0: location of xdc input file
# argv 1: location of edif input file
# argv 2: location of bit output file

# set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
# set_property SEVERITY {Warning} [get_drc_checks UCIO-1]
read_xdc [lindex $argv 0]
read_edif [lindex $argv 1]
link_design -part xc7z020clg400
# link_design -part only if PS7 used? -top needed?
place_design
route_design
write_bitstream -force [lindex $argv 2]
