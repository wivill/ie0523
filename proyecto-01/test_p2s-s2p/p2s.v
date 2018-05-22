`include "../p2s/ffd_p2s_cond.v"
`include "../p2s/mux_p2s_cond.v"
`include "../p2s/freq_div_cond.v"

module p2s_cond(  input [2:0]       IN_CLK_p2s, //0->2MHz, 1->1MHz, 2->500KHz, 3->250KHz
                  input [7:0]       IN_LANE3_p2s,
                  input [7:0]       IN_LANE2_p2s,
                  input [7:0]       IN_LANE1_p2s,
                  input [7:0]       IN_LANE0_p2s,
                  input [2:0]       IN_CTR_p2s,
                  output reg [3:0]  OUT_LANE_p2s
  );

  wire [7:0]  Q0_p2s, Q1_p2s, Q2_p2s, Q3_p2s;
  wire [7:0]  D0_p2s, D1_p2s, D2_p2s, D3_p2s;
  wire [3:0]  DATA_OUT_p2s;
  wire        ENB_p2s, reset_p2s;

  OUT_LANE_p2s = DATA_OUT_p2s;

  mux_p2s_cond mux_lane3(  .sel      (IN_CTR_p2s),
                           .data_in  (Q3_p2s),
                           .data_out (DATA_OUT_p2s[3])
                           );

  mux_p2s_cond mux_lane2(  .sel      (IN_CTR_p2s),
                           .data_in  (Q2_p2s),
                           .data_out (DATA_OUT_p2s[2])
                           );

  mux_p2s_cond mux_lane1(  .sel      (IN_CTR_p2s),
                           .data_in  (Q1_p2s),
                           .data_out (DATA_OUT_p2s[1])
                           );

  mux_p2s_cond mux_lane0(  .sel      (IN_CTR_p2s),
                           .data_in  (Q0_p2s),
                           .data_out (DATA_OUT_p2s[0])
                           );

  ffd_p2s_cond ffd_lane3[7:0]( .CLK (IN_CLK_p2s[0]),
                               .D   (D3_p2s),
                               .ENB (ENB_p2s),
                               .Q   (Q3_p2s)
                               );

  ffd_p2s_cond ffd_lane2[7:0]( .CLK (IN_CLK_p2s[0]),
                               .D   (D2_p2s),
                               .ENB (ENB_p2s),
                               .Q   (Q2_p2s)
                               );

  ffd_p2s_cond ffd_lane1[7:0]( .CLK (IN_CLK_p2s[0]),
                               .D   (D1_p2s),
                               .ENB (ENB_p2s),
                               .Q   (Q1_p2s)
                               );

  ffd_p2s_cond ffd_lane0[7:0]( .CLK (IN_CLK_p2s[0]),
                               .D   (D0_p2s),
                               .ENB (ENB_p2s),
                               .Q   (Q0_p2s)
                               );

endmodule
