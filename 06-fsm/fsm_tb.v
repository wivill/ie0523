`timescale 	1ns				/ 100ps
// escala	unidad temporal (valor de "#1") / precisión
// includes de archivos de verilog
// Pueden omitirse y llamarse desde el testbench
`include "ascensor_cond.v"
`include "tester.v"
`include "verifier.v"
`include "synth.v"
`include "synth_delay.v"

module testbench;

   // Wires para alambrar módulos
   wire CLK_tb, go_up_tb, go_down_tb, halt_tb;
   wire top_lim_synth_tb, top_lim_cond_tb, top_lim_synth_delay_tb;
   wire bott_lim_synth_tb, bott_lim_cond_tb, bott_lim_synth_delay_tb;

   tester     letest( .CLK             (CLK_tb),
                      .go_down         (go_down_tb),
                      .go_up           (go_up_tb),
                      .halt            (halt_tb),
                      .top_lim_cond    (top_lim_cond_tb),
                      .bott_lim_cond   (bott_lim_cond_tb),
                      .top_lim_synth  (top_lim_synth_tb),
                      .bott_lim_synth (bott_lim_synth_tb),
                      .top_lim_synth_delay   (top_lim_synth_delay_tb),
                      .bott_lim_synth_delay  (bott_lim_synth_delay_tb),
                      );

  ascensor_cond         a_cond(   .CLK        (CLK_tb),
                                  .go_down    (go_down_tb),
                                  .go_up      (go_up_tb),
                                  .halt       (halt_tb),
                                  .top_lim    (top_lim_cond_tb),
                                  .bott_lim   (bott_lim_cond_tb),
                              );

  ascensor_synth      a_synth (   .CLK        (CLK_tb),
                                  .go_down    (go_down_tb),
                                  .go_up      (go_up_tb),
                                  .halt       (halt_tb),
                                  .top_lim    (top_lim_synth_tb),
                                  .bott_lim   (bott_lim_synth_tb),
                                  );

  ascensor_synth_delay a_synth_delay(   .CLK        (CLK_tb),
                                  .go_down    (go_down_tb),
                                  .go_up      (go_up_tb),
                                  .halt       (halt_tb),
                                  .top_lim    (top_lim_synth_delay_tb),
                                  .bott_lim   (bott_lim_synth_delay_tb),
                                  );

  verifier          leverifier(   .top_lim_cond    (top_lim_cond_tb),
                                  .bott_lim_cond   (bott_lim_cond_tb),
                                  .top_lim_synth  (top_lim_synth_tb),
                                  .bott_lim_synth (bott_lim_synth_tb),
                                  .top_lim_synth_delay   (top_lim_synth_delay_tb),
                                  .bott_lim_synth_delay  (bott_lim_synth_delay_tb),
                                  );

endmodule
