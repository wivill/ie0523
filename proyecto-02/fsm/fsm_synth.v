/* Generated by Yosys 0.7 (git sha1 61f6811, gcc 5.4.0-6ubuntu1~16.04.4 -O2 -fstack-protector-strong -fPIC -Os) */

(* top =  1  *)
(* src = "fsm_synth.v:1" *)
module fsm_synth(CLK, sReset, sInit, sEmpty, sFull, sPause, sContinue, oInit, oIdle, oError, stbPause, stbContinue, State, nState);
  (* src = "fsm_synth.v:156" *)
  wire [3:0] _000_;
  (* src = "fsm_synth.v:156" *)
  wire [3:0] _001_;
  (* src = "fsm_synth.v:156" *)
  wire _002_;
  (* src = "fsm_synth.v:156" *)
  wire _003_;
  (* src = "fsm_synth.v:156" *)
  wire [3:0] _004_;
  (* src = "fsm_synth.v:146" *)
  wire [7:0] _005_;
  (* src = "fsm_synth.v:156" *)
  wire [3:0] _006_;
  (* src = "fsm_synth.v:156" *)
  wire [3:0] _007_;
  (* src = "fsm_synth.v:37" *)
  wire [7:0] _008_;
  (* src = "fsm_synth.v:37" *)
  wire [7:0] _009_;
  (* src = "fsm_synth.v:37" *)
  wire [7:0] _010_;
  (* src = "fsm_synth.v:37" *)
  wire [7:0] _011_;
  (* src = "fsm_synth.v:37" *)
  wire [7:0] _012_;
  (* src = "fsm_synth.v:37" *)
  wire [7:0] _013_;
  (* src = "fsm_synth.v:37" *)
  wire [7:0] _014_;
  (* src = "fsm_synth.v:37" *)
  wire [7:0] _015_;
  (* src = "fsm_synth.v:37" *)
  wire [7:0] _016_;
  wire _017_;
  wire [3:0] _018_;
  wire [1:0] _019_;
  wire [3:0] _020_;
  wire [1:0] _021_;
  wire [2:0] _022_;
  wire _023_;
  wire [2:0] _024_;
  wire _025_;
  wire [2:0] _026_;
  wire _027_;
  wire [2:0] _028_;
  wire _029_;
  wire [2:0] _030_;
  wire _031_;
  wire [2:0] _032_;
  wire [2:0] _033_;
  wire [2:0] _034_;
  wire _035_;
  wire [1:0] _036_;
  wire [1:0] _037_;
  wire [1:0] _038_;
  wire [1:0] _039_;
  wire [1:0] _040_;
  wire [1:0] _041_;
  wire [1:0] _042_;
  wire [3:0] _043_;
  wire [1:0] _044_;
  wire [3:0] _045_;
  wire [1:0] _046_;
  wire [3:0] _047_;
  wire [1:0] _048_;
  wire [3:0] _049_;
  wire [1:0] _050_;
  wire [3:0] _051_;
  wire [1:0] _052_;
  wire [3:0] _053_;
  wire [1:0] _054_;
  wire _055_;
  wire [3:0] _056_;
  wire [1:0] _057_;
  wire [3:0] _058_;
  wire [1:0] _059_;
  wire [3:0] _060_;
  wire [1:0] _061_;
  wire [3:0] _062_;
  wire [1:0] _063_;
  wire [3:0] _064_;
  wire [1:0] _065_;
  wire _066_;
  wire [3:0] _067_;
  wire [3:0] _068_;
  wire [3:0] _069_;
  wire [7:0] _070_;
  wire [7:0] _071_;
  wire [7:0] _072_;
  wire [7:0] _073_;
  wire [7:0] _074_;
  wire [7:0] _075_;
  wire [7:0] _076_;
  wire [7:0] _077_;
  wire [7:0] _078_;
  wire [7:0] _079_;
  wire [7:0] _080_;
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
  (* src = "fsm_synth.v:103" *)
  wire _094_;
  (* src = "fsm_synth.v:103" *)
  wire _095_;
  (* src = "fsm_synth.v:238" *)
  wire _096_;
  (* src = "fsm_synth.v:101" *)
  wire _097_;
  (* src = "fsm_synth.v:103" *)
  wire _098_;
  (* src = "fsm_synth.v:238" *)
  wire _099_;
  (* src = "fsm_synth.v:174|<techmap.v>:432" *)
  wire [7:0] _100_;
  (* src = "fsm_synth.v:174|<techmap.v>:428" *)
  wire [3:0] _101_;
  wire [3:0] _102_;
  wire _103_;
  wire [3:0] _104_;
  wire _105_;
  wire [3:0] _106_;
  (* src = "fsm_synth.v:174|<techmap.v>:432" *)
  wire [7:0] _107_;
  (* src = "fsm_synth.v:174|<techmap.v>:428" *)
  wire [3:0] _108_;
  wire [3:0] _109_;
  wire [3:0] _110_;
  wire _111_;
  wire [3:0] _112_;
  wire [3:0] _113_;
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
  (* src = "fsm_synth.v:38|<techmap.v>:432" *)
  wire [47:0] _124_;
  (* src = "fsm_synth.v:38|<techmap.v>:428" *)
  wire [7:0] _125_;
  wire [3:0] _126_;
  (* src = "fsm_synth.v:101" *)
  wire _127_;
  (* src = "fsm_synth.v:103" *)
  wire _128_;
  (* src = "fsm_synth.v:174|<techmap.v>:445" *)
  wire _129_;
  (* src = "fsm_synth.v:174|<techmap.v>:445" *)
  wire _130_;
  (* src = "fsm_synth.v:38|<techmap.v>:445" *)
  wire _131_;
  (* src = "fsm_synth.v:3" *)
  input CLK;
  (* src = "fsm_synth.v:18" *)
  output [7:0] State;
  (* src = "fsm_synth.v:22" *)
  reg [3:0] continuar;
  (* src = "fsm_synth.v:18" *)
  output [7:0] nState;
  (* src = "fsm_synth.v:23" *)
  wire [7:0] nextState;
  (* src = "fsm_synth.v:14" *)
  output [3:0] oError;
  reg [3:0] oError;
  (* src = "fsm_synth.v:13" *)
  output oIdle;
  reg oIdle;
  (* src = "fsm_synth.v:12" *)
  output oInit;
  reg oInit;
  (* src = "fsm_synth.v:22" *)
  reg [3:0] pausa;
  (* src = "fsm_synth.v:9" *)
  input [3:0] sContinue;
  (* src = "fsm_synth.v:6" *)
  input [3:0] sEmpty;
  (* src = "fsm_synth.v:7" *)
  input [3:0] sFull;
  (* src = "fsm_synth.v:5" *)
  input sInit;
  (* src = "fsm_synth.v:8" *)
  input [3:0] sPause;
  (* src = "fsm_synth.v:4" *)
  input sReset;
  (* src = "fsm_synth.v:23" *)
  wire [7:0] state;
  (* src = "fsm_synth.v:16" *)
  output [3:0] stbContinue;
  reg [3:0] stbContinue;
  (* src = "fsm_synth.v:15" *)
  output [3:0] stbPause;
  reg [3:0] stbPause;
  assign _018_[1] = _080_[2] |(* src = "fsm_synth.v:38" *)  state[3];
  assign _019_[0] = state[1] |(* src = "fsm_synth.v:38" *)  _018_[1];
  assign _081_ = _019_[0] |(* src = "fsm_synth.v:38" *)  _019_[1];
  assign _021_[0] = _020_[0] |(* src = "fsm_synth.v:38" *)  _020_[1];
  assign _082_ = _021_[0] |(* src = "fsm_synth.v:38" *)  _019_[1];
  assign _108_[2] = _107_[2] |(* src = "fsm_synth.v:174|<techmap.v>:441" *)  _107_[6];
  assign _108_[3] = _107_[3] |(* src = "fsm_synth.v:174|<techmap.v>:441" *)  _107_[7];
  assign _108_[1] = _107_[1] |(* src = "fsm_synth.v:174|<techmap.v>:441" *)  _107_[5];
  assign _108_[0] = _107_[0] |(* src = "fsm_synth.v:174|<techmap.v>:441" *)  _107_[4];
  assign _130_ = _103_ |(* src = "fsm_synth.v:174|<techmap.v>:445" *)  _111_;
  assign _101_[1] = _100_[1] |(* src = "fsm_synth.v:174|<techmap.v>:441" *)  _100_[5];
  assign _129_ = _103_ |(* src = "fsm_synth.v:174|<techmap.v>:445" *)  _105_;
  assign _101_[2] = _100_[2] |(* src = "fsm_synth.v:174|<techmap.v>:441" *)  _100_[6];
  assign _101_[3] = _100_[3] |(* src = "fsm_synth.v:174|<techmap.v>:441" *)  _100_[7];
  assign _101_[0] = _100_[0] |(* src = "fsm_synth.v:174|<techmap.v>:441" *)  _100_[4];
  assign _023_ = _022_[0] |(* src = "fsm_synth.v:38|<techmap.v>:441" *)  _022_[1];
  assign _024_[0] = _124_[7] |(* src = "fsm_synth.v:38|<techmap.v>:441" *)  _124_[15];
  assign _025_ = _024_[0] |(* src = "fsm_synth.v:38|<techmap.v>:441" *)  _024_[1];
  assign _027_ = _026_[0] |(* src = "fsm_synth.v:38|<techmap.v>:441" *)  _026_[1];
  assign _029_ = _028_[0] |(* src = "fsm_synth.v:38|<techmap.v>:441" *)  _028_[1];
  assign _030_[1] = _124_[19] |(* src = "fsm_synth.v:38|<techmap.v>:441" *)  _124_[27];
  assign _031_ = _030_[0] |(* src = "fsm_synth.v:38|<techmap.v>:441" *)  _030_[1];
  assign _125_[2] = _032_[1] |(* src = "fsm_synth.v:38|<techmap.v>:441" *)  _032_[2];
  assign _033_[2] = _124_[33] |(* src = "fsm_synth.v:38|<techmap.v>:441" *)  _124_[41];
  assign _034_[0] = _116_ |(* src = "fsm_synth.v:38|<techmap.v>:445" *)  _017_;
  assign _034_[1] = _120_ |(* src = "fsm_synth.v:38|<techmap.v>:445" *)  _121_;
  assign _034_[2] = _122_ |(* src = "fsm_synth.v:38|<techmap.v>:445" *)  _123_;
  assign _035_ = _034_[0] |(* src = "fsm_synth.v:38|<techmap.v>:445" *)  _034_[1];
  assign _131_ = _035_ |(* src = "fsm_synth.v:38|<techmap.v>:445" *)  _034_[2];
  assign _036_[0] = sPause[3] |(* src = "fsm_synth.v:118" *)  sPause[2];
  assign _036_[1] = sPause[1] |(* src = "fsm_synth.v:118" *)  sPause[0];
  assign _128_ = _036_[0] |(* src = "fsm_synth.v:118" *)  _036_[1];
  assign _037_[0] = sContinue[3] |(* src = "fsm_synth.v:118" *)  sContinue[2];
  assign _037_[1] = sContinue[1] |(* src = "fsm_synth.v:118" *)  sContinue[0];
  assign _127_ = _037_[0] |(* src = "fsm_synth.v:118" *)  _037_[1];
  assign _038_[0] = sEmpty[3] &(* src = "fsm_synth.v:197" *)  sEmpty[2];
  assign _038_[1] = sEmpty[1] &(* src = "fsm_synth.v:197" *)  sEmpty[0];
  assign _013_[2] = _038_[0] &(* src = "fsm_synth.v:197" *)  _038_[1];
  assign _039_[0] = _067_[0] |(* src = "fsm_synth.v:209" *)  _067_[1];
  assign _039_[1] = _067_[2] |(* src = "fsm_synth.v:209" *)  _067_[3];
  assign _098_ = _039_[0] |(* src = "fsm_synth.v:209" *)  _039_[1];
  assign _040_[0] = _068_[0] |(* src = "fsm_synth.v:238" *)  _068_[1];
  assign _040_[1] = _068_[2] |(* src = "fsm_synth.v:238" *)  _068_[3];
  assign _097_ = _040_[0] |(* src = "fsm_synth.v:238" *)  _040_[1];
  assign _041_[0] = _069_[0] |(* src = "fsm_synth.v:238" *)  _069_[1];
  assign _041_[1] = _069_[2] |(* src = "fsm_synth.v:238" *)  _069_[3];
  assign _099_ = _041_[0] |(* src = "fsm_synth.v:238" *)  _041_[1];
  assign _042_[0] = sFull[3] |(* src = "fsm_synth.v:258" *)  sFull[2];
  assign _042_[1] = sFull[1] |(* src = "fsm_synth.v:258" *)  sFull[0];
  assign _011_[7] = _042_[0] |(* src = "fsm_synth.v:258" *)  _042_[1];
  assign _043_[2] = nextState[4] |(* src = "fsm_synth.v:174" *)  _070_[5];
  assign _044_[1] = _043_[2] |(* src = "fsm_synth.v:174" *)  _043_[3];
  assign _083_ = _044_[0] |(* src = "fsm_synth.v:174" *)  _044_[1];
  assign _045_[3] = _071_[6] |(* src = "fsm_synth.v:174" *)  nextState[7];
  assign _046_[1] = _045_[2] |(* src = "fsm_synth.v:174" *)  _045_[3];
  assign _084_ = _044_[0] |(* src = "fsm_synth.v:174" *)  _046_[1];
  assign _047_[2] = _072_[4] |(* src = "fsm_synth.v:174" *)  nextState[5];
  assign _048_[1] = _047_[2] |(* src = "fsm_synth.v:174" *)  _043_[3];
  assign _085_ = _044_[0] |(* src = "fsm_synth.v:174" *)  _048_[1];
  assign _049_[3] = nextState[6] |(* src = "fsm_synth.v:174" *)  _073_[7];
  assign _044_[0] = nextState[1] |(* src = "fsm_synth.v:174" *)  _043_[1];
  assign _050_[1] = _045_[2] |(* src = "fsm_synth.v:174" *)  _049_[3];
  assign _086_ = _044_[0] |(* src = "fsm_synth.v:174" *)  _050_[1];
  assign _051_[1] = _074_[2] |(* src = "fsm_synth.v:174" *)  nextState[3];
  assign _052_[0] = nextState[1] |(* src = "fsm_synth.v:174" *)  _051_[1];
  assign _087_ = _052_[0] |(* src = "fsm_synth.v:174" *)  _052_[1];
  assign _043_[1] = nextState[2] |(* src = "fsm_synth.v:174" *)  nextState[3];
  assign _045_[2] = nextState[4] |(* src = "fsm_synth.v:174" *)  nextState[5];
  assign _043_[3] = nextState[6] |(* src = "fsm_synth.v:174" *)  nextState[7];
  assign _054_[0] = _053_[0] |(* src = "fsm_synth.v:174" *)  _043_[1];
  assign _052_[1] = _045_[2] |(* src = "fsm_synth.v:174" *)  _043_[3];
  assign _088_ = _054_[0] |(* src = "fsm_synth.v:174" *)  _052_[1];
  assign _055_ = _119_ | _118_;
  assign _017_ = _055_ | _117_;
  assign _018_[2] = state[4] |(* src = "fsm_synth.v:38" *)  state[5];
  assign _056_[3] = state[6] |(* src = "fsm_synth.v:38" *)  _075_[7];
  assign _057_[1] = _018_[2] |(* src = "fsm_synth.v:38" *)  _056_[3];
  assign _089_ = _057_[0] |(* src = "fsm_synth.v:38" *)  _057_[1];
  assign _058_[3] = _076_[6] |(* src = "fsm_synth.v:38" *)  state[7];
  assign _059_[1] = _018_[2] |(* src = "fsm_synth.v:38" *)  _058_[3];
  assign _090_ = _057_[0] |(* src = "fsm_synth.v:38" *)  _059_[1];
  assign _060_[2] = state[4] |(* src = "fsm_synth.v:38" *)  _077_[5];
  assign _061_[1] = _060_[2] |(* src = "fsm_synth.v:38" *)  _018_[3];
  assign _091_ = _057_[0] |(* src = "fsm_synth.v:38" *)  _061_[1];
  assign _062_[2] = _078_[4] |(* src = "fsm_synth.v:38" *)  state[5];
  assign _063_[1] = _062_[2] |(* src = "fsm_synth.v:38" *)  _018_[3];
  assign _092_ = _057_[0] |(* src = "fsm_synth.v:38" *)  _063_[1];
  assign _064_[1] = state[2] |(* src = "fsm_synth.v:38" *)  _079_[3];
  assign _065_[0] = state[1] |(* src = "fsm_synth.v:38" *)  _064_[1];
  assign _019_[1] = _018_[2] |(* src = "fsm_synth.v:38" *)  _018_[3];
  assign _093_ = _065_[0] |(* src = "fsm_synth.v:38" *)  _019_[1];
  assign _020_[1] = state[2] |(* src = "fsm_synth.v:38" *)  state[3];
  assign _018_[3] = state[6] |(* src = "fsm_synth.v:38" *)  state[7];
  assign _057_[0] = state[1] |(* src = "fsm_synth.v:38" *)  _020_[1];
  assign _066_ = _057_[0] |(* src = "fsm_synth.v:38" *)  _019_[1];
  assign _121_ = ~(* src = "fsm_synth.v:38" *) _081_;
  assign _122_ = ~(* src = "fsm_synth.v:38" *) _082_;
  assign _123_ = ~(* src = "fsm_synth.v:38" *) _066_;
  assign _105_ = ~(* src = "fsm_synth.v:174" *) _083_;
  assign _103_ = ~(* src = "fsm_synth.v:174" *) _084_;
  assign _111_ = ~(* src = "fsm_synth.v:174" *) _085_;
  assign _116_ = ~(* src = "fsm_synth.v:38" *) _089_;
  assign _117_ = ~(* src = "fsm_synth.v:38" *) _090_;
  assign _118_ = ~(* src = "fsm_synth.v:38" *) _091_;
  assign _119_ = ~(* src = "fsm_synth.v:38" *) _092_;
  assign _120_ = ~(* src = "fsm_synth.v:38" *) _093_;
  assign _008_[4] = _128_ &(* src = "fsm_synth.v:114" *)  _098_;
  assign _009_[5] = _127_ &(* src = "fsm_synth.v:116" *)  _097_;
  assign _094_ = _128_ &(* src = "fsm_synth.v:118" *)  _127_;
  assign _095_ = _094_ &(* src = "fsm_synth.v:118" *)  _098_;
  assign _010_[6] = _095_ &(* src = "fsm_synth.v:118" *)  _097_;
  assign _096_ = _097_ &(* src = "fsm_synth.v:238" *)  _099_;
  assign _109_[0] = _130_ ? (* src = "fsm_synth.v:174|<techmap.v>:445" *) _108_[0] : 1'b0;
  assign _109_[1] = _130_ ? (* src = "fsm_synth.v:174|<techmap.v>:445" *) _108_[1] : 1'b0;
  assign _109_[2] = _130_ ? (* src = "fsm_synth.v:174|<techmap.v>:445" *) _108_[2] : 1'b0;
  assign _109_[3] = _130_ ? (* src = "fsm_synth.v:174|<techmap.v>:445" *) _108_[3] : 1'b0;
  assign _102_[0] = _129_ ? (* src = "fsm_synth.v:174|<techmap.v>:445" *) _101_[0] : 1'b0;
  assign _102_[1] = _129_ ? (* src = "fsm_synth.v:174|<techmap.v>:445" *) _101_[1] : 1'b0;
  assign _102_[2] = _129_ ? (* src = "fsm_synth.v:174|<techmap.v>:445" *) _101_[2] : 1'b0;
  assign _102_[3] = _129_ ? (* src = "fsm_synth.v:174|<techmap.v>:445" *) _101_[3] : 1'b0;
  assign nextState[1] = _131_ ? (* src = "fsm_synth.v:38|<techmap.v>:445" *) _033_[2] : 1'b1;
  assign nextState[2] = _131_ ? (* src = "fsm_synth.v:38|<techmap.v>:445" *) _125_[2] : 1'b0;
  assign nextState[3] = _131_ ? (* src = "fsm_synth.v:38|<techmap.v>:445" *) _031_ : 1'b0;
  assign nextState[4] = _131_ ? (* src = "fsm_synth.v:38|<techmap.v>:445" *) _029_ : 1'b0;
  assign nextState[5] = _131_ ? (* src = "fsm_synth.v:38|<techmap.v>:445" *) _027_ : 1'b0;
  assign nextState[6] = _131_ ? (* src = "fsm_synth.v:38|<techmap.v>:445" *) _023_ : 1'b0;
  assign nextState[7] = _131_ ? (* src = "fsm_synth.v:38|<techmap.v>:445" *) _025_ : 1'b0;
  assign _000_[0] = sReset ? (* src = "fsm_synth.v:157" *) sContinue[0] : 1'b0;
  assign _000_[1] = sReset ? (* src = "fsm_synth.v:157" *) sContinue[1] : 1'b0;
  assign _000_[2] = sReset ? (* src = "fsm_synth.v:157" *) sContinue[2] : 1'b0;
  assign _000_[3] = sReset ? (* src = "fsm_synth.v:157" *) sContinue[3] : 1'b0;
  assign _004_[0] = sReset ? (* src = "fsm_synth.v:157" *) sPause[0] : 1'b0;
  assign _004_[1] = sReset ? (* src = "fsm_synth.v:157" *) sPause[1] : 1'b0;
  assign _004_[2] = sReset ? (* src = "fsm_synth.v:157" *) sPause[2] : 1'b0;
  assign _004_[3] = sReset ? (* src = "fsm_synth.v:157" *) sPause[3] : 1'b0;
  assign _126_[0] = _096_ ? (* src = "fsm_synth.v:238" *) sContinue[0] : 1'b0;
  assign _126_[1] = _096_ ? (* src = "fsm_synth.v:238" *) sContinue[1] : 1'b0;
  assign _126_[2] = _096_ ? (* src = "fsm_synth.v:238" *) sContinue[2] : 1'b0;
  assign _126_[3] = _096_ ? (* src = "fsm_synth.v:238" *) sContinue[3] : 1'b0;
  assign _104_[0] = _097_ ? (* src = "fsm_synth.v:224" *) sContinue[0] : 1'b0;
  assign _104_[1] = _097_ ? (* src = "fsm_synth.v:224" *) sContinue[1] : 1'b0;
  assign _104_[2] = _097_ ? (* src = "fsm_synth.v:224" *) sContinue[2] : 1'b0;
  assign _104_[3] = _097_ ? (* src = "fsm_synth.v:224" *) sContinue[3] : 1'b0;
  assign _006_[0] = sReset ? (* src = "fsm_synth.v:157" *) _102_[0] : 1'b0;
  assign _006_[1] = sReset ? (* src = "fsm_synth.v:157" *) _102_[1] : 1'b0;
  assign _006_[2] = sReset ? (* src = "fsm_synth.v:157" *) _102_[2] : 1'b0;
  assign _006_[3] = sReset ? (* src = "fsm_synth.v:157" *) _102_[3] : 1'b0;
  assign _106_[0] = _096_ ? (* src = "fsm_synth.v:238" *) sPause[0] : 1'b0;
  assign _106_[1] = _096_ ? (* src = "fsm_synth.v:238" *) sPause[1] : 1'b0;
  assign _106_[2] = _096_ ? (* src = "fsm_synth.v:238" *) sPause[2] : 1'b0;
  assign _106_[3] = _096_ ? (* src = "fsm_synth.v:238" *) sPause[3] : 1'b0;
  assign _110_[0] = _098_ ? (* src = "fsm_synth.v:209" *) sPause[0] : 1'b0;
  assign _110_[1] = _098_ ? (* src = "fsm_synth.v:209" *) sPause[1] : 1'b0;
  assign _110_[2] = _098_ ? (* src = "fsm_synth.v:209" *) sPause[2] : 1'b0;
  assign _110_[3] = _098_ ? (* src = "fsm_synth.v:209" *) sPause[3] : 1'b0;
  assign _007_[0] = sReset ? (* src = "fsm_synth.v:157" *) _109_[0] : 1'b0;
  assign _007_[1] = sReset ? (* src = "fsm_synth.v:157" *) _109_[1] : 1'b0;
  assign _007_[2] = sReset ? (* src = "fsm_synth.v:157" *) _109_[2] : 1'b0;
  assign _007_[3] = sReset ? (* src = "fsm_synth.v:157" *) _109_[3] : 1'b0;
  assign _112_[0] = _011_[7] ? (* src = "fsm_synth.v:258" *) sFull[0] : 1'b0;
  assign _112_[1] = _011_[7] ? (* src = "fsm_synth.v:258" *) sFull[1] : 1'b0;
  assign _112_[2] = _011_[7] ? (* src = "fsm_synth.v:258" *) sFull[2] : 1'b0;
  assign _112_[3] = _011_[7] ? (* src = "fsm_synth.v:258" *) sFull[3] : 1'b0;
  assign _113_[0] = _086_ ? (* src = "fsm_synth.v:174" *) 1'b0 : _112_[0];
  assign _113_[1] = _086_ ? (* src = "fsm_synth.v:174" *) 1'b0 : _112_[1];
  assign _113_[2] = _086_ ? (* src = "fsm_synth.v:174" *) 1'b0 : _112_[2];
  assign _113_[3] = _086_ ? (* src = "fsm_synth.v:174" *) 1'b0 : _112_[3];
  assign _001_[0] = sReset ? (* src = "fsm_synth.v:157" *) _113_[0] : 1'b0;
  assign _001_[1] = sReset ? (* src = "fsm_synth.v:157" *) _113_[1] : 1'b0;
  assign _001_[2] = sReset ? (* src = "fsm_synth.v:157" *) _113_[2] : 1'b0;
  assign _001_[3] = sReset ? (* src = "fsm_synth.v:157" *) _113_[3] : 1'b0;
  assign _114_ = _087_ ? (* src = "fsm_synth.v:174" *) 1'b0 : _013_[2];
  assign _002_ = sReset ? (* src = "fsm_synth.v:157" *) _114_ : 1'b0;
  assign _115_ = _088_ ? (* src = "fsm_synth.v:174" *) 1'b0 : sInit;
  assign _003_ = sReset ? (* src = "fsm_synth.v:157" *) _115_ : 1'b0;
  assign _005_[1] = sReset ? (* src = "fsm_synth.v:147" *) nextState[1] : 1'b0;
  assign _005_[2] = sReset ? (* src = "fsm_synth.v:147" *) nextState[2] : 1'b0;
  assign _005_[3] = sReset ? (* src = "fsm_synth.v:147" *) nextState[3] : 1'b0;
  assign _005_[4] = sReset ? (* src = "fsm_synth.v:147" *) nextState[4] : 1'b0;
  assign _005_[5] = sReset ? (* src = "fsm_synth.v:147" *) nextState[5] : 1'b0;
  assign _005_[6] = sReset ? (* src = "fsm_synth.v:147" *) nextState[6] : 1'b0;
  assign _005_[7] = sReset ? (* src = "fsm_synth.v:147" *) nextState[7] : 1'b0;
  assign _009_[3] = _009_[5] ? (* src = "fsm_synth.v:116" *) 1'b0 : _010_[3];
  assign _009_[6] = _009_[5] ? (* src = "fsm_synth.v:116" *) 1'b0 : _010_[6];
  assign _009_[7] = _009_[5] ? (* src = "fsm_synth.v:116" *) 1'b0 : _010_[7];
  assign _008_[3] = _008_[4] ? (* src = "fsm_synth.v:114" *) 1'b0 : _009_[3];
  assign _008_[6] = _008_[4] ? (* src = "fsm_synth.v:114" *) 1'b0 : _009_[6];
  assign _008_[7] = _008_[4] ? (* src = "fsm_synth.v:114" *) 1'b0 : _009_[7];
  assign _011_[3] = ~(* src = "fsm_synth.v:105" *) _011_[7];
  assign _010_[3] = _010_[6] ? (* src = "fsm_synth.v:103" *) 1'b0 : _011_[3];
  assign _010_[7] = _010_[6] ? (* src = "fsm_synth.v:103" *) 1'b0 : _011_[7];
  assign _016_[3] = _009_[5] ? (* src = "fsm_synth.v:73" *) 1'b0 : _011_[3];
  assign _016_[7] = _009_[5] ? (* src = "fsm_synth.v:73" *) 1'b0 : _011_[7];
  assign _015_[3] = _008_[4] ? (* src = "fsm_synth.v:69" *) 1'b0 : _016_[3];
  assign _008_[5] = _008_[4] ? (* src = "fsm_synth.v:69" *) 1'b0 : _009_[5];
  assign _015_[7] = _008_[4] ? (* src = "fsm_synth.v:69" *) 1'b0 : _016_[7];
  assign _014_[3] = _010_[6] ? (* src = "fsm_synth.v:67" *) 1'b0 : _015_[3];
  assign _014_[4] = _010_[6] ? (* src = "fsm_synth.v:67" *) 1'b0 : _008_[4];
  assign _014_[5] = _010_[6] ? (* src = "fsm_synth.v:67" *) 1'b0 : _008_[5];
  assign _014_[7] = _010_[6] ? (* src = "fsm_synth.v:67" *) 1'b0 : _015_[7];
  assign _013_[3] = ~(* src = "fsm_synth.v:58" *) _013_[2];
  assign _012_[2] = ~(* src = "fsm_synth.v:49" *) sInit;
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      oInit <= _003_;
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      oIdle <= _002_;
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      oError[0] <= _001_[0];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      oError[1] <= _001_[1];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      oError[2] <= _001_[2];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      oError[3] <= _001_[3];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      stbPause[0] <= _007_[0];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      stbPause[1] <= _007_[1];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      stbPause[2] <= _007_[2];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      stbPause[3] <= _007_[3];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      stbContinue[0] <= _006_[0];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      stbContinue[1] <= _006_[1];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      stbContinue[2] <= _006_[2];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      stbContinue[3] <= _006_[3];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      pausa[0] <= _004_[0];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      pausa[1] <= _004_[1];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      pausa[2] <= _004_[2];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      pausa[3] <= _004_[3];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      continuar[0] <= _000_[0];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      continuar[1] <= _000_[1];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      continuar[2] <= _000_[2];
  (* src = "fsm_synth.v:156" *)
  always @(posedge CLK)
      continuar[3] <= _000_[3];
  reg \state_reg[1] ;
  (* src = "fsm_synth.v:146" *)
  always @(posedge CLK)
      \state_reg[1]  <= _005_[1];
  assign state[1] = \state_reg[1] ;
  reg \state_reg[2] ;
  (* src = "fsm_synth.v:146" *)
  always @(posedge CLK)
      \state_reg[2]  <= _005_[2];
  assign state[2] = \state_reg[2] ;
  reg \state_reg[3] ;
  (* src = "fsm_synth.v:146" *)
  always @(posedge CLK)
      \state_reg[3]  <= _005_[3];
  assign state[3] = \state_reg[3] ;
  reg \state_reg[4] ;
  (* src = "fsm_synth.v:146" *)
  always @(posedge CLK)
      \state_reg[4]  <= _005_[4];
  assign state[4] = \state_reg[4] ;
  reg \state_reg[5] ;
  (* src = "fsm_synth.v:146" *)
  always @(posedge CLK)
      \state_reg[5]  <= _005_[5];
  assign state[5] = \state_reg[5] ;
  reg \state_reg[6] ;
  (* src = "fsm_synth.v:146" *)
  always @(posedge CLK)
      \state_reg[6]  <= _005_[6];
  assign state[6] = \state_reg[6] ;
  reg \state_reg[7] ;
  (* src = "fsm_synth.v:146" *)
  always @(posedge CLK)
      \state_reg[7]  <= _005_[7];
  assign state[7] = \state_reg[7] ;
  assign _080_[2] = state[2] ^(* src = "fsm_synth.v:38" *)  1'b1;
  assign _020_[0] = state[1] ^(* src = "fsm_synth.v:38" *)  1'b1;
  assign _107_[4] = _110_[0] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _111_;
  assign _107_[5] = _110_[1] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _111_;
  assign _107_[6] = _110_[2] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _111_;
  assign _107_[7] = _110_[3] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _111_;
  assign _107_[0] = _106_[0] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _103_;
  assign _107_[1] = _106_[1] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _103_;
  assign _107_[2] = _106_[2] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _103_;
  assign _107_[3] = _106_[3] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _103_;
  assign _100_[4] = _104_[0] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _105_;
  assign _100_[5] = _104_[1] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _105_;
  assign _100_[6] = _104_[2] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _105_;
  assign _100_[7] = _104_[3] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _105_;
  assign _100_[0] = _126_[0] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _103_;
  assign _100_[1] = _126_[1] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _103_;
  assign _100_[2] = _126_[2] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _103_;
  assign _100_[3] = _126_[3] &(* src = "fsm_synth.v:174|<techmap.v>:434" *)  _103_;
  assign _124_[41] = sReset &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _123_;
  assign _124_[33] = sInit &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _122_;
  assign _032_[2] = _012_[2] &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _122_;
  assign _032_[1] = _013_[2] &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _121_;
  assign _124_[27] = _013_[3] &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _121_;
  assign _124_[19] = _014_[3] &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _120_;
  assign _028_[1] = _014_[4] &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _120_;
  assign _026_[1] = _014_[5] &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _120_;
  assign _022_[1] = _010_[6] &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _120_;
  assign _024_[1] = _014_[7] &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _120_;
  assign _030_[0] = _008_[3] &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _017_;
  assign _028_[0] = _008_[4] &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _017_;
  assign _026_[0] = _008_[5] &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _017_;
  assign _022_[0] = _008_[6] &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _017_;
  assign _124_[15] = _008_[7] &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _017_;
  assign _124_[7] = sReset &(* src = "fsm_synth.v:38|<techmap.v>:434" *)  _116_;
  assign _067_[0] = sPause[0] ^(* src = "fsm_synth.v:209" *)  pausa[0];
  assign _067_[1] = sPause[1] ^(* src = "fsm_synth.v:209" *)  pausa[1];
  assign _067_[2] = sPause[2] ^(* src = "fsm_synth.v:209" *)  pausa[2];
  assign _067_[3] = sPause[3] ^(* src = "fsm_synth.v:209" *)  pausa[3];
  assign _068_[0] = sContinue[0] ^(* src = "fsm_synth.v:238" *)  continuar[0];
  assign _068_[1] = sContinue[1] ^(* src = "fsm_synth.v:238" *)  continuar[1];
  assign _068_[2] = sContinue[2] ^(* src = "fsm_synth.v:238" *)  continuar[2];
  assign _068_[3] = sContinue[3] ^(* src = "fsm_synth.v:238" *)  continuar[3];
  assign _069_[0] = sPause[0] ^(* src = "fsm_synth.v:238" *)  continuar[0];
  assign _069_[1] = sPause[1] ^(* src = "fsm_synth.v:238" *)  continuar[1];
  assign _069_[2] = sPause[2] ^(* src = "fsm_synth.v:238" *)  continuar[2];
  assign _069_[3] = sPause[3] ^(* src = "fsm_synth.v:238" *)  continuar[3];
  assign _070_[5] = nextState[5] ^(* src = "fsm_synth.v:174" *)  1'b1;
  assign _071_[6] = nextState[6] ^(* src = "fsm_synth.v:174" *)  1'b1;
  assign _072_[4] = nextState[4] ^(* src = "fsm_synth.v:174" *)  1'b1;
  assign _073_[7] = nextState[7] ^(* src = "fsm_synth.v:174" *)  1'b1;
  assign _074_[2] = nextState[2] ^(* src = "fsm_synth.v:174" *)  1'b1;
  assign _053_[0] = nextState[1] ^(* src = "fsm_synth.v:174" *)  1'b1;
  assign _075_[7] = state[7] ^(* src = "fsm_synth.v:38" *)  1'b1;
  assign _076_[6] = state[6] ^(* src = "fsm_synth.v:38" *)  1'b1;
  assign _077_[5] = state[5] ^(* src = "fsm_synth.v:38" *)  1'b1;
  assign _078_[4] = state[4] ^(* src = "fsm_synth.v:38" *)  1'b1;
  assign _079_[3] = state[3] ^(* src = "fsm_synth.v:38" *)  1'b1;
  assign State = { state[7:1], 1'b0 };
  assign nState = { nextState[7:1], 1'b0 };
  assign nextState[0] = 1'b0;
  assign state[0] = 1'b0;
endmodule
