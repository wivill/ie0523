module tester_p2s(  input       [2:0] CLK_div,
                    input       [7:0] Q0,
                    input       [7:0] Q1,
                    input       [7:0] Q2,
                    input       [7:0] Q3,
                    input       [3:0] data_out,
                    output reg  [2:0] sel,
                    output reg  [31:0] data_in,
                    output reg         CLK,
                    output reg  [31:0] D,
                    output reg        ENB,
                    output reg        reset
  );

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
  end

endmodule
