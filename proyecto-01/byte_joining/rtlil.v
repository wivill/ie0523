/* Generated by Yosys 0.7 (git sha1 61f6811, i686-w64-mingw32.static-gcc 4.9.3 -Os) */

(* top =  1  *)
(* src = "bytejoining_cond.v:17" *)
module byte_joining_conductual(Lane_0, Lane_1, Lane_2, Lane_3, ctr_3, clk250k, out);
  (* src = "bytejoining_cond.v:27" *)
  reg [7:0] L0;
  (* src = "bytejoining_cond.v:28" *)
  reg [7:0] L1;
  (* src = "bytejoining_cond.v:29" *)
  reg [7:0] L2;
  (* src = "bytejoining_cond.v:30" *)
  reg [7:0] L3;
  (* src = "bytejoining_cond.v:18" *)
  input [7:0] Lane_0;
  (* src = "bytejoining_cond.v:19" *)
  input [7:0] Lane_1;
  (* src = "bytejoining_cond.v:20" *)
  input [7:0] Lane_2;
  (* src = "bytejoining_cond.v:21" *)
  input [7:0] Lane_3;
  (* src = "bytejoining_cond.v:23" *)
  input clk250k;
  (* src = "bytejoining_cond.v:22" *)
  input [1:0] ctr_3;
  (* src = "bytejoining_cond.v:24" *)
  output [7:0] out;
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L0[0] <= Lane_0[0];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L0[1] <= Lane_0[1];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L0[2] <= Lane_0[2];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L0[3] <= Lane_0[3];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L0[4] <= Lane_0[4];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L0[5] <= Lane_0[5];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L0[6] <= Lane_0[6];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L0[7] <= Lane_0[7];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L1[0] <= Lane_1[0];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L1[1] <= Lane_1[1];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L1[2] <= Lane_1[2];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L1[3] <= Lane_1[3];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L1[4] <= Lane_1[4];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L1[5] <= Lane_1[5];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L1[6] <= Lane_1[6];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L1[7] <= Lane_1[7];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L2[0] <= Lane_2[0];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L2[1] <= Lane_2[1];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L2[2] <= Lane_2[2];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L2[3] <= Lane_2[3];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L2[4] <= Lane_2[4];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L2[5] <= Lane_2[5];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L2[6] <= Lane_2[6];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L2[7] <= Lane_2[7];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L3[0] <= Lane_3[0];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L3[1] <= Lane_3[1];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L3[2] <= Lane_3[2];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L3[3] <= Lane_3[3];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L3[4] <= Lane_3[4];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L3[5] <= Lane_3[5];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L3[6] <= Lane_3[6];
  (* src = "bytejoining_cond.v:33" *)
  always @(posedge clk250k)
      L3[7] <= Lane_3[7];
  (* src = "bytejoining_cond.v:40" *)
  mux4a1 mux (
    .In0(L0),
    .In1(L1),
    .In2(L2),
    .In3(L3),
    .Sel(ctr_3),
    .outmux(out)
  );
endmodule

