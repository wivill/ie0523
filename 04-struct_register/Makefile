###########################################################
#Makefile básico para proyectos de Circuitos Digitales II.#
#Siéntanse en libertad de compartir :D			  #
#							  #
#Autor: Willy Villalobos				  #
###########################################################

SRC=files.txt
EXE=registros
YOS=yoscript.txt

all:
	iverilog -o ${EXE}.exe -c ${SRC} -Ttyp

run:
	vvp ${EXE}.exe

yosys:
	yosys -s ${YOS}

wave:
#	gtkwave ${EXE}.vcd --script=signal_list.csh &
	gtkwave ${EXE}.vcd registro.sav &

clean:
	rm -rf ${EXE}.exe ${EXE}.vcd synth.v
