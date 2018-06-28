`timescale 1ns / 100ps
`include "fsm_cond.v"
`include "fsm_synth.v"
`include "fsm_tester.v"
module fsm_testbench;
  wire clock;
  wire inReset;
  wire inInit;
  wire [3:0] inEmpty;
  wire [3:0] inFull;
  wire [3:0] inPausa;
  wire [3:0] inContinuar;
  wire outInit;
  wire outIdle;
  wire [3:0] outError;
  wire [3:0] outPause;
  wire [3:0] outContinue;
  wire [7:0] actual;

  wire outInit_synth;
  wire outIdle_synth;
  wire [3:0] outError_synth;
  wire [3:0] outPause_synth;
  wire [3:0] outContinue_synth;
  wire [7:0] actual_synth;

  fsm_cond FSM_cond (
    .CLK        (clock),
    .sReset     (inReset),
    .sInit      (inInit),
    .sEmpty     (inEmpty),
    .sFull      (inFull),
    .sPause     (inPausa),
    .sContinue  (inContinuar),
    .oInit      (outInit),
    .oIdle      (outIdle),
    .oError     (outError),
    .stbPause   (outPause),
    .stbContinue (outContinue),
    .State (actual)
    );

  fsm_synth FSM_synth (
    .CLK        (clock),
    .sReset     (inReset),
    .sInit      (inInit),
    .sEmpty     (inEmpty),
    .sFull      (inFull),
    .sPause     (inPausa),
    .sContinue  (inContinuar),
    .oInit      (outInit_synth),
    .oIdle      (outIdle_synth),
    .oError     (outError_synth),
    .stbPause   (outPause_synth),
    .stbContinue (outContinue_synth),
    .State (actual_synth)
    );

  fsm_tester FSM_prob (
    .CLK        (clock),
    .sReset     (inReset),
    .sInit      (inInit),
    .sEmpty     (inEmpty),
    .sFull      (inFull),
    .sPause     (inPausa),
    .sContinue  (inContinuar)
    );

endmodule //fsm_testbench
