module tester_p2s(  input       [2:0] CLK_div,
                    input       [7:0] Q0,
                    input       [7:0] Q1,
                    input       [7:0] Q2,
                    input       [7:0] Q3,
                    input       [3:0] data_out,
                    output reg  [2:0] sel,
                    // output reg  [31:0] data_in,
                    output reg         CLK,
                    // output reg  [31:0] D,
                    output reg  [7:0] D0,
                    output reg  [7:0] D1,
                    output reg  [7:0] D2,
                    output reg  [7:0] D3,
                    output reg        ENB,
                    output reg        reset
  );

  reg [31:0] D;

  // Facilita asignación de valores
  always @ (*) begin
    D = {D3, D2, D1, D0};
  end

  initial begin
    $dumpfile("p2s.vcd");
    $dumpvars(1, tester_p2s);
    $monitor("\nAt time %t\nQ0 = %h, Q1 = %h, Q2 = %h, Q3 = %h\nCLK = %h, CLK_2 = %h, CLK_4 = %h, CLK_8 = %h\nsel = %h, data_out = %h",
             $time, Q0, Q1, Q2, Q3, CLK, CLK_div[0], CLK_div[1], CLK_div[2], sel, data_out);
  end

  initial begin
    CLK = 1'b0;
    ENB = 1'b0;
    reset = 1'b0;
    sel = 3'b0;
    // data_in = 32'b0;
    D = 32'b0;
    #500
    repeat(2) #500 CLK = ~CLK;
    ENB = 1'b1;
    reset = 1'b1;
    forever #500 CLK = ~CLK;
  end

  always @ (posedge CLK) begin
    sel = sel + 1;
  end

  initial begin
    @(posedge ENB)
    D = 32'h01234567;
    repeat(6) @(posedge CLK);
    D = 32'h89ABCDEF;
    repeat(6) @(posedge CLK);
    D = 32'h81A3C5E7;
    repeat(6) @(posedge CLK);
    D = 32'h092B4D6F;
    repeat(6) @(posedge CLK);
    D = 32'h00000000;
    repeat(6) @(posedge CLK);
    D = 32'hFFFFFFFF;
    repeat(6) @(posedge CLK);
    D = 32'hAAAAAAAA;
    repeat(6) @(posedge CLK);
    D = 32'h55555555;
    repeat(6) @(posedge CLK);
    D = 32'hFEDCBA98;
    repeat(6) @(posedge CLK);
    ENB = 1'b0;
    D = 32'hFEDCBA98;
    repeat(6) @(posedge CLK);
    ENB = 1'b1;
    D = 32'hFEDCBA98;
    repeat(6) @(posedge CLK);
    reset = 1'b0;
    D = 32'hFEDCBA98;
    repeat(6) @(posedge CLK);
    reset = 1'b1;
    D = 32'hFEDCBA98;
    #500 $finish;
  end

endmodule
