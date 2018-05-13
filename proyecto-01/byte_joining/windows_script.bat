#!/bin/bash

iverilog -o Testbench.o Testbench.v

vvp Testbench.o

gtkwave bytejoining.vcd 

pause
#gtkwave senales.gtkw
