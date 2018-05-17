module memTrans (dir, LE, dato);
  input [2:0] dir;
  input LE;
  inout [31:0] dato;
  reg [31:0] PwrCntr [5:0];
  //Control de E/S del puerto de datos
  assign dato = (LE)? PwrCntr[dir] : 32'bz;
  //Ciclo de escritura para la memoria
  always @(dir or negedge LE or dato) begin
    if (~LE) //escritura
    PwrCntr[dir] = dato;
  end
endmodule
