module fifo_tester #(parameter DATA_WIDTH = 8, parameter ADDRESS_WIDTH = 3, parameter BUFFER_DEPTH = 8)(
  output reg CLK,              // Reloj
  output reg ENB,              // Enabler
  output reg RST,              // Reset
  output reg sRead,            // Señal que indica lectura
  output reg sWrite,           // Señal que indica escritura


  output reg [ADDRESS_WIDTH-1:0] umbEmpty,    // Umbral de vaciado
  output reg [ADDRESS_WIDTH-1:0] umbFull,     // Umbral de llenado

  output reg [DATA_WIDTH-1:0] inputData       // Datos que se quieren escribir
  );

  initial begin
    CLK <= 0;
  end

  initial begin
    $dumpfile("fifo_wave.vcd");
    $dumpvars;
    ENB <= 0;
    RST <= 1;
    inputData <= 8'b00110011;
    sRead <= 0;
    sWrite <= 0;
    umbEmpty <= 3'd3;
    umbFull <= 3'd6;
    #10;
    RST <=0;
    #10;
    ENB <= 1;
    sWrite <= 1;
    // Lleno el Fifo para tener un error de Full
    #80;
    sWrite <= 0;
    sRead <= 0;
    // Espero un tiempo para iniciar lecturas
    #20;
    sRead <= 1;
    // Se lee hasta tener un error de empty
    #100;
    // Se resetea todo para generar un error de full
    ENB <= 0;
    RST <= 1;
    inputData <= 8'b11001100;
    sRead <= 0;
    sWrite <= 0;
    umbEmpty <= 3'd3;
    umbFull <= 3'd6;
    #10;
    RST <=0;
    #10;
    ENB <= 1;
    sWrite <= 1;
    // Lleno el Fifo para tener un error de Full
    #120;

    $finish;
  end

  always begin
    #5;
    CLK <= ~CLK;
  end
endmodule
