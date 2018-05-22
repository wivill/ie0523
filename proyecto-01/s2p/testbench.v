`timescale 1ns / 100ps

`include "tester.v"
`include "ffd_s2p_cond.v"
`include "freq_div_cond.v"
`include "s2p_cond.v"
`include "ffd_s2p_synth.v"
`include "freq_div_synth.v"
`include "s2p_synth.v"
`include "ffd_s2p_synth_delay.v"
`include "freq_div_synth_delay.v"
`include "s2p_synth_delay.v"
`include "cmos_cells.v"
`include "cmos_cells_delay.v"

module testbench;

  wire [2:0]  CLK_div_tb; //0->2MHz, 1->1MHz, 2->500KHz, 3->250KHz
  wire [7:0]  Q0_cond_tb, Q1_cond_tb, Q2_cond_tb, Q3_cond_tb;
  wire [7:0]  P0_cond_tb, P1_cond_tb, P2_cond_tb, P3_cond_tb;
  wire        ENB_tb, reset_tb, CLK_tb;
  wire [3:0]  s_in_tb;

  // Para sintetizados
  wire [7:0]  Q0_synth_tb, Q1_synth_tb, Q2_synth_tb, Q3_synth_tb;
  wire [3:0]  data_out_synth_tb;
  wire [7:0]  P0_synth_tb, P1_synth_tb, P2_synth_tb, P3_synth_tb;
  // sintetizados con delay
  wire [7:0]  Q0_synth_delay_tb, Q1_synth_delay_tb, Q2_synth_delay_tb, Q3_synth_delay_tb;
  wire [3:0]  data_out_synth_delay_tb;
  wire [7:0]  P0_synth_delay_tb, P1_synth_delay_tb, P2_synth_delay_tb, P3_synth_delay_tb;

  tester_s2p  letest_s2p( .CLK_div  (CLK_div_tb),
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
                          .P0_cond  (P0_cond_tb),
                          .P1_cond  (P1_cond_tb),
                          .P2_cond  (P2_cond_tb),
                          .P3_cond  (P3_cond_tb),
                          .P0_synth  (P0_synth_tb),
                          .P1_synth  (P1_synth_tb),
                          .P2_synth  (P2_synth_tb),
                          .P3_synth  (P3_synth_tb),
                          .P0_synth_delay  (P0_synth_delay_tb),
                          .P1_synth_delay  (P1_synth_delay_tb),
                          .P2_synth_delay  (P2_synth_delay_tb),
                          .P3_synth_delay  (P3_synth_delay_tb),
                          .CLK      (CLK_tb),
                          .ENB      (ENB_tb),
                          .reset    (reset_tb),
                          .s_in     (s_in_tb)
                          );

  // Conductual///////////////////////////////////////////

  s2p_cond #(8) reg_lane3(  .CLK    (CLK_tb),
                            .CLK_8  (CLK_div_tb[2]),
                            .ENB    (ENB_tb),
                            .s_in   (s_in_tb[3]),
                            .p_out  (P3_cond_tb)
                            );

  s2p_cond #(8) reg_lane2(  .CLK    (CLK_tb),
                            .CLK_8  (CLK_div_tb[2]),
                            .ENB    (ENB_tb),
                            .s_in   (s_in_tb[2]),
                            .p_out  (P2_cond_tb)
                            );

  s2p_cond #(8) reg_lane1(  .CLK    (CLK_tb),
                            .CLK_8  (CLK_div_tb[2]),
                            .ENB    (ENB_tb),
                            .s_in   (s_in_tb[1]),
                            .p_out  (P1_cond_tb)
                            );

  s2p_cond #(8) reg_lane0(  .CLK    (CLK_tb),
                            .CLK_8  (CLK_div_tb[2]),
                            .ENB    (ENB_tb),
                            .s_in   (s_in_tb[0]),
                            .p_out  (P0_cond_tb)
                            );

  ffd_s2p_cond ffd_lane3[7:0]( .CLK (CLK_div_tb[2]),
                               .D   (P3_cond_tb),
                               .ENB (ENB_tb),
                               .Q   (Q3_cond_tb)
                               );

  ffd_s2p_cond ffd_lane2[7:0]( .CLK (CLK_div_tb[2]),
                               .D   (P2_cond_tb),
                               .ENB (ENB_tb),
                               .Q   (Q2_cond_tb)
                               );

  ffd_s2p_cond ffd_lane1[7:0]( .CLK (CLK_div_tb[2]),
                               .D   (P1_cond_tb),
                               .ENB (ENB_tb),
                               .Q   (Q1_cond_tb)
                               );

  ffd_s2p_cond ffd_lane0[7:0]( .CLK (CLK_tb),
                               .D   (P0_cond_tb),
                               .ENB (ENB_tb),
                               .Q   (Q0_cond_tb)
                               );

  // Sintetizado///////////////////////////////////////////

  s2p_synth #(8) reg_lane3_synth(  .CLK    (CLK_tb),
                            .CLK_8  (CLK_div_tb[2]),
                            .ENB    (ENB_tb),
                            .s_in   (s_in_tb[3]),
                            .p_out  (P3_synth_tb)
                            );

  s2p_synth #(8) reg_lane2_synth(  .CLK    (CLK_tb),
                            .CLK_8  (CLK_div_tb[2]),
                            .ENB    (ENB_tb),
                            .s_in   (s_in_tb[2]),
                            .p_out  (P2_synth_tb)
                            );

  s2p_synth #(8) reg_lane1_synth(  .CLK    (CLK_tb),
                            .CLK_8  (CLK_div_tb[2]),
                            .ENB    (ENB_tb),
                            .s_in   (s_in_tb[1]),
                            .p_out  (P1_synth_tb)
                            );

  s2p_synth #(8) reg_lane0_synth(  .CLK    (CLK_tb),
                            .CLK_8  (CLK_div_tb[2]),
                            .ENB    (ENB_tb),
                            .s_in   (s_in_tb[0]),
                            .p_out  (P0_synth_tb)
                            );

  ffd_s2p_synth ffd_lane3_synth[7:0]( .CLK (CLK_div_tb[2]),
                                      .D   (P3_synth_tb),
                                      .ENB (ENB_tb),
                                      .Q   (Q3_synth_tb)
                                      );

  ffd_s2p_synth ffd_lane2_synth[7:0]( .CLK (CLK_div_tb[2]),
                                      .D   (P2_synth_tb),
                                      .ENB (ENB_tb),
                                      .Q   (Q2_synth_tb)
                                      );

  ffd_s2p_synth ffd_lane1_synth[7:0]( .CLK (CLK_div_tb[2]),
                                      .D   (P1_synth_tb),
                                      .ENB (ENB_tb),
                                      .Q   (Q1_synth_tb)
                                      );

  ffd_s2p_synth ffd_lane0_synth[7:0]( .CLK (CLK_div_tb[2]),
                                      .D   (P0_synth_tb),
                                      .ENB (ENB_tb),
                                      .Q   (Q0_synth_tb)
                                      );
  // Sintetizado con delay/////////////////////////////////

  s2p_synth_delay #(8) reg_lane3_synth_delay(  .CLK    (CLK_tb),
                            .CLK_8  (CLK_div_tb[2]),
                            .ENB    (ENB_tb),
                            .s_in   (s_in_tb[3]),
                            .p_out  (P3_synth_delay_tb)
                            );

  s2p_synth_delay #(8) reg_lane2_synth_delay(  .CLK    (CLK_tb),
                            .CLK_8  (CLK_div_tb[2]),
                            .ENB    (ENB_tb),
                            .s_in   (s_in_tb[2]),
                            .p_out  (P2_synth_delay_tb)
                            );

  s2p_synth_delay #(8) reg_lane1_synth_delay(  .CLK    (CLK_tb),
                            .CLK_8  (CLK_div_tb[2]),
                            .ENB    (ENB_tb),
                            .s_in   (s_in_tb[1]),
                            .p_out  (P1_synth_delay_tb)
                            );

  s2p_synth_delay #(8) reg_lane0_synth_delay(  .CLK    (CLK_tb),
                            .CLK_8  (CLK_div_tb[2]),
                            .ENB    (ENB_tb),
                            .s_in   (s_in_tb[0]),
                            .p_out  (P0_synth_delay_tb)
                            );

  ffd_s2p_synth_delay ffd_lane3_synth_delay[7:0]( .CLK (CLK_div_tb[2]),
                                                  .D   (P3_synth_delay_tb),
                                                  .ENB (ENB_tb),
                                                  .Q   (Q3_synth_delay_tb)
                                                  );

  ffd_s2p_synth_delay ffd_lane2_synth_delay[7:0]( .CLK (CLK_div_tb[2]),
                                                  .D   (P2_synth_delay_tb),
                                                  .ENB (ENB_tb),
                                                  .Q   (Q2_synth_delay_tb)
                                                  );

  ffd_s2p_synth_delay ffd_lane1_synth_delay[7:0]( .CLK (CLK_div_tb[2]),
                                                  .D   (P1_synth_delay_tb),
                                                  .ENB (ENB_tb),
                                                  .Q   (Q1_synth_delay_tb)
                                                  );

  ffd_s2p_synth_delay ffd_lane0_synth_delay[7:0]( .CLK (CLK_div_tb[2]),
                                                  .D   (P0_synth_delay_tb),
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
