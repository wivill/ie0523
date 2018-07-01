`include "tester.v"
`include "qos_cond.v"
`include "qos_synth.v"
`include "cmos_cells.v"



module testbench;

  wire       clk,
  wire       enb,
  wire       reset,
  wire [3:0] Data_Word,
  wire       edit_weight,
  wire [1:0] vc_assign,
  wire [2:0] weight_assign,
  wire       sInit,
  // wire FIFOs
  wire [3:0] lectura, escritura,
  wire [2:0] umbralVacio0, umbralLleno0,
  wire [2:0] umbralVacio1, umbralLleno1,
  wire [2:0] umbralVacio2, umbralLleno2,
  wire [2:0] umbralVacio3, umbralLleno3,
  wire      oInit,
  wire      oIdle,
  wire [3:0]oError, stbPause, stbContinue,
  wire [7:0]State, nState

  tester  letest( .weight_assign  (weight_assign_tb),
                  .vc_assign      (vc_assign_tb),
                  .CLK_2MHz       (clk_tb),
                  .reset          (reset_tb),
                  .edit_weight    (edit_weight_tb),
                  .Data_Word      (Data_Word_tb)
  );
  // conditional
  qos_cond conditional();
  // synth
  qos_synth synthetized();


endmodule
