`include "definitions.v"

module verifier(  input      [3:0]  Qcond,
                  input      [3:0]  Qstruct,
                  input             S_OUTcond,
                  input             S_OUTstruct
                  );

  // real time_a;
  // real time_b;

  // integer exep = 0;

  always @ (posedge Qstruct or negedge Qstruct) begin
    // time_a = $realtime;
    // if (time_a != 0 && time_b != 0 ) begin
      // if ((0 <= (time_b-time_a))&&((time_b-time_a) < 20)&&(exep == 0)) begin
        if (Qstruct != Qcond) begin
          $display("Error de salida en T = %t, Qstruct = %d, Qcond = %d.", $time, Qstruct, Qcond);
          // exep <= 1;
        end // if
      // end else if ((-20.0 < (time_b - time_a)) && ((time_b - time_a) < 0) && (exep == 0)) begin
        if (Qstruct != Qcond) begin
          $display("Error de salida en T = %t, Qstruct = %d, Qcond = %d.", $time, Qstruct, Qcond);
          // exep <= 1;
        end // if
      // end
    // end
  end // end

  always @ (posedge S_OUTstruct or negedge S_OUTstruct) begin
    // time_a = $realtime;
    // if (time_a != 0 && time_b != 0 ) begin
      // if ((0 <= (time_b - time_a)) && ((time_b - time_a) < 20) && (exep == 0)) begin
        if (S_OUTstruct != S_OUTcond) begin
          $display("Error de salida en T = %t, S_OUTstruct = %d, S_OUTcond = %d.", $time, S_OUTstruct, S_OUTcond);
          // exep <= 1;
        end // if
      // end else if ((-20.0 < (time_b - time_a)) && ((time_b - time_a) < 0) && (exep == 0)) begin
        if (S_OUTstruct != S_OUTcond) begin
          $display("Error de salida en T = %t, S_OUTstruct = %d, S_OUTcond = %d.", $time, S_OUTstruct, S_OUTcond);
          // exep <= 1;
        end // if
      // end
    // end
  end // end

endmodule
