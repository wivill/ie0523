`include "definitions.v"
module tester(  output reg CLK,
                output reg go_down,
                output reg go_up,
                output reg halt,
                output reg reset,
                input      top_lim_cond,
                input      bott_lim_cond,
                input      top_lim_synth,
                input      bott_lim_synth,
                input      top_lim_synth_delay,
                input      bott_lim_synth_delay,
                input [4:0] estado_cond,
                input [4:0] prox_estado_cond,
                input [4:0] estado_synth,
                input [4:0] prox_estado_synth,
                input [4:0] estado_synth_delay,
                input [4:0] prox_estado_synth_delay
                );

   initial begin
      $dumpfile("fsm.vcd");
      $dumpvars(1, tester);
      $monitor("\nAt time %t\ntop_lim_cond = %h, top_lim_synth = %h, top_lim_synth_delay = %h\nbott_lim_cond = %h, bott_lim_synth = %h, bott_lim_synth_delay = %h\nestado_cond = %h, prox_estado_cond = %h, estado_synth = %h, prox_estado_synth = %h, estado_synth_delay = %h, prox_estado_synth_delay = %h\n",
               $time, top_lim_cond, top_lim_synth, top_lim_synth_delay, bott_lim_cond, bott_lim_synth, bott_lim_synth_delay, estado_cond, prox_estado_cond, estado_synth, prox_estado_synth, estado_synth_delay, prox_estado_synth_delay);
   end

   initial begin
      reset = 1'b0;
      CLK = 1'b0;
      go_down = 1'b0;
      go_up = 1'b0;
      halt = 1'b1;
      repeat(2) #100 CLK = ~CLK;
      reset = 1'b1;
      halt = 1'b0;
      forever #100 CLK = ~CLK;
   end

    initial begin
      @(negedge halt);
      go_down = 1'b1;
      repeat(6) @(posedge CLK);
      go_down = 1'b1;
      repeat(6) @(posedge CLK);
      go_down = 1'b0;
      go_up = 1'b1;
      repeat(6) @(posedge CLK);
      go_down = 1'b1;
      go_up = 1'b0;
      repeat(6) @(posedge CLK);
      halt = 1'b1;
      repeat(6) @(posedge CLK);
      go_down = 1'b0;
      go_up = 1'b1;
      repeat(6) @(posedge CLK);
      go_down = 1'b1;
      go_up = 1'b0;
      repeat(6) @(posedge CLK);
      halt = 1'b0;
      go_down = 1'b1;
      go_up = 1'b1;
      repeat(6) @(posedge CLK);
      halt = 1'b1;
      #10 $finish;
   end

endmodule // tester
