`timescale 1us / 100ns

module testbench;
  wire [7:0] lane0, lane1, lane2, lane3, entradaBS;
  wire validBS, relojMUX, relojBS;
  byte_striping BS(
    .stripedLane0 (lane0),
    .stripedLane1 (lane1),
    .stripedLane2 (lane2),
    .stripedLane3 (lane3),
    .byteStripingIN (entradaBS),
    .byteStripingVLD (validBS),
    .byteStripingCLK (relojBS),
    .controlMuxCLK (relojMUX)
    );

  tester_byte_striping BS_tester(
    .stripedLane0 (lane0),
    .stripedLane1 (lane1),
    .stripedLane2 (lane2),
    .stripedLane3 (lane3),
    .byteStripingIN (entradaBS),
    .byteStripingVLD (validBS),
    .byteStripingCLK (relojBS),
    .controlMuxCLK (relojMUX)
    );



endmodule // testbench
