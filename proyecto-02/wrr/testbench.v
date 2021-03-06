`include "tester.v"
`include "mux4_1_cond.v"
`include "wrr_cond.v"
`include "vc_table_cond.v"
`include "mux4_1_synth.v"
`include "wrr_synth.v"
`include "vc_table_synth.v"
`include "cmos_cells.v"

module testbench;

  wire [3:0] Data_Word_tb;
  wire       clk_tb, reset_tb, edit_weight_tb;
  wire [1:0] vc_assign_tb;
  wire [2:0] weight_assign_tb;

  wire [1:0] VC_id_cond_tb, request_id_cond_tb;
  wire [2:0] weight_cond_tb;
  wire       data_out_cond_tb;

  wire [1:0] VC_id_synth_tb, request_id_synth_tb;
  wire [2:0] weight_synth_tb;
  wire       data_out_synth_tb;

  tester  letest( .weight_assign  (weight_assign_tb),
                  .vc_assign      (vc_assign_tb),
                  .CLK_2MHz       (clk_tb),
                  .reset          (reset_tb),
                  .edit_weight    (edit_weight_tb),
                  .Data_Word      (Data_Word_tb)
  );
// conditional
  mux4_1_cond mux_cond( .VC_id      (VC_id_cond_tb),
                        .Data_Word  (Data_Word_tb),
                        .reset      (reset_tb),
                        .data_out   (data_out_cond_tb)
  );

  wrr_cond wrr_mod_cond(.reset      (reset_tb),
                        .clk        (clk_tb),
                        .weight     (weight_cond_tb),
                        .request_id (request_id_cond_tb),
                        .grant_id   (VC_id_cond_tb)
  );

  vc_table_cond table_cond( .clk            (clk_tb),
                            .reset          (reset_tb),
                            .edit_weight    (edit_weight_tb),
                            .weight_assign  (weight_assign_tb),
                            .vc_assign      (vc_assign_tb),
                            .weight         (weight_cond_tb),
                            .vc_id_out      (request_id_cond_tb)
  );
// synth
  mux4_1_synth mux_synth( .VC_id      (VC_id_synth_tb),
                          .Data_Word  (Data_Word_tb),
                          .reset      (reset_tb),
                          .data_out   (data_out_synth_tb)
  );

  wrr_synth wrr_mod_synth(.reset      (reset_tb),
                          .clk        (clk_tb),
                          .weight     (weight_synth_tb),
                          .request_id (request_id_synth_tb),
                          .grant_id   (VC_id_synth_tb)
  );

  vc_table_synth table_synth( .clk            (clk_tb),
                              .reset          (reset_tb),
                              .edit_weight    (edit_weight_tb),
                              .weight_assign  (weight_assign_tb),
                              .vc_assign      (vc_assign_tb),
                              .weight         (weight_synth_tb),
                              .vc_id_out      (request_id_synth_tb)
  );

endmodule
