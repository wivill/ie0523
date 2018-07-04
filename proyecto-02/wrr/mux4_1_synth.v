/* Generated by Yosys 0.7 (git sha1 UNKNOWN, clang 5.0.1 -march=x86-64 -mtune=generic -O2 -fstack-protector-strong -fno-plt -fPIC -Os) */

module mux4_1_synth(VC_id, Data_Word, reset, data_out);
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
  input [3:0] Data_Word;
  input [1:0] VC_id;
  output data_out;
  input reset;
  NOT _14_ (
    .A(reset),
    .Y(_13_)
  );
  NOR _15_ (
    .A(Data_Word[2]),
    .B(VC_id[0]),
    .Y(_00_)
  );
  NOT _16_ (
    .A(Data_Word[3]),
    .Y(_01_)
  );
  NAND _17_ (
    .A(_01_),
    .B(VC_id[0]),
    .Y(_02_)
  );
  NAND _18_ (
    .A(_02_),
    .B(VC_id[1]),
    .Y(_03_)
  );
  NOR _19_ (
    .A(_03_),
    .B(_00_),
    .Y(_04_)
  );
  NOT _20_ (
    .A(VC_id[0]),
    .Y(_05_)
  );
  NOT _21_ (
    .A(Data_Word[1]),
    .Y(_06_)
  );
  NOR _22_ (
    .A(_06_),
    .B(_05_),
    .Y(_07_)
  );
  NOT _23_ (
    .A(Data_Word[0]),
    .Y(_08_)
  );
  NOR _24_ (
    .A(_08_),
    .B(VC_id[0]),
    .Y(_09_)
  );
  NOR _25_ (
    .A(_09_),
    .B(_07_),
    .Y(_10_)
  );
  NOR _26_ (
    .A(_10_),
    .B(VC_id[1]),
    .Y(_11_)
  );
  NOR _27_ (
    .A(_11_),
    .B(_04_),
    .Y(_12_)
  );
  NOR _28_ (
    .A(_12_),
    .B(_13_),
    .Y(data_out)
  );
endmodule
