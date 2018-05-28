module mux_ctr_cond(  input             valid_count,
                      input             CLK,
                      input             reset,
                      output reg [2:0]  CTR
                      );


// wire [2:0]  in_ctr;
// assign in_ctr = 3'b111;

always @ (posedge valid_count) begin
  CTR <= 3'b111;
end


always @ (posedge CLK) begin
  if (reset) begin
    // if (valid_count) begin
      CTR <= CTR + 1;
    // end else begin
      // CTR <= CTR;
    // end
  end else begin
    CTR <= 3'b111;
  end
end

endmodule
