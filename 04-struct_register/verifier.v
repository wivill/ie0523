`include "definitions.v"

module verifier(  input      [3:0]  Qcond,
                  input      [3:0]  Qstruct,
                  input             S_OUTcond,
                  input             S_OUTstruct
                  );

  always @ (posedge Qstruct or negedge Qstruct) begin
    if (Qstruct != Qcond) begin
      $display("#####################\nError de salida en T = %t, Qstruct = %d, Qcond = %d.\n#####################", $time, Qstruct, Qcond);
    end // if
  end

  always @ (posedge S_OUTstruct or negedge S_OUTstruct) begin
    if (S_OUTstruct != S_OUTcond) begin
      $display("#####################\nError de salida en T = %t, S_OUTstruct = %d, S_OUTcond = %d.\n#####################", $time, S_OUTstruct, S_OUTcond);
    end // if
  end // end

endmodule
