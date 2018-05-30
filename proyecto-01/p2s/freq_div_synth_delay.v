/* Generated by Yosys 0.7+560 (git sha1 d9a2b430, gcc 7.3.1 -fPIC -Os) */

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
    .A(_1_),
    .B(CLK_2),
    .Y(_0_)
  );
  always @(posedge CLK)
      CLK_2 <= #15  _0_;
  assign CLK_4 = 1'h0;
  assign CLK_8 = 1'h0;
endmodule
