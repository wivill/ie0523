`include "ffd_p2s_cond.v"
`include "mux_p2s_cond.v"
// `include "../p2s/freq_div_cond.v"

module p2s_cond(  input        IN_CLK_p2s, //2MHz
                  input [7:0]  IN_LANE3_p2s,
                  input [7:0]  IN_LANE2_p2s,
                  input [7:0]  IN_LANE1_p2s,
                  input [7:0]  IN_LANE0_p2s,
                  input [2:0]  IN_CTR_p2s,
                  input        IN_ENB_p2s,
                  // input        IN_RESET_p2s,
                  input        IN_VALID_BS,
                  output [3:0] OUT_LANE_p2s
  );

  wire [7:0]  Q0_p2s, Q1_p2s, Q2_p2s, Q3_p2s;
  wire        valid_ffd;

  mux_p2s_cond mux_lane3(  .sel      (IN_CTR_p2s),
                           .data_in  (Q3_p2s),
                           .data_out (OUT_LANE_p2s[3])
                           );

  mux_p2s_cond mux_lane2(  .sel      (IN_CTR_p2s),
                           .data_in  (Q2_p2s),
                           .data_out (OUT_LANE_p2s[2])
                           );

  mux_p2s_cond mux_lane1(  .sel      (IN_CTR_p2s),
                           .data_in  (Q1_p2s),
                           .data_out (OUT_LANE_p2s[1])
                           );

  mux_p2s_cond mux_lane0(  .sel      (IN_CTR_p2s),
                           .data_in  (Q0_p2s),
                           .data_out (OUT_LANE_p2s[0])
                           );

  ffd_p2s_cond ffd_valid     ( .CLK (IN_CLK_p2s),
                               .D   (IN_LANE3_p2s[7]),
                               .ENB (IN_ENB_p2s),
                               .valid_in(IN_VALID_BS),
                               .Q   (Q3_p2s[7]),
                               .valid_out(valid_ffd)
                               );

  ffd_p2s_cond ffd_lane3[6:0]( .CLK (IN_CLK_p2s),
                               .D   (IN_LANE3_p2s[6:0]),
                               .ENB (IN_ENB_p2s),
                               .valid_in(IN_VALID_BS),
                               .Q   (Q3_p2s[6:0])
                               );

  ffd_p2s_cond ffd_lane2[7:0]( .CLK (IN_CLK_p2s),
                               .D   (IN_LANE2_p2s),
                               .ENB (IN_ENB_p2s),
                               .valid_in(IN_VALID_BS),
                               .Q   (Q2_p2s)
                               );

  ffd_p2s_cond ffd_lane1[7:0]( .CLK (IN_CLK_p2s),
                               .D   (IN_LANE1_p2s),
                               .ENB (IN_ENB_p2s),
                               .valid_in(IN_VALID_BS),
                               .Q   (Q1_p2s)
                               );

  ffd_p2s_cond ffd_lane0[7:0]( .CLK (IN_CLK_p2s),
                               .D   (IN_LANE0_p2s),
                               .ENB (IN_ENB_p2s),
                               .valid_in(IN_VALID_BS),
                               .Q   (Q0_p2s)
                               );

endmodule
