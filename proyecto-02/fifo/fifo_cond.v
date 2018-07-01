module fifo_cond #(parameter DATA_WIDTH = 8, parameter ADDRESS_WIDTH = 3, parameter BUFFER_DEPTH = 8
)(
  input CLK,              // Reloj
  input ENB,              // Enabler
  input RST,              // Reset
  input sRead,            // Señal que indica lectura
  input sWrite,           // Señal que indica escritura


  input [ADDRESS_WIDTH-1:0] umbEmpty,    // Umbral de vaciado
  input [ADDRESS_WIDTH-1:0] umbFull,     // Umbral de llenado

  input [DATA_WIDTH-1:0] inputData,       // Datos que se quieren escribir

  output reg almostEmpty,
  output reg almostFull,
  output reg outEmpty,
  output reg outFull,
  output reg errorEmpty,
  output reg errorFull,

  output reg [DATA_WIDTH-1:0] outputData
  );

  reg [ADDRESS_WIDTH-1:0] ptrWr;  // Puntero de la escritura
  reg [ADDRESS_WIDTH-1:0] ptrRd;  // Puntero de la lectura
  reg [ADDRESS_WIDTH-1:0] cantWr; // Cantidad de valores escritos

  reg [DATA_WIDTH-1:0] buffer [BUFFER_DEPTH-1:0]; // Se crea la memoria

  always @ ( posedge CLK ) begin
    if (RST) begin  // Todas las salidas a cero
      almostEmpty <= 0;
      almostFull <= 0;
      outEmpty <= 1;
      outFull <= 0;
      errorEmpty <= 0;
      errorFull <= 0;

      ptrWr <= 0;
      ptrRd <= 0;
      cantWr <= 0;
    end
    else begin
    if (ENB) begin           // Escritura en el boffer
      if (sWrite) begin
        buffer[ptrWr] <= inputData;
        ptrWr <= ptrWr + 1;           // Se corre el puntero

        if (!sRead) begin             // Si no se lee el recién escrito
          if(outEmpty) begin          // *Líneas tentativas
            outEmpty <= 0;            // *
          end                         // *
          if (outFull) begin          // Si el buffer ya está lleno tire error
            errorFull <= 1;
          end
          else begin
            if (cantWr == DATA_WIDTH-1) begin // Se llena el buffer
              outFull <= 1;
            end
          end
          cantWr <= cantWr + 1;
        end
      end // fin del write

      if (sRead) begin
        outputData <= buffer[ptrRd]; // La salida es el primer elemento en el fifo
        ptrRd <= ptrRd + 1;

        if (!sWrite) begin
          if (outFull) begin
            outFull <= 0;
          end
          if (outEmpty) begin
            errorEmpty <= 1;
          end
          else begin
            if (cantWr == 1) begin
              outEmpty <= 1;
            end
          end
          cantWr <= cantWr - 1;
          end
        end
      end

      if ((1 < cantWr)&&(cantWr <= umbEmpty)) begin
        outEmpty <= 0;
        almostEmpty <= 1;
        almostFull <= 0;
      end

      if ((umbEmpty<=cantWr)&&(cantWr<=umbFull-1)) begin
        almostEmpty <= 0;
        almostFull <= 0;
      end

      if ((umbFull <= cantWr)&&(cantWr < DATA_WIDTH-1)) begin
        outFull <=0 ;
        almostEmpty <= 0;
        almostFull <= 1;
      end
    end // fin del reset
  end // fin del always

  // always @ ( * ) begin
  //   if(!cantWr&&outFull) begin
  //     outFull = 0;
  //   end
  //
  //   if(!cantWr&&outEmpty) begin
  //     outEmpty = 0;
  //   end
  //
  // end














endmodule //fifo_cond
