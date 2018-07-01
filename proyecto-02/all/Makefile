###########################################################
#Makefile básico para proyectos de Circuitos Digitales II.#
#Siéntanse en libertad de compartir :D			  #
#							  #
#Autor: Willy Villalobos				  #
###########################################################

SRC=files.txt
EXE=wrr
YOS0=wrr_synth.yos
YOS1=vc_table_synth.yos
YOS2=mux4_1_synth.yos
YOS3=fifo_synth.yos
YOS4=fsm_synth.yos

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
	yosys -s ${YOS0}
	sed -i 's/_cond/_synth/' wrr_synth.v
	yosys -s ${YOS1}
	sed -i 's/_cond/_synth/' vc_table_synth.v
	yosys -s ${YOS2}
	sed -i 's/_cond/_synth/' mux4_1_synth.v
	yosys -s ${YOS3}
	sed -i 's/_cond/_synth/' fifo_synth.v
	yosys -s ${YOS4}
	sed -i 's/_cond/_synth/' fsm_synth.v
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
	gtkwave ${EXE}.vcd qos.sav &

clean:
	rm -rf ${EXE}.exe ${EXE}.vcd *.eps *.dot
