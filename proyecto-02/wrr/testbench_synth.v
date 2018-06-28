`include "tester.v"
`include "mux4_1_synth.v"
`include "wrr_synth.v"
`include "vc_table_synth.v"

module testbench_synth;

  wire [1:0] VC_id_tb, request_id_tb, vc_assign_tb;
  wire [2:0] weight_tb, weight_assign_tb;
  wire [3:0] Data_Word_tb;
  wire       clk_tb, reset_tb, data_out_tb, edit_weight_tb;


  mux4_1_cond mux_synth( .VC_id      (VC_id_tb),
                        .Data_Word  (Data_Word_tb),
                        .reset      (reset_tb),
                        .data_out   (data_out_tb)
  );

  wrr_cond wrr_mod_synth(.reset      (reset_tb),
                        .clk        (clk_tb),
                        .weight     (weight_tb),
                        .request_id (request_id_tb),
                        .grant_id   (VC_id_tb)
  );

  vc_table_cond table_synth( .clk          (clk_tb),
                            .reset        (reset_tb),
                            .edit_weight  (edit_weight_tb),
                            .weight_assign(weight_assign_tb),
                            .weight       (weight_tb),
                            .vc           (request_id_tb)
  );

  tester  letest_synth(  .weight_assign  (weight_assign_tb),
                        .vc_assign      (vc_assign_tb),
                        .CLK_2MHz       (clk_tb),
                        .reset          (reset_tb),
                        .edit_weight    (edit_weight_tb),
                        .Data_Word      (Data_Word_tb)
  );

endmodule
