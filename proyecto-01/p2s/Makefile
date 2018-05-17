###########################################################
#Makefile básico para proyectos de Circuitos Digitales II.#
#Siéntanse en libertad de compartir :D			  #
#							  #
#Autor: Willy Villalobos				  #
###########################################################

SRC=files.txt
EXE=p2s
MUXYOS=mux_p2s.yos
FFDYOS=ffd_p2s.yos
MUXYOSD=mux_p2s_delay.yos
FFDYOSD=ffd_p2s_delay.yos
CLKYOS=freq_div.yos
CLKYOSD=freq_div_delay.yos

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
	yosys -s ${MUXYOS}
	sed -i '1s;^;`include "cmos_cells.v"\n;' mux_p2s_synth.v
	sed -i 's/_cond/_synth/' mux_p2s_synth.v
	yosys -s ${FFDYOS}
	sed -i '1s;^;`include "cmos_cells.v"\n;' ffd_p2s_synth.v
	sed -i 's/_cond/_synth/' ffd_p2s_synth.v
	yosys -s ${CLKYOS}
	sed -i '1s;^;`include "cmos_cells.v"\n;' freq_div_synth.v
	sed -i 's/_cond/_synth/' freq_div_synth.v

synth_delay:
	yosys -s ${MUXYOSD}
	sed -i '1s;^;`include "cmos_cells_delay.v"\n;' mux_p2s_synth_delay.v
	sed -i 's/_cond/_synth_delay/' mux_p2s_synth_delay.v
	yosys -s ${FFDYOSD}
	sed -i '1s;^;`include "cmos_cells_delay.v"\n;' ffd_p2s_synth_delay.v
	sed -i 's/_cond/_synth_delay/' ffd_p2s_synth_delay.v
	yosys -s ${CLKYOSD}
	sed -i '1s;^;`include "cmos_cells_delay.v"\n;' freq_div_synth_delay.v
	sed -i 's/_cond/_synth_delay/' freq_div_synth_delay.v
	sed -i 's#BUF#BUF_delay#' mux_p2s_synth_delay.v
	sed -i 's#NOT#NOT_delay#' mux_p2s_synth_delay.v
	sed -i 's#NAND#NAND_delay#' mux_p2s_synth_delay.v
	sed -i 's#NOR#NOR_delay#' mux_p2s_synth_delay.v
	sed -i 's#DFF#DFF_delay#' mux_p2s_synth_delay.v
	sed -i 's#DFFSR#DFFSR_delay#' mux_p2s_synth_delay.v
	sed -i 's/<=/<= #15 /' mux_p2s_synth_delay.v
	#
	sed -i 's#BUF#BUF_delay#' ffd_p2s_synth_delay.v
	sed -i 's#NOT#NOT_delay#' ffd_p2s_synth_delay.v
	sed -i 's#NAND#NAND_delay#' ffd_p2s_synth_delay.v
	sed -i 's#NOR#NOR_delay#' ffd_p2s_synth_delay.v
	sed -i 's#DFF#DFF_delay#' ffd_p2s_synth_delay.v
	sed -i 's#DFFSR#DFFSR_delay#' ffd_p2s_synth_delay.v
	sed -i 's/<=/<= #15 /' ffd_p2s_synth_delay.v
	#
	sed -i 's#BUF#BUF_delay#' freq_div_synth_delay.v
	sed -i 's#NOT#NOT_delay#' freq_div_synth_delay.v
	sed -i 's#NAND#NAND_delay#' freq_div_synth_delay.v
	sed -i 's#NOR#NOR_delay#' freq_div_synth_delay.v
	sed -i 's#DFF#DFF_delay#' freq_div_synth_delay.v
	sed -i 's#DFFSR#DFFSR_delay#' freq_div_synth_delay.v
	sed -i 's/<=/<= #15 /' freq_div_synth_delay.v

wave:
#	gtkwave ${EXE}.vcd --script=signal_list.csh &
	gtkwave ${EXE}.vcd p2s.sav &

clean:
	rm -rf ${EXE}.exe ${EXE}.vcd ffd_p2s_synth.v ffd_p2s_synth_delay.v mux_p2s_synth.v mux_p2s_synth_delay.v freq_div_synth.v freq_div_synth_delay.v
	rm -rf *.eps *.dot
