make all:
	yosys -s yosys_cmos_synth.txt
	iverilog -o out testbench_byte_striping.v byte_striping_conduct.v yosys_cmos_synth.v tester_byte_striping.v
	vvp out

make ttyp:
	yosys -s yosys_cmos_synth_delay.txt
	iverilog -o out testbench_byte_striping.v byte_striping_conduct.v yosys_cmos_synth_delay.v tester_byte_striping.v cmos_cells_delay.v -Ttyp
	vvp out

make tmax:
	yosys -s yosys_cmos_synth_delay.txt
	iverilog -o out testbench_byte_striping.v byte_striping_conduct.v yosys_cmos_synth_delay.v tester_byte_striping.v -Tmax
	vvp out

make tmin:
	yosys -s yosys_cmos_synth_delay.txt
	iverilog -o out testbench_byte_striping.v byte_striping_conduct.v yosys_cmos_synth_delay.v tester_byte_striping.v -Tmin
	vvp out

make wave:
	gtkwave pruebaByteStripping.vcd
make clean:
	rm -rf out pruebaByteStripping.vcd yosys_cmos_synth_delay.v yosys_cmos_synth.v *.dot *.eps
