module memory_tester #(parameter DATA_WIDTH = 8, parameter ADDRESS_WIDTH = 3, parameter BUFFER_DEPTH = 8)(
  output reg CLK,              // Reloj
  output reg ENB,              // Enabler
  output reg sRead,            // Señal que indica lectura
  output reg sWrite,           // Señal que indica escritura


  output reg [ADDRESS_WIDTH-1:0] addressRead,    // lectura
  output reg [ADDRESS_WIDTH-1:0] addressWrite,   // Umbral de llenado

  output reg [DATA_WIDTH-1:0] inputData       // Datos que se quieren escribir
  );

  reg [2:0] i;
  initial begin
    CLK <= 0;
  end

  initial begin
    $dumpfile("memory_wave.vcd");
    $dumpvars;
    #0;
    ENB <= 1;
    inputData <= 8'b1;
    sRead <= 0;
    sWrite <= 1;
    addressWrite <= 3'd0;
    addressRead <= 3'd0;

    #10;
    inputData <= 8'd2;
    addressWrite <= 3'd1;

    #4;
    sRead <=1;
    #6;
    inputData <= 8'd4;
    addressWrite <= 3'd2;
    addressRead <= addressWrite - 1;

    #10;
    inputData <= 8'd8;
    addressWrite <= 3'd3;
    addressRead <= addressWrite - 1;

    #10;
    inputData <= 8'd16;
    addressWrite <= 3'd4;
    addressRead <= addressWrite - 1;

    #10;
    inputData <= 8'd32;
    addressWrite <= 3'd5;
    addressRead <= addressWrite - 1;

    #10;
    inputData <= 8'd64;
    addressWrite <= 3'd6;
    addressRead <= addressWrite - 1;

    #10;
    inputData <= 8'd128;
    addressWrite <= 3'd7;
    addressRead <= addressWrite - 1;
    #10

    $finish;
  end

  always begin
    #5;
    CLK <= ~CLK;
  end
endmodule
