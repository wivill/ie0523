module tester_byte_striping (
  input wire [7:0] stripedLane0,
  input wire [7:0] stripedLane1,
  input wire [7:0] stripedLane2,
  input wire [7:0] stripedLane3,
  input wire byteStripingVLD,

  output reg [7:0] byteStripingIN,
  output reg lane0VLD,
  output reg lane1VLD,
  output reg lane2VLD,
  output reg lane3VLD,
  output reg clk250k,
  output reg clk1Mhz,
  output reg conteo,
  output reg reset
  );

  initial begin
    $dumpfile("pruebaByteStripping.vcd");
    $dumpvars;

    #0
    reset = 1;
    lane0VLD = 1'b0;
    lane1VLD = 1'b0;
    lane2VLD = 1'b0;
    lane3VLD = 1'b0;

    #1
    reset = 0;
    lane0VLD = 1'b1;
    lane1VLD = 1'b0;
    lane2VLD = 1'b0;
    lane3VLD = 1'b0;
    byteStripingIN = 8'b00000000;
    #1
    lane0VLD = 1'b0;
    lane1VLD = 1'b1;
    lane2VLD = 1'b0;
    lane3VLD = 1'b0;
    byteStripingIN = 8'b00001111;
    #1
    lane0VLD = 1'b0;
    lane1VLD = 1'b0;
    lane2VLD = 1'b1;
    lane3VLD = 1'b0;
    byteStripingIN = 8'b11110000;
    #1
    lane0VLD = 1'b0;
    lane1VLD = 1'b0;
    lane2VLD = 1'b0;
    lane3VLD = 1'b1;
    byteStripingIN = 8'b11111111;
    #1
    lane0VLD = 1'b1;
    lane1VLD = 1'b0;
    lane2VLD = 1'b0;
    lane3VLD = 1'b0;
    byteStripingIN = 8'b11111111;
    #1
    lane0VLD = 1'b0;
    lane1VLD = 1'b1;
    lane2VLD = 1'b0;
    lane3VLD = 1'b0;
    byteStripingIN = 8'b11110000;
    #1
    lane0VLD = 1'b0;
    lane1VLD = 1'b0;
    lane2VLD = 1'b1;
    lane3VLD = 1'b0;
    byteStripingIN = 8'b00001111;
    #1
    lane0VLD = 1'b0;
    lane1VLD = 1'b0;
    lane2VLD = 1'b0;
    lane3VLD = 1'b1;
    byteStripingIN = 8'b00000000;
    #1

    $finish;
  end

  initial clk1Mhz <=0;
  always #0.5 clk1Mhz <= ~clk1Mhz;

  initial clk250k <=0;
  always #2 clk250k <= ~clk250k;

  initial conteo = 2'b00;

  always #0.5 conteo <= conteo + 1;





endmodule //tester_byte_striping
