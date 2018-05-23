#!/bin/bash

iverilog -o testbench.o testbench.v

vvp testbench.o

gtkwave p2s.vcd p2s.sav &

pause
#gtkwave senales.gtkw
