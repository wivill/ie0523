synth:
	yosys -s yosys_synth.txt
	sed -i 's/memory_cond/memory_synth/g' memory_synth.v

cmos:
	yosys -s yosys_cmos.txt
	sed -i 's/memory_cond/memory_synth/g' memory_synth.v

wave:
	iverilog -o out memory_testbench.v
	vvp out
	gtkwave memory_wave.vcd

clean:
	rm -rf out *.vcd *.dot *.eps
