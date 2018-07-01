`include "fifo_cond.v"
`include "fsm_cond.v"
`include "mux4_1_cond.v"
`include "vc_table_cond.v"
`include "wrr_cond.v"

module qos_cond(  input       clk,
                  input       enb,
                  input       reset,
                  input [3:0] Data_Word,
                  input       edit_weight,
                  input [1:0] vc_assign,
                  input [2:0] weight_assign,
                  input       sInit
);

// FSM
wire [3:0] casiLleno, casiVacio, vacio, lleno, errorVacio, errorLleno;

fsm_cond FSM_cond (
    .CLK        (clk),
    .sReset     (reset),
    .sInit      (inInit),
    .sEmpty     (vacio),
    .sFull      (inFull),
    .sPause     (inPausa),
    .sContinue  (casiVacio),
    .oInit      (outInit),
    .oIdle      (outIdle),
    .oError     (outError),
    .stbPause   (outPause),
    .stbContinue (outContinue),
    .State (actual)
    );

// flags FIFOs

// input FIFOs
wire [3:0] lectura, escritura;
wire [2:0] umbralVacio0, umbralLleno0;
wire [2:0] umbralVacio1, umbralLleno1;
wire [2:0] umbralVacio2, umbralLleno2;
wire [2:0] umbralVacio3, umbralLleno3;

// FIFOs
fifo_cond #(1,3,8) FIFO_vc0_cond (
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
    .outFull      (lleno[0]),
    .errorEmpty   (errorVacio[0]),
    .errorFull    (errorLleno[0]),
    .outputData   (fifo_mux[0])
    );

fifo_cond #(1,3,8) FIFO_vc1_cond (
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
    .errorFull    (errorLleno[1]),
    .outputData   (fifo_mux[1])
);

fifo_cond #(1,3,8) FIFO_vc2_cond (
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
    .errorFull    (errorLleno[2]),
    .outputData   (fifo_mux[2])
    );

fifo_cond #(1,3,8) FIFO_vc3_cond (
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
    .errorFull    (errorLleno[3]),
    .outputData   (fifo_mux[3])
    );

wire [3:0] fifo_mux;

// wrr
wire [1:0] VC_id_cond, request_id_cond;
wire [2:0] weight_cond;
wire       data_out_cond;

mux4_1_cond mux_cond( .VC_id      (VC_id_cond),
                      .Data_Word  (fifo_mux),
                      .reset      (reset),
                      .data_out   (data_out_cond)
);

wrr_cond wrr_mod_cond(.reset      (reset),
                      .clk        (clk),
                      .weight     (weight_cond),
                      .request_id (request_id_cond),
                      .grant_id   (VC_id_cond)
);

vc_table_cond table_cond( .clk            (clk),
                          .reset          (reset),
                          .edit_weight    (edit_weight),
                          .weight_assign  (weight_assign),
                          .vc_assign      (vc_assign),
                          .weight         (weight_cond),
                          .vc_id_out      (request_id_cond)
);


endmodule
