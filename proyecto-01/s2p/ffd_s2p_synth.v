/* Generated by Yosys 0.7 (git sha1 61f6811, gcc 6.2.0-11ubuntu1 -O2 -fdebug-prefix-map=/build/yosys-OIL3SR/yosys-0.7=. -fstack-protector-strong -fPIC -Os) */

module ffd_s2p_synth(CLK, D, ENB, Q);
  wire _0_;
  wire _1_;
  wire _2_;
  input CLK;
  input D;
  input ENB;
  output Q;
  reg Q;
  NOT _3_ (
    .A(D),
    .Y(_1_)
  );
  NOT _4_ (
    .A(ENB),
    .Y(_2_)
  );
  NOR _5_ (
    .A(_2_),
    .B(_1_),
    .Y(_0_)
  );
  always @(posedge CLK)
      Q <= _0_;
endmodule
