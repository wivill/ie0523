`include "cmos_cells.v"
/* Generated by Yosys 0.7+560 (git sha1 d9a2b430, gcc 7.3.1 -fPIC -Os) */

module byte_joining_synth(Lane_0, Lane_1, Lane_2, Lane_3, ctr_3, clk250k, ENB, out);
  input ENB;
  reg [7:0] L0;
  reg [7:0] L1;
  reg [7:0] L2;
  reg [7:0] L3;
  input [7:0] Lane_0;
  input [7:0] Lane_1;
  input [7:0] Lane_2;
  input [7:0] Lane_3;
  input clk250k;
  input [1:0] ctr_3;
  output [7:0] out;
  always @(posedge clk250k)
      L0[0] <= Lane_0[0];
  always @(posedge clk250k)
      L0[1] <= Lane_0[1];
  always @(posedge clk250k)
      L0[2] <= Lane_0[2];
  always @(posedge clk250k)
      L0[3] <= Lane_0[3];
  always @(posedge clk250k)
      L0[4] <= Lane_0[4];
  always @(posedge clk250k)
      L0[5] <= Lane_0[5];
  always @(posedge clk250k)
      L0[6] <= Lane_0[6];
  always @(posedge clk250k)
      L0[7] <= Lane_0[7];
  always @(posedge clk250k)
      L1[0] <= Lane_1[0];
  always @(posedge clk250k)
      L1[1] <= Lane_1[1];
  always @(posedge clk250k)
      L1[2] <= Lane_1[2];
  always @(posedge clk250k)
      L1[3] <= Lane_1[3];
  always @(posedge clk250k)
      L1[4] <= Lane_1[4];
  always @(posedge clk250k)
      L1[5] <= Lane_1[5];
  always @(posedge clk250k)
      L1[6] <= Lane_1[6];
  always @(posedge clk250k)
      L1[7] <= Lane_1[7];
  always @(posedge clk250k)
      L2[0] <= Lane_2[0];
  always @(posedge clk250k)
      L2[1] <= Lane_2[1];
  always @(posedge clk250k)
      L2[2] <= Lane_2[2];
  always @(posedge clk250k)
      L2[3] <= Lane_2[3];
  always @(posedge clk250k)
      L2[4] <= Lane_2[4];
  always @(posedge clk250k)
      L2[5] <= Lane_2[5];
  always @(posedge clk250k)
      L2[6] <= Lane_2[6];
  always @(posedge clk250k)
      L2[7] <= Lane_2[7];
  always @(posedge clk250k)
      L3[0] <= Lane_3[0];
  always @(posedge clk250k)
      L3[1] <= Lane_3[1];
  always @(posedge clk250k)
      L3[2] <= Lane_3[2];
  always @(posedge clk250k)
      L3[3] <= Lane_3[3];
  always @(posedge clk250k)
      L3[4] <= Lane_3[4];
  always @(posedge clk250k)
      L3[5] <= Lane_3[5];
  always @(posedge clk250k)
      L3[6] <= Lane_3[6];
  always @(posedge clk250k)
      L3[7] <= Lane_3[7];
  mux4a1_synth mux_cond (
    .ENB(ENB),
    .In0(L0),
    .In1(L1),
    .In2(L2),
    .In3(L3),
    .Sel(ctr_3),
    .outmux(out)
  );
endmodule

module byte_striping_synth(stripedLane0, stripedLane1, stripedLane2, stripedLane3, byteStripingVLD, byteStripingIN, laneVLD, clk250k, clk1Mhz, counter, reset, ENB);
  wire [7:0] _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  input ENB;
  input [7:0] byteStripingIN;
  output byteStripingVLD;
  input clk1Mhz;
  input clk250k;
  output [1:0] counter;
  input laneVLD;
  input reset;
  output [7:0] stripedLane0;
  output [7:0] stripedLane1;
  output [7:0] stripedLane2;
  output [7:0] stripedLane3;
  reg [7:0] stripedLane3;
  NOT _18_ (
    .A(laneVLD),
    .Y(_01_)
  );
  NAND _19_ (
    .A(byteStripingIN[0]),
    .B(laneVLD),
    .Y(_02_)
  );
  NAND _20_ (
    .A(stripedLane3[0]),
    .B(_01_),
    .Y(_03_)
  );
  NAND _21_ (
    .A(_02_),
    .B(_03_),
    .Y(_00_[0])
  );
  NAND _22_ (
    .A(laneVLD),
    .B(byteStripingIN[1]),
    .Y(_04_)
  );
  NAND _23_ (
    .A(_01_),
    .B(stripedLane3[1]),
    .Y(_05_)
  );
  NAND _24_ (
    .A(_04_),
    .B(_05_),
    .Y(_00_[1])
  );
  NAND _25_ (
    .A(laneVLD),
    .B(byteStripingIN[2]),
    .Y(_06_)
  );
  NAND _26_ (
    .A(_01_),
    .B(stripedLane3[2]),
    .Y(_07_)
  );
  NAND _27_ (
    .A(_06_),
    .B(_07_),
    .Y(_00_[2])
  );
  NAND _28_ (
    .A(laneVLD),
    .B(byteStripingIN[3]),
    .Y(_08_)
  );
  NAND _29_ (
    .A(_01_),
    .B(stripedLane3[3]),
    .Y(_09_)
  );
  NAND _30_ (
    .A(_08_),
    .B(_09_),
    .Y(_00_[3])
  );
  NAND _31_ (
    .A(laneVLD),
    .B(byteStripingIN[4]),
    .Y(_10_)
  );
  NAND _32_ (
    .A(_01_),
    .B(stripedLane3[4]),
    .Y(_11_)
  );
  NAND _33_ (
    .A(_10_),
    .B(_11_),
    .Y(_00_[4])
  );
  NAND _34_ (
    .A(laneVLD),
    .B(byteStripingIN[5]),
    .Y(_12_)
  );
  NAND _35_ (
    .A(_01_),
    .B(stripedLane3[5]),
    .Y(_13_)
  );
  NAND _36_ (
    .A(_12_),
    .B(_13_),
    .Y(_00_[5])
  );
  NAND _37_ (
    .A(laneVLD),
    .B(byteStripingIN[6]),
    .Y(_14_)
  );
  NAND _38_ (
    .A(_01_),
    .B(stripedLane3[6]),
    .Y(_15_)
  );
  NAND _39_ (
    .A(_14_),
    .B(_15_),
    .Y(_00_[6])
  );
  NAND _40_ (
    .A(laneVLD),
    .B(byteStripingIN[7]),
    .Y(_16_)
  );
  NAND _41_ (
    .A(_01_),
    .B(stripedLane3[7]),
    .Y(_17_)
  );
  NAND _42_ (
    .A(_16_),
    .B(_17_),
    .Y(_00_[7])
  );
  always @(posedge clk1Mhz)
      stripedLane3[0] <= _00_[0];
  always @(posedge clk1Mhz)
      stripedLane3[1] <= _00_[1];
  always @(posedge clk1Mhz)
      stripedLane3[2] <= _00_[2];
  always @(posedge clk1Mhz)
      stripedLane3[3] <= _00_[3];
  always @(posedge clk1Mhz)
      stripedLane3[4] <= _00_[4];
  always @(posedge clk1Mhz)
      stripedLane3[5] <= _00_[5];
  always @(posedge clk1Mhz)
      stripedLane3[6] <= _00_[6];
  always @(posedge clk1Mhz)
      stripedLane3[7] <= _00_[7];
  assign byteStripingVLD = 1'h1;
  assign counter = 2'h3;
endmodule

module ctr3_synth(CLK, reset, CTR);
  input CLK;
  output [1:0] CTR;
  input reset;
  assign CTR = 2'h2;
endmodule

module ffd_p2s_synth(CLK, D, ENB, valid_in, Q, valid_out);
  input CLK;
  input D;
  input ENB;
  output Q;
  input valid_in;
  output valid_out;
  assign Q = 1'h0;
  assign valid_out = 1'h1;
endmodule

module multiplexer_synth(muxOUT, muxVLD, TLP, COM, PAD, SKP, STP, SDP, END, EDB, FTS, IDL, muxCTRL, muxCLK, ENB);
  wire [7:0] _000_;
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
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  wire _177_;
  wire _178_;
  wire _179_;
  wire _180_;
  wire _181_;
  wire _182_;
  wire _183_;
  wire _184_;
  wire _185_;
  wire _186_;
  wire _187_;
  wire _188_;
  wire _189_;
  wire _190_;
  wire _191_;
  wire _192_;
  wire _193_;
  wire _194_;
  wire _195_;
  wire _196_;
  wire _197_;
  wire _198_;
  wire _199_;
  wire _200_;
  wire _201_;
  wire _202_;
  wire _203_;
  wire _204_;
  wire _205_;
  wire _206_;
  wire _207_;
  wire _208_;
  wire _209_;
  wire _210_;
  wire _211_;
  input [7:0] COM;
  input [7:0] EDB;
  input ENB;
  input [7:0] END;
  input [7:0] FTS;
  input [7:0] IDL;
  input [7:0] PAD;
  input [7:0] SDP;
  input [7:0] SKP;
  input [7:0] STP;
  input [7:0] TLP;
  input muxCLK;
  input [3:0] muxCTRL;
  output [7:0] muxOUT;
  reg [7:0] muxOUT;
  output muxVLD;
  reg muxVLD;
  NAND _212_ (
    .A(IDL[4]),
    .B(_027_),
    .Y(_127_)
  );
  NOR _213_ (
    .A(_011_),
    .B(_033_),
    .Y(_128_)
  );
  NAND _214_ (
    .A(SDP[4]),
    .B(_045_),
    .Y(_129_)
  );
  NAND _215_ (
    .A(STP[4]),
    .B(_035_),
    .Y(_130_)
  );
  NAND _216_ (
    .A(muxOUT[4]),
    .B(_016_),
    .Y(_131_)
  );
  NAND _217_ (
    .A(PAD[4]),
    .B(_041_),
    .Y(_132_)
  );
  NAND _218_ (
    .A(END[4]),
    .B(_043_),
    .Y(_133_)
  );
  NAND _219_ (
    .A(SKP[4]),
    .B(_037_),
    .Y(_134_)
  );
  NAND _220_ (
    .A(_125_),
    .B(_133_),
    .Y(_135_)
  );
  NAND _221_ (
    .A(_124_),
    .B(_131_),
    .Y(_136_)
  );
  NOR _222_ (
    .A(_135_),
    .B(_136_),
    .Y(_137_)
  );
  NOT _223_ (
    .A(_137_),
    .Y(_138_)
  );
  NAND _224_ (
    .A(_129_),
    .B(_134_),
    .Y(_139_)
  );
  NAND _225_ (
    .A(_126_),
    .B(_130_),
    .Y(_140_)
  );
  NOR _226_ (
    .A(_139_),
    .B(_140_),
    .Y(_141_)
  );
  NAND _227_ (
    .A(_127_),
    .B(_132_),
    .Y(_142_)
  );
  NOR _228_ (
    .A(_128_),
    .B(_142_),
    .Y(_143_)
  );
  NAND _229_ (
    .A(_141_),
    .B(_143_),
    .Y(_144_)
  );
  NOR _230_ (
    .A(_138_),
    .B(_144_),
    .Y(_145_)
  );
  NOR _231_ (
    .A(_006_),
    .B(_145_),
    .Y(_000_[4])
  );
  NAND _232_ (
    .A(TLP[5]),
    .B(_019_),
    .Y(_146_)
  );
  NAND _233_ (
    .A(FTS[5]),
    .B(_022_),
    .Y(_147_)
  );
  NAND _234_ (
    .A(PAD[5]),
    .B(_041_),
    .Y(_148_)
  );
  NAND _235_ (
    .A(IDL[5]),
    .B(_027_),
    .Y(_149_)
  );
  NOR _236_ (
    .A(_012_),
    .B(_033_),
    .Y(_150_)
  );
  NAND _237_ (
    .A(SDP[5]),
    .B(_045_),
    .Y(_151_)
  );
  NAND _238_ (
    .A(STP[5]),
    .B(_035_),
    .Y(_152_)
  );
  NAND _239_ (
    .A(muxOUT[5]),
    .B(_016_),
    .Y(_153_)
  );
  NAND _240_ (
    .A(COM[5]),
    .B(_025_),
    .Y(_154_)
  );
  NAND _241_ (
    .A(END[5]),
    .B(_043_),
    .Y(_155_)
  );
  NAND _242_ (
    .A(SKP[5]),
    .B(_037_),
    .Y(_156_)
  );
  NAND _243_ (
    .A(_147_),
    .B(_155_),
    .Y(_157_)
  );
  NAND _244_ (
    .A(_146_),
    .B(_153_),
    .Y(_158_)
  );
  NOR _245_ (
    .A(_157_),
    .B(_158_),
    .Y(_159_)
  );
  NOT _246_ (
    .A(_159_),
    .Y(_160_)
  );
  NAND _247_ (
    .A(_151_),
    .B(_156_),
    .Y(_161_)
  );
  NAND _248_ (
    .A(_148_),
    .B(_152_),
    .Y(_162_)
  );
  NOR _249_ (
    .A(_161_),
    .B(_162_),
    .Y(_163_)
  );
  NAND _250_ (
    .A(_149_),
    .B(_154_),
    .Y(_164_)
  );
  NOR _251_ (
    .A(_150_),
    .B(_164_),
    .Y(_165_)
  );
  NAND _252_ (
    .A(_163_),
    .B(_165_),
    .Y(_166_)
  );
  NOR _253_ (
    .A(_160_),
    .B(_166_),
    .Y(_167_)
  );
  NOR _254_ (
    .A(_006_),
    .B(_167_),
    .Y(_000_[5])
  );
  NAND _255_ (
    .A(COM[6]),
    .B(_025_),
    .Y(_168_)
  );
  NAND _256_ (
    .A(FTS[6]),
    .B(_022_),
    .Y(_169_)
  );
  NAND _257_ (
    .A(TLP[6]),
    .B(_019_),
    .Y(_170_)
  );
  NAND _258_ (
    .A(IDL[6]),
    .B(_027_),
    .Y(_171_)
  );
  NOR _259_ (
    .A(_013_),
    .B(_033_),
    .Y(_172_)
  );
  NAND _260_ (
    .A(SDP[6]),
    .B(_045_),
    .Y(_173_)
  );
  NAND _261_ (
    .A(STP[6]),
    .B(_035_),
    .Y(_174_)
  );
  NAND _262_ (
    .A(muxOUT[6]),
    .B(_016_),
    .Y(_175_)
  );
  NAND _263_ (
    .A(PAD[6]),
    .B(_041_),
    .Y(_176_)
  );
  NAND _264_ (
    .A(END[6]),
    .B(_043_),
    .Y(_177_)
  );
  NAND _265_ (
    .A(SKP[6]),
    .B(_037_),
    .Y(_178_)
  );
  NAND _266_ (
    .A(_169_),
    .B(_177_),
    .Y(_179_)
  );
  NAND _267_ (
    .A(_168_),
    .B(_175_),
    .Y(_180_)
  );
  NOR _268_ (
    .A(_179_),
    .B(_180_),
    .Y(_181_)
  );
  NOT _269_ (
    .A(_181_),
    .Y(_182_)
  );
  NAND _270_ (
    .A(_173_),
    .B(_178_),
    .Y(_183_)
  );
  NAND _271_ (
    .A(_170_),
    .B(_174_),
    .Y(_184_)
  );
  NOR _272_ (
    .A(_183_),
    .B(_184_),
    .Y(_185_)
  );
  NAND _273_ (
    .A(_171_),
    .B(_176_),
    .Y(_186_)
  );
  NOR _274_ (
    .A(_172_),
    .B(_186_),
    .Y(_187_)
  );
  NAND _275_ (
    .A(_185_),
    .B(_187_),
    .Y(_188_)
  );
  NOR _276_ (
    .A(_182_),
    .B(_188_),
    .Y(_189_)
  );
  NOR _277_ (
    .A(_006_),
    .B(_189_),
    .Y(_000_[6])
  );
  NAND _278_ (
    .A(COM[7]),
    .B(_025_),
    .Y(_190_)
  );
  NAND _279_ (
    .A(FTS[7]),
    .B(_022_),
    .Y(_191_)
  );
  NAND _280_ (
    .A(TLP[7]),
    .B(_019_),
    .Y(_192_)
  );
  NAND _281_ (
    .A(IDL[7]),
    .B(_027_),
    .Y(_193_)
  );
  NOR _282_ (
    .A(_014_),
    .B(_033_),
    .Y(_194_)
  );
  NAND _283_ (
    .A(STP[7]),
    .B(_035_),
    .Y(_195_)
  );
  NAND _284_ (
    .A(SKP[7]),
    .B(_037_),
    .Y(_196_)
  );
  NAND _285_ (
    .A(muxOUT[7]),
    .B(_016_),
    .Y(_197_)
  );
  NAND _286_ (
    .A(PAD[7]),
    .B(_041_),
    .Y(_198_)
  );
  NAND _287_ (
    .A(END[7]),
    .B(_043_),
    .Y(_199_)
  );
  NAND _288_ (
    .A(SDP[7]),
    .B(_045_),
    .Y(_200_)
  );
  NAND _289_ (
    .A(_191_),
    .B(_199_),
    .Y(_201_)
  );
  NAND _290_ (
    .A(_190_),
    .B(_197_),
    .Y(_202_)
  );
  NOR _291_ (
    .A(_201_),
    .B(_202_),
    .Y(_203_)
  );
  NOT _292_ (
    .A(_203_),
    .Y(_204_)
  );
  NAND _293_ (
    .A(_195_),
    .B(_200_),
    .Y(_205_)
  );
  NAND _294_ (
    .A(_192_),
    .B(_196_),
    .Y(_206_)
  );
  NOR _295_ (
    .A(_205_),
    .B(_206_),
    .Y(_207_)
  );
  NAND _296_ (
    .A(_193_),
    .B(_198_),
    .Y(_208_)
  );
  NOR _297_ (
    .A(_194_),
    .B(_208_),
    .Y(_209_)
  );
  NAND _298_ (
    .A(_207_),
    .B(_209_),
    .Y(_210_)
  );
  NOR _299_ (
    .A(_204_),
    .B(_210_),
    .Y(_211_)
  );
  NOR _300_ (
    .A(_006_),
    .B(_211_),
    .Y(_000_[7])
  );
  NOT _301_ (
    .A(muxCTRL[2]),
    .Y(_002_)
  );
  NOT _302_ (
    .A(muxCTRL[3]),
    .Y(_003_)
  );
  NOT _303_ (
    .A(muxCTRL[0]),
    .Y(_004_)
  );
  NOT _304_ (
    .A(muxCTRL[1]),
    .Y(_005_)
  );
  NOT _305_ (
    .A(ENB),
    .Y(_006_)
  );
  NOT _306_ (
    .A(EDB[0]),
    .Y(_007_)
  );
  NOT _307_ (
    .A(EDB[1]),
    .Y(_008_)
  );
  NOT _308_ (
    .A(EDB[2]),
    .Y(_009_)
  );
  NOT _309_ (
    .A(EDB[3]),
    .Y(_010_)
  );
  NOT _310_ (
    .A(EDB[4]),
    .Y(_011_)
  );
  NOT _311_ (
    .A(EDB[5]),
    .Y(_012_)
  );
  NOT _312_ (
    .A(EDB[6]),
    .Y(_013_)
  );
  NOT _313_ (
    .A(EDB[7]),
    .Y(_014_)
  );
  NOR _314_ (
    .A(muxCTRL[2]),
    .B(muxCTRL[1]),
    .Y(_015_)
  );
  NOR _315_ (
    .A(_003_),
    .B(_015_),
    .Y(_016_)
  );
  NOR _316_ (
    .A(_006_),
    .B(_016_),
    .Y(_001_)
  );
  NAND _317_ (
    .A(_004_),
    .B(_005_),
    .Y(_017_)
  );
  NAND _318_ (
    .A(_002_),
    .B(_003_),
    .Y(_018_)
  );
  NOR _319_ (
    .A(_017_),
    .B(_018_),
    .Y(_019_)
  );
  NAND _320_ (
    .A(TLP[0]),
    .B(_019_),
    .Y(_020_)
  );
  NAND _321_ (
    .A(_002_),
    .B(muxCTRL[3]),
    .Y(_021_)
  );
  NOR _322_ (
    .A(_017_),
    .B(_021_),
    .Y(_022_)
  );
  NAND _323_ (
    .A(FTS[0]),
    .B(_022_),
    .Y(_023_)
  );
  NAND _324_ (
    .A(muxCTRL[0]),
    .B(_005_),
    .Y(_024_)
  );
  NOR _325_ (
    .A(_018_),
    .B(_024_),
    .Y(_025_)
  );
  NAND _326_ (
    .A(COM[0]),
    .B(_025_),
    .Y(_026_)
  );
  NOR _327_ (
    .A(_021_),
    .B(_024_),
    .Y(_027_)
  );
  NAND _328_ (
    .A(IDL[0]),
    .B(_027_),
    .Y(_028_)
  );
  NAND _329_ (
    .A(muxCTRL[2]),
    .B(_003_),
    .Y(_029_)
  );
  NOT _330_ (
    .A(_029_),
    .Y(_030_)
  );
  NAND _331_ (
    .A(muxCTRL[0]),
    .B(muxCTRL[1]),
    .Y(_031_)
  );
  NOT _332_ (
    .A(_031_),
    .Y(_032_)
  );
  NAND _333_ (
    .A(_030_),
    .B(_032_),
    .Y(_033_)
  );
  NOR _334_ (
    .A(_007_),
    .B(_033_),
    .Y(_034_)
  );
  NOR _335_ (
    .A(_017_),
    .B(_029_),
    .Y(_035_)
  );
  NAND _336_ (
    .A(STP[0]),
    .B(_035_),
    .Y(_036_)
  );
  NOR _337_ (
    .A(_018_),
    .B(_031_),
    .Y(_037_)
  );
  NAND _338_ (
    .A(SKP[0]),
    .B(_037_),
    .Y(_038_)
  );
  NAND _339_ (
    .A(muxOUT[0]),
    .B(_016_),
    .Y(_039_)
  );
  NAND _340_ (
    .A(_004_),
    .B(muxCTRL[1]),
    .Y(_040_)
  );
  NOR _341_ (
    .A(_018_),
    .B(_040_),
    .Y(_041_)
  );
  NAND _342_ (
    .A(PAD[0]),
    .B(_041_),
    .Y(_042_)
  );
  NOR _343_ (
    .A(_029_),
    .B(_040_),
    .Y(_043_)
  );
  NAND _344_ (
    .A(END[0]),
    .B(_043_),
    .Y(_044_)
  );
  NOR _345_ (
    .A(_024_),
    .B(_029_),
    .Y(_045_)
  );
  NAND _346_ (
    .A(SDP[0]),
    .B(_045_),
    .Y(_046_)
  );
  NAND _347_ (
    .A(_023_),
    .B(_044_),
    .Y(_047_)
  );
  NAND _348_ (
    .A(_020_),
    .B(_039_),
    .Y(_048_)
  );
  NOR _349_ (
    .A(_047_),
    .B(_048_),
    .Y(_049_)
  );
  NOT _350_ (
    .A(_049_),
    .Y(_050_)
  );
  NAND _351_ (
    .A(_036_),
    .B(_046_),
    .Y(_051_)
  );
  NAND _352_ (
    .A(_026_),
    .B(_038_),
    .Y(_052_)
  );
  NOR _353_ (
    .A(_051_),
    .B(_052_),
    .Y(_053_)
  );
  NAND _354_ (
    .A(_028_),
    .B(_042_),
    .Y(_054_)
  );
  NOR _355_ (
    .A(_034_),
    .B(_054_),
    .Y(_055_)
  );
  NAND _356_ (
    .A(_053_),
    .B(_055_),
    .Y(_056_)
  );
  NOR _357_ (
    .A(_050_),
    .B(_056_),
    .Y(_057_)
  );
  NOR _358_ (
    .A(_006_),
    .B(_057_),
    .Y(_000_[0])
  );
  NAND _359_ (
    .A(COM[1]),
    .B(_025_),
    .Y(_058_)
  );
  NAND _360_ (
    .A(FTS[1]),
    .B(_022_),
    .Y(_059_)
  );
  NAND _361_ (
    .A(PAD[1]),
    .B(_041_),
    .Y(_060_)
  );
  NAND _362_ (
    .A(IDL[1]),
    .B(_027_),
    .Y(_061_)
  );
  NOR _363_ (
    .A(_008_),
    .B(_033_),
    .Y(_062_)
  );
  NAND _364_ (
    .A(STP[1]),
    .B(_035_),
    .Y(_063_)
  );
  NAND _365_ (
    .A(SKP[1]),
    .B(_037_),
    .Y(_064_)
  );
  NAND _366_ (
    .A(muxOUT[1]),
    .B(_016_),
    .Y(_065_)
  );
  NAND _367_ (
    .A(TLP[1]),
    .B(_019_),
    .Y(_066_)
  );
  NAND _368_ (
    .A(END[1]),
    .B(_043_),
    .Y(_067_)
  );
  NAND _369_ (
    .A(SDP[1]),
    .B(_045_),
    .Y(_068_)
  );
  NAND _370_ (
    .A(_059_),
    .B(_067_),
    .Y(_069_)
  );
  NAND _371_ (
    .A(_058_),
    .B(_065_),
    .Y(_070_)
  );
  NOR _372_ (
    .A(_069_),
    .B(_070_),
    .Y(_071_)
  );
  NOT _373_ (
    .A(_071_),
    .Y(_072_)
  );
  NAND _374_ (
    .A(_063_),
    .B(_068_),
    .Y(_073_)
  );
  NAND _375_ (
    .A(_060_),
    .B(_064_),
    .Y(_074_)
  );
  NOR _376_ (
    .A(_073_),
    .B(_074_),
    .Y(_075_)
  );
  NAND _377_ (
    .A(_061_),
    .B(_066_),
    .Y(_076_)
  );
  NOR _378_ (
    .A(_062_),
    .B(_076_),
    .Y(_077_)
  );
  NAND _379_ (
    .A(_075_),
    .B(_077_),
    .Y(_078_)
  );
  NOR _380_ (
    .A(_072_),
    .B(_078_),
    .Y(_079_)
  );
  NOR _381_ (
    .A(_006_),
    .B(_079_),
    .Y(_000_[1])
  );
  NAND _382_ (
    .A(TLP[2]),
    .B(_019_),
    .Y(_080_)
  );
  NAND _383_ (
    .A(FTS[2]),
    .B(_022_),
    .Y(_081_)
  );
  NAND _384_ (
    .A(PAD[2]),
    .B(_041_),
    .Y(_082_)
  );
  NAND _385_ (
    .A(IDL[2]),
    .B(_027_),
    .Y(_083_)
  );
  NOR _386_ (
    .A(_009_),
    .B(_033_),
    .Y(_084_)
  );
  NAND _387_ (
    .A(SDP[2]),
    .B(_045_),
    .Y(_085_)
  );
  NAND _388_ (
    .A(STP[2]),
    .B(_035_),
    .Y(_086_)
  );
  NAND _389_ (
    .A(muxOUT[2]),
    .B(_016_),
    .Y(_087_)
  );
  NAND _390_ (
    .A(COM[2]),
    .B(_025_),
    .Y(_088_)
  );
  NAND _391_ (
    .A(END[2]),
    .B(_043_),
    .Y(_089_)
  );
  NAND _392_ (
    .A(SKP[2]),
    .B(_037_),
    .Y(_090_)
  );
  NAND _393_ (
    .A(_081_),
    .B(_089_),
    .Y(_091_)
  );
  NAND _394_ (
    .A(_080_),
    .B(_087_),
    .Y(_092_)
  );
  NOR _395_ (
    .A(_091_),
    .B(_092_),
    .Y(_093_)
  );
  NOT _396_ (
    .A(_093_),
    .Y(_094_)
  );
  NAND _397_ (
    .A(_085_),
    .B(_090_),
    .Y(_095_)
  );
  NAND _398_ (
    .A(_082_),
    .B(_086_),
    .Y(_096_)
  );
  NOR _399_ (
    .A(_095_),
    .B(_096_),
    .Y(_097_)
  );
  NAND _400_ (
    .A(_083_),
    .B(_088_),
    .Y(_098_)
  );
  NOR _401_ (
    .A(_084_),
    .B(_098_),
    .Y(_099_)
  );
  NAND _402_ (
    .A(_097_),
    .B(_099_),
    .Y(_100_)
  );
  NOR _403_ (
    .A(_094_),
    .B(_100_),
    .Y(_101_)
  );
  NOR _404_ (
    .A(_006_),
    .B(_101_),
    .Y(_000_[2])
  );
  NAND _405_ (
    .A(COM[3]),
    .B(_025_),
    .Y(_102_)
  );
  NAND _406_ (
    .A(FTS[3]),
    .B(_022_),
    .Y(_103_)
  );
  NAND _407_ (
    .A(PAD[3]),
    .B(_041_),
    .Y(_104_)
  );
  NAND _408_ (
    .A(IDL[3]),
    .B(_027_),
    .Y(_105_)
  );
  NOR _409_ (
    .A(_010_),
    .B(_033_),
    .Y(_106_)
  );
  NAND _410_ (
    .A(STP[3]),
    .B(_035_),
    .Y(_107_)
  );
  NAND _411_ (
    .A(SKP[3]),
    .B(_037_),
    .Y(_108_)
  );
  NAND _412_ (
    .A(muxOUT[3]),
    .B(_016_),
    .Y(_109_)
  );
  NAND _413_ (
    .A(TLP[3]),
    .B(_019_),
    .Y(_110_)
  );
  NAND _414_ (
    .A(END[3]),
    .B(_043_),
    .Y(_111_)
  );
  NAND _415_ (
    .A(SDP[3]),
    .B(_045_),
    .Y(_112_)
  );
  NAND _416_ (
    .A(_103_),
    .B(_111_),
    .Y(_113_)
  );
  NAND _417_ (
    .A(_102_),
    .B(_109_),
    .Y(_114_)
  );
  NOR _418_ (
    .A(_113_),
    .B(_114_),
    .Y(_115_)
  );
  NOT _419_ (
    .A(_115_),
    .Y(_116_)
  );
  NAND _420_ (
    .A(_107_),
    .B(_112_),
    .Y(_117_)
  );
  NAND _421_ (
    .A(_104_),
    .B(_108_),
    .Y(_118_)
  );
  NOR _422_ (
    .A(_117_),
    .B(_118_),
    .Y(_119_)
  );
  NAND _423_ (
    .A(_105_),
    .B(_110_),
    .Y(_120_)
  );
  NOR _424_ (
    .A(_106_),
    .B(_120_),
    .Y(_121_)
  );
  NAND _425_ (
    .A(_119_),
    .B(_121_),
    .Y(_122_)
  );
  NOR _426_ (
    .A(_116_),
    .B(_122_),
    .Y(_123_)
  );
  NOR _427_ (
    .A(_006_),
    .B(_123_),
    .Y(_000_[3])
  );
  NAND _428_ (
    .A(COM[4]),
    .B(_025_),
    .Y(_124_)
  );
  NAND _429_ (
    .A(FTS[4]),
    .B(_022_),
    .Y(_125_)
  );
  NAND _430_ (
    .A(TLP[4]),
    .B(_019_),
    .Y(_126_)
  );
  always @(posedge muxCLK)
      muxOUT[0] <= _000_[0];
  always @(posedge muxCLK)
      muxOUT[1] <= _000_[1];
  always @(posedge muxCLK)
      muxOUT[2] <= _000_[2];
  always @(posedge muxCLK)
      muxOUT[3] <= _000_[3];
  always @(posedge muxCLK)
      muxOUT[4] <= _000_[4];
  always @(posedge muxCLK)
      muxOUT[5] <= _000_[5];
  always @(posedge muxCLK)
      muxOUT[6] <= _000_[6];
  always @(posedge muxCLK)
      muxOUT[7] <= _000_[7];
  always @(posedge muxCLK)
      muxVLD <= _001_;
endmodule

module mux4a1_synth(In0, In1, In2, In3, Sel, ENB, outmux);
  input ENB;
  input [7:0] In0;
  input [7:0] In1;
  input [7:0] In2;
  input [7:0] In3;
  input [1:0] Sel;
  output [7:0] outmux;
  assign outmux = 8'h00;
endmodule

module mux_ctr_synth(valid_count, CLK, reset, CTR);
  input CLK;
  output [2:0] CTR;
  input reset;
  input valid_count;
  assign CTR = 3'h7;
endmodule

module mux_p2s_synth(sel, data_in, data_out);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  input [7:0] data_in;
  output data_out;
  input [2:0] sel;
  NOT _23_ (
    .A(sel[1]),
    .Y(_00_)
  );
  NOT _24_ (
    .A(sel[2]),
    .Y(_01_)
  );
  NOT _25_ (
    .A(sel[0]),
    .Y(_02_)
  );
  NAND _26_ (
    .A(sel[2]),
    .B(data_in[7]),
    .Y(_03_)
  );
  NAND _27_ (
    .A(_01_),
    .B(data_in[3]),
    .Y(_04_)
  );
  NAND _28_ (
    .A(_03_),
    .B(_04_),
    .Y(_05_)
  );
  NAND _29_ (
    .A(sel[0]),
    .B(_05_),
    .Y(_06_)
  );
  NOR _30_ (
    .A(sel[2]),
    .B(data_in[2]),
    .Y(_07_)
  );
  NOR _31_ (
    .A(_01_),
    .B(data_in[6]),
    .Y(_08_)
  );
  NOR _32_ (
    .A(_07_),
    .B(_08_),
    .Y(_09_)
  );
  NAND _33_ (
    .A(_02_),
    .B(_09_),
    .Y(_10_)
  );
  NAND _34_ (
    .A(_06_),
    .B(_10_),
    .Y(_11_)
  );
  NAND _35_ (
    .A(sel[1]),
    .B(_11_),
    .Y(_12_)
  );
  NAND _36_ (
    .A(_01_),
    .B(data_in[1]),
    .Y(_13_)
  );
  NAND _37_ (
    .A(sel[2]),
    .B(data_in[5]),
    .Y(_14_)
  );
  NAND _38_ (
    .A(_13_),
    .B(_14_),
    .Y(_15_)
  );
  NAND _39_ (
    .A(sel[0]),
    .B(_15_),
    .Y(_16_)
  );
  NOR _40_ (
    .A(sel[2]),
    .B(data_in[0]),
    .Y(_17_)
  );
  NOR _41_ (
    .A(_01_),
    .B(data_in[4]),
    .Y(_18_)
  );
  NOR _42_ (
    .A(_17_),
    .B(_18_),
    .Y(_19_)
  );
  NAND _43_ (
    .A(_02_),
    .B(_19_),
    .Y(_20_)
  );
  NAND _44_ (
    .A(_16_),
    .B(_20_),
    .Y(_21_)
  );
  NAND _45_ (
    .A(_00_),
    .B(_21_),
    .Y(_22_)
  );
  NAND _46_ (
    .A(_12_),
    .B(_22_),
    .Y(data_out)
  );
endmodule

module p2s_synth(IN_CLK_p2s, IN_LANE3_p2s, IN_LANE2_p2s, IN_LANE1_p2s, IN_LANE0_p2s, IN_CTR_p2s, IN_ENB_p2s, IN_VALID_BS, OUT_LANE_p2s);
  input IN_CLK_p2s;
  input [2:0] IN_CTR_p2s;
  input IN_ENB_p2s;
  input [7:0] IN_LANE0_p2s;
  input [7:0] IN_LANE1_p2s;
  input [7:0] IN_LANE2_p2s;
  input [7:0] IN_LANE3_p2s;
  input IN_VALID_BS;
  output [3:0] OUT_LANE_p2s;
  wire [7:0] Q0_p2s;
  wire [7:0] Q1_p2s;
  wire [7:0] Q2_p2s;
  wire [7:0] Q3_p2s;
  wire valid_ffd;
  ffd_p2s_synth \ffd_lane0[0]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE0_p2s[0]),
    .ENB(IN_ENB_p2s),
    .Q(Q0_p2s[0]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane0[1]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE0_p2s[1]),
    .ENB(IN_ENB_p2s),
    .Q(Q0_p2s[1]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane0[2]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE0_p2s[2]),
    .ENB(IN_ENB_p2s),
    .Q(Q0_p2s[2]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane0[3]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE0_p2s[3]),
    .ENB(IN_ENB_p2s),
    .Q(Q0_p2s[3]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane0[4]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE0_p2s[4]),
    .ENB(IN_ENB_p2s),
    .Q(Q0_p2s[4]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane0[5]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE0_p2s[5]),
    .ENB(IN_ENB_p2s),
    .Q(Q0_p2s[5]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane0[6]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE0_p2s[6]),
    .ENB(IN_ENB_p2s),
    .Q(Q0_p2s[6]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane0[7]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE0_p2s[7]),
    .ENB(IN_ENB_p2s),
    .Q(Q0_p2s[7]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane1[0]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE1_p2s[0]),
    .ENB(IN_ENB_p2s),
    .Q(Q1_p2s[0]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane1[1]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE1_p2s[1]),
    .ENB(IN_ENB_p2s),
    .Q(Q1_p2s[1]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane1[2]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE1_p2s[2]),
    .ENB(IN_ENB_p2s),
    .Q(Q1_p2s[2]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane1[3]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE1_p2s[3]),
    .ENB(IN_ENB_p2s),
    .Q(Q1_p2s[3]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane1[4]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE1_p2s[4]),
    .ENB(IN_ENB_p2s),
    .Q(Q1_p2s[4]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane1[5]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE1_p2s[5]),
    .ENB(IN_ENB_p2s),
    .Q(Q1_p2s[5]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane1[6]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE1_p2s[6]),
    .ENB(IN_ENB_p2s),
    .Q(Q1_p2s[6]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane1[7]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE1_p2s[7]),
    .ENB(IN_ENB_p2s),
    .Q(Q1_p2s[7]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane2[0]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE2_p2s[0]),
    .ENB(IN_ENB_p2s),
    .Q(Q2_p2s[0]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane2[1]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE2_p2s[1]),
    .ENB(IN_ENB_p2s),
    .Q(Q2_p2s[1]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane2[2]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE2_p2s[2]),
    .ENB(IN_ENB_p2s),
    .Q(Q2_p2s[2]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane2[3]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE2_p2s[3]),
    .ENB(IN_ENB_p2s),
    .Q(Q2_p2s[3]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane2[4]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE2_p2s[4]),
    .ENB(IN_ENB_p2s),
    .Q(Q2_p2s[4]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane2[5]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE2_p2s[5]),
    .ENB(IN_ENB_p2s),
    .Q(Q2_p2s[5]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane2[6]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE2_p2s[6]),
    .ENB(IN_ENB_p2s),
    .Q(Q2_p2s[6]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane2[7]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE2_p2s[7]),
    .ENB(IN_ENB_p2s),
    .Q(Q2_p2s[7]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane3[0]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE3_p2s[0]),
    .ENB(IN_ENB_p2s),
    .Q(Q3_p2s[0]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane3[1]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE3_p2s[1]),
    .ENB(IN_ENB_p2s),
    .Q(Q3_p2s[1]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane3[2]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE3_p2s[2]),
    .ENB(IN_ENB_p2s),
    .Q(Q3_p2s[2]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane3[3]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE3_p2s[3]),
    .ENB(IN_ENB_p2s),
    .Q(Q3_p2s[3]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane3[4]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE3_p2s[4]),
    .ENB(IN_ENB_p2s),
    .Q(Q3_p2s[4]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane3[5]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE3_p2s[5]),
    .ENB(IN_ENB_p2s),
    .Q(Q3_p2s[5]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth \ffd_lane3[6]  (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE3_p2s[6]),
    .ENB(IN_ENB_p2s),
    .Q(Q3_p2s[6]),
    .valid_in(IN_VALID_BS)
  );
  ffd_p2s_synth ffd_valid (
    .CLK(IN_CLK_p2s),
    .D(IN_LANE3_p2s[7]),
    .ENB(IN_ENB_p2s),
    .Q(Q3_p2s[7]),
    .valid_in(IN_VALID_BS),
    .valid_out(valid_ffd)
  );
  mux_p2s_synth mux_lane0 (
    .data_in(Q0_p2s),
    .data_out(OUT_LANE_p2s[0]),
    .sel(IN_CTR_p2s)
  );
  mux_p2s_synth mux_lane1 (
    .data_in(Q1_p2s),
    .data_out(OUT_LANE_p2s[1]),
    .sel(IN_CTR_p2s)
  );
  mux_p2s_synth mux_lane2 (
    .data_in(Q2_p2s),
    .data_out(OUT_LANE_p2s[2]),
    .sel(IN_CTR_p2s)
  );
  mux_p2s_synth mux_lane3 (
    .data_in(Q3_p2s),
    .data_out(OUT_LANE_p2s[3]),
    .sel(IN_CTR_p2s)
  );
endmodule

module p2s_s2p_synth(IN_CLK_2MHz, IN_CLK_250KHz, IN_LANE3, IN_LANE2, IN_LANE1, IN_LANE0, IN_ENB_TX, IN_RESET_TX, IN_VALID_TX, IN_ENB_RX, IN_RESET_RX, OUT_LANE3, OUT_LANE2, OUT_LANE1, OUT_LANE0);
  wire [1:0] CLK_RX;
  wire [2:0] CTR_TX;
  input IN_CLK_250KHz;
  input IN_CLK_2MHz;
  input IN_ENB_RX;
  input IN_ENB_TX;
  input [7:0] IN_LANE0;
  input [7:0] IN_LANE1;
  input [7:0] IN_LANE2;
  input [7:0] IN_LANE3;
  input IN_RESET_RX;
  input IN_RESET_TX;
  input IN_VALID_TX;
  wire [3:0] LANE;
  output [7:0] OUT_LANE0;
  output [7:0] OUT_LANE1;
  output [7:0] OUT_LANE2;
  output [7:0] OUT_LANE3;
  mux_ctr_synth ctr_tx_cond (
    .CLK(IN_CLK_2MHz),
    .CTR(CTR_TX),
    .reset(IN_RESET_TX),
    .valid_count(IN_VALID_TX)
  );
  s2p_synth low_rx_cond (
    .IN_CLK_s2p({ IN_CLK_250KHz, IN_CLK_2MHz }),
    .IN_DIR_s2p(1'h1),
    .IN_ENB_s2p(IN_ENB_RX),
    .IN_LANE_s2p(LANE),
    .IN_MODO_s2p(2'h0),
    .IN_RESET_s2p(IN_RESET_RX),
    .OUT_LANE0_s2p(OUT_LANE0),
    .OUT_LANE1_s2p(OUT_LANE1),
    .OUT_LANE2_s2p(OUT_LANE2),
    .OUT_LANE3_s2p(OUT_LANE3)
  );
  p2s_synth low_tx_cond (
    .IN_CLK_p2s(IN_CLK_2MHz),
    .IN_CTR_p2s(CTR_TX),
    .IN_ENB_p2s(IN_ENB_TX),
    .IN_LANE0_p2s(IN_LANE0),
    .IN_LANE1_p2s(IN_LANE1),
    .IN_LANE2_p2s(IN_LANE2),
    .IN_LANE3_p2s(IN_LANE3),
    .IN_VALID_BS(IN_VALID_TX),
    .OUT_LANE_p2s(LANE)
  );
  assign CLK_RX = { IN_CLK_250KHz, IN_CLK_2MHz };
endmodule

module pcie_synth(IN_COM, IN_PAD, IN_SKP, IN_STP, IN_SDP, IN_END, IN_EDB, IN_FTS, IN_IDL, IN_TLP, IN_CTRL, IN_CLK_2MHz, CLK_1MHz, CLK_500KHz, CLK_250KHz, IN_RESET_CLK, IN_ENB_TX_RX, OUT_DATA);
  input CLK_1MHz;
  input CLK_250KHz;
  input CLK_500KHz;
  input IN_CLK_2MHz;
  input [7:0] IN_COM;
  input [3:0] IN_CTRL;
  input [7:0] IN_EDB;
  input IN_ENB_TX_RX;
  input [7:0] IN_END;
  input [7:0] IN_FTS;
  input [7:0] IN_IDL;
  input [7:0] IN_PAD;
  input IN_RESET_CLK;
  input [7:0] IN_SDP;
  input [7:0] IN_SKP;
  input [7:0] IN_STP;
  input [7:0] IN_TLP;
  output [7:0] OUT_DATA;
endmodule

module s2p_synth(IN_CLK_s2p, IN_LANE_s2p, IN_MODO_s2p, IN_DIR_s2p, IN_ENB_s2p, IN_RESET_s2p, OUT_LANE3_s2p, OUT_LANE2_s2p, OUT_LANE1_s2p, OUT_LANE0_s2p);
  input [1:0] IN_CLK_s2p;
  input IN_DIR_s2p;
  input IN_ENB_s2p;
  input [3:0] IN_LANE_s2p;
  input [1:0] IN_MODO_s2p;
  input IN_RESET_s2p;
  output [7:0] OUT_LANE0_s2p;
  output [7:0] OUT_LANE1_s2p;
  output [7:0] OUT_LANE2_s2p;
  output [7:0] OUT_LANE3_s2p;
  s2p_reg_synth reg_lane0 (
    .CLK(IN_CLK_s2p[0]),
    .DIR(IN_DIR_s2p),
    .ENB(IN_ENB_s2p),
    .MODO(IN_MODO_s2p),
    .Q(OUT_LANE0_s2p),
    .RESET(IN_RESET_s2p),
    .S_IN(IN_LANE_s2p[0])
  );
  s2p_reg_synth reg_lane1 (
    .CLK(IN_CLK_s2p[0]),
    .DIR(IN_DIR_s2p),
    .ENB(IN_ENB_s2p),
    .MODO(IN_MODO_s2p),
    .Q(OUT_LANE1_s2p),
    .RESET(IN_RESET_s2p),
    .S_IN(IN_LANE_s2p[1])
  );
  s2p_reg_synth reg_lane2 (
    .CLK(IN_CLK_s2p[0]),
    .DIR(IN_DIR_s2p),
    .ENB(IN_ENB_s2p),
    .MODO(IN_MODO_s2p),
    .Q(OUT_LANE2_s2p),
    .RESET(IN_RESET_s2p),
    .S_IN(IN_LANE_s2p[2])
  );
  s2p_reg_synth reg_lane3 (
    .CLK(IN_CLK_s2p[0]),
    .DIR(IN_DIR_s2p),
    .ENB(IN_ENB_s2p),
    .MODO(IN_MODO_s2p),
    .Q(OUT_LANE3_s2p),
    .RESET(IN_RESET_s2p),
    .S_IN(IN_LANE_s2p[3])
  );
endmodule

module s2p_reg_synth(D, MODO, CLK, ENB, DIR, S_IN, RESET, Q, S_OUT);
  input CLK;
  input [7:0] D;
  input DIR;
  input ENB;
  input [1:0] MODO;
  output [7:0] Q;
  input RESET;
  input S_IN;
  output S_OUT;
  assign Q = 8'h00;
  assign S_OUT = 1'h0;
endmodule
