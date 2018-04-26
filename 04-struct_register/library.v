// `timescale 	1ns				/ 100ps
// `include "letest.v"
// Para la temporización se usan los valores máximos a diferentes niveles de tensión
// y a temperatura ambiente (25 grados C)
`include "definitions.v"

module nand_ti(output oNand,
               input  iA,
               input  iB
               );

   parameter PwrC = 0;

   nand #(8:8:9, 8:8:9) nand_gate(oNand, iA, iB);

   // always @(posedge oNand or negedge oNand) begin
   //    $display("NAND PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
   //    letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
   //    $display("NAND PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
   // end

endmodule // nand_ti

module nor_ti(output oNor,
              input  iA,
              input  iB
              );

   parameter PwrC = 0;

   nor #(8:8:9, 8:8:9) nor_gate(oNor, iA, iB);

   // always @(posedge oNor or negedge oNor) begin
   //    $display("NOR PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
   //    letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
   //    $display("NOR PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
   // end

endmodule // nor_ti

module not_ti(output oNot,
              input  iA
              );

   parameter PwrC = 0;

   not #(8:8:9, 8:8:9) not_gate(oNot, iA);

   // always @(posedge oNot or negedge oNot) begin
   //    $display("NOT PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
   //    letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
   //    $display("NOT PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
   // end

endmodule // not_ti

module mux_2a1(output oMux,
               input  iA,
               input  iB,
               input  s0
               );

   parameter PwrC = 0;

   wire      nand0_nand2, nand1_nand2, sn0;

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
      // $display("MUX PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
      letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
      // $display("MUX PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
   end

endmodule // mux_2a1

module ff_d ( output reg Q,
              output reg Qn,
              input wire D,
              input wire CLK,
              input wire ENB
              );

   parameter PwrC = 0;

   real time_a;
   real time_b;
   integer exep = 0;

   always @(posedge CLK) begin
      if (ENB == 0) begin
         Q <= #15 Q;
         Qn <= #15 Qn;
      end else begin
         Q <= #15 D;
         Qn <= #15 ~D;
      end
   end

   always @(posedge Q or negedge Q) begin
      // $display("FFD PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
      letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
      // $display("FFD PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
   end

   always @ (posedge D or negedge D) begin
       time_a = $realtime;
 		   // $display("flanco: %d",time_b);
 		   // $display("cambio: %d",time_a);
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
 		   // $display("flanco: %d",time_b);
 		   // $display("cambio: %d",time_a);
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

module mid_mux( output oD,
                input Qleft,
                input Qright,
                input D,
                input DIR,
                input MODO1
                );

  parameter PwrC = 0;

  wire mDIR_o__mMODO1_A;

  mux_2a1 #(PwrC) mDIR( mDIR_o__mMODO1_A,
                        Qright,
                        Qleft,
                        DIR
                        );

  mux_2a1 #(PwrC) mMODO1( oD,
                          mDIR_o__mMODO1_A,
                          D,
                          MODO1
                          );

  always @(posedge oD or negedge oD) begin
    // $display("mid_mux PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
    letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
    // $display("mid_mux PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
  end

endmodule // mid_mux

module left_mux(  output oD,
                  input S_IN,
                  input Qcirc,
                  input Qright,
                  input D,
                  input DIR,
                  input MODO1,
                  input MODO0
                  );

  parameter PwrC = 0;

  wire  mMODO0_o__mDIR_A, mDIR_o__mMODO1_A;

  mux_2a1 #(PwrC) mMODO0( mMODO0_o__mDIR_A,
                          S_IN,
                          Qcirc,
                          MODO0
                          );

  mux_2a1 #(PwrC) mDIR(   mDIR_o__mMODO1_A,
                          Qright,
                          mMODO0_o__mDIR_A,
                          DIR
                          );

  mux_2a1 #(PwrC) mMODO1( oD,
                          mDIR_o__mMODO1_A,
                          D,
                          MODO1
                          );

  always @(posedge oD or negedge oD) begin
    // $display("left_mux PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
    letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
    // $display("left_mux PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
  end

endmodule // mid_mux

// module right_mux( output oD,
//                   input S_IN,
//                   input Qcirc,
//                   input Qleft,
//                   input D,
//                   input DIR,
//                   input MODO1,
//                   input MODO0
//                   );
//
//   parameter PwrC = 0;
//
//   wire  mMODO0_o__mDIR_A, mDIR_o__mMODO1_A;
//
//   mux_2a1 #(PwrC) mMODO0( mMODO0_o__mDIR_A,
//                           S_IN,
//                           Qcirc,
//                           MODO0
//                           );
//
//   mux_2a1 #(PwrC) mDIR(   mDIR_o__mMODO1_A,
//                           mMODO0_o__mDIR_A,
//                           Qleft,
//                           DIR
//                           );
//
//   mux_2a1 #(PwrC) mMODO1( oD,
//                           mDIR_o__mMODO1_A,
//                           D,
//                           MODO1
//                           );
//
//   always @(posedge oD or negedge oD) begin
//     $display("right_mux PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
//     letest.m1.PwrCntr[PwrC] = letest.m1.PwrCntr[PwrC] + 1;
//     $display("right_mux PwrCntr[%d]: %d", PwrC, letest.m1.PwrCntr[PwrC]);
//   end
//
// endmodule
