module wrr_cond(  input   reset,
                  input   clk,
                  input [2:0]   weight,
                  input [1:0]   request_id,
                  output reg [1:0] grant_id

                  );
// hacer tabla de VC y pesos para que lo lea wrr_cond y asignar así el canal en el mux.

  reg [1:0] current_request_id;
  reg [2:0] weight_ctr, current_weight;


  always @ (~reset) begin
    grant_id <= 2'b00;
    current_request_id <= 2'b00;
    weight_ctr <= 3'b111;
    current_weight <= 3'b001;
  end

  always @ (posedge clk) begin
    if (reset) begin
      weight_ctr <= weight_ctr + 1'b1;
      if (current_weight == weight_ctr) begin
        weight_ctr <= 3'b111;
        current_request_id <= request_id;
        current_weight <= weight;
      end else begin
        grant_id <= current_request_id;
      end
    end
  end


endmodule
