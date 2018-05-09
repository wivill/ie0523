
module BUF_delay(A, Y);
input A;
output Y;
// parameter PwrC = 4;
// always @(posedge Y or negedge Y) begin
//   letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
// end // end counter
assign #(8:8:9) Y = A;
endmodule

module NOT_delay(A, Y);
input A;
output Y;
parameter PwrC = 4;
always @(posedge Y or negedge Y) begin
  letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
end // end counter
assign #(8:8:9) Y = ~A;
endmodule

module NAND_delay(A, B, Y);
input A, B;
output Y;
parameter PwrC = 4;
always @(posedge Y or negedge Y) begin
  letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
end // end counter
assign #(8:8:9) Y = ~(A & B);
endmodule

module NOR_delay(A, B, Y);
input A, B;
output Y;
parameter PwrC = 4;
always @(posedge Y or negedge Y) begin
  letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
end // end counter
assign #(8:8:9) Y = ~(A | B);
endmodule

module DFF_delay(C, D, Q);
input C, D;
output reg Q;
// parameter PwrC = 4;
// always @(posedge Q or negedge Q) begin
//   letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
// end // end counter
always @(posedge C)
	Q <= #15 D;
endmodule

module DFFSR_delay(C, D, Q, S, R);
input C, D, S, R;
output reg Q;
always @(posedge C, posedge S, posedge R)
	if (S)
		Q <= #15 1'b1;
	else if (R)
		Q <= #15 1'b0;
	else
		Q <= #15 D;

// parameter PwrC = 4;
// always @(posedge Q or negedge Q) begin
//   letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
// end // end counter
endmodule
