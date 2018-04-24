###########################################################
#Makefile básico para proyectos de Circuitos Digitales II.#
#Siéntanse en libertad de compartir :D			  #
#							  #
#Autor: Willy Villalobos				  #
###########################################################

SRC=files.txt
EXE=registros
YOS=yoscript.txt

all: yosys compile run wave

compile:
	iverilog -o ${EXE}.exe -c ${SRC} -Ttyp

typical: compile

max:
	iverilog -o ${EXE}.exe -c ${SRC} -Tmax

min:
	iverilog -o ${EXE}.exe -c ${SRC} -Tmin

run:
	vvp ${EXE}.exe

yosys:
	yosys -s ${YOS}

wave:
#	gtkwave ${EXE}.vcd --script=signal_list.csh &
	gtkwave ${EXE}.vcd registro.sav &

clean:
	rm -rf ${EXE}.exe ${EXE}.vcd synth.v
