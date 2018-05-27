`include "multiplexer/multiplexer_cond.v"
`include "freq_div_cond.v"
`include "byte_striping/byte_striping_cond.v"
`include "p2s_s2p_cond.v"
`include "byte_joining/byte_joining_cond.v"
`include "ctr3_cond.v"

module pcie_cond( input [7:0]   IN_COM, IN_PAD, IN_SKP, IN_STP, IN_SDP, IN_END, IN_EDB, IN_FTS, IN_IDL, IN_TLP,
                  input [3:0]   IN_CTRL,
                  input         IN_CLK_2MHz,
                  input         IN_RESET_CLK,
                  input         IN_ENB_TX_RX,
                  output [7:0]  OUT_DATA
  );

  wire CLK_1MHz, CLK_500KHz, CLK_250KHz;

  freq_div_cond    leclock( .CLK    (IN_CLK_2MHz),
                            .reset  (IN_RESET_CLK),
                            .CLK_2  (CLK_1MHz),
                            .CLK_4  (CLK_500KHz),
                            .CLK_8  (CLK_250KHz)
    );

  wire [7:0] MUX_BS;
  wire       MUX_VALID;

  multiplexer_cond tx_input_cond (  .muxOUT   (MUX_BS),
                                    .muxVLD   (MUX_VALID),
                                    .TLP      (IN_TLP),
                                    .COM      (IN_COM),
                                    .PAD      (IN_PAD),
                                    .SKP      (IN_SKP),
                                    .STP      (IN_STP),
                                    .SDP      (IN_SDP),
                                    .END      (IN_END),
                                    .EDB      (IN_EDB),
                                    .FTS      (IN_FTS),
                                    .IDL      (IN_IDL),
                                    .muxCTRL  (IN_CTRL),
                                    .muxCLK   (CLK_1MHz)
  );

  wire [7:0]  BS_LANE3, BS_LANE2, BS_LANE1, BS_LANE0;
  wire        BS_VALID;


  byte_striping_cond tx_bs_cond ( .stripedLane0   (BS_LANE0),
                                  .stripedLane1   (BS_LANE1),
                                  .stripedLane2   (BS_LANE2),
                                  .stripedLane3   (BS_LANE3),
                                  .byteStripingVLD(BS_VALID),
                                  .byteStripingIN (MUX_BS),
                                  .laneVLD        (MUX_VALID),
                                  .clk250k        (CLK_250KHz),
                                  .clk1Mhz        (CLK_1MHz),
                                  .reset          (IN_RESET_CLK)
  );

  wire [7:0]  S2P_LANE3, S2P_LANE2, S2P_LANE1, S2P_LANE0;

  p2s_s2p_cond  tx_rx_cond  ( .IN_CLK_2MHz    (IN_CLK_2MHz),
                              .IN_CLK_250KHz  (CLK_250KHz),
                              .IN_LANE3       (BS_LANE3),
                              .IN_LANE2       (BS_LANE2),
                              .IN_LANE1       (BS_LANE1),
                              .IN_LANE0       (BS_LANE0),
                              .IN_ENB_TX      (IN_ENB_TX_RX),
                              .IN_RESET_TX    (IN_RESET_CLK),
                              .IN_VALID_TX    (BS_VALID),
                              .IN_ENB_RX      (IN_ENB_TX_RX),
                              .OUT_LANE3      (S2P_LANE3),
                              .OUT_LANE2      (S2P_LANE2),
                              .OUT_LANE1      (S2P_LANE1),
                              .OUT_LANE0      (S2P_LANE0)
  );

  wire [7:0]  BJ_OUT;
  wire [1:0]  CTR_3;

  ctr3_cond   ctr3_rx_cond  ( .CLK    (CLK_1MHz),
                              .reset  (IN_RESET_CLK),
                              .CTR    (CTR_3)
  );

  byte_joining_cond bj_rx_cond (  .Lane_0   (S2P_LANE0),
                                  .Lane_1   (S2P_LANE1),
                                  .Lane_2   (S2P_LANE2),
                                  .Lane_3   (S2P_LANE3),
                                  .ctr_3    (CTR_3),
                                  .clk250k  (CLK_250KHz),
                                  .out      (BJ_OUT)
  );

endmodule
