`include "multiplexer_cond.v"
`include "multiplexer_synth.v"
`include "multiplexer_synth_delay.v"
`include "tester.v"

module testbench;

output [7:0] muxOUT;
output muxVLD;

output [7:0] muxOUT_synth;
output muxVLD_synth;

output [7:0] muxOUT_synth_delay;
output muxVLD_synth_delay;

wire [7:0] TLP;
wire [7:0] COM;
wire [7:0] PAD;
wire [7:0] SKP;
wire [7:0] STP;
wire [7:0] SDP;
wire [7:0] END;
wire [7:0] EDB;
wire [7:0] FTS;
wire [7:0] IDL;

wire [3:0] muxCTRL;
wire muxCLK;          // 1 Mhz
wire ENB;

tester  letest(.IN_COM       (COM),
                      .IN_PAD       (PAD),
                      .IN_SKP       (SKP),
                      .IN_STP       (STP),
                      .IN_SDP       (SDP),
                      .IN_END       (END),
                      .IN_EDB       (EDB),
                      .IN_FTS       (FTS),
                      .IN_IDL       (IDL),
                      .IN_TLP       (TLP),
                      .CLK_1MHz     (muxCLK),
                      .IN_CTRL      (muxCTRL),
                      .ENB          (ENB),
                      .reset        (reset_tb));

multiplexer_cond cond(.muxOUT(muxOUT),
                      .muxVLD(muxVLD),
                      .TLP(TLP),
                      .COM(COM),
                      .PAD(PAD),
                      .SKP(SKP),
                      .STP(STP),
                      .SDP(SDP),
                      .END(END),
                      .EDB(EDB),
                      .FTS(FTS),
                      .IDL(IDL),
                      .muxCTRL(muxCTRL),
                      .muxCLK(muxCLK),
                      .ENB(ENB)
);

multiplexer_synth synth(.muxOUT(muxOUT_synth),
                      .muxVLD(muxVLD_synth),
                      .TLP(TLP),
                      .COM(COM),
                      .PAD(PAD),
                      .SKP(SKP),
                      .STP(STP),
                      .SDP(SDP),
                      .END(END),
                      .EDB(EDB),
                      .FTS(FTS),
                      .IDL(IDL),
                      .muxCTRL(muxCTRL),
                      .muxCLK(muxCLK),
                      .ENB(ENB));

multiplexer_synth_delay synth_delay(.muxOUT(muxOUT_synth_delay),
                      .muxVLD(muxVLD_synth_delay),
                      .TLP(TLP),
                      .COM(COM),
                      .PAD(PAD),
                      .SKP(SKP),
                      .STP(STP),
                      .SDP(SDP),
                      .END(END),
                      .EDB(EDB),
                      .FTS(FTS),
                      .IDL(IDL),
                      .muxCTRL(muxCTRL),
                      .muxCLK(muxCLK),
                      .ENB(ENB));

endmodule
