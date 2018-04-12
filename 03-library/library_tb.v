`timescale 	1ns				/ 100ps
// escala	unidad temporal (valor de "#1") / precisi�n
// includes de archivos de verilog
// Pueden omitirse y llamarse desde el testbench
`include "library.v"
`include "tester.v"

`define NumPwrCntr 2
`define Ndir 1

module testbench;

   wire iA, iB, D, s0, ENB, CLK, oNand, oNor, oNot, oMux, Q, Qn;
   wire [31:0] dato;
   wire [`Ndir:0] dir;
   // wire [7:0]  Suma;
   // wire        llevo;
   parameter PwrC = 0;


   nand_ti #(PwrC) nand0(.iA       (iA),
                      .iB       (iB),
                      .oNand (oNand)
                      );

   nor_ti  #(PwrC) nor0( .iA     (iA),
                      .iB     (iB),
                      .oNor (oNor)
                      );

   not_ti  #(PwrC) not0( .iA     (iA),
                      .oNot (oNot)
                      );

   mux_2a1 #(PwrC) mux0( .iA     (iA),
                      .iB     (iB),
                      .oMux   (oMux)
                      );

   ff_d    #(PwrC) ffd0( .D      (D),
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
