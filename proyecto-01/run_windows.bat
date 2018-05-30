#!/bin/bash

iverilog -o testbench.o testbench.v

vvp testbench.o

gtkwave  pcie.vcd pcie.sav

pause
