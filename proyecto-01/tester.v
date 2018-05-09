`include "definitions.v"
module tester(
                input      [3:0]  Qcond,
                input      [3:0]  Qstruct,
                input      [3:0]  QA,
                input      [3:0]  Qyos,
                input      [3:0]  Qdelay,
                input             S_OUTcond,
                input             S_OUTstruct,
                input             S_OUTnstruct,
                input             S_OUTA,
                input             S_OUTyos,
                input             S_OUTdelay,
                output reg [1:0]  MODO,
                output reg        DIR,
                output reg [3:0]  D,
                output reg        S_IN,
                output reg        ENB,
                output reg        CLK
                );

   reg  [31:0]              Contador;
   reg  [`Ndir:0]           dir;
   reg                      LE;
   wire [31:0]              dato;

   // Instancia de memoria la hago en el tester para que funcione
   memTrans        m1(dir,
                      LE,
                      dato
                      );

   assign dato = (~LE)? Contador : 32'bz;

//prueba
   initial begin
      $dumpfile("registros.vcd");
      $dumpvars(1, tester);
      $monitor("\nAt time %t\nQcond = %h, Qstruct = %h, QA = %h, Qyos = %h, Qdelay = %h\nS_OUTcond = %h, S_OUTstruct = %h, S_OUTA = %h, S_OUTyos = %h, S_OUTdelay = %h\n",
               $time, Qcond, Qstruct, QA, Qyos, Qdelay, S_OUTcond, S_OUTstruct, S_OUTA, S_OUTyos, S_OUTdelay);
      // $monitor("At time %t, S_OUTcond = %h, S_OUTstruct = %h, S_OUTA = %h, S_OUTyos = %h, S_OUTdelay = %h",
      //          $time, S_OUTcond, S_OUTstruct, S_OUTA, S_OUTyos, S_OUTdelay);
   end

   initial begin
      #1 LE = 0; // Habilita escritura
      CLK = 1'b0;
      ENB = 1'b0;
      D = 4'b0000;
      DIR = 1'b0;
      MODO = 2'b00;
      S_IN = 1'b0;
      #1
      Contador = 0;
      for (dir = 0; dir <= `NumPwrCntr; dir = dir + 1) begin
        // $display("Inicializando contador %d", dir);
        #1 Contador = 0;
        // $display("Contador %d: %d ",dir, Contador);
      end

      // Prueba a frecuencia original 30
      // repeat(2) #30 CLK = ~CLK;
      // ENB = 1'b1;
      // forever #30 CLK = ~CLK;

      // Prueba a frecuencia sin falla 32
      repeat(2) #32 CLK = ~CLK;
      ENB = 1'b1;
      forever #32 CLK = ~CLK;
    end

    initial begin
      // Carga de datos
      @(posedge ENB);
      D = 4'b1101;
      MODO = `LOAD;
      S_IN = 1'b0;
      DIR = 0;
      repeat(6) @(posedge CLK);
      // Desplazamiento izquierda
      S_IN = 1'b0;
      DIR = 0;
      MODO = `PUSH;
      repeat(6) @(posedge CLK);
      // Desplazamiento derecha
      S_IN = 1'b1;
      DIR = 1;
      MODO = `PUSH;
      repeat(6) @(posedge CLK);
      // Refrescar dato
      D = 4'b1010;
      MODO = `LOAD;
      repeat(6) @(posedge CLK);
      // Desplazamiento circular izquierda
      DIR = 0;
      MODO = `CYCLE;
      repeat(6) @(posedge CLK);
      // Refrescar dato
      D = 4'b0110;
      MODO = `LOAD;
      repeat(6) @(posedge CLK);
      // Desplazamiento circular derecha
      DIR = 1;
      MODO = `CYCLE;
      repeat(6) @(posedge CLK);

      // Imprime contadores
      #10 LE = 1; // Si no pongo esto, reinicia los contadores y pierdo el dato
      for (dir = 0; dir <= `NumPwrCntr; dir = dir + 1) begin
        #1 Contador = dato;
        $display(,,"PwrCntr[%d]: %d", dir, Contador);
      end
      #1 $finish;
   end

endmodule // tester
