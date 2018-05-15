`timescale 	1ns				/ 100ps
// escala	unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
// Pueden omitirse y llamarse desde el testbench
// `include "verificador.v"
`include "byte_joining_estructural.v"
`include "bytejoining_cond.v"
`include "tester.v"
// `include "memoria.v"


module Testbench; // Testbench
	wire [7:0] byte_joining_desc_estruc;
	wire [7:0] byte_joining_desc_cond;
  wire [7:0] Lane_0;
  wire [7:0] Lane_1;
  wire [7:0] Lane_2;
  wire [7:0] Lane_3;
  wire clk250k;
	wire [1:0] ctr_3;

	// Nombres de los modulos mas las equivalencias de sus puertos globales

	byte_joining_conductual	bj_conduc(	.out		(byte_joining_desc_cond), // se esta instanciando un modulo de tipo registro4bit_conductual que se va a llamar b4r_conductual
					.Lane_0		(Lane_0),
					.Lane_1		(Lane_1),
					.Lane_2		(Lane_2),
					.Lane_3		(Lane_3),
					.ctr_3		(ctr_3),
					.clk250k		(clk250k)
	);

	byte_joining_estructural	bj_estruc(	.out		(byte_joining_desc_estruc), // se esta instanciando un modulo de tipo registro4bit_conductual que se va a llamar b4r_conductual
					.Lane_0		(Lane_0),
					.Lane_1		(Lane_1),
					.Lane_2		(Lane_2),
					.Lane_3		(Lane_3),
					.ctr_3		(ctr_3),
					.clk250k		(clk250k)
	);
	tester	tester_(	.byte_joining_desc_cond		(byte_joining_desc_cond), // se esta instanciando un modulo de tipo registro4bit_conductual que se va a llamar b4r_conductual
					.byte_joining_desc_estruc		(byte_joining_desc_estruc),
					.Lane_0		(Lane_0),
          .Lane_1		(Lane_1),
          .Lane_2		(Lane_2),
          .Lane_3		(Lane_3),
					.ctr_3		(ctr_3),
					.clk250k		(clk250k)

	);

endmodule
