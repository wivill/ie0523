`include "definitions.v"

module s2p_reg_cond #(parameter WIDTH = 8)
(
input   wire  [WIDTH-1 : 0] D,
input   wire  [1 : 0]       MODO,
input   wire                CLK, ENB, DIR, S_IN,

output  reg   [WIDTH-1 : 0] Q,
output  reg                 S_OUT
);

always @ (posedge CLK) begin
  if (~ENB) begin
    Q <= Q;
  end else begin

    case (MODO)
      `PUSH:
      begin
        if (DIR == 0) begin
          S_OUT <= Q[WIDTH - 1];
          Q <= {Q[WIDTH - 2 : 0], S_IN};
        end else begin
          S_OUT <= Q[0];
          Q <= {S_IN, Q[WIDTH - 1 : 1]};
        end
      end
    //------------------------------------------------------
      `CYCLE:
      begin
        if (DIR == 0) begin
            Q[WIDTH - 1 : 0] <= {Q[WIDTH - 2 : 0], Q[WIDTH - 1]};
            S_OUT <= 0;
        end else begin
            Q[WIDTH - 1 : 0] <= {Q[0], Q[WIDTH - 1 : 1]};
            S_OUT <= 0;
        end
      end
    //------------------------------------------------------
      `LOAD:
      begin
        Q[WIDTH - 1 : 0] <= D[WIDTH - 1 : 0];
        S_OUT <= 0;
      end
    //------------------------------------------------------
      default:
      begin
        Q[WIDTH - 1 : 0] <= D[WIDTH - 1 : 0];
        S_OUT <= 0;
      end
    //------------------------------------------------------
    endcase

  end //end else


end //end always

endmodule
