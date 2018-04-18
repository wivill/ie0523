`timescale 	1ns				/ 100ps
`include "tester.v"
// Para la temporización se usan los valores máximos a diferentes niveles de tensión
// y a temperatura ambiente (25 grados C)

`define NumPwrCntr 4
`define Ndir 2

module nand_ti(
               output oNand,
               input  iA,
               input  iB
               );

   parameter PwrC = 0;

   nand #(8:8:9, 8:8:9) nand_gate(oNand, iA, iB);

   always @(posedge oNand or negedge oNand) begin
      m1.PwrCntr[PwrC] = m1.PwrCntr[PwrC] + 1;
      // $display("PwrCntr[%d]: %d", PwrC, m1.PwrCntr[PwrC]);
   end

endmodule // nand_ti

module nor_ti(
              output oNor,
              input  iA,
              input  iB
              );

   parameter PwrC = 0;

   nor #(8:8:9, 8:8:9) nor_gate(oNor, iA, iB);

   always @(posedge oNor or negedge oNor) begin
      m1.PwrCntr[PwrC] = m1.PwrCntr[PwrC] + 1;
      // $display("PwrCntr[%d]: %d", PwrC, m1.PwrCntr[PwrC]);
   end

endmodule // nor_ti

module not_ti(
              output oNot,
              input  iA
              );

   parameter PwrC = 0;

   not #(8:8:9, 8:8:9) not_gate(oNot, iA);

   always @(posedge oNot or negedge oNot) begin
      m1.PwrCntr[PwrC] = m1.PwrCntr[PwrC] + 1;
      // $display("PwrCntr[%d]: %d", PwrC, m1.PwrCntr[PwrC]);
   end

endmodule // not_ti

module mux_2a1(
               output oMux,
               input  iA,
               input  iB,
               input  s0
               );

   parameter PwrC = 0;

   wire               nand0_nand2, nand1_nand2, sn0;

   // Mux con assign y tiempos de hojas de datos
   assign #(10:11:12, 10:11:12) oMux = (s0) ? iB : iA;

   // Mux con compuertas
   // not_ti #(PwrC) n0(sn0, s0);
   //
   // nand_ti #(PwrC) nand0(nand0_nand2, sn0, iA);
   // nand_ti #(PwrC) nand1(nand1_nand2, s0, iB);
   //
   // nand_ti #(PwrC) nand2(oMux, nand0_nand2, nand1_nand2);

   // Mux con primitivas
   // not n0(sn0, s0);
   //
   // nand nand0(nand0_nand2, sn0, iA);
   // nand nand1(nand1_nand2, s0, iB);
   //
   // nand nand2(oMux, nand0_nand2, nand1_nand2);

   always @(posedge oMux or negedge oMux) begin
      m1.PwrCntr[PwrC] = m1.PwrCntr[PwrC] + 1;
      // $display("PwrCntr[%d]: %d", PwrC, m1.PwrCntr[PwrC]);
   end

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
   // real delta_ab;
   integer exep = 0;


   always @(posedge CLK) begin
      if (ENB == 0) begin
         Q <= #5 Q;
         Qn <= #5 Qn;
      end else begin
         Q <= #5 D;
         Qn <= #5 ~D;
      end

   end

   always @(posedge Q or negedge Q) begin
      m1.PwrCntr[PwrC] = m1.PwrCntr[PwrC] + 1;
      // $display("PwrCntr[%d]: %d", PwrC, m1.PwrCntr[PwrC]);
   end

   always @ (posedge D or negedge D) begin
       time_a = $realtime;
 		   $display("flanco: %d",time_b);
 		   $display("cambio: %d",time_a);
 		   // $display("delta: %d",time_b-time_a);
 		   if (time_a != 0 && time_b != 0 ) begin
 			     if ((0 <= (time_b-time_a))&&((time_b-time_a) < 20)&&(exep == 0)) begin
 				       $display("D. Violación en tsetup en %d, con flanco %d. Captura de excepción.", time_a, time_b);
 				       exep <= 1;
 			     end else if ((-15.0 < (time_b-time_a))&& ((time_b-time_a) < 0) && (exep == 0)) begin
 				       $display("D. Violación en thold en %d, con flanco %d. Captura de excepción.", time_a, time_b);
 				       exep <= 1;
 			     end
 		   end
 	 end

 	 always @ (posedge CLK) begin
 		   time_b = $realtime;
 		   $display("flanco: %d",time_b);
 		   $display("cambio: %d",time_a);
 		   // $display("delta: %d",time_b-time_a);
 		   if (time_a != 0 && time_b !=0 ) begin
 			     if ((0 <= (time_b - time_a)) && ((time_b - time_a) < 20) && (exep == 0)) begin
 				       $display("CLK. Violación en tsetup en %d, con flanco %d. Captura de excepción.", time_a, time_b);
 				       exep <= 1;
 			     end else if ((-15.0 < (time_b - time_a)) && ((time_b - time_a) < 0) && (exep == 0)) begin
 				       $display("CLK. Violación en tsetup en %d, con flanco %d. Captura de excepción.", time_a, time_b);
 				       exep <= 1;
 			     end
 	     end
   end

endmodule // ff_d_cond

module memTrans (dir, LE, dato);
   input [`Ndir:0] dir;
   input           LE;
   inout [31:0]    dato;
   reg [31:0]      PwrCntr [`NumPwrCntr:0];
   //Control de E/S del puerto de datos
   assign dato = (LE) ? PwrCntr[dir] : 32'bz;
   //Ciclo de escritura para la memoria
   always @(dir or negedge LE or dato) begin
      if (~LE) //escritura
        PwrCntr[dir] = dato;
   end

endmodule

module testbench;

   wire iA, iB, D, s0, ENB, CLK, oNand, oNor, oNot, oMux, Q, Qn;
   wire [31:0] dato;
   wire [`Ndir:0] dir;
   wire LE;
   // wire [7:0]  Suma;
   // wire        llevo;
   parameter PwrC = 0;


   nand_ti #(0) nand0(.iA       (iA),
                      .iB       (iB),
                      .oNand (oNand)
                      );

   nor_ti  #(1) nor0( .iA     (iA),
                      .iB     (iB),
                      .oNor (oNor)
                      );

   not_ti  #(2) not0( .iA     (iA),
                      .oNot (oNot)
                      );

   mux_2a1 #(3) mux0(.oMux   (oMux),
                        .iA     (iA),
                        .iB     (iB),
                        .s0     (s0)
                       );

   ff_d    #(4) ffd0( .D      (D),
                      .ENB    (ENB),
                      .CLK    (CLK),
                      .Q      (Q),
                      .Qn     (Qn)
                      );

   tester     letest(.iA       (iA),
                     .iB       (iB),
                     .D        (D),
                     .SEL      (s0),
                     .ENB      (ENB),
                     .NAND     (oNand),
                     .NOT      (oNot),
                     .NOR      (oNor),
                     .MUX      (oMux),
                     .Q        (Q),
                     .Qn       (Qn),
                     .CLK      (CLK)
                     );

   memTrans        m1(dir,
                      LE,
                      dato
                      );

endmodule
