`include "definitions.v"

module verifier(  input      [3:0]  Qcond,
                  input      [3:0]  Qstruct,
                  input      [3:0]  Qyos,
                  input      [3:0]  QA,
                  input      [3:0]  Qdelay,
                  input             S_OUTcond,
                  input             S_OUTstruct,
                  input             S_OUTyosA,
                  input             S_OUTyos,
                  input             S_OUTdelay
                  );

  always @ (posedge Qstruct or negedge Qstruct) begin
    if (Qstruct != Qcond) begin
      $display("##############################\nError de salida en T = %t, Qstruct = %d, Qcond = %d, Qyos = %d, QA = %d, Qdelay = %d.\n##############################", $time, Qstruct, Qcond, Qyos, QA, Qdelay);
    end // if
  end

  always @ (posedge S_OUTstruct or negedge S_OUTstruct) begin
    if (S_OUTstruct != S_OUTcond) begin
      $display("##############################\nError de salida en T = %t, S_OUTstruct = %d, S_OUTcond = %d, S_OUTyos = %d, S_OUTyosA = %d, S_OUTdelay = %d.\n##############################", $time, S_OUTstruct, S_OUTcond, S_OUTyos, S_OUTyosA, S_OUTdelay);
    end // if
  end // end
// comentario de prueba
  // always @ (posedge S_OUTyos or negedge S_OUTyos) begin
  //   if (S_OUTstruct != S_OUTcond) begin
  //     $display("Error de salida en T = %t, S_OUTstruct = %d, S_OUTcond = %d.", $time, S_OUTstruct, S_OUTcond);
  //   end // if
  // end // end

endmodule
