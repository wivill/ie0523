###########################################################
#Makefile básico para proyectos de Circuitos Digitales II.#
#Siéntanse en libertad de compartir :D			  #
#							  #
#Autor: Willy Villalobos				  #
###########################################################

SRC=files.txt
EXE=registros
YOS=yoscript.txt

all: yosysA yosys yosys_delay compile run wave

compile:
	iverilog -o ${EXE}.exe -c ${SRC} -Ttyp

typical: compile

max:
	iverilog -o ${EXE}.exe -c ${SRC} -Tmax

min:
	iverilog -o ${EXE}.exe -c ${SRC} -Tmin

run:
	vvp ${EXE}.exe > results.txt

yosysA:
	sed -i 's#always @(#//always @(#' registro_cond.v
	# sed -i 's#  $display#//  $display#' registro_cond.v
	sed -i 's#letest.m1#//letest.m1#' registro_cond.v
	sed -i 's#end // end counter#//end // end counter#' registro_cond.v
	yosys -s yoscriptA.txt
	# sed -i '1s;^;`include "cmos_cells.v";' synthA.v
	sed -i 's/_cond/_A/' synthA.v
	sed -i 's#//always @(#always @(#' registro_cond.v
	# sed -i 's#//  $display#  $display#' registro_cond.v
	sed -i 's#//letest.m1#letest.m1#' registro_cond.v
	sed -i 's#//end // end counter#end // end counter#' registro_cond.v
	sed -i 's#endmodule#\nparameter PwrC = 2;\nalways @(posedge Q or negedge Q) begin\n  letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;\nend // end counter\nendmodule#' synthA.v

yosys:
	sed -i 's#always @(#//always @(#' registro_cond.v
	# sed -i 's#  $display#//  $display#' registro_cond.v
	sed -i 's#letest.m1#//letest.m1#' registro_cond.v
	sed -i 's#end // end counter#//end // end counter#' registro_cond.v
	yosys -s ${YOS}
	sed -i '1s;^;`include "cmos_cells.v"\n;' synth.v
	sed -i 's/_cond/_yosys/' synth.v
	sed -i 's#//always @(#always @(#' registro_cond.v
	# sed -i 's#//  $display#  $display#' registro_cond.v
	sed -i 's#//letest.m1#letest.m1#' registro_cond.v
	sed -i 's#//end // end counter#end // end counter#' registro_cond.v
	sed -i 's#endmodule#\nparameter PwrC = 3;\nalways @(posedge Q or negedge Q) begin\n  letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;\nend // end counter\nendmodule#' synth.v

yosys_delay:
	sed -i 's#always @(#//always @(#' registro_cond.v
	# sed -i 's#  $display#//  $display#' registro_cond.v
	sed -i 's#letest.m1#//letest.m1#' registro_cond.v
	sed -i 's#end // end counter#//end // end counter#' registro_cond.v
	yosys -s yoscript_delay.txt
	sed -i '1s;^;`include "cmos_cells_delay.v"\n;' synth_delay.v
	sed -i 's/_cond/_yosys_delay/' synth_delay.v
	sed -i 's#//always @(#always @(#' registro_cond.v
	# sed -i 's#//  $display#  $display#' registro_cond.v
	sed -i 's#//letest.m1#letest.m1#' registro_cond.v
	sed -i 's#//end // end counter#end // end counter#' registro_cond.v
	sed -i 's#endmodule#\nparameter PwrC = 4;\nalways @(posedge Q or negedge Q) begin\n  letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;\nend // end counter\nendmodule#' synth_delay.v
	sed -i 's#BUF#BUF_delay#' synth_delay.v
	sed -i 's#NOT#NOT_delay#' synth_delay.v
	sed -i 's#NAND#NAND_delay#' synth_delay.v
	sed -i 's#NOR#NOR_delay#' synth_delay.v
	sed -i 's#DFF#DFF_delay#' synth_delay.v
	sed -i 's#DFFSR#DFFSR_delay#' synth_delay.v

wave:
#	gtkwave ${EXE}.vcd --script=signal_list.csh &
	gtkwave ${EXE}.vcd registro.sav &

clean:
	rm -rf ${EXE}.exe ${EXE}.vcd synth.v synthA.v synth_delay.v
