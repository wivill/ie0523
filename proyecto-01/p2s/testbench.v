`timescale 1ns / 100ps

`include "tester.v"
`include "mux_p2s_cond.v"
`include "ffd_p2s_cond.v"
`include "freq_div_cond.v"
`include "mux_p2s_synth.v"
`include "ffd_p2s_synth.v"
`include "freq_div_synth.v"
`include "mux_p2s_synth_delay.v"
`include "ffd_p2s_synth_delay.v"
`include "freq_div_synth_delay.v"
`include "cmos_cells.v"
`include "cmos_cells_delay.v"

module testbench;

  wire [2:0]  CLK_div_tb; //0->2MHz, 1->1MHz, 2->500KHz, 3->250KHz
  wire [7:0]  Q0_cond_tb, Q1_cond_tb, Q2_cond_tb, Q3_cond_tb;
  wire [7:0]  D0_tb, D1_tb, D2_tb, D3_tb;
  wire [3:0]  data_out_cond_tb;
  wire [2:0]  sel_tb;
  // wire [31:0] D_tb;
  wire        ENB_tb, reset_tb, CLK_tb;

  // Para sintetizados
  wire [7:0]  Q0_synth_tb, Q1_synth_tb, Q2_synth_tb, Q3_synth_tb;
  wire [3:0]  data_out_synth_tb;
  // sintetizados con delay
  wire [7:0]  Q0_synth_delay_tb, Q1_synth_delay_tb, Q2_synth_delay_tb, Q3_synth_delay_tb;
  wire [3:0]  data_out_synth_delay_tb;

  tester_p2s  letest_p2s( .CLK_div  (CLK_div_tb),
                          .Q0_cond  (Q0_cond_tb),
                          .Q1_cond  (Q1_cond_tb),
                          .Q2_cond  (Q2_cond_tb),
                          .Q3_cond  (Q3_cond_tb),
                          .Q0_synth  (Q0_synth_tb),
                          .Q1_synth  (Q1_synth_tb),
                          .Q2_synth  (Q2_synth_tb),
                          .Q3_synth  (Q3_synth_tb),
                          .Q0_synth_delay  (Q0_synth_delay_tb),
                          .Q1_synth_delay  (Q1_synth_delay_tb),
                          .Q2_synth_delay  (Q2_synth_delay_tb),
                          .Q3_synth_delay  (Q3_synth_delay_tb),
                          .data_out_cond (data_out_cond_tb),
                          .data_out_synth (data_out_synth_tb),
                          .data_out_synth_delay (data_out_synth_delay_tb),
                          .sel      (sel_tb),
                          .CLK      (CLK_tb),
                          .D0       (D0_tb),
                          .D1       (D1_tb),
                          .D2       (D2_tb),
                          .D3       (D3_tb),
                          .ENB      (ENB_tb),
                          .reset    (reset_tb)
                          );

// Conductual///////////////////////////////////////////

  mux_p2s_cond mux_lane3(  .sel      (sel_tb),
                           .data_in  (Q3_cond_tb),
                           .data_out (data_out_cond_tb[3])
                           );

  mux_p2s_cond mux_lane2(  .sel      (sel_tb),
                           .data_in  (Q2_cond_tb),
                           .data_out (data_out_cond_tb[2])
                           );

  mux_p2s_cond mux_lane1(  .sel      (sel_tb),
                           .data_in  (Q1_cond_tb),
                           .data_out (data_out_cond_tb[1])
                           );

  mux_p2s_cond mux_lane0(  .sel      (sel_tb),
                           .data_in  (Q0_cond_tb),
                           .data_out (data_out_cond_tb[0])
                           );

  ffd_p2s_cond ffd_lane3[7:0]( .CLK (CLK_tb),
                               .D   (D3_tb),
                               .ENB (ENB_tb),
                               .Q   (Q3_cond_tb)
                               );

  ffd_p2s_cond ffd_lane2[7:0]( .CLK (CLK_tb),
                               .D   (D2_tb),
                               .ENB (ENB_tb),
                               .Q   (Q2_cond_tb)
                               );

  ffd_p2s_cond ffd_lane1[7:0]( .CLK (CLK_tb),
                               .D   (D1_tb),
                               .ENB (ENB_tb),
                               .Q   (Q1_cond_tb)
                               );

  ffd_p2s_cond ffd_lane0[7:0]( .CLK (CLK_tb),
                               .D   (D0_tb),
                               .ENB (ENB_tb),
                               .Q   (Q0_cond_tb)
                               );

// Sintetizado///////////////////////////////////////////
mux_p2s_synth mux_lane3_synth(  .sel      (sel_tb),
                                .data_in  (Q3_synth_tb),
                                .data_out (data_out_synth_tb[3])
                                );

mux_p2s_synth mux_lane2_synth(  .sel      (sel_tb),
                                .data_in  (Q2_synth_tb),
                                .data_out (data_out_synth_tb[2])
                                );

mux_p2s_synth mux_lane1_synth(  .sel      (sel_tb),
                                .data_in  (Q1_synth_tb),
                                .data_out (data_out_synth_tb[1])
                                );

mux_p2s_synth mux_lane0_synth(  .sel      (sel_tb),
                                .data_in  (Q0_synth_tb),
                                .data_out (data_out_synth_tb[0])
                                );

ffd_p2s_synth ffd_lane3_synth[7:0]( .CLK (CLK_tb),
                                    .D   (D3_tb),
                                    .ENB (ENB_tb),
                                    .Q   (Q3_synth_tb)
                                    );

ffd_p2s_synth ffd_lane2_synth[7:0]( .CLK (CLK_tb),
                                    .D   (D2_tb),
                                    .ENB (ENB_tb),
                                    .Q   (Q2_synth_tb)
                                    );

ffd_p2s_synth ffd_lane1_synth[7:0]( .CLK (CLK_tb),
                                    .D   (D1_tb),
                                    .ENB (ENB_tb),
                                    .Q   (Q1_synth_tb)
                                    );

ffd_p2s_synth ffd_lane0_synth[7:0]( .CLK (CLK_tb),
                                    .D   (D0_tb),
                                    .ENB (ENB_tb),
                                    .Q   (Q0_synth_tb)
                                    );
// Sintetizado con delay/////////////////////////////////
mux_p2s_synth_delay mux_lane3_synth_delay(  .sel      (sel_tb),
                                            .data_in  (Q3_synth_delay_tb),
                                            .data_out (data_out_synth_delay_tb[3])
                                            );

mux_p2s_synth_delay mux_lane2_synth_delay(  .sel      (sel_tb),
                                            .data_in  (Q2_synth_delay_tb),
                                            .data_out (data_out_synth_delay_tb[2])
                                            );

mux_p2s_synth_delay mux_lane1_synth_delay(  .sel      (sel_tb),
                                            .data_in  (Q1_synth_delay_tb),
                                            .data_out (data_out_synth_delay_tb[1])
                                            );

mux_p2s_synth_delay mux_lane0_synth_delay(  .sel      (sel_tb),
                                            .data_in  (Q0_synth_delay_tb),
                                            .data_out (data_out_synth_delay_tb[0])
                                            );

ffd_p2s_synth_delay ffd_lane3_synth_delay[7:0]( .CLK (CLK_tb),
                                                .D   (D3_tb),
                                                .ENB (ENB_tb),
                                                .Q   (Q3_synth_delay_tb)
                                                );

ffd_p2s_synth_delay ffd_lane2_synth_delay[7:0]( .CLK (CLK_tb),
                                                .D   (D2_tb),
                                                .ENB (ENB_tb),
                                                .Q   (Q2_synth_delay_tb)
                                                );

ffd_p2s_synth_delay ffd_lane1_synth_delay[7:0]( .CLK (CLK_tb),
                                                .D   (D1_tb),
                                                .ENB (ENB_tb),
                                                .Q   (Q1_synth_delay_tb)
                                                );

ffd_p2s_synth_delay ffd_lane0_synth_delay[7:0]( .CLK (CLK_tb),
                                                .D   (D0_tb),
                                                .ENB (ENB_tb),
                                                .Q   (Q0_synth_delay_tb)
                                                );

// Divisor de frecuencias

freq_div_cond divisor(.CLK  (CLK_tb),
                      .reset(reset_tb),
                      .CLK_2(CLK_div_tb[0]),
                      .CLK_4(CLK_div_tb[1]),
                      .CLK_8(CLK_div_tb[2])
                      );

endmodule // testbench
