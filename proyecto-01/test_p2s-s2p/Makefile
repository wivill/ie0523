###########################################################
#Makefile básico para proyectos de Circuitos Digitales II.#
#Siéntanse en libertad de compartir :D			  #
#							  #
#Autor: Willy Villalobos				  #
###########################################################

SRC=files.txt
EXE=p2s_s2p
YOS=p2s_s2p_synth.yos
YOSD=p2s_s2p_synth_delay.yos

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
	sed -i '1s;^;`include "cmos_cells.v"\n;' p2s_s2p_synth.v
	sed -i 's/_cond/_synth/' p2s_s2p_synth.v

synth_delay:
	yosys -s ${YOSD}
	sed -i '1s;^;`include "cmos_cells_delay.v"\n;' p2s_s2p_synth_delay.v
	sed -i 's/_cond/_synth_delay/' p2s_s2p_synth_delay.v
	sed -i 's#BUF#BUF_delay#' p2s_s2p_synth_delay.v
	sed -i 's#NOT#NOT_delay#' p2s_s2p_synth_delay.v
	sed -i 's#NAND#NAND_delay#' p2s_s2p_synth_delay.v
	sed -i 's#NOR#NOR_delay#' p2s_s2p_synth_delay.v
	sed -i 's#DFF#DFF_delay#' p2s_s2p_synth_delay.v
	sed -i 's#DFFSR#DFFSR_delay#' p2s_s2p_synth_delay.v
	sed -i 's/<=/<= #15 /' p2s_s2p_synth_delay.v

wave:
	gtkwave ${EXE}.vcd ${EXE}.sav &

clean:
	rm -rf ${EXE}.exe ${EXE}.vcd *.ps *.eps *.dot
