/* Generated by Yosys 0.7 (git sha1 61f6811, gcc 5.4.0-6ubuntu1~16.04.4 -O2 -fstack-protector-strong -fPIC -Os) */

module wrr_synth(reset, clk, weight, request_id, grant_id);
  input clk;
  output [1:0] grant_id;
  input [1:0] request_id;
  input reset;
  input [2:0] weight;
  assign grant_id = 2'b00;
endmodule
