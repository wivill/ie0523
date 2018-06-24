module wrr_cond(  input   reset,
                  input   clk,
                  input [2:0]   weight,
                  input [1:0]   request_id,
                  output reg [1:0] grant_id

                  );
// hacer tabla de VC y pesos para que lo lea wrr_cond y asignar así el canal en el mux.
endmodule
