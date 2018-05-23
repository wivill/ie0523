###########################################################
#Makefile básico para proyectos de Circuitos Digitales II.#
#Siéntanse en libertad de compartir :D			  #
#							  #
#Autor: Willy Villalobos				  #
###########################################################

SRC=files.txt
EXE=s2p
FFDYOS=ffd_s2p.yos
FFDYOSD=ffd_s2p_delay.yos
S2PYOS=s2p_reg.yos
S2PYOSD=s2p_reg_delay.yos
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
	yosys -s ${FFDYOS}
	sed -i 's/_cond/_synth/' ffd_s2p_synth.v
	yosys -s ${CLKYOS}
	sed -i 's/_cond/_synth/' freq_div_synth.v
	yosys -s ${S2PYOS}
	sed -i 's/_cond/_synth/' s2p_reg_synth.v

synth_delay:
	yosys -s ${FFDYOSD}
	sed -i 's/_cond/_synth_delay/' ffd_s2p_synth_delay.v
	yosys -s ${CLKYOSD}
	sed -i 's/_cond/_synth_delay/' freq_div_synth_delay.v
	yosys -s ${S2PYOSD}
	sed -i 's/_cond/_synth_delay/' s2p_reg_synth_delay.v
	#
	sed -i 's#BUF#BUF_delay#' ffd_s2p_synth_delay.v
	sed -i 's#NOT#NOT_delay#' ffd_s2p_synth_delay.v
	sed -i 's#NAND#NAND_delay#' ffd_s2p_synth_delay.v
	sed -i 's#NOR#NOR_delay#' ffd_s2p_synth_delay.v
	sed -i 's#DFF#DFF_delay#' ffd_s2p_synth_delay.v
	sed -i 's#DFFSR#DFFSR_delay#' ffd_s2p_synth_delay.v
	sed -i 's/<=/<= #15 /' ffd_s2p_synth_delay.v
	#
	sed -i 's#BUF#BUF_delay#' freq_div_synth_delay.v
	sed -i 's#NOT#NOT_delay#' freq_div_synth_delay.v
	sed -i 's#NAND#NAND_delay#' freq_div_synth_delay.v
	sed -i 's#NOR#NOR_delay#' freq_div_synth_delay.v
	sed -i 's#DFF#DFF_delay#' freq_div_synth_delay.v
	sed -i 's#DFFSR#DFFSR_delay#' freq_div_synth_delay.v
	sed -i 's/<=/<= #15 /' freq_div_synth_delay.v
	#
	sed -i 's#BUF#BUF_delay#' s2p_reg_synth_delay.v
	sed -i 's#NOT#NOT_delay#' s2p_reg_synth_delay.v
	sed -i 's#NAND#NAND_delay#' s2p_reg_synth_delay.v
	sed -i 's#NOR#NOR_delay#' s2p_reg_synth_delay.v
	sed -i 's#DFF#DFF_delay#' s2p_reg_synth_delay.v
	sed -i 's#DFFSR#DFFSR_delay#' s2p_reg_synth_delay.v
	sed -i 's/<=/<= #15 /' s2p_reg_synth_delay.v

wave:
	gtkwave ${EXE}.vcd s2p.sav &

clean:
	rm -rf ${EXE}.exe ${EXE}.vcd ffd_s2p_synth.v ffd_s2p_synth_delay.v s2p_reg_synth.v s2p_reg_synth_delay.v freq_div_synth.v freq_div_synth_delay.v
	rm -rf *.eps *.dot
