module ffd_s2p_cond(input CLK,
                    input D,
                    input ENB,
                    output reg Q
  );

  always @ (~ENB) begin
    Q <= 1'bz;
  end

  always @ (posedge CLK) begin
    if (ENB) begin
      Q <= D;
    end else begin
      Q <= 1'bz;
    end
  end

endmodule
