###########################################################
#Makefile básico para proyectos de Circuitos Digitales II.#
#Siéntanse en libertad de compartir :D			  #
#							  #
#Autor: Willy Villalobos				  #
###########################################################

SRC=files.txt
EXE=fsm
SYNTH=synth.yos
SYNTHD=synth_delay.yos

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
	# sed -i 's#always @(#//always @(#' ascensor_cond.v
	# # sed -i 's#  $display#//  $display#' registro_cond.v
	# sed -i 's#letest.m1#//letest.m1#' ascensor_cond.v
	# sed -i 's#end // end counter#//end // end counter#' ascensor_cond.v
	yosys -s ${SYNTH}
	sed -i '1s;^;`include "cmos_cells.v"\n;' synth.v
	sed -i 's/_cond/_synth/' synth.v
	# sed -i 's#\$_##' synth.v
	# sed -i 's#\$_##' synth.v
	# sed -i 's#//always @(#always @(#' ascensor_cond.v
	# sed -i 's#//  $display#  $display#' registro_cond.v
	# sed -i 's#//letest.m1#letest.m1#' ascensor_cond.v
	# sed -i 's#//end // end counter#end // end counter#' ascensor_cond.v
	# sed -i 's#endmodule#\nparameter PwrC = 3;\nalways @(posedge Q or negedge Q) begin\n  letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;\nend // end counter\nendmodule#' synth.v

synth_delay:
	# sed -i 's#always @(#//always @(#' ascensor_cond.v
	# # sed -i 's#  $display#//  $display#' registro_cond.v
	# sed -i 's#letest.m1#//letest.m1#' ascensor_cond.v
	# sed -i 's#end // end counter#//end // end counter#' ascensor_cond.v
	yosys -s ${SYNTHD}
	sed -i '1s;^;`include "cmos_cells_delay.v"\n;' synth_delay.v
	sed -i 's/_cond/_synth_delay/' synth_delay.v
	# sed -i 's#//always @(#always @(#' ascensor_cond.v
	# sed -i 's#//  $display#  $display#' registro_cond.v
	# sed -i 's#//letest.m1#letest.m1#' ascensor_cond.v
	# sed -i 's#//end // end counter#end // end counter#' ascensor_cond.v
	# sed -i 's#endmodule#\nparameter PwrC = 4;\nalways @(posedge Q or negedge Q) begin\n  letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;\nend // end counter\nendmodule#' synth_delay.v
	sed -i 's#BUF#BUF_delay#' synth_delay.v
	sed -i 's#NOT#NOT_delay#' synth_delay.v
	sed -i 's#NAND#NAND_delay#' synth_delay.v
	sed -i 's#NOR#NOR_delay#' synth_delay.v
	sed -i 's#DFF#DFF_delay#' synth_delay.v
	sed -i 's#DFFSR#DFFSR_delay#' synth_delay.v
	sed -i 's#dlatch#dlatch_delay#' synth_delay.v
	# sed -i 's#\$_##' synth_delay.v
	# sed -i 's#\$_##' synth_delay.v
	sed -i 's#DLATCH_P_#DLATCH_P_delay#' synth_delay.v
	# sed -i 's#DLATCH_N_#DLATCH_N_delay#' synth_delay.v
	sed -i 's/<=/<= #15 /' synth_delay.v

wave:
#	gtkwave ${EXE}.vcd --script=signal_list.csh &
	gtkwave ${EXE}.vcd fsm.sav &

clean:
	rm -rf ${EXE}.exe ${EXE}.vcd synth.v synth_delay.v
	rm -rf synth.eps synth_delay.eps *.dot
