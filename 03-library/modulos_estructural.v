module NAND (
	input A,
	input B,
	output wire out);
	// parameter PwrC = 0;

	nand #(11:11:22,7:7:15) gate1(out,A,B); //tplh = 11 ns, tphl = 7 ns

	// always @(posedge out) begin
	// 	BancoPruebas.m1.PwrCntr[PwrC] = BancoPruebas.m1.PwrCntr[PwrC] + 1;
	// end

endmodule





module NOR (
	input A,
	input B,
	output wire out);
	//parameter PwrC = 1;
	nor #(8:8:11,8:8:11) gate1(out,A,B); //tplh = 8 ns, tphl = 8 ns

	// always @(posedge out) begin
	// 	BancoPruebas.m1.PwrCntr[PwrC] = BancoPruebas.m1.PwrCntr[PwrC] + 1;
	// end


endmodule

module NOT (
	input A,
	output wire out);
	// parameter PwrC = 2;
	not #(1:1:4,1:1:4) gate1(out,A); //tplh = tphl = 1 ns

	// always @(posedge out) begin
	// 	BancoPruebas.m1.PwrCntr[PwrC] = BancoPruebas.m1.PwrCntr[PwrC] + 1;
	// end
endmodule

module mux2a1(
  input     In1, //entrada 1 del canal 1 del mux
  input     In2, //entrada del canal 2 del mux
  input     Sel, //entrada de la linea de sele
	output wire   out
  );
	// parameter PwrC = 8;

	NAND /*#(8)*/ nand1(Sel,1'b1,x);
	NAND /*#(8)*/ nand2(In2,Sel,z);
	NAND /*#(8)*/ nand3(x,In1,y);
	NAND /*#(8)*/	nand4(y,z,out);

endmodule

module FLOP_D (
	input D,
	input Clk,
	output reg Q);
	// parameter PwrC = 5,
	real time_a;
	real time_b;
	real delta_ab;
	integer exep = 0;

	always @ ( posedge D or negedge D ) begin
		time_a = $realtime;
		$display("flanco: %d",time_b);
		$display("cambio: %d",time_a);
		$display("delta: %d",time_b-time_a);
		if (time_a != 0 && time_b != 0 ) begin
			if ((0 <= (time_b-time_a))&&((time_b-time_a) < 20)&&(exep == 0)) begin
				$display("Delta %d, Se ha violado el tiempo de septup del flip-flop en el tiempo %d, con el flanco %d se va a proceder en forma de exepcion",delta_ab,time_a,time_b);
				exep <= 1;
			end else if ((-15.0 < (time_b-time_a))&& ((time_b-time_a) < 0) && (exep == 0)) begin
				$display("Delta %d, Se ha violado el tiempo de hold del flip-flop %d, con el flanco %d, se va proceder en forma de exepcion", delta_ab,time_a,time_b);
				exep <= 1;
			end
		end
	end



	always @ (posedge Clk) begin
		time_b = $realtime;
		$display("flanco: %d",time_b);
		$display("cambio: %d",time_a);
		$display("delta: %d",time_b-time_a);
		if (time_a != 0 && time_b !=0 ) begin
			if ((0 <= (time_b-time_a))&&((time_b-time_a) < 20)&&(exep == 0)) begin
				$display("Delta %d, Se ha violado el tiempo de septup del flip-flop en el tiempo %d, con el flanco %d se va a proceder en forma de exepcion",delta_ab,time_a,time_b);
				exep <= 1;
			end else if ((-15.0 < (time_b-time_a))&& ((time_b-time_a) < 0) && (exep == 0)) begin
				$display("Delta %d, Se ha violado el tiempo de hold del flip-flop %d, con el flanco %d, se va proceder en forma de exepcion", delta_ab,time_a,time_b);
				exep <= 1;
			end
		end

		#14;
		Q <= D;



	end
	// always @(posedge out) begin
	// 	BancoPruebas.m1.PwrCntr[PwrC] = BancoPruebas.m1.PwrCntr[PwrC] + 1;
	// end


endmodule
