synth:
	yosys -s yosys_synth.txt
	sed -i 's/fsm_cond/fsm_synth/g' fsm_synth.v
	
wave:
	iverilog -o out fsm_testbench.v
	vvp out
	gtkwave fsm_wave.vcd

clean:
	rm -rf out *.vcd *.dot *.eps
