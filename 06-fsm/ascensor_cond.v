`include "definitions.v"

module ascensor_cond( input       CLK,
                      input       go_down,
                      input       go_up,
                      input       halt,
                      output reg  top_lim,
                      output reg  bott_lim,
                      output reg [4:0] estado,
                      output reg [4:0] prox_estado
                      );

  always @(posedge CLK) begin
    estado <= prox_estado;
  end

  always @(*) begin
    top_lim = 1'b0;
    bott_lim = 1'b0;
    prox_estado = estado;
    case (estado)
    
      `IDLE: begin
        if (halt) begin
          prox_estado = `IDLE;
          top_lim = top_lim;
          bott_lim = bott_lim;
        end else if (go_down) begin
          prox_estado = `GOING_DOWN;
          top_lim = 1'b0;
          bott_lim = 1'b0;
        end else if (go_up) begin
          prox_estado = `GOING_UP;
          top_lim = 1'b0;
          bott_lim = 1'b0;
        end
      end

      `GOING_UP: begin
        if (halt) begin
          prox_estado = `IDLE;
          top_lim = 1'b0;
          bott_lim = 1'b1;
        end else begin
          prox_estado = `AT_TOP;
          top_lim = 1'b1;
          bott_lim = 1'b0;
        end
      end

      `AT_TOP: begin
        if (go_up) begin
          prox_estado = `AT_TOP;
          top_lim = 1'b1;
          bott_lim = 1'b0;
        end else if (go_down) begin
          prox_estado = `GOING_DOWN;
          top_lim = 1'b0;
          bott_lim = 1'b0;
        end
      end

      `GOING_DOWN: begin
        if (halt) begin
          prox_estado = `IDLE;
          top_lim = 1'b1;
          bott_lim = 1'b0;
        end else begin
          prox_estado = `AT_BOTTOM;
          top_lim = 1'b0;
          bott_lim = 1'b1;
        end
      end

      `AT_BOTTOM: begin
        if (go_down) begin
          prox_estado = `AT_BOTTOM;
          top_lim = 1'b0;
          bott_lim = 1'b1;
        end else if (go_up) begin
          prox_estado = `GOING_UP;
          top_lim = 1'b0;
          bott_lim = 1'b0;
        end
      end

      default: begin
        prox_estado = `IDLE;
        top_lim = 1'b0;
        bott_lim = 1'b0;
      end

    endcase

  end

endmodule
