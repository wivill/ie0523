/* Generated by Yosys 0.7 (git sha1 UNKNOWN, clang 5.0.1 -march=x86-64 -mtune=generic -O2 -fstack-protector-strong -fno-plt -fPIC -Os) */

module ffd_p2s_synth(CLK, D, ENB, valid_in, Q, valid_out);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  input CLK;
  input D;
  input ENB;
  output Q;
  reg Q;
  input valid_in;
  output valid_out;
  NOR _05_ (
    .A(valid_in),
    .B(Q),
    .Y(_01_)
  );
  NOT _06_ (
    .A(D),
    .Y(_02_)
  );
  NAND _07_ (
    .A(valid_in),
    .B(_02_),
    .Y(_03_)
  );
  NAND _08_ (
    .A(_03_),
    .B(ENB),
    .Y(_04_)
  );
  NOR _09_ (
    .A(_04_),
    .B(_01_),
    .Y(_00_)
  );
  always @(posedge CLK)
      Q <= _00_;
  assign valid_out = 1'b1;
endmodule
