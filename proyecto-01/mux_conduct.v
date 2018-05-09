module mux (

  output reg [7:0] outputMux,

  input wire [7:0] inputA,
  input wire [7:0] inputB,
  input wire [7:0] inputC,
  input wire [7:0] inputD,

  input wire [1:0] controlInput,
  input wire muxCLK
  );

  always @ ( posedge muxCLK ) begin
    case (controlInput)
      2'b00: outputMux <= inputA;
      2'b01: outputMux <= inputB;
      2'b10: outputMux <= inputC;
      2'b11: outputMux <= inputD;
    endcase
  end

endmodule //mux
