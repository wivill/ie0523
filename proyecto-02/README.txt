En este directorio se encuentra el código verilog para sintetizar
y probar la capa física del PCIE. Para poder verificar
su funcionamiento, basta con utilizar el Makefile proporcionado.

Las opciones disponibles son las siguientes:

make/make all	compila, ejecuta, sintetiza y visualiza el sistema.

make compile	compila y genera un ejecutable usando los .v en
		el archivo de texto files.txt

make run	ejecuta el binario generado por make, así como
		el .vcd para su posterior visualización con
		gtkwave. Genera un archivo results.txt con los mensajes de ejecución

make wave	abre el .vcd para su visualización.

make synth	sintetiza el .v usando la receta provista por
		el archivo synth.yos

make synth_delay	sintetiza el .v usando la receta provista por
			el archivo synth_delay.yos

make clean	limpia el directorio de ejecutables y otros
		residuos.
