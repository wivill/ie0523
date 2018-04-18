`timescale 1ns/100ps

`include "library.v"
`include "definitions.v"

`define NumPwrCntr 4
`define Ndir 2

module registro_struct (  output  wire  [3 : 0] Q,
                          output  wire  [3 : 0] Qn,
                          output  wire          S_OUT,
                          input   wire  [3 : 0] D,
                          input   wire  [1 : 0] MODO,
                          input   wire          CLK, ENB, DIR, S_IN
                          );

  wire oD_Q3, oD_Q2, oD_Q1, oD_Q0;

  ff_d #(0) Q3( .Q    (Q[3]),
                .Qn   (Qn[3]),
                .D    (oD_Q3),
                .CLK  (CLK),
                .ENB  (ENB)
              );

  ff_d #(0) Q2( .Q    (Q[2]),
                .Qn   (Qn[2]),
                .D    (oD_Q2),
                .CLK  (CLK),
                .ENB  (ENB)
                );

  ff_d #(0) Q1( .Q    (Q[1]),
                .Qn   (Qn[1]),
                .D    (oD_Q1),
                .CLK  (CLK),
                .ENB  (ENB)
                );

  ff_d #(0) Q0( .Q    (Q[0]),
                .Qn   (Qn[0]),
                .D    (oD_Q0),
                .CLK  (CLK),
                .ENB  (ENB)
                );

  left_mux #(0) left( .oD       (oD_Q3),
                      .S_IN     (S_IN),
                      .Qcirc    (Q[0]),
                      .Qright   (Q[2]),
                      .D        (D[3]),
                      .DIR      (DIR),
                      .MODO1    (MODO[1]),
                      .MODO0    (MODO[0])
                      );

  mid_mux #(0) q3_q2( .oD       (oD_Q2),
                      .Qleft    (Q[3]),
                      .Qright   (Q[1]),
                      .D        (D[2]),
                      .DIR      (DIR),
                      .MODO1    (MODO[1])
                      );

  mid_mux #(0) q2_q1( .oD       (oD_Q1),
                      .Qleft    (Q[2]),
                      .Qright   (Q[0]),
                      .D        (D[1]),
                      .DIR      (DIR),
                      .MODO1    (MODO[1])
                      );

  right_mux #(0) right( .oD       (oD_Q0),
                        .S_IN     (S_IN),
                        .Qcirc    (Q[3]),
                        .Qleft    (Q[1]),
                        .D        (D[0]),
                        .DIR      (DIR),
                        .MODO1    (MODO[1]),
                        .MODO0    (MODO[0])
                      );

endmodule
