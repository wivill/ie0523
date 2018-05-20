
module BUF(A, Y);
input A;
output Y;
assign Y = A;
parameter PwrC = 3;
// always @(posedge Y or negedge Y) begin
//   letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
// end // end counter
endmodule

module NOT(A, Y);
input A;
output Y;
assign Y = ~A;
parameter PwrC = 3;
// always @(posedge Y or negedge Y) begin
//   letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
// end // end counter
endmodule

module NAND(A, B, Y);
input A, B;
output Y;
assign Y = ~(A & B);
parameter PwrC = 3;
// always @(posedge Y or negedge Y) begin
//   letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
// end // end counter
endmodule

module NOR(A, B, Y);
input A, B;
output Y;
assign Y = ~(A | B);
parameter PwrC = 3;
// always @(posedge Y or negedge Y) begin
//   letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
// end // end counter
endmodule

module DFF(C, D, Q);
input C, D;
output reg Q;
always @(posedge C)
	Q <= D;
// parameter PwrC = 3;
// always @(posedge Q or negedge Q) begin
//   letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
// end // end counter
endmodule

module DFFSR(C, D, Q, S, R);
input C, D, S, R;
output reg Q;
always @(posedge C, posedge S, posedge R)
	if (S)
		Q <= 1'b1;
	else if (R)
		Q <= 1'b0;
	else
		Q <= D;
// parameter PwrC = 3;
// always @(posedge Q or negedge Q) begin
//   letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
// end // end counter
endmodule
