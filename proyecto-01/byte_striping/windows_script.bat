#!/bin/bash

iverilog -o testbench_byte_striping.o testbench_byte_striping.v

vvp testbench_byte_striping.o

gtkwave pruebaByteStripping.vcd

pause
#gtkwave senales.gtkw
