`include "tester.v"
`include "qos_cond.v"
`include "qos_synth.v"
`include "cmos_cells.v"



module testbench;

wire sReset;
wire sInit;
wire [3:0] sEmpty;
wire [3:0] sFull;
wire [3:0] sPause;
wire [3:0] sContinue;

wire oInit;
wire oIdle;
wire [3:0] oError;
wire [3:0] stbPause;
wire [3:0] stbContinue;
wire [7:0] State, nState;



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

// synth
  


endmodule
