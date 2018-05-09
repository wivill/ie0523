`timescale 1ns / 100ps

module testbench;
  wire [7:0] sA, sB, sC, sD, sOut;
  wire [1:0] sControl;
  wire clk;

  mux mux1(
    .outputMux (sOut),
    .inputA (sA),
    .inputB (sB),
    .inputC (sC),
    .inputD (sD),
    .controlInput (sControl),
    .muxCLK (clk)
    );

  tester_mux tester(
    .outputMux (sOut),
    .inputA (sA),
    .inputB (sB),
    .inputC (sC),
    .inputD (sD),
    .controlInput (sControl),
    .muxCLK (clk)
    );



endmodule // testbench
