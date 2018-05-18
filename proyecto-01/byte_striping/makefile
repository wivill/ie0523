make all:
	iverilog -o out testbench_byte_striping.v byte_striping_conduct.v tester_byte_striping.v
	vvp out
	gtkwave pruebaByteStripping.vcd
make clean:
	rm -rf out pruebaByteStripping.vcd
