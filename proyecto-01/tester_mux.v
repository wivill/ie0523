module tester_mux (
  input wire [7:0] outputMux,

  output reg [7:0] inputA,
  output reg [7:0] inputB,
  output reg [7:0] inputC,
  output reg [7:0] inputD,

  output reg [1:0] controlInput,
  output reg muxCLK
  );

  initial begin
    $dumpfile("pruebaMux.vcd");
    $dumpvars;


    #0
    inputA = 8'hFF;
    inputB = 8'hF0;
    inputC = 8'h0F;
    inputD = 8'h00;
    controlInput = 2'b00;

    #1
    controlInput = 2'b01;

    #1
    controlInput = 2'b10;

    #1
    controlInput = 2'b11;

    #1
    $finish;
  end

  initial muxCLK <=0;
  always #0.5 muxCLK <= ~muxCLK;


endmodule //
