###########################################################
#Makefile básico para proyectos de Circuitos Digitales II.#
#Siéntanse en libertad de compartir :D			  #
#							  #
#Autor: Willy Villalobos				  #
###########################################################

SRC=files.txt
EXE=wrr
WRRYOS=wrr_synth.yos
VCTYOS=vc_table_synth.yos
MUXYOS=mux4_1_synth.yos

all: synth compile run wave

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
	sed -i 's/_cond/_synth/' mux4_1_synth.v
	yosys -s ${WRRYOS}
	sed -i 's/_cond/_synth/' wrr_synth.v
	yosys -s ${VCTYOS}
	sed -i 's/_cond/_synth/' vc_table_synth.v

# synth_delay:
# 	yosys -s ${FFDYOSD}
# 	sed -i 's/_cond/_synth_delay/' ffd_s2p_synth_delay.v
# 	yosys -s ${CLKYOSD}
# 	sed -i 's/_cond/_synth_delay/' freq_div_synth_delay.v
# 	yosys -s ${S2PYOSD}
# 	sed -i 's/_cond/_synth_delay/' s2p_reg_synth_delay.v
# 	#
# 	sed -i 's#BUF#BUF_delay#' ffd_s2p_synth_delay.v
# 	sed -i 's#NOT#NOT_delay#' ffd_s2p_synth_delay.v
# 	sed -i 's#NAND#NAND_delay#' ffd_s2p_synth_delay.v
# 	sed -i 's#NOR#NOR_delay#' ffd_s2p_synth_delay.v
# 	sed -i 's#DFF#DFF_delay#' ffd_s2p_synth_delay.v
# 	sed -i 's#DFFSR#DFFSR_delay#' ffd_s2p_synth_delay.v
# 	sed -i 's/<=/<= #15 /' ffd_s2p_synth_delay.v
# 	#
# 	sed -i 's#BUF#BUF_delay#' freq_div_synth_delay.v
# 	sed -i 's#NOT#NOT_delay#' freq_div_synth_delay.v
# 	sed -i 's#NAND#NAND_delay#' freq_div_synth_delay.v
# 	sed -i 's#NOR#NOR_delay#' freq_div_synth_delay.v
# 	sed -i 's#DFF#DFF_delay#' freq_div_synth_delay.v
# 	sed -i 's#DFFSR#DFFSR_delay#' freq_div_synth_delay.v
# 	sed -i 's/<=/<= #15 /' freq_div_synth_delay.v
# 	#
# 	sed -i 's#BUF#BUF_delay#' s2p_reg_synth_delay.v
# 	sed -i 's#NOT#NOT_delay#' s2p_reg_synth_delay.v
# 	sed -i 's#NAND#NAND_delay#' s2p_reg_synth_delay.v
# 	sed -i 's#NOR#NOR_delay#' s2p_reg_synth_delay.v
# 	sed -i 's#DFF#DFF_delay#' s2p_reg_synth_delay.v
# 	sed -i 's#DFFSR#DFFSR_delay#' s2p_reg_synth_delay.v
# 	sed -i 's/<=/<= #15 /' s2p_reg_synth_delay.v

wave:
	gtkwave ${EXE}.vcd wrr.sav &

clean:
	rm -rf ${EXE}.exe ${EXE}.vcd *.eps *.dot
