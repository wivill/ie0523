`timescale 1ns / 100ps

module tester(      output reg  [2:0]   weight_assign,
                    output reg  [1:0]   vc_assign,
                    output reg          clk, reset, edit_weight,
                    output reg  [3:0]   Data_Word
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
    repeat(2) #250 CLK_2MHz = ~CLK_2MHz;
    ENB = 1'b1;
    reset = 1'b1;
    forever #250 CLK_2MHz = ~CLK_2MHz;
  end

  initial begin
    IN_CTRL = 0;
    IN_TLP = 8'hFF;
    IN_COM = 8'hBC;
    IN_PAD = 8'hC7;
    IN_SKP = 8'hAC;
    IN_STP = 8'hAA;
    IN_SDP = 8'hE5;
    IN_END = 8'hF6;
    IN_EDB = 8'hDF;
    IN_FTS = 8'hA8;
    IN_IDL = 8'hAE;



endmodule
