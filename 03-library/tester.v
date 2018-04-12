`define NumPwrCntr 2
`define Ndir 1
module tester(
                input      NOT,
                input      NAND,
                input      NOR,
                input      MUX,
                input      Q,
                input      Qn,
                output reg iA,
                output reg iB,
                output reg D,
                output reg SEL,
                output reg ENB,
                output reg CLK
                );

   // reg                     CLK;
   // reg [7:0]               oprA, oprB;
   reg [31:0]              Contador;
   reg [`Ndir:0]           dir;
   reg                     LE;
   // integer                 semilla;

   assign dato = (~LE)? Contador : 32'bz;


   initial begin
      $dumpfile("library.vcd");
      $dumpvars(1, tester);
   end

   initial begin
      #1 LE = 0;
      Contador = 0;
      for (dir = 0; dir <= `NumPwrCntr; dir = dir + 1)
        #1 Contador = 0;
      #1 LE = 1;
      CLK = 1'b0;
      ENB = 1'b0;
      iA = 1'b0;
      iB = 1'b0;
      D = 1'b0;
      SEL = 1'b0;

      repeat(4) #10 CLK = ~CLK;
      ENB = 1'b1;
      forever #10 CLK = ~CLK;
   end

   initial begin
     for (dir=0; dir<=`NumPwrCntr; dir=dir+1) begin
        #1 Contador = dato;
        $display(,,"PwrCntr[%d]: %d", dir, Contador);
     end
      @(posedge ENB);
      // Pruebas básicas a compuertas
      repeat (4) begin
         @(posedge CLK);
         {iA, iB} <= {iA, iB} + 1;
      end
      iA = 0;

      // Pruebas MUX
      repeat (4) begin
         @(posedge CLK);
         {SEL, iA} <= {SEL, iA} + 1;
      end

      // ENB = 1'b1;
      repeat (10) begin
         @(posedge CLK);
         D = ~D;
      end
   //    $finish;
   //
   // end
   // //
   // initial begin


      #1 $finish;
   end

endmodule // tester
