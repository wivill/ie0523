`timescale 	1ns				/ 100ps
// escala	unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
// Pueden omitirse y llamarse desde el testbench
// `include "verificador.v"
`include "registro4bit_conductual.v"
`include "tester.v"
// `include "memoria.v"


module BancoPruebas; // Testbench

	wire [3:0] cuatrobit_desc_cond1;
	wire [3:0] cuatrobit_desc_cond2;
	wire [3:0] cuatrobit_desc_cond3;
	wire [3:0] cuatrobit_desc_cond4;
	wire [3:0] cuatrobit_desc_estructural1;
	wire [3:0] cuatrobit_desc_estructural2;
	wire [3:0] cuatrobit_desc_estructural3;
	wire [3:0] cuatrobit_desc_estructural4;
	wire [3:0] D;
	wire [3:0] Dd;
	wire [1:0] MODO;
	wire [1:0] MODOc;

	wire S_IN, DIR, ENBflops, Clk, ENB, S_OUTc1, S_OUTe1, S_OUTc2, S_OUTe2, S_OUTc3, S_OUTe3, S_OUTc4, S_OUTe4;

	wire verificador1Q;
	wire verificador1S_OUT;

	wire verificador2Q;
	wire verificador2S_OUT;

	wire verificador3Q;
	wire verificador3S_OUT;

	wire verificador4Q;
	wire verificador4S_OUT;

	// Nombres de los modulos mas las equivalencias de sus puertos globales

	registro4bit_desc_conductual	b4r_condprueba1(	.Q		(cuatrobit_desc_cond1), // se esta instanciando un modulo de tipo registro4bit_conductual que se va a llamar b4r_conductual
					.D		(D),
					.MODO		(MODO),
					.S_OUT		(S_OUTc1),
					.S_IN		(S_IN),
					.DIR		(DIR),
					.ENB		(ENB),
					.Clk		(Clk)
	);
	registro4bit_desc_conductual	b4r_condprueba2(	.Q		(cuatrobit_desc_cond2), // se esta instanciando un modulo de tipo registro4bit_conductual que se va a llamar b4r_conductual
					.D		(Dd),
					.MODO		(MODOc),
					.S_OUT		(S_OUTc2),
					.S_IN		(S_IN),
					.DIR		(DIR),
					.ENB		(ENB),
					.Clk		(Clk)
	);

	registro4bit_desc_conductual	b4r_condprueba3(	.Q		(cuatrobit_desc_cond3), // se esta instanciando un modulo de tipo registro4bit_conductual que se va a llamar b4r_conductual
					.D		(D),
					.MODO		(MODO),
					.S_OUT		(S_OUTc3),
					.S_IN		(S_IN),
					.DIR		(DIRd),
					.ENB		(ENB),
					.Clk		(Clk)
	);

	registro4bit_desc_conductual	b4r_condprueba4(	.Q		(cuatrobit_desc_cond4), // se esta instanciando un modulo de tipo registro4bit_conductual que se va a llamar b4r_conductual
					.D		(Dd),
					.MODO		(MODOc),
					.S_OUT		(S_OUTc4),
					.S_IN		(S_IN),
					.DIR		(DIRd),
					.ENB		(ENB),
					.Clk		(Clk)
	);



	registro4bit_estructural	#(0) b4r_estr1(	.Q		(cuatrobit_desc_estructural1), // se esta instanciando un modulo de tipo registro4bit_conductual que se va a llamar b4r_conductual
					.D		(D),
					.MODO		(MODO),
					.S_OUT		(S_OUTe1),
					.S_IN		(S_IN),
					.DIR		(DIR),
					.ENBflops		(ENBflops),
					.ENB (ENB),
					.Clk		(Clk)
	);

	registro4bit_estructural	#(1) b4r_estr2(	.Q		(cuatrobit_desc_estructural2), // se esta instanciando un modulo de tipo registro4bit_conductual que se va a llamar b4r_conductual
					.D		(Dd),
					.MODO		(MODOc),
					.S_OUT		(S_OUTe2),
					.S_IN		(S_IN),
					.DIR		(DIR),
					.ENBflops		(ENBflops),
					.ENB (ENB),
					.Clk		(Clk)
	);

	registro4bit_estructural	#(2) b4r_estr3(	.Q		(cuatrobit_desc_estructural3), // se esta instanciando un modulo de tipo registro4bit_conductual que se va a llamar b4r_conductual
					.D		(D),
					.MODO		(MODO),
					.S_OUT		(S_OUTe3),
					.S_IN		(S_IN),
					.DIR		(DIRd),
					.ENBflops		(ENBflops),
					.ENB (ENB),
					.Clk		(Clk)
	);

	registro4bit_estructural	#(3) b4r_estr4(	.Q		(cuatrobit_desc_estructural4), // se esta instanciando un modulo de tipo registro4bit_conductual que se va a llamar b4r_conductual
					.D		(Dd),
					.MODO		(MODOc),
					.S_OUT		(S_OUTe4),
					.S_IN		(S_IN),
					.DIR		(DIRd),
					.ENBflops		(ENBflops),
					.ENB (ENB),
					.Clk		(Clk)
	);

	verificador verificadorp1(
		.Qcin (cuatrobit_desc_cond1),
	 	.Qein	(cuatrobit_desc_estructural1),
	 	.Clk (Clk),
	 	.verificarQ (verificador1Q),
	 	.verificarS_OUT (verificador1S_OUT),
		.S_OUTcin (S_OUTc1),
		.S_OUTein (S_OUTe1)
	 );

	 verificador verificadorp2(
 		.Qcin (cuatrobit_desc_cond2),
 	 	.Qein	(cuatrobit_desc_estructural2),
 	 	.Clk (Clk),
 	 	.verificarQ (verificador2Q),
 	 	.verificarS_OUT (verificador2S_OUT),
 		.S_OUTcin (S_OUTc2),
 		.S_OUTein (S_OUTe2)
 	 );

	 verificador verificadorp3(
			.Qcin (cuatrobit_desc_cond3),
			.Qein	(cuatrobit_desc_estructural3),
			.Clk (Clk),
			.verificarQ (verificador3Q),
			.verificarS_OUT (verificador3S_OUT),
			.S_OUTcin (S_OUTc3),
			.S_OUTein (S_OUTe3)
		 );
	verificador verificadorp4(
		 .Qcin (cuatrobit_desc_cond4),
		 .Qein	(cuatrobit_desc_estructural4),
		 .Clk (Clk),
		 .verificarQ (verificador4Q),
		 .verificarS_OUT (verificador4S_OUT),
		 .S_OUTcin (S_OUTc4),
		 .S_OUTein (S_OUTe4)
		);








	// Probador: generador de se�ales y monitor
	probador probador_(
						.bit4_desc_cond1			(cuatrobit_desc_cond1),
						.bit4_desc_estruc1		(cuatrobit_desc_estructural1),
		 				.bit4_desc_cond2			(cuatrobit_desc_cond2),
						.bit4_desc_estruc2		(cuatrobit_desc_estructural2),
		 				.bit4_desc_cond3			(cuatrobit_desc_cond3),
						.bit4_desc_estruc3		(cuatrobit_desc_estructural3),
		 				.bit4_desc_cond4			(cuatrobit_desc_cond4),
						.bit4_desc_estruc4		(cuatrobit_desc_estructural4),
						.S_OUTc1	(S_OUTc1),	// S_OUT de tipo reg, almacena el valor que se elimina al hacer rotaciones a la derecha o a la izquierda, cuando no se elimina un valor se toma como 0
	 					.S_OUTe1	(S_OUTe1),//output reg ENB,	// ENB wire implicito, entrada que habilita que se puedan dar transiciones de estado en el registro
	 					.S_OUTc2	(S_OUTc2),	// S_OUT de tipo reg, almacena el valor que se elimina al hacer rotaciones a la derecha o a la izquierda, cuando no se elimina un valor se toma como 0
		 				.S_OUTe2	(S_OUTe2),
						.S_OUTc3	(S_OUTc3),	// S_OUT de tipo reg, almacena el valor que se elimina al hacer rotaciones a la derecha o a la izquierda, cuando no se elimina un valor se toma como 0
						.S_OUTe3	(S_OUTe3),
						.S_OUTc4	(S_OUTc4),
						.S_OUTe4	(S_OUTe4),	// S_OUT de tipo reg, almacena el valor que se elimina al hacer rotaciones a la derecha o a la izquierda, cuando no se elimina un valor se tom
						.D		(D),
						.Dd		(Dd),
						.MODO		(MODO),
						.MODOc	(MODOc),
						.S_IN		(S_IN),
						.DIR		(DIR),
						.DIRd		(DIRd),
						.ENBflops		(ENBflops),
						.ENB (ENB),
						.Clk		(Clk)
	);
endmodule
