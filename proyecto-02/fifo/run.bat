iverilog -o out fifo_testbench.v
vvp out
gtkwave fifo_wave.vcd