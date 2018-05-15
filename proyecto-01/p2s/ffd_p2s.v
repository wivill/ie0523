module ffd_p2s( input CLK,
                input D,
                input ENB,
                output reg Q
  );

  always @ (posedge CLK) begin
    if (ENB) begin
      Q <= D;
    end else begin
      Q <= 1'bz;
      // Q <= Q;
    end
  end

endmodule