(* src = "bytejoining_cond.v:1" *)
module mux4a1(In0, In1, In2, In3, Sel, outmux);
  wire [1:0] _00_;
  wire [1:0] _01_;
  wire [1:0] _02_;
  wire [1:0] _03_;
  wire [1:0] _04_;
  wire [1:0] _05_;
  wire [1:0] _06_;
  wire [1:0] _07_;
  wire [1:0] _08_;
  wire _09_;
  wire [1:0] _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  (* src = "bytejoining_cond.v:7|<techmap.v>:432" *)
  wire [31:0] _14_;
  (* src = "bytejoining_cond.v:7|<techmap.v>:428" *)
  wire [7:0] _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  (* src = "bytejoining_cond.v:7|<techmap.v>:445" *)
  wire _20_;
  (* src = "bytejoining_cond.v:2" *)
  input [7:0] In0;
  (* src = "bytejoining_cond.v:2" *)
  input [7:0] In1;
  (* src = "bytejoining_cond.v:2" *)
  input [7:0] In2;
  (* src = "bytejoining_cond.v:2" *)
  input [7:0] In3;
  (* src = "bytejoining_cond.v:3" *)
  input [1:0] Sel;
  (* src = "bytejoining_cond.v:4" *)
  output [7:0] outmux;
  assign _00_[0] = _14_[6] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[14];
  assign _00_[1] = _14_[22] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[30];
  assign _15_[6] = _00_[0] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _00_[1];
  assign _01_[0] = _14_[7] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[15];
  assign _01_[1] = _14_[23] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[31];
  assign _15_[7] = _01_[0] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _01_[1];
  assign _02_[0] = _14_[5] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[13];
  assign _02_[1] = _14_[21] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[29];
  assign _15_[5] = _02_[0] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _02_[1];
  assign _03_[0] = _14_[4] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[12];
  assign _03_[1] = _14_[20] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[28];
  assign _15_[4] = _03_[0] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _03_[1];
  assign _04_[0] = _14_[3] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[11];
  assign _04_[1] = _14_[19] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[27];
  assign _15_[3] = _04_[0] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _04_[1];
  assign _05_[0] = _14_[2] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[10];
  assign _05_[1] = _14_[18] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[26];
  assign _15_[2] = _05_[0] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _05_[1];
  assign _06_[0] = _14_[1] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[9];
  assign _06_[1] = _14_[17] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[25];
  assign _15_[1] = _06_[0] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _06_[1];
  assign _07_[0] = _14_[0] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[8];
  assign _07_[1] = _14_[16] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _14_[24];
  assign _15_[0] = _07_[0] |(* src = "bytejoining_cond.v:7|<techmap.v>:441" *)  _07_[1];
  assign _08_[0] = _16_ |(* src = "bytejoining_cond.v:7|<techmap.v>:445" *)  _17_;
  assign _08_[1] = _18_ |(* src = "bytejoining_cond.v:7|<techmap.v>:445" *)  _19_;
  assign _20_ = _08_[0] |(* src = "bytejoining_cond.v:7|<techmap.v>:445" *)  _08_[1];
  assign _11_ = _10_[0] |(* src = "bytejoining_cond.v:7" *)  _10_[1];
  assign _12_ = Sel[0] |(* src = "bytejoining_cond.v:7" *)  _10_[1];
  assign _13_ = _10_[0] |(* src = "bytejoining_cond.v:7" *)  Sel[1];
  assign _09_ = Sel[0] |(* src = "bytejoining_cond.v:7" *)  Sel[1];
  assign _19_ = ~(* src = "bytejoining_cond.v:7" *) _09_;
  assign _16_ = ~(* src = "bytejoining_cond.v:7" *) _11_;
  assign _17_ = ~(* src = "bytejoining_cond.v:7" *) _12_;
  assign _18_ = ~(* src = "bytejoining_cond.v:7" *) _13_;
  assign outmux[0] = _20_ ? (* src = "bytejoining_cond.v:7|<techmap.v>:445" *) _15_[0] : 1'bx;
  assign outmux[1] = _20_ ? (* src = "bytejoining_cond.v:7|<techmap.v>:445" *) _15_[1] : 1'bx;
  assign outmux[2] = _20_ ? (* src = "bytejoining_cond.v:7|<techmap.v>:445" *) _15_[2] : 1'bx;
  assign outmux[3] = _20_ ? (* src = "bytejoining_cond.v:7|<techmap.v>:445" *) _15_[3] : 1'bx;
  assign outmux[4] = _20_ ? (* src = "bytejoining_cond.v:7|<techmap.v>:445" *) _15_[4] : 1'bx;
  assign outmux[5] = _20_ ? (* src = "bytejoining_cond.v:7|<techmap.v>:445" *) _15_[5] : 1'bx;
  assign outmux[6] = _20_ ? (* src = "bytejoining_cond.v:7|<techmap.v>:445" *) _15_[6] : 1'bx;
  assign outmux[7] = _20_ ? (* src = "bytejoining_cond.v:7|<techmap.v>:445" *) _15_[7] : 1'bx;
  assign _14_[24] = In0[0] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _19_;
  assign _14_[25] = In0[1] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _19_;
  assign _14_[26] = In0[2] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _19_;
  assign _14_[27] = In0[3] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _19_;
  assign _14_[28] = In0[4] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _19_;
  assign _14_[29] = In0[5] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _19_;
  assign _14_[30] = In0[6] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _19_;
  assign _14_[31] = In0[7] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _19_;
  assign _14_[16] = In1[0] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _18_;
  assign _14_[17] = In1[1] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _18_;
  assign _14_[18] = In1[2] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _18_;
  assign _14_[19] = In1[3] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _18_;
  assign _14_[20] = In1[4] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _18_;
  assign _14_[21] = In1[5] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _18_;
  assign _14_[22] = In1[6] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _18_;
  assign _14_[23] = In1[7] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _18_;
  assign _14_[8] = In2[0] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _17_;
  assign _14_[9] = In2[1] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _17_;
  assign _14_[10] = In2[2] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _17_;
  assign _14_[11] = In2[3] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _17_;
  assign _14_[12] = In2[4] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _17_;
  assign _14_[13] = In2[5] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _17_;
  assign _14_[14] = In2[6] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _17_;
  assign _14_[15] = In2[7] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _17_;
  assign _14_[0] = In3[0] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _16_;
  assign _14_[1] = In3[1] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _16_;
  assign _14_[2] = In3[2] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _16_;
  assign _14_[3] = In3[3] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _16_;
  assign _14_[4] = In3[4] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _16_;
  assign _14_[5] = In3[5] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _16_;
  assign _14_[6] = In3[6] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _16_;
  assign _14_[7] = In3[7] &(* src = "bytejoining_cond.v:7|<techmap.v>:434" *)  _16_;
  assign _10_[1] = Sel[1] ^(* src = "bytejoining_cond.v:7" *)  1'b1;
  assign _10_[0] = Sel[0] ^(* src = "bytejoining_cond.v:7" *)  1'b1;
endmodule
