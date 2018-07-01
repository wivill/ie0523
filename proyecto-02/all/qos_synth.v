`include "fifo_synth.v"
`include "fsm_synth.v"
`include "mux4_1_synth.v"
`include "vc_table_synth.v"
`include "wrr_synth.v"
//
module qos_synth(  input       clk,
                  input       enb,
                  input       reset,
                  input [3:0] Data_Word,
                  input       edit_weight,
                  input [1:0] vc_assign,
                  input [2:0] weight_assign,
                  input       sInit,
                  // input FIFOs
                  input [3:0] lectura, escritura,
                  input [2:0] umbralVacio0, umbralLleno0,
                  input [2:0] umbralVacio1, umbralLleno1,
                  input [2:0] umbralVacio2, umbralLleno2,
                  input [2:0] umbralVacio3, umbralLleno3,
                  output      oInit,
                  output      oIdle,
                  output [3:0]oError, stbPause, stbContinue,
                  output [7:0]State, nState
);

// FSM
wire [3:0] casiLleno, casiVacio, vacio, lleno, errorVacio, errorLleno;

fsm_synth FSM_synth (
    .CLK        (clk),
    .sReset     (reset),
    .sInit      (inInit),
    .sEmpty     (vacio),
    .sFull      (lleno),
    .sPause     (casiLleno),
    .sContinue  (casiVacio),
    .oInit      (oInit),
    .oIdle      (oIdle),
    .oError     (oError),
    .stbPause   (stbPause),
    .stbContinue (stbContinue),
    .State (State)
    );

// FIFOs
fifo_synth #(1,3,8) FIFO_vc0_synth (
    .CLK          (clk),
    .ENB          (enb),
    .RST          (reset),
    .sRead        (lectura[0]),
    .sWrite       (escritura[0]),
    .umbEmpty      (umbralVacio0),
    .umbFull       (umbralLleno0),
    .inputData    (Data_Word[0]),
    .almostEmpty  (casiVacio[0]),
    .almostFull   (casiLleno[0]),
    .outEmpty     (vacio[0]),
    // .outFull      (lleno[0]),
    .errorEmpty   (errorVacio[0]),
    // .errorFull    (errorLleno[0]),
    .errorFull    (lleno[0]),
    .outputData   (fifo_mux[0])
    );

fifo_synth #(1,3,8) FIFO_vc1_synth (
    .CLK          (clk),
    .ENB          (enb),
    .RST          (reset),
    .sRead        (lectura[1]),
    .sWrite       (escritura[1]),
    .umbEmpty      (umbralVacio1),
    .umbFull       (umbralLleno1),
    .inputData    (Data_Word[1]),
    .almostEmpty  (casiVacio[1]),
    .almostFull   (casiLleno[1]),
    .outEmpty     (vacio[1]),
    .outFull      (lleno[1]),
    .errorEmpty   (errorVacio[1]),
    // .errorFull    (errorLleno[1]),
    .errorFull    (lleno[1]),
    .outputData   (fifo_mux[1])
);

fifo_synth #(1,3,8) FIFO_vc2_synth (
    .CLK          (clk),
    .ENB          (enb),
    .RST          (reset),
    .sRead        (lectura[2]),
    .sWrite       (escritura[2]),
    .umbEmpty      (umbralVacio2),
    .umbFull       (umbralLleno2),
    .inputData    (Data_Word[2]),
    .almostEmpty  (casiVacio[2]),
    .almostFull   (casiLleno[2]),
    .outEmpty     (vacio[2]),
    .outFull      (lleno[2]),
    .errorEmpty   (errorVacio[2]),
    // .errorFull    (errorLleno[2]),
    .errorFull    (lleno[2]),
    .outputData   (fifo_mux[2])
    );

fifo_synth #(1,3,8) FIFO_vc3_synth (
    .CLK          (clk),
    .ENB          (enb),
    .RST          (reset),
    .sRead        (lectura[3]),
    .sWrite       (escritura[3]),
    .umbEmpty      (umbralVacio3),
    .umbFull       (umbralLleno3),
    .inputData    (Data_Word[3]),
    .almostEmpty  (casiVacio[3]),
    .almostFull   (casiLleno[3]),
    .outEmpty     (vacio[3]),
    .outFull      (lleno[3]),
    .errorEmpty   (errorVacio[3]),
    // .errorFull    (errorLleno[3]),
    .errorFull    (lleno[3]),
    .outputData   (fifo_mux[3])
    );

wire [3:0] fifo_mux;

// wrr
wire [1:0] VC_id_synth, request_id_synth;
wire [2:0] weight_synth;
wire       data_out_synth;

mux4_1_synth mux_synth( .VC_id      (VC_id_synth),
                      .Data_Word  (fifo_mux),
                      .reset      (reset),
                      .data_out   (data_out_synth)
);

wrr_synth wrr_mod_synth(.reset      (reset),
                      .clk        (clk),
                      .weight     (weight_synth),
                      .request_id (request_id_synth),
                      .grant_id   (VC_id_synth)
);

vc_table_synth table_synth( .clk            (clk),
                          .reset          (reset),
                          .edit_weight    (edit_weight),
                          .weight_assign  (weight_assign),
                          .vc_assign      (vc_assign),
                          .weight         (weight_synth),
                          .vc_id_out      (request_id_synth)
);


endmodule
