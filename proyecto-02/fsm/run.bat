iverilog -o out fsm_testbench.v
vvp out
gtkwave fsm_wave.vcd
