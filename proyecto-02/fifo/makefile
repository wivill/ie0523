synth:
	yosys -s yosys_synth.txt
	sed -i 's/fifo_cond/fifo_synth/g' fifo_synth.v

cmos:
	yosys -s yosys_cmos.txt
	sed -i 's/fifo_cond/fifo_synth/g' fifo_synth.v

wave:
	iverilog -o out fifo_testbench.v
	vvp out
	gtkwave fifo_wave.vcd

clean:
	rm -rf out *.vcd *.dot *.eps
