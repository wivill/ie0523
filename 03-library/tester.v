`define NumPwrCntr 4
`define Ndir 2
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
   wire [31:0]             dato;
   // integer                 semilla;

   assign dato = (~LE)? Contador : 32'bz;


   initial begin
      $dumpfile("library.vcd");
      $dumpvars(1, tester);
   end

   initial begin
      #1 LE = 0;
      CLK = 1'b0;
      ENB = 1'b0;
      iA = 1'b0;
      iB = 1'b0;
      D = 1'b0;
      SEL = 1'b0;
      #1
      Contador = 0;
      for (dir = 0; dir <= `NumPwrCntr; dir = dir + 1) begin
        $display("Inicializando contador %d", dir);
        Contador = 0;
        $display("Contador %d: %d ",dir, Contador);
      end
      // #1 LE = 1;
      LE = 1;
      repeat(2) #10 CLK = ~CLK;
      ENB = 1'b1;
      forever #10 CLK = ~CLK;
   end

   initial begin
      @(posedge ENB);
      // Pruebas básicas a compuertas y mux
      repeat (10) begin
         @(posedge CLK);
         {SEL, iA, iB} <= {SEL, iA, iB} + 1;
         #1 D = ~D;
      end

      // Imprime contadores
      for (dir = 0; dir <= `NumPwrCntr; dir = dir + 1) begin
        Contador = dato;
        $display(,,"PwrCntr[%d]: %d", dir, Contador);
      end
      #1 $finish;
   end

endmodule // tester
