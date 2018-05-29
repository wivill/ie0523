module ffd_p2s_cond(input CLK,
                    input D,
                    input ENB,
                    input valid_in,
                    output reg Q,
                    output reg valid_out
  );

  always @ (~ENB) begin
    Q <= 1'b0;
  end

  always @ (posedge CLK) begin
    if (ENB) begin
      if (valid_in) begin
        Q <= D;
      end else begin
        Q <= Q;
      end
    end else begin
      // Q <= 1'bz;
      Q <= 1'b0;
      // Q <= Q;
    end
  end

  always @ (valid_in) begin
    valid_out = 1'b1;
  end

endmodule
