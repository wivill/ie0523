
module BUF(A, Y);
input A;
output Y;
assign Y = A;
// 	always @(posedge Y) begin
// 	probador_.m1.PwrCntr[0] = probador_.m1.PwrCntr[0] + 1;
// // 	//$display("PwrCntr[%d]: %d",PwrC,probador_.m1.PwrCntr[PwrC]);
//  	end
endmodule

module NOT(A, Y);
input A;
output Y;
assign #(1:1:4,1:1:4) Y = ~A;
always @(posedge Y) begin
	probador_.m1.PwrCntr[0] = probador_.m1.PwrCntr[0] + 1;
	//$display("PwrCntr[%d]: %d",PwrC,probador_.m1.PwrCntr[PwrC]);
end
endmodule

module NAND(A, B, Y);
input A, B;
output Y;
assign #(11:11:22,7:7:15) Y = ~(A & B);
always @(posedge Y) begin
	probador_.m1.PwrCntr[0] = probador_.m1.PwrCntr[0] + 1;
	//$display("PwrCntr[%d]: %d",PwrC,probador_.m1.PwrCntr[PwrC]);
end
endmodule

module NOR(A, B, Y);
input A, B;
output Y;
assign #(8:8:11,8:8:11) Y = ~(A | B);
always @(posedge Y) begin
	probador_.m1.PwrCntr[0] = probador_.m1.PwrCntr[0] + 1;
	//$display("PwrCntr[%d]: %d",PwrC,probador_.m1.PwrCntr[PwrC]);
end
endmodule

module DFF(C, D, Q);
input C, D;
output reg Q;

real time_a;
real time_b;
real delta_ab;
integer exep = 0;
//-------Codigo de Verificacion de los tiempos de setup y hold------------------
always @ ( posedge D or negedge D ) begin
	time_a = $realtime;
	//$display("flanco: %d",time_b);
	//$display("cambio: %d",time_a);
	//$display("delta: %d",time_b-time_a);
	if (time_a != 0 && time_b != 0 ) begin
		if ((0 <= (time_b-time_a))&&((time_b-time_a) < 20)&&(exep == 0)) begin
			$display("Se ha violado el tiempo de septup del flip-flop en el tiempo %d, con el flanco %d se va a proceder en forma de exepcion",time_a,time_b);
			exep <= 1;
		end else if ((-15.0 < (time_b-time_a))&& ((time_b-time_a) < 0) && (exep == 0)) begin
			$display("Se ha violado el tiempo de hold del flip-flop %d, con el flanco %d, se va proceder en forma de exepcion",time_a,time_b);
			exep <= 1;
		end
	end
end

always @ (posedge C) begin
	time_b = $realtime;
	//$display("flanco: %d",time_b);
	//$display("cambio: %d",time_a);
	//$display("delta: %d",time_b-time_a);
	if (time_a != 0 && time_b !=0 ) begin
		if ((0 <= (time_b-time_a))&&((time_b-time_a) < 20)&&(exep == 0)) begin
			$display("Se ha violado el tiempo de septup del flip-flop en el tiempo %d, con el flanco %d se va a proceder en forma de exepcion",time_a,time_b);
			exep <= 1;
		end else if ((-15.0 < (time_b-time_a))&& ((time_b-time_a) < 0) && (exep == 0)) begin
			$display("Se ha violado el tiempo de hold del flip-flop %d, con el flanco %d, se va proceder en forma de exepcion",time_a,time_b);
			exep <= 1;
		end
	end
end
//----------------------------------------------------------------------------
always @(posedge C)
	#14 Q <= D;
always @(posedge Q) begin
	probador_.m1.PwrCntr[0] = probador_.m1.PwrCntr[0] + 1;
	//$display("PwrCntr[%d]: %d",PwrC,probador_.m1.PwrCntr[PwrC]);
end
endmodule

module DFFSR(C, D, Q, S, R);
input C, D, S, R;
output reg Q;
always @(posedge C, posedge S, posedge R)
	if (S)
		#14 Q <= 1'b1;
	else if (R)
		#14 Q <= 1'b0;
	else
		#14 Q <= D;
// always @(posedge Q) begin
// 	probador_.m1.PwrCntr[0] = probador_.m1.PwrCntr[0] + 1;
// 	//$display("PwrCntr[%d]: %d",PwrC,probador_.m1.PwrCntr[PwrC]);
// end
endmodule
