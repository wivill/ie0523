`include "definitions.v"

module verifier(  input      [3:0]  Qcond,
                  input      [3:0]  Qstruct,
                  input      [3:0]  Qyos,
                  input             S_OUTcond,
                  input             S_OUTstruct,
                  input             S_OUTyos
                  );

  always @ (posedge Qstruct or negedge Qstruct) begin
    if (Qstruct != Qcond) begin
      $display("Error de salida en T = %t, Qstruct = %d, Qcond = %d, Qyos = %d.", $time, Qstruct, Qcond, Qyos);
    end // if
  end

  always @ (posedge S_OUTstruct or negedge S_OUTstruct) begin
    if (S_OUTstruct != S_OUTcond) begin
      $display("Error de salida en T = %t, S_OUTstruct = %d, S_OUTcond = %d, S_OUTyos = %d.", $time, S_OUTstruct, S_OUTcond, S_OUTyos);
    end // if
  end // end

  // always @ (posedge S_OUTyos or negedge S_OUTyos) begin
  //   if (S_OUTstruct != S_OUTcond) begin
  //     $display("Error de salida en T = %t, S_OUTstruct = %d, S_OUTcond = %d.", $time, S_OUTstruct, S_OUTcond);
  //   end // if
  // end // end

endmodule
