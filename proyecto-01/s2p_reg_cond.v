`include "definitions.v"

module s2p_reg_cond ( input   wire  [7:0] D,
                      input   wire  [1:0] MODO,
                      input   wire        CLK, ENB, DIR, S_IN, RESET,
                      output  reg   [7:0] Q,
                      output  reg         S_OUT
  );

  always @ (~RESET) begin
    Q <= 8'b0;
    S_OUT <= 1'b0;
    // Q <= 8'bz;
    // S_OUT <= 1'bz;
  end

  always @ (posedge CLK) begin
    if (RESET) begin
      if (~ENB) begin
        Q <= Q;
      end else begin

        case (MODO)
          `PUSH:
          begin
            if (DIR == 0) begin
              S_OUT <= Q[7];
              Q <= {Q[6 : 0], S_IN};
            end else begin
              S_OUT <= Q[0];
              Q <= {S_IN, Q[7 : 1]};
            end
          end
        //------------------------------------------------------
          `CYCLE:
          begin
            if (DIR == 0) begin
                Q[7 : 0] <= {Q[6 : 0], Q[7]};
                S_OUT <= 0;
            end else begin
                Q[7 : 0] <= {Q[0], Q[7 : 1]};
                S_OUT <= 0;
            end
          end
        //------------------------------------------------------
          `LOAD:
          begin
            Q[7 : 0] <= D[7 : 0];
            S_OUT <= 0;
          end
        //------------------------------------------------------
          default:
          begin
            Q[7 : 0] <= D[7 : 0];
            S_OUT <= 0;
          end
        //------------------------------------------------------
        endcase

      end //end else
    end else begin
      Q <= 8'b0;
      S_OUT <= 1'b0;
      // Q <= 8'bz;
      // S_OUT <= 1'bz;
    end
  end //end always

endmodule
