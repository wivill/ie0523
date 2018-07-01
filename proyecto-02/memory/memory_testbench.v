`timescale 1ns / 100ps
`include "memory_cond.v"
`include "memory_synth.v"
`include "memory_tester.v"
`include "cmos_cells.v"
module memory_testbench;
  wire clock;
  wire enable;
  wire lectura;
  wire escritura;
  wire [2:0] dirLectura;
  wire [2:0] dicEscritura;
  wire [7:0] datoEntrada;
  wire [7:0] datoSalida;
  wire [7:0] datoSalida_synth;

  memory_cond memory_cond (
    .CLK          (clock),
    .ENB          (enable),
    .sRead        (lectura),
    .sWrite       (escritura),
    .addressRead  (dirLectura),
    .addressWrite (dicEscritura),
    .inputData    (datoEntrada),
    .outputData   (datoSalida)
    );
    memory_synth MEM_synth (
      .CLK          (clock),
      .ENB          (enable),
      .sRead        (lectura),
      .sWrite       (escritura),
      .addressRead  (dirLectura),
      .addressWrite (dicEscritura),
      .inputData    (datoEntrada),
      .outputData   (datoSalida_synth)
      );

    memory_tester MEM_tester (
      .CLK          (clock),
      .ENB          (enable),
      .sRead        (lectura),
      .sWrite       (escritura),
      .addressRead  (dirLectura),
      .addressWrite (dicEscritura),
      .inputData    (datoEntrada)
      );



endmodule //fsm_testbench
