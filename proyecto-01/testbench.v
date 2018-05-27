`include "tester.v"
`include "pcie_cond.v"
`include "pcie_synth.v"
`include "pcie_synth_delay.v"

module testbench;

  wire [7:0]  IN_COM_tb, IN_PAD_tb, IN_SKP_tb, IN_STP_tb, IN_SDP_tb, IN_END_tb, IN_EDB_tb, IN_FTS_tb, IN_IDL_tb, IN_TLP_tb,
  wire [3:0]  IN_CTRL_tb;
  wire        CLK_tb;
  wire        ENB_tb;
  wire        reset_tb;
  wire [7:0] OUT_cond_tb;
  wire [7:0] OUT_synth_tb;
  wire [7:0] OUT_synth_delay_tb;


  tester  letest_cond ( .IN_COM       (IN_COM_tb),
                        .IN_PAD       (IN_PAD_tb),
                        .IN_SKP       (IN_SKP_tb),
                        .IN_STP       (IN_STP_tb),
                        .IN_SDP       (IN_SDP_tb),
                        .IN_END       (IN_END_tb),
                        .IN_EDB       (IN_EDB_tb),
                        .IN_FTS       (IN_FTS_tb),
                        .IN_IDL       (IN_IDL_tb),
                        .IN_TLP       (IN_TLP_tb),
                        .CLK_2MHz     (CLK_tb),
                        .IN_CTRL      (IN_CTRL_tb),
                        .ENB          (ENB_tb),
                        .reset        (reset_tb),
  );

  pcie_cond cond  ( .IN_COM       (IN_COM_tb),
                    .IN_PAD       (IN_PAD_tb),
                    .IN_SKP       (IN_SKP_tb),
                    .IN_STP       (IN_STP_tb),
                    .IN_SDP       (IN_SDP_tb),
                    .IN_END       (IN_END_tb),
                    .IN_EDB       (IN_EDB_tb),
                    .IN_FTS       (IN_FTS_tb),
                    .IN_IDL       (IN_IDL_tb),
                    .IN_TLP       (IN_TLP_tb),
                    .IN_CTRL      (IN_CTRL_tb)
                    .IN_CLK_2MHz  (CLK_tb),
                    .IN_RESET_CLK (reset_tb),
                    .IN_ENB_TX_RX (ENB_tb),
                    .OUT_DATA     (OUT_cond_tb)
  );

endmodule
