
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

module \$dlatch (EN, D, Q);

parameter WIDTH = 0;
parameter EN_POLARITY = 1'b1;

input EN;
input [WIDTH-1:0] D;
output reg [WIDTH-1:0] Q;

always @* begin
        if (EN == EN_POLARITY)
                Q = D;
end

endmodule

module LDCP (G, PRE, CLR, D, Q);
    parameter INIT = 0;

    input G, PRE, CLR, D;
    output reg Q;

    initial begin
        Q <= INIT;
    end

    always @* begin
        if (CLR == 1)
            Q <= 0;
        else if (G == 1)
            Q <= D;
        else if (PRE == 1)
            Q <= 1;
    end
endmodule

module LDCP_N (G, PRE, CLR, D, Q);
    parameter INIT = 0;

    input G, PRE, CLR, D;
    output reg Q;

    initial begin
        Q <= INIT;
    end

    always @* begin
        if (CLR == 1)
            Q <= 0;
        else if (G == 0)
            Q <= D;
        else if (PRE == 1)
            Q <= 1;
    end
endmodule

module \$_DLATCH_P_ (input E, input D, output Q);
    LDCP _TECHMAP_REPLACE_ (
        .D(D),
        .G(E),
        .Q(Q),
        .PRE(1'b0),
        .CLR(1'b0)
        );
endmodule

module \$_DLATCH_N_ (input E, input D, output Q);
    LDCP_N _TECHMAP_REPLACE_ (
        .D(D),
        .G(E),
        .Q(Q),
        .PRE(1'b0),
        .CLR(1'b0)
        );
endmodule
