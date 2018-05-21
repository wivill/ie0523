module tester_p2s(  input       [2:0] CLK_div,
                    input       [7:0] Q0_cond,
                    input       [7:0] Q1_cond,
                    input       [7:0] Q2_cond,
                    input       [7:0] Q3_cond,
                    input       [7:0] Q0_synth,
                    input       [7:0] Q1_synth,
                    input       [7:0] Q2_synth,
                    input       [7:0] Q3_synth,
                    input       [7:0] Q0_synth_delay,
                    input       [7:0] Q1_synth_delay,
                    input       [7:0] Q2_synth_delay,
                    input       [7:0] Q3_synth_delay,
                    input       [3:0] data_out_cond,
                    input       [3:0] data_out_synth,
                    input       [3:0] data_out_synth_delay,
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
    // D = {D3, D2, D1, D0};
    {D3, D2, D1, D0} = D;
  end

  initial begin
    $dumpfile("p2s.vcd");
    $dumpvars(1, tester_p2s);
    $monitor("\nAt time %t\nCLK = %h, CLK_2 = %h, CLK_4 = %h, CLK_8 = %h, sel = %h\ndata_out_cond = %h, Q0_cond = %h, Q1_cond = %h, Q2_cond = %h, Q3_cond = %h,\ndata_out_synth = %h, Q0_synth = %h, Q1_synth = %h, Q2_synth = %h, Q3_synth = %h\ndata_out_synth_delay = %h, Q0_synth_delay = %h, Q1_synth_delay = %h, Q2_synth_delay = %h, Q3_synth_delay = %h",
             $time, CLK, CLK_div[0], CLK_div[1], CLK_div[2], sel, data_out_cond, Q0_cond, Q1_cond, Q2_cond, Q3_cond, data_out_synth, Q0_synth, Q1_synth, Q2_synth, Q3_synth, data_out_synth_delay, Q0_synth_delay, Q1_synth_delay, Q2_synth_delay, Q3_synth_delay);
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
