
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
// always @(posedge Y or negedge Y) begin
//   letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
// end // end counter
assign #(8:8:9) Y = ~A;
endmodule

module NAND_delay(A, B, Y);
input A, B;
output Y;
parameter PwrC = 4;
// always @(posedge Y or negedge Y) begin
//   letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
// end // end counter
assign #(8:8:9) Y = ~(A & B);
endmodule

module NOR_delay(A, B, Y);
input A, B;
output Y;
parameter PwrC = 4;
// always @(posedge Y or negedge Y) begin
//   letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
// end // end counter
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

module \$dlatch_delay (EN, D, Q);

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

module LDCP_delay (G, PRE, CLR, D, Q);
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

module LDCP_N_delay (G, PRE, CLR, D, Q);
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

module \$_DLATCH_P_delay (input E, input D, output Q);
    LDCP_delay _TECHMAP_REPLACE_ (
        .D(D),
        .G(E),
        .Q(Q),
        .PRE(1'b0),
        .CLR(1'b0)
        );
endmodule

module \$_DLATCH_N_delay (input E, input D, output Q);
    LDCP_N_delay _TECHMAP_REPLACE_ (
        .D(D),
        .G(E),
        .Q(Q),
        .PRE(1'b0),
        .CLR(1'b0)
        );
endmodule
