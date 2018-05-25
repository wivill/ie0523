`include "p2s.v"
`include "s2p.v"

module p2s_s2p_cond(  input         IN_CLK_2MHz,
                      input         IN_CLK_250KHz,
                      input   [7:0] IN_LANE3,
                      input   [7:0] IN_LANE2,
                      input   [7:0] IN_LANE1,
                      input   [7:0] IN_LANE0,
                      input   [2:0] IN_CTR_TX,
                      input   [2:0] IN_CTR_RX,
                      input         IN_ENB_TX,
                      input         IN_RESET_TX,
                      input         IN_VALID_TX,
                      input         IN_ENB_RX,
                      input         IN_RESET_RX,
                      output  [7:0] OUT_LANE3,
                      output  [7:0] OUT_LANE2,
                      output  [7:0] OUT_LANE1,
                      output  [7:0] OUT_LANE0
  );

  wire MODO_RX = `PUSH;
  wire DIR_RX = `LEFT;
  wire [3:0]  LANE;
  wire [1:0]  CLK_RX = {IN_CLK_250KHz, IN_CLK_2MHz};

  p2s_cond    low_tx_cond ( .IN_CLK_p2s   (IN_CLK_2MHz),
                            .IN_LANE3_p2s (IN_LANE3),
                            .IN_LANE2_p2s (IN_LANE2),
                            .IN_LANE1_p2s (IN_LANE1),
                            .IN_LANE0_p2s (IN_LANE0),
                            .IN_CTR_p2s   (IN_CTR_TX),
                            .IN_ENB_p2s   (IN_ENB_TX),
                            .IN_RESET_p2s (IN_RESET_TX),
                            .IN_VALID_BS  (IN_VALID_TX),
                            .OUT_LANE_p2s (LANE)
                            );

  s2p_cond    low_rx_cond ( .IN_CLK_s2p   (CLK_RX),
                            .IN_LANE_s2p  (LANE),
                            .IN_MODO_s2p  (MODO_RX),
                            .IN_DIR_s2p   (DIR_RX),
                            .IN_ENB_s2p   (IN_ENB_RX),
                            // .IN_RESET_s2p (IN_RESET_RX),
                            .OUT_LANE3_s2p(OUT_LANE3),
                            .OUT_LANE2_s2p(OUT_LANE2),
                            .OUT_LANE1_s2p(OUT_LANE1),
                            .OUT_LANE0_s2p(OUT_LANE0)
                            );

endmodule
