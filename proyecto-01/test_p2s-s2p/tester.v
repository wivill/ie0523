`timescale 1ns / 100ps

`include "../s2p/freq_div_cond.v"

module tester_s2p(  output reg          CLK_2MHz,
                    output              CLK_1MHz,
                    output              CLK_500KHz,
                    output              CLK_250KHz,
                    output reg          ENB,
                    output reg          reset,
                    output reg  [2:0]   CTR,
                    output reg  [31:0]  DATO,
                    output reg          VALID
                    );

  freq_div_cond clocks_cond ( .CLK    (CLK_2MHz),
                              .reset  (reset),
                              .CLK_2  (CLK_1MHz),
                              .CLK_4  (CLK_500KHz),
                              .CLK_8  (CLK_250KHz)
                              );

  initial begin
    $dumpfile("p2s-s2p.vcd");
    $dumpvars;
  end

  initial begin
    CLK_2MHz = 1'b0;
    ENB = 1'b0;
    reset = 1'b0;
    CTR = 3'b111;
    #500
    repeat(2) #500 CLK_2MHz = ~CLK_2MHz;
    ENB = 1'b1;
    reset = 1'b1;
    VALID = 1'b1;
    forever #500 CLK_2MHz = ~CLK_2MHz;
  end

  always @ (posedge CLK_2MHz) begin
    CTR = CTR + 1;
  end

  initial begin
    @(posedge ENB)
    repeat(8) @(posedge CLK_2MHz);
    DATO = 32'h01234567;
    repeat(8) @(posedge CLK_2MHz);
    DATO = 32'h89ABCDEF;
    repeat(8) @(posedge CLK_2MHz);
    DATO = 32'h092B4D6F;
    repeat(8) @(posedge CLK_2MHz);
    DATO = 32'h81A3C5E7;
    repeat(8) @(posedge CLK_2MHz);
    DATO = 32'h76543210;
    repeat(8) @(posedge CLK_2MHz);
    DATO = 32'hFEDCBA98;
    repeat(8) @(posedge CLK_2MHz);
    DATO = 32'hF6D4B290;
    repeat(8) @(posedge CLK_2MHz);
    DATO = 32'h7E5C3A18;
    repeat(8) @(posedge CLK_2MHz);
    #500 $finish;
  end

endmodule
