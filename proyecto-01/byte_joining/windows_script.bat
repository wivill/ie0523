#!/bin/bash

iverilog -o Testbench.o Testbench.v

vvp Testbench.o

gtkwave bytejoining.vcd bytejoining.gtkw

pause
#gtkwave senales.gtkw
