`include "../s2p/s2p_reg_cond.v"
`include "../s2p/freq_div_cond.v"
`include "../s2p/ffd_s2p_cond.v"

module s2p_cond(    input [1:0]  IN_CLK_s2p, //0->2MHz, 1->250KHz
                    input [3:0]  IN_LANE_s2p,
                    input [1:0]  IN_MODO_s2p,
                    input        IN_DIR_s2p,
                    input        IN_ENB_s2p,
                    input        IN_RESET_s2p,
                    output [7:0] OUT_LANE3_s2p,
                    output [7:0] OUT_LANE2_s2p,
                    output [7:0] OUT_LANE1_s2p,
                    output [7:0] OUT_LANE0_s2p
                    );

  wire [7:0]  P0_cond_s2p, P1_cond_s2p, P2_cond_s2p, P3_cond_s2p;

  // Conductual///////////////////////////////////////////

  s2p_reg_cond #(8) reg_lane3(  .CLK    (IN_CLK_s2p[0]),
                            .ENB    (IN_ENB_s2p),
                            .S_IN   (IN_LANE_s2p[3]),
                            .Q      (P3_cond_s2p),
                            .MODO   (IN_MODO_s2p),
                            .DIR    (IN_DIR_s2p)
                            );

  s2p_reg_cond #(8) reg_lane2(  .CLK    (IN_CLK_s2p[0]),
                            .ENB    (IN_ENB_s2p),
                            .S_IN   (IN_LANE_s2p[2]),
                            .Q      (P2_cond_s2p),
                            .MODO   (IN_MODO_s2p),
                            .DIR    (IN_DIR_s2p)
                            );

  s2p_reg_cond #(8) reg_lane1(  .CLK    (IN_CLK_s2p[0]),
                            .ENB    (IN_ENB_s2p),
                            .S_IN   (IN_LANE_s2p[1]),
                            .Q      (P1_cond_s2p),
                            .MODO   (IN_MODO_s2p),
                            .DIR    (IN_DIR_s2p)
                            );

  s2p_reg_cond #(8) reg_lane0(  .CLK    (IN_CLK_s2p[0]),
                            .ENB    (IN_ENB_s2p),
                            .S_IN   (IN_LANE_s2p[0]),
                            .Q      (P0_cond_s2p),
                            .MODO   (IN_MODO_s2p),
                            .DIR    (IN_DIR_s2p)
                            );

  ffd_s2p_cond ffd_lane3[7:0]( .CLK (IN_CLK_s2p[1]),
                               .D   (P3_cond_s2p),
                               .ENB (IN_ENB_s2p),
                               .Q   (OUT_LANE3_s2p)
                               );

  ffd_s2p_cond ffd_lane2[7:0]( .CLK (IN_CLK_s2p[1]),
                               .D   (P2_cond_s2p),
                               .ENB (IN_ENB_s2p),
                               .Q   (OUT_LANE2_s2p)
                               );

  ffd_s2p_cond ffd_lane1[7:0]( .CLK (IN_CLK_s2p[1]),
                               .D   (P1_cond_s2p),
                               .ENB (IN_ENB_s2p),
                               .Q   (OUT_LANE1_s2p)
                               );

  ffd_s2p_cond ffd_lane0[7:0]( .CLK (IN_CLK_s2p[1]),
                               .D   (P0_cond_s2p),
                               .ENB (IN_ENB_s2p),
                               .Q   (OUT_LANE0_s2p)
                               );

endmodule
