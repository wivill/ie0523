/* Generated by Yosys 0.7+560 (git sha1 d9a2b430, gcc 7.3.1 -fPIC -Os) */

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
  input [3:0] Data_Word;
  input [1:0] VC_id;
  output data_out;
  input reset;
  NOT _13_ (
    .A(reset),
    .Y(_12_)
  );
  NOT _14_ (
    .A(Data_Word[3]),
    .Y(_00_)
  );
  NOT _15_ (
    .A(Data_Word[0]),
    .Y(_01_)
  );
  NOR _16_ (
    .A(VC_id[0]),
    .B(Data_Word[2]),
    .Y(_02_)
  );
  NAND _17_ (
    .A(VC_id[0]),
    .B(_00_),
    .Y(_03_)
  );
  NAND _18_ (
    .A(VC_id[1]),
    .B(_03_),
    .Y(_04_)
  );
  NOR _19_ (
    .A(_02_),
    .B(_04_),
    .Y(_05_)
  );
  NAND _20_ (
    .A(VC_id[0]),
    .B(Data_Word[1]),
    .Y(_06_)
  );
  NOT _21_ (
    .A(_06_),
    .Y(_07_)
  );
  NOR _22_ (
    .A(VC_id[0]),
    .B(_01_),
    .Y(_08_)
  );
  NOR _23_ (
    .A(_07_),
    .B(_08_),
    .Y(_09_)
  );
  NOR _24_ (
    .A(VC_id[1]),
    .B(_09_),
    .Y(_10_)
  );
  NOR _25_ (
    .A(_05_),
    .B(_10_),
    .Y(_11_)
  );
  NOR _26_ (
    .A(_12_),
    .B(_11_),
    .Y(data_out)
  );
endmodule
