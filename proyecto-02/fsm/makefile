synth:
	yosys -s yosys_synth.txt
	sed -i 's/fsm_cond/fsm_synth/g' fsm_synth.v

cmos:
	yosys -s yosys_cmos.txt
	sed -i 's/fsm_cond/fsm_synth/g' fsm_synth.v

wave:
	iverilog -o out fsm_testbench.v
	vvp out
	gtkwave fsm_wave.vcd fsm.sav &

clean:
	rm -rf out *.vcd *.dot *.eps
