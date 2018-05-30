/* Generated by Yosys 0.7 (git sha1 61f6811, gcc 6.2.0-11ubuntu1 -O2 -fdebug-prefix-map=/build/yosys-OIL3SR/yosys-0.7=. -fstack-protector-strong -fPIC -Os) */

module freq_div_synth_delay(CLK, reset, CLK_2, CLK_4, CLK_8);
  wire _0_;
  wire _1_;
  input CLK;
  output CLK_2;
  reg CLK_2;
  output CLK_4;
  output CLK_8;
  input reset;
  NOT_delay _2_ (
    .A(reset),
    .Y(_1_)
  );
  NOR_delay _3_ (
    .A(CLK_2),
    .B(_1_),
    .Y(_0_)
  );
  always @(posedge CLK)
      CLK_2 <= #15  _0_;
  assign CLK_4 = 1'b0;
  assign CLK_8 = 1'b0;
endmodule
