//`include "button.v"
module button_tester(
                     input      sluz
                     output reg oclk, oreset, otoggle
                     );

   //Pruebas iniciales para reset
   initial begin
      oclk = 1'b0;
      oreset = 1'b1;
      otoggle = 
      repeat(4) #5 oclk = ~oclk;
      oreset = 1'b0;
      forever #5 oclk = ~oclk;
   end

   //Pruebas de conmutación
   initial begin
      @(posedge oreset);
      
   end
   

   //Monitor para imprimir valores
   initial
     $monitor("At time %t, sluz = %h (%0d)",
              $time, sluz, sluz);

   //Dump para visualización en gtkwave
   initial begin
      $dumpfile ("button.vcd"); 
      $dumpvars(1, button_tester); 
   end

endmodule
