`include"definitions.v"
`include"registro.v"
module registro_tb;

// Ancho de palabra del registro
  parameter  WIDTH = 4;

// Entradas del módulo registro
    reg ENB;
    reg DIR;
    reg S_IN;
    reg [1 : 0]         MODO;
    reg [WIDTH - 1 : 0] D;
    reg CLK;
// Salidas del módulo registro
    wire [WIDTH - 1 : 0] Q;
    wire                 S_OUT;

// Instancia del registro para un ancho de palabra de 4 bits
    registro #(WIDTH) r0
    (
      .Q(Q),
      .S_OUT(S_OUT),
      .D(D),
      .MODO(MODO),
      .CLK(CLK),
      .ENB(ENB),
      .DIR(DIR),
      .S_IN(S_IN)
    );
endmodule
