module ctr3_cond    ( input             CLK,
                      input             reset,
                      output reg [1:0]  CTR
                      );

always @ (posedge CLK) begin
  if (reset) begin
    CTR <= CTR + 1;
  end else begin
    CTR <= 2'b11;
  end
end

endmodule
