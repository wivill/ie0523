`include "cmos_cells_delay.v"
/* Generated by Yosys 0.7+560 (git sha1 d9a2b430, gcc 7.3.1 -fPIC -Os) */

module registro_yosys_delay(Q, S_OUT, D, MODO, CLK, ENB, DIR, S_IN);
  wire [3:0] _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  input CLK;
  input [3:0] D;
  input DIR;
  input ENB;
  input [1:0] MODO;
  output [3:0] Q;
  reg [3:0] Q;
  input S_IN;
  output S_OUT;
  reg S_OUT;
  NOT_delay _053_ (
    .A(MODO[1]),
    .Y(_002_)
  );
  NOT_delay _054_ (
    .A(MODO[0]),
    .Y(_003_)
  );
  NOT_delay _055_ (
    .A(DIR),
    .Y(_004_)
  );
  NOT_delay _056_ (
    .A(ENB),
    .Y(_005_)
  );
  NOR_delay _057_ (
    .A(Q[0]),
    .B(ENB),
    .Y(_006_)
  );
  NOR_delay _058_ (
    .A(MODO[1]),
    .B(_003_),
    .Y(_007_)
  );
  NAND_delay _059_ (
    .A(Q[1]),
    .B(DIR),
    .Y(_008_)
  );
  NAND_delay _060_ (
    .A(_004_),
    .B(Q[3]),
    .Y(_009_)
  );
  NAND_delay _061_ (
    .A(_008_),
    .B(_009_),
    .Y(_010_)
  );
  NAND_delay _062_ (
    .A(_007_),
    .B(_010_),
    .Y(_011_)
  );
  NOR_delay _063_ (
    .A(MODO[1]),
    .B(MODO[0]),
    .Y(_012_)
  );
  NAND_delay _064_ (
    .A(S_IN),
    .B(_004_),
    .Y(_013_)
  );
  NAND_delay _065_ (
    .A(_008_),
    .B(_013_),
    .Y(_014_)
  );
  NAND_delay _066_ (
    .A(_012_),
    .B(_014_),
    .Y(_015_)
  );
  NAND_delay _067_ (
    .A(MODO[1]),
    .B(D[0]),
    .Y(_016_)
  );
  NAND_delay _068_ (
    .A(_011_),
    .B(_016_),
    .Y(_017_)
  );
  NAND_delay _069_ (
    .A(ENB),
    .B(_015_),
    .Y(_018_)
  );
  NOR_delay _070_ (
    .A(_017_),
    .B(_018_),
    .Y(_019_)
  );
  NOR_delay _071_ (
    .A(_006_),
    .B(_019_),
    .Y(_000_[0])
  );
  NAND_delay _072_ (
    .A(MODO[1]),
    .B(D[1]),
    .Y(_020_)
  );
  NAND_delay _073_ (
    .A(_004_),
    .B(Q[0]),
    .Y(_021_)
  );
  NAND_delay _074_ (
    .A(DIR),
    .B(Q[2]),
    .Y(_022_)
  );
  NAND_delay _075_ (
    .A(_021_),
    .B(_022_),
    .Y(_023_)
  );
  NAND_delay _076_ (
    .A(_002_),
    .B(_023_),
    .Y(_024_)
  );
  NAND_delay _077_ (
    .A(_020_),
    .B(_024_),
    .Y(_025_)
  );
  NAND_delay _078_ (
    .A(ENB),
    .B(_025_),
    .Y(_026_)
  );
  NAND_delay _079_ (
    .A(Q[1]),
    .B(_005_),
    .Y(_027_)
  );
  NAND_delay _080_ (
    .A(_026_),
    .B(_027_),
    .Y(_000_[1])
  );
  NAND_delay _081_ (
    .A(MODO[1]),
    .B(D[2]),
    .Y(_028_)
  );
  NAND_delay _082_ (
    .A(Q[1]),
    .B(_004_),
    .Y(_029_)
  );
  NAND_delay _083_ (
    .A(DIR),
    .B(Q[3]),
    .Y(_030_)
  );
  NAND_delay _084_ (
    .A(_029_),
    .B(_030_),
    .Y(_031_)
  );
  NAND_delay _085_ (
    .A(_002_),
    .B(_031_),
    .Y(_032_)
  );
  NAND_delay _086_ (
    .A(_028_),
    .B(_032_),
    .Y(_033_)
  );
  NAND_delay _087_ (
    .A(ENB),
    .B(_033_),
    .Y(_034_)
  );
  NAND_delay _088_ (
    .A(Q[2]),
    .B(_005_),
    .Y(_035_)
  );
  NAND_delay _089_ (
    .A(_034_),
    .B(_035_),
    .Y(_000_[2])
  );
  NOR_delay _090_ (
    .A(Q[3]),
    .B(ENB),
    .Y(_036_)
  );
  NAND_delay _091_ (
    .A(_004_),
    .B(Q[2]),
    .Y(_037_)
  );
  NAND_delay _092_ (
    .A(DIR),
    .B(Q[0]),
    .Y(_038_)
  );
  NAND_delay _093_ (
    .A(_037_),
    .B(_038_),
    .Y(_039_)
  );
  NAND_delay _094_ (
    .A(_007_),
    .B(_039_),
    .Y(_040_)
  );
  NAND_delay _095_ (
    .A(S_IN),
    .B(DIR),
    .Y(_041_)
  );
  NAND_delay _096_ (
    .A(_037_),
    .B(_041_),
    .Y(_042_)
  );
  NAND_delay _097_ (
    .A(_012_),
    .B(_042_),
    .Y(_043_)
  );
  NAND_delay _098_ (
    .A(MODO[1]),
    .B(D[3]),
    .Y(_044_)
  );
  NAND_delay _099_ (
    .A(_040_),
    .B(_044_),
    .Y(_045_)
  );
  NAND_delay _100_ (
    .A(ENB),
    .B(_043_),
    .Y(_046_)
  );
  NOR_delay _101_ (
    .A(_045_),
    .B(_046_),
    .Y(_047_)
  );
  NOR_delay _102_ (
    .A(_036_),
    .B(_047_),
    .Y(_000_[3])
  );
  NAND_delay _103_ (
    .A(_009_),
    .B(_038_),
    .Y(_048_)
  );
  NAND_delay _104_ (
    .A(_012_),
    .B(_048_),
    .Y(_049_)
  );
  NAND_delay _105_ (
    .A(ENB),
    .B(_049_),
    .Y(_050_)
  );
  NOT_delay _106_ (
    .A(_050_),
    .Y(_051_)
  );
  NOR_delay _107_ (
    .A(ENB),
    .B(S_OUT),
    .Y(_052_)
  );
  NOR_delay _108_ (
    .A(_051_),
    .B(_052_),
    .Y(_001_)
  );
  always @(posedge CLK)
      Q[0] <= #15  _000_[0];
  always @(posedge CLK)
      Q[1] <= #15  _000_[1];
  always @(posedge CLK)
      Q[2] <= #15  _000_[2];
  always @(posedge CLK)
      Q[3] <= #15  _000_[3];
  always @(posedge CLK)
      S_OUT <= #15  _001_;

parameter PwrC = 4;
always @(posedge Q or negedge Q) begin
  letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
end // end counter
endmodule
