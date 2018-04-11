`include"definitions.v"
module tester()
// Pruebas sincrónicas
// Reloj
  initial begin
    $dumpfile ("registro.vcd");
    $dumpvars(1, registro_tb);
    $monitor("At time %t, Q = %h (%0d), S_OUT = %h (%0d)",
             $time, Q, Q, S_OUT, S_OUT);

    CLK = 1'b0;
    ENB = 1'b0;
    repeat(4) #5 CLK = ~CLK;
    ENB = 1'b1;
    forever #5 CLK = ~CLK;

    // Carga de datos
    @(posedge ENB);
    D = 4'b1101;
    MODO = `LOAD;
    S_IN = 1'b0;
    DIR = 0;
    repeat(6) @(posedge CLK);
    // Desplazamiento izquierda
    S_IN = 1'b0;
    DIR = 0;
    MODO = `PUSH;
    repeat(6) @(posedge CLK);
    // Desplazamiento derecha
    S_IN = 1'b1;
    DIR = 1;
    MODO = `PUSH;
    repeat(6) @(posedge CLK);
    // Refrescar dato
    D = 4'b1010;
    MODO = `LOAD;
    repeat(6) @(posedge CLK);
    // Desplazamiento circular izquierda
    DIR = 0;
    MODO = `CYCLE;
    repeat(6) @(posedge CLK);
    // Refrescar dato
    D = 4'b0110;
    MODO = `LOAD;
    repeat(6) @(posedge CLK);
    // Desplazamiento circular derecha
    DIR = 1;
    MODO = `CYCLE;
    repeat(6) @(posedge CLK);
    $finish;
  end

endmodule
