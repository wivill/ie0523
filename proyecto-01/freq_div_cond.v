module freq_div_cond( input       CLK,
                      input       reset,
                      output reg  CLK_2,
                      output reg  CLK_4,
                      output reg  CLK_8
  );

  // wire CLK_2_to_CLK_4, CLK_4_to_CLK_8;

  always @ (~reset) begin
    CLK_2 <= 1'b0;
    CLK_4 <= 1'b0;
    CLK_8 <= 1'b0;
  end

  always @ (posedge CLK) begin
    if (~reset) begin
      CLK_2 <= 1'b0;
      CLK_4 <= 1'b0;
      CLK_8 <= 1'b0;
    end else begin
      CLK_2 <= ~CLK_2;
    end
  end

  always @ (posedge CLK_2) begin
    CLK_4 <= ~CLK_4;
  end

  always @ (posedge CLK_4) begin
    CLK_8 <= ~CLK_8;
  end

endmodule
