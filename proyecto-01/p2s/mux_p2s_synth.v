/* Generated by Yosys 0.7+560 (git sha1 d9a2b430, gcc 7.3.1 -fPIC -Os) */

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