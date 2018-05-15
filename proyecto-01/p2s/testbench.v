`timescale 1ns / 100ps

`include "tester.v"
`include "mux_p2s.v"
`include "ffd_p2s.v"
`include "freq_div.v"

module testbench;

  wire [2:0]  CLK_div_tb; //0->2MHz, 1->1MHz, 2->500KHz, 3->250KHz
  wire [7:0]  Q0_cond_tb, Q1_cond_tb, Q2_cond_tb, Q3_cond_tb;
  wire [7:0]  D0_cond_tb, D1_cond_tb, D2_cond_tb, D3_cond_tb;
  wire [3:0]  data_out_cond_tb;
  wire [2:0]  sel_tb;
  // wire [31:0] D_tb;
  wire        ENB_tb, reset_tb, CLK_tb;

  // Para sintetizados
  wire [7:0]  Q0_synth_tb, Q1_synth_tb, Q2_synth_tb, Q3_synth_tb;
  wire [3:0]  data_out_synth_tb;
  // sintetizados con delay
  wire [7:0]  Q0_delay_tb, Q1_delay_tb, Q2_delay_tb, Q3_delay_tb;
  wire [3:0]  data_out_delay_tb;

  tester_p2s  letest_p2s( .CLK_div  (CLK_div_tb),
                          .Q0       (Q0_cond_tb),
                          .Q1       (Q1_cond_tb),
                          .Q2       (Q2_cond_tb),
                          .Q3       (Q3_cond_tb),
                          .data_out (data_out_cond_tb),
                          .sel      (sel_tb),
                          .CLK      (CLK_tb),
                          .D0       (D0_cond_tb),
                          .D1       (D1_cond_tb),
                          .D2       (D2_cond_tb),
                          .D3       (D3_cond_tb),
                          .ENB      (ENB_tb),
                          .reset    (reset_tb)
                          );

  mux_p2s     mux_lane3(  .sel      (sel_tb),
                          .data_in  (Q3_cond_tb),
                          .data_out (data_out_cond_tb[3])
                          );

  mux_p2s     mux_lane2(  .sel      (sel_tb),
                          .data_in  (Q2_cond_tb),
                          .data_out (data_out_cond_tb[2])
                          );

  mux_p2s     mux_lane1(  .sel      (sel_tb),
                          .data_in  (Q1_cond_tb),
                          .data_out (data_out_cond_tb[1])
                          );

  mux_p2s     mux_lane0(  .sel      (sel_tb),
                          .data_in  (Q0_cond_tb),
                          .data_out (data_out_cond_tb[0])
                          );

  ffd_p2s ffd_lane3[7:0]( .CLK      (CLK_tb),
                          .D        (D3_cond_tb),
                          .ENB      (ENB_tb),
                          .Q        (Q3_cond_tb)
                          );

  ffd_p2s ffd_lane2[7:0]( .CLK      (CLK_tb),
                          .D        (D2_cond_tb),
                          .ENB      (ENB_tb),
                          .Q        (Q2_cond_tb)
                          );

  ffd_p2s ffd_lane1[7:0]( .CLK      (CLK_tb),
                          .D        (D1_cond_tb),
                          .ENB      (ENB_tb),
                          .Q        (Q1_cond_tb)
                          );

  ffd_p2s ffd_lane0[7:0]( .CLK      (CLK_tb),
                          .D        (D0_cond_tb),
                          .ENB      (ENB_tb),
                          .Q        (Q0_cond_tb)
                          );

endmodule // testbench
