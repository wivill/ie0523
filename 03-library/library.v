// `include "definitions.v"
// `include "library_tb.v"
// Para la temporización se usan los valores máximos a diferentes niveles de tensión
// y a temperatura ambiente (25 grados C)

`define NumPwrCntr 2
`define Ndir 1

module nand_ti(
               output oNand,
               input  iA,
               input  iB
               );

   parameter PwrC = 0;

   nand #(8:8:9, 8:8:9) nand_gate(oNand, iA, iB);

   // always @(posedge oNand) begin
   //    library_tb.m1.PwrCntr[PwrC] = library_tb.m1.PwrCntr[PwrC] + 1;
   // end

endmodule // nand_ti

module nor_ti(
              output oNor,
              input  iA,
              input  iB
              );

   parameter PwrC = 0;

   nor #(8:8:9, 8:8:9) nor_gate(oNor, iA, iB);

   // always @(posedge oNor) begin
   //    library_tb.m1.PwrCntr[PwrC] = library_tb.m1.PwrCntr[PwrC] + 1;
   // end

endmodule // nor_ti

module not_ti(
              output oNot,
              input  iA
              );

   parameter PwrC = 0;

   not #(8:8:9, 8:8:9) not_gate(oNot, iA);

   // always @(posedge oNot) begin
   //    library_tb.m1.PwrCntr[PwrC] = library_tb.m1.PwrCntr[PwrC] + 1;
   // end

endmodule // not_ti

module mux_2a1(
               output oMux,
               input  iA,
               input  iB,
               input  s0
               );

   parameter PwrC = 0;

   wire               nand0_nand2, nand1_nand2, sn0;

   nand_ti #(PwrC) n0(sn0, s0, s0);

   nand_ti #(PwrC) nand0(nand0_nand2, sn0, iA);
   nand_ti #(PwrC) nand1(nand1_nand2, s0, iB);

   nand_ti #(PwrC) nand2(oMux, nand0_nand2, nand1_nand2);

   // always @(posedge oMux) begin
   //    library_tb.m1.PwrCntr[PwrC] = library_tb.m1.PwrCntr[PwrC] + 1;
   // end

endmodule // mux_2a1

module ff_d (
                  output reg Q,
                  output reg Qn,
                  input wire D,
                  input wire CLK,
                  input wire ENB
                  );
   parameter PwrC = 0;

   real time_a;
   real time_b;
   real delta_ab;
   integer exep = 0;


   always @(posedge CLK) begin
      if (~ENB) begin
         Q <= #15 Q;
         Qn <= #15 Qn;
      end else begin
         Q <= #15 D;
         Qn <= #15 ~D;
      end

   end

   // always @(posedge Q) begin
   //    library_tb.m1.PwrCntr[PwrC] = library_tb.m1.PwrCntr[PwrC] + 1;
   // end

   // always @ ( posedge D or negedge D ) begin
   //     time_a = $realtime;
 		//    $display("flanco: %d",time_b);
 		//    $display("cambio: %d",time_a);
 		//    $display("delta: %d",time_b-time_a);
 		//    if (time_a != 0 && time_b != 0 ) begin
 		// 	     if ((0 <= (time_b-time_a))&&((time_b-time_a) < 20)&&(exep == 0)) begin
 		// 		       $display("Delta %d, Se ha violado el tiempo de septup del flip-flop en el tiempo %d, con el flanco %d se va a proceder en forma de exepcion",delta_ab,time_a,time_b);
 		// 		       exep <= 1;
 		// 	     end else if ((-15.0 < (time_b-time_a))&& ((time_b-time_a) < 0) && (exep == 0)) begin
 		// 		       $display("Delta %d, Se ha violado el tiempo de hold del flip-flop %d, con el flanco %d, se va proceder en forma de exepcion", delta_ab,time_a,time_b);
 		// 		       exep <= 1;
 		// 	     end
 		//    end
 	 // end
   //
 	 // always @ (posedge CLK) begin
 		//    time_b = $realtime;
 		//    $display("flanco: %d",time_b);
 		//    $display("cambio: %d",time_a);
 		//    $display("delta: %d",time_b-time_a);
 		//    if (time_a != 0 && time_b !=0 ) begin
 		// 	     if ((0 <= (time_b-time_a))&&((time_b-time_a) < 20)&&(exep == 0)) begin
 		// 		       $display("Delta %d, Se ha violado el tiempo de septup del flip-flop en el tiempo %d, con el flanco %d se va a proceder en forma de exepcion",delta_ab,time_a,time_b);
 		// 		       exep <= 1;
 		// 	     end else if ((-15.0 < (time_b-time_a))&& ((time_b-time_a) < 0) && (exep == 0)) begin
 		// 		       $display("Delta %d, Se ha violado el tiempo de hold del flip-flop %d, con el flanco %d, se va proceder en forma de exepcion", delta_ab,time_a,time_b);
 		// 		       exep <= 1;
 		// 	     end
 	 //     end
   // end

endmodule // ff_d_cond

module memTrans (dir, LE, dato);
   input [`Ndir:0] dir;
   input           LE;
   inout [31:0]    dato;
   reg [31:0]      PwrCntr [`NumPwrCntr:0];
   //Control de E/S del puerto de datos
   assign dato = (LE)? PwrCntr[dir] : 32'bz;
   //Ciclo de escritura para la memoria
   always @(dir or negedge LE or dato) begin
      if (~LE) //escritura
        PwrCntr[dir] = dato;
   end

endmodule
