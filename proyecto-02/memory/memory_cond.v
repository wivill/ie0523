module memory_cond #(parameter DATA_WIDTH = 8, parameter ADDRESS_WIDTH = 3, parameter BUFFER_DEPTH = 8
)(
  input CLK,              // Reloj
  input ENB,              // Enabler
  input sRead,            // Señal que indica lectura
  input sWrite,           // Señal que indica escritura

  input [ADDRESS_WIDTH-1:0] addressRead,
  input [ADDRESS_WIDTH-1:0] addressWrite,
  input [DATA_WIDTH-1:0] inputData,       // Datos que se quieren escribir
  output reg [DATA_WIDTH-1:0] outputData  // Datos que se quieren leer
  );

  reg [DATA_WIDTH-1:0] memoria [BUFFER_DEPTH-1:0]; // Se crea la memoria

  always @ ( posedge CLK ) begin
    if (sRead) begin
      outputData <= memoria[addressRead];
    end
    if (sWrite) begin
      memoria[addressWrite] <= inputData;
    end
  end
endmodule //memory
