module s2p_cond #(parameter WIDTH = 8)
(     input                   CLK,
      input                   CLK_8,
      input                   ENB,
      input                   s_in,
      output reg [WIDTH-1:0]  p_out
      );

  reg [WIDTH-1:0] Q;

  always @(posedge CLK) begin
    Q <= {Q[WIDTH-1:1],s_in};
  end

  always @ (posedge CLK_8) begin
    p_out <= Q;
  end

endmodule
