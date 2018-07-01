`timescale 1ns / 100ps
`include "fifo_cond.v"
`include "fifo_synth.v"
`include "fifo_tester.v"
`include "cmos_cells.v"
module fifo_testbench;
  wire clock;
  wire reset;
  wire enabler;
  wire [2:0] umbralVacio;
  wire [2:0] umbralLleno;
  wire escritura;
  wire lectura;
  wire [7:0] datoEntrada;
  wire [7:0] datoSalida;
  wire casiLleno;
  wire casiVacio;
  wire vacio;
  wire lleno;
  wire errorVacio;
  wire errorLleno;


  wire [7:0] datoSalida_synth;
  wire casiLleno_synth;
  wire casiVacio_synth;
  wire vacio_synth;
  wire lleno_synth;
  wire errorVacio_synth;
  wire errorLleno_synth;

  fifo_cond FIFO_cond (
    .CLK          (clock),
    .ENB          (enabler),
    .RST          (reset),
    .sRead        (lectura),
    .sWrite       (escritura),
    .umbEmpty      (umbralVacio),
    .umbFull       (umbralLleno),
    .inputData    (datoEntrada),
    .almostEmpty  (casiVacio),
    .almostFull   (casiLleno),
    .outEmpty     (vacio),
    .outFull      (lleno),
    .errorEmpty   (errorVacio),
    .errorFull    (errorLleno),
    .outputData   (datoSalida)
    );

  fifo_synth FIFO_synth (
    .CLK          (clock),
    .ENB          (enabler),
    .RST          (reset),
    .sRead        (lectura),
    .sWrite       (escritura),
    .umbEmpty      (umbralVacio),
    .umbFull       (umbralLleno),
    .inputData    (datoEntrada),
    .almostEmpty  (casiVacio_synth),
    .almostFull   (casiLleno_synth),
    .outEmpty     (vacio_synth),
    .outFull      (lleno_synth),
    .errorEmpty   (errorVacio_synth),
    .errorFull    (errorLleno_synth),
    .outputData   (datoSalida_synth)
    );


  fifo_tester FIFO_prob (
    .CLK          (clock),
    .ENB          (enabler),
    .RST          (reset),
    .sRead        (lectura),
    .sWrite       (escritura),
    .umbEmpty      (umbralVacio),
    .umbFull       (umbralLleno),
    .inputData    (datoEntrada)
    );

endmodule //fsm_testbench
