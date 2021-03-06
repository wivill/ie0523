`include "tester.v"
`include "p2s_s2p_cond.v"
`include "p2s_s2p_synth.v"
`include "p2s_s2p_synth_delay.v"

module testbench;

  wire [3:0]  CLK_tb;
  wire        ENB_tb;
  wire        reset_tb;
  wire [31:0] DATO_tb;
  wire [31:0] OUT_cond_tb;
  wire [31:0] OUT_synth_tb;
  wire [31:0] OUT_synth_delay_tb;
  wire        VALID_tb;



  tester_s2p    letest_cond     ( .CLK_2MHz     (CLK_tb[0]),
                                  .CLK_1MHz     (CLK_tb[1]),
                                  .CLK_500KHz   (CLK_tb[2]),
                                  .CLK_250KHz   (CLK_tb[3]),
                                  .ENB          (ENB_tb),
                                  .reset        (reset_tb),
                                  .DATO         (DATO_tb),
                                  .VALID        (VALID_tb)
    );

  p2s_s2p_cond  low_tx_rx_cond  ( .IN_CLK_2MHz      (CLK_tb[0]),
                                  .IN_CLK_250KHz    (CLK_tb[3]),
                                  .IN_LANE3         (DATO_tb[31:24]),
                                  .IN_LANE2         (DATO_tb[23:16]),
                                  .IN_LANE1         (DATO_tb[15:8]),
                                  .IN_LANE0         (DATO_tb[7:0]),
                                  .IN_ENB_TX        (ENB_tb),
                                  .IN_RESET_TX      (reset_tb),
                                  .IN_VALID_TX      (VALID_tb),
                                  .IN_ENB_RX        (ENB_tb),
                                  .IN_RESET_RX      (reset_tb),
                                  .OUT_LANE3        (OUT_cond_tb[31:24]),
                                  .OUT_LANE2        (OUT_cond_tb[23:16]),
                                  .OUT_LANE1        (OUT_cond_tb[15:8]),
                                  .OUT_LANE0        (OUT_cond_tb[7:0])
                                  );

  p2s_s2p_synth  low_tx_rx_synth  ( .IN_CLK_2MHz      (CLK_tb[0]),
                                    .IN_CLK_250KHz    (CLK_tb[3]),
                                    .IN_LANE3         (DATO_tb[31:24]),
                                    .IN_LANE2         (DATO_tb[23:16]),
                                    .IN_LANE1         (DATO_tb[15:8]),
                                    .IN_LANE0         (DATO_tb[7:0]),
                                    .IN_ENB_TX        (ENB_tb),
                                    .IN_RESET_TX      (reset_tb),
                                    .IN_VALID_TX      (VALID_tb),
                                    .IN_ENB_RX        (ENB_tb),
                                    .IN_RESET_RX      (reset_tb),
                                    .OUT_LANE3        (OUT_synth_tb[31:24]),
                                    .OUT_LANE2        (OUT_synth_tb[23:16]),
                                    .OUT_LANE1        (OUT_synth_tb[15:8]),
                                    .OUT_LANE0        (OUT_synth_tb[7:0])
                                    );

  p2s_s2p_synth_delay  low_tx_rx_synth_delay  ( .IN_CLK_2MHz      (CLK_tb[0]),
                                                .IN_CLK_250KHz    (CLK_tb[3]),
                                                .IN_LANE3         (DATO_tb[31:24]),
                                                .IN_LANE2         (DATO_tb[23:16]),
                                                .IN_LANE1         (DATO_tb[15:8]),
                                                .IN_LANE0         (DATO_tb[7:0]),
                                                .IN_ENB_TX        (ENB_tb),
                                                .IN_RESET_TX      (reset_tb),
                                                .IN_VALID_TX      (VALID_tb),
                                                .IN_ENB_RX        (ENB_tb),
                                                .IN_RESET_RX      (reset_tb),
                                                .OUT_LANE3        (OUT_synth_delay_tb[31:24]),
                                                .OUT_LANE2        (OUT_synth_delay_tb[23:16]),
                                                .OUT_LANE1        (OUT_synth_delay_tb[15:8]),
                                                .OUT_LANE0        (OUT_synth_delay_tb[7:0])
                                                );

endmodule
