###########################################################
#Makefile básico para proyectos de Circuitos Digitales II.#
#Siéntanse en libertad de compartir :D			  #
#							  #
#Autor: Willy Villalobos				  #
###########################################################

SRC=files.txt
EXE=multiplexer
YOS=multiplexer_synth.yos
YOSD=multiplexer_synth_delay.yos

all: synth synth_delay compile run wave

compile:
	iverilog -o ${EXE}.exe -c ${SRC} -Ttyp

typical: compile

max:
	iverilog -o ${EXE}.exe -c ${SRC} -Tmax

min:
	iverilog -o ${EXE}.exe -c ${SRC} -Tmin

run:
	vvp ${EXE}.exe > results.txt

synth:
	yosys -s ${YOS}
	sed -i '1s;^;`include "cmos_cells.v"\n;' multiplexer_synth.v
	sed -i 's/_cond/_synth/' multiplexer_synth.v

synth_delay:
	yosys -s ${YOSD}
	sed -i '1s;^;`include "cmos_cells_delay.v"\n;' multiplexer_synth_delay.v
	sed -i 's/_cond/_synth_delay/' multiplexer_synth_delay.v
	sed -i 's#BUF#BUF_delay#' multiplexer_synth_delay.v
	sed -i 's#NOT#NOT_delay#' multiplexer_synth_delay.v
	sed -i 's#NAND#NAND_delay#' multiplexer_synth_delay.v
	sed -i 's#NOR#NOR_delay#' multiplexer_synth_delay.v
	sed -i 's#DFF#DFF_delay#' multiplexer_synth_delay.v
	sed -i 's#DFFSR#DFFSR_delay#' multiplexer_synth_delay.v
	sed -i 's/<=/<= #15 /' multiplexer_synth_delay.v

wave:
	gtkwave ${EXE}.vcd ${EXE}.sav &

clean:
	rm -rf ${EXE}.exe ${EXE}.vcd *.ps *.eps *.dot
