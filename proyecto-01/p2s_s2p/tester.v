`timescale 1ns / 100ps

`include "../s2p/freq_div_cond.v"

module tester_s2p(  output reg  [7:0]   IN_COM, IN_PAD, IN_SKP, IN_STP, IN_SDP, IN_END, IN_EDB, IN_FTS, IN_IDL, IN_TLP,
                    output reg          CLK_2MHz,
                    output reg  [3:0]   IN_CTRL,
                    output reg          ENB,
                    output reg          reset
                    );

  initial begin
    $dumpfile("pcie.vcd");
    $dumpvars;
  end

  initial begin
    CLK_2MHz = 1'b0;
    ENB = 1'b0;
    reset = 1'b0;
    // CTR = 3'b110;
    #500
    repeat(2) #500 CLK_2MHz = ~CLK_2MHz;
    ENB = 1'b1;
    reset = 1'b1;
    forever #500 CLK_2MHz = ~CLK_2MHz;
  end

  initial begin
    @(posedge ENB)
    // repeat(8) @(posedge CLK_2MHz);
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
