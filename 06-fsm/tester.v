`include "definitions.v"
module tester(  output reg CLK,
                output reg go_down,
                output reg go_up,
                output reg halt,
                input      top_lim_cond,
                input      bott_lim_cond,
                input      top_lim_struct,
                input      bott_lim_struct,
                input      top_lim_delay,
                input      bott_lim_delay
                );

   initial begin
      $dumpfile("fsm.vcd");
      $dumpvars(1, tester);
      $monitor("\nAt time %t\ntop_lim_cond = %h, top_lim_struct = %h, top_lim_delay = %h\nbott_lim_cond = %h, bott_lim_struct = %h, bott_lim_delay = %h\n",
               $time, top_lim_cond, top_lim_struct, top_lim_delay, bott_lim_cond, bott_lim_struct, bott_lim_delay);
   end

   initial begin
      // #1 LE = 0; // Habilita escritura
      CLK = 1'b0;
      ENB = 1'b0;
      D = 4'b0000;
      DIR = 1'b0;
      MODO = 2'b00;
      S_IN = 1'b0;
      // Prueba a frecuencia sin falla 32
      repeat(2) #32 CLK = ~CLK;
      // ENB = 1'b1;
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

   end

endmodule // tester
