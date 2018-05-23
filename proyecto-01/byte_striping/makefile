yosys:
	yosys -s yosys_synth.txt
	iverilog -o out testbench_byte_striping.v byte_striping_conduct.v yosys_synth.v tester_byte_striping.v
	vvp out


cmos:
	yosys -s yosys_cmos_synth.txt
	iverilog -o out testbench_byte_striping.v byte_striping_conduct.v yosys_cmos_synth.v tester_byte_striping.v cmos_cells.v
	vvp out

ttyp:
	yosys -s yosys_cmos_synth_delay.txt
	iverilog -o out testbench_byte_striping.v tester_byte_striping.v byte_striping_conduct.v yosys_cmos_synth_delay.v cmos_cells_delay.v -Ttyp
	vvp out

tmax:
	yosys -s yosys_cmos_synth_delay.txt
	iverilog -o out testbench_byte_striping.v tester_byte_striping.v byte_striping_conduct.v yosys_cmos_synth_delay.v cmos_cells_delay.v -Ttyp
	vvp out

tmin:
	yosys -s yosys_cmos_synth_delay.txt
	iverilog -o out testbench_byte_striping.v tester_byte_striping.v byte_striping_conduct.v yosys_cmos_synth_delay.v cmos_cells_delay.v -Ttyp
	vvp out

wave:
	gtkwave pruebaByteStripping.vcd

clean:
	rm -rf out pruebaByteStripping.vcd yosys_cmos_synth_delay.v yosys_cmos_synth.v *.dot *.eps yosys_synth.v yosys_cmos_synth_delay
