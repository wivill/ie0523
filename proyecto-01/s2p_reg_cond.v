`include "definitions.v"

module s2p_reg_cond ( input   wire  [7:0] D,
                      input   wire  [1:0] MODO,
                      input   wire        CLK, ENB, DIR, S_IN, RESET,
                      output  reg   [7:0] Q,
                      output  reg         S_OUT
  );

  reg [2:0] CTR;
  reg [8:0] DATA;

  always @ (~RESET) begin
    Q <= 8'b00000000;
    S_OUT <= 1'b0;
    CTR <= 3'b111;
    // Q <= 8'bz;
    // S_OUT <= 1'bz;
  end

  always @ (posedge CLK) begin

    if (RESET) begin

      CTR <= CTR + 1;

      if (~ENB) begin
        Q <= Q;
      end else begin

      if (CTR == 3'b001) begin
        Q <= DATA[7:0];
        S_OUT <= DATA[8];
      end

        case (MODO)
          `PUSH:
          begin
            // if (CTR == 3'b111) begin
              if (DIR == 0) begin
                DATA[8] <= DATA[7];
                DATA[7:0] <= {DATA[6 : 0], S_IN};
              end else begin
                DATA[8] <= DATA[0];
                DATA[7:0] <= {S_IN, DATA[7 : 1]};
              end

            // end
          end
        //------------------------------------------------------
          `CYCLE:
          begin
            // if (CTR == 3'b111) begin
              if (DIR == 0) begin
                DATA[7 : 0] <= {DATA[6 : 0], DATA[7]};
                DATA[8] <= 0;
              end else begin
                DATA[7 : 0] <= {DATA[0], DATA[7 : 1]};
                DATA[8] <= 0;
              end
            // end
          end
        //------------------------------------------------------
          `LOAD:
          begin
            DATA[7 : 0] <= D[7 : 0];
            DATA[8] <= 0;
          end
        //------------------------------------------------------
          default:
          begin
            DATA[7 : 0] <= D[7 : 0];
            DATA[8] <= 0;
          end
        //------------------------------------------------------
        endcase

      end //end else
    end else begin
      Q <= 8'b0;
      S_OUT <= 1'b0;
      CTR <= 3'b111;
      // Q <= 8'bz;
      // S_OUT <= 1'bz;
    end
  end //end always

endmodule
