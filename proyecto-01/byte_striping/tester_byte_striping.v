module tester_byte_striping (
  input wire [7:0] stripedLane0,
  input wire [7:0] stripedLane1,
  input wire [7:0] stripedLane2,
  input wire [7:0] stripedLane3,

  output reg [7:0] byteStripingIN,

  output reg byteStripingVLD,
  output reg byteStripingCLK,
  output reg controlMuxCLK
  );



  initial begin
    $dumpfile("pruebaByteStripping.vcd");
    $dumpvars;

    #0
    byteStripingIN = 8'b00010001;
    #8
    $finish;
  end

  initial controlMuxCLK <=1;
  always #0.5 controlMuxCLK <= ~controlMuxCLK;

  initial byteStripingCLK <=1;
  always #2 byteStripingCLK <= ~byteStripingCLK;








endmodule //tester_byte_striping
