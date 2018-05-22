module tester_s2p(  input       [2:0] CLK_div,
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
                    input       [7:0] P0_cond,
                    input       [7:0] P1_cond,
                    input       [7:0] P2_cond,
                    input       [7:0] P3_cond,
                    input       [7:0] P0_synth,
                    input       [7:0] P1_synth,
                    input       [7:0] P2_synth,
                    input       [7:0] P3_synth,
                    input       [7:0] P0_synth_delay,
                    input       [7:0] P1_synth_delay,
                    input       [7:0] P2_synth_delay,
                    input       [7:0] P3_synth_delay,
                    output reg        CLK,
                    output reg        ENB,
                    output reg        reset,
                    output reg  [3:0] s_in
  );

  initial begin
    $dumpfile("s2p.vcd");
    $dumpvars(1, tester_s2p);
    $monitor("\nAt time %t\nCLK = %h, CLK_2 = %h, CLK_4 = %h, CLK_8 = %h, sel = %h\nQ0_cond = %h, Q1_cond = %h, Q2_cond = %h, Q3_cond = %h,\nQ0_synth = %h, Q1_synth = %h, Q2_synth = %h, Q3_synth = %h\nQ0_synth_delay = %h, Q1_synth_delay = %h, Q2_synth_delay = %h, Q3_synth_delay = %h",
             $time, CLK, CLK_div[0], CLK_div[1], CLK_div[2], Q0_cond, Q1_cond, Q2_cond, Q3_cond, Q0_synth, Q1_synth, Q2_synth, Q3_synth, Q0_synth_delay, Q1_synth_delay, Q2_synth_delay, Q3_synth_delay);
  end

  initial begin
    CLK = 1'b0;
    ENB = 1'b0;
    reset = 1'b0;
    s_in = 4'b0;
    #500
    repeat(2) #500 CLK = ~CLK;
    ENB = 1'b1;
    reset = 1'b1;
    forever #500 CLK = ~CLK;
  end

  always @ (posedge CLK) begin
    s_in = s_in + 1;
  end

  initial begin
    @(posedge ENB)
    repeat(80) @(posedge CLK);
    ENB = 1'b1;
    repeat(8) @(posedge CLK);
    reset = 1'b0;
    repeat(40) @(posedge CLK);
    reset = 1'b1;
    #500 $finish;
  end

endmodule
