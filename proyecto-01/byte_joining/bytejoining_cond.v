module mux4a1 (
  input In0,In1,In2,In3;
  input [1:0] Sel;
  output out;
  );
  always @ ( * ) begin
    case (Sel)
      2'b00: out = In0;
      2'b01: out = In1;
      2'b10: out = In2;
      2'b11: out = In3;
    endcase
  end

endmodule //mux4a1

module byte_joining (
  input [7:0] Lane_0; //Entrada para la Linea 0 que viene de la etapa de serie a paralelo
  input [7:0] Lane_1; //Entrada para la Linea 1 que viene de la etapa de serie a paralelo
  input [7:0] Lane_2; //Entrada para la Linea 1 que viene de la etapa de serie a paralelo
  input [7:0] Lane_3; //Entrada para la Linea 1 que viene de la etapa de serie a paralelo
  input [1:0] ctr_3; // Bus de selecion para el multiplexor que distribuye los datos de cada linea a la salida
  input clk250k; //Señal de reloj de los flops que guardan el dato que viene de la etapa de serie paralelo
  output [7:0] out;
  );

  reg [7:0] L0; //registro que contiene el dato mas reciente de la linea 0 de la etapa serie a paralelo.
  reg [7:0] L1; //registro que contiene el dato mas reciente de la linea 1 de la etapa serie a paralelo.
  reg [7:0] L2; //registro que contiene el dato mas reciente de la linea 2 de la etapa serie a paralelo.
  reg [7:0] L3; //registro que contiene el dato mas reciente de la linea 3 de la etapa serie a paralelo.


  always @ (posedge clk250k) begin
    L0 <= Lane_0;
    L1 <= Lane_1;
    L2 <= Lane_2;
    L3 <= Lane_3;
  end

  mux4a1 mux( .In0 (L0),  // se intancia el mux 4 a 1 que distribuye los datos de los canales
              .In1 (L1),
              .In2 (L2),
              .In3 (L3),
              .out (out),
              .Sel (ctr_3)
    );




endmodule //byte_joining
