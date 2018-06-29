`timescale 1ns / 100ps

module tester(      output reg  [2:0]   weight_assign,
                    output reg  [1:0]   vc_assign,
                    output reg          CLK_2MHz, reset, edit_weight,
                    output reg  [3:0]   Data_Word
                    );

  initial begin
    $dumpfile("wrr.vcd");
    $dumpvars;
  end

  initial begin
    vc_assign = 2'b00;
    weight_assign = 3'b000;
    Data_Word = 4'b0000;
    CLK_2MHz = 1'b0;
    reset = 1'b0;
    edit_weight = 1'b0;
    #500
    repeat(2) #250 CLK_2MHz = ~CLK_2MHz;
    reset = 1'b1;
    forever #250 CLK_2MHz = ~CLK_2MHz;
  end

  always @ (posedge CLK_2MHz) begin
    Data_Word = Data_Word + 1;
  end

  initial begin
    @(posedge reset)
    repeat(4) @(posedge CLK_2MHz);
    edit_weight = 1'b1;
    vc_assign = 2'b00;
    weight_assign = 3'b011;
    repeat(4) @(posedge CLK_2MHz);
    edit_weight = 1'b1;
    vc_assign = 2'b01;
    weight_assign = 3'b100;
    repeat(4) @(posedge CLK_2MHz);
    edit_weight = 1'b1;
    vc_assign = 2'b10;
    weight_assign = 3'b001;
    repeat(4) @(posedge CLK_2MHz);
    edit_weight = 1'b1;
    vc_assign = 2'b11;
    weight_assign = 3'b010;
    repeat(8) @(posedge CLK_2MHz);
    edit_weight = 1'b0;
    vc_assign = 2'b00;
    repeat(8) @(posedge CLK_2MHz);
    edit_weight = 1'b0;
    vc_assign = 2'b01;
    repeat(8) @(posedge CLK_2MHz);
    edit_weight = 1'b0;
    vc_assign = 2'b10;
    repeat(8) @(posedge CLK_2MHz);
    edit_weight = 1'b0;
    vc_assign = 2'b11;
    #500 $finish;
  end

endmodule
