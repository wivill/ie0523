module mux4_1_cond( input [1:0]   VC_id,
                    input [3:0]   Data_Word,
                    input         reset,
                    output reg    data_out
                    );

  // VC_id corresponde a las líneas de selección
  // Data_Word corresponde a las entradas de datos

  // Bloque reset para tener un estado de partida y facilitar la síntesis
  always @ ( reset ) begin
    data_out = 1'b0;
  end
  // COndiciones de salida
  always @ (VC_id or Data_Word) begin
    case (VC_id)
      2'b00: data_out = VC_id[0];
      2'b01: data_out = VC_id[1];
      2'b10: data_out = VC_id[2];
      2'b11: data_out = VC_id[3];
      default: data_out = 1'b0;
    endcase
  end

endmodule
