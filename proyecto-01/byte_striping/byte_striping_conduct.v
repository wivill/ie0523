module byte_striping (
  output reg [7:0] stripedLane0,
  output reg [7:0] stripedLane1,
  output reg [7:0] stripedLane2,
  output reg [7:0] stripedLane3,

  input wire [7:0] byteStripingIN,

  input wire byteStripingVLD,
  input wire byteStripingCLK,
  input wire controlMuxCLK
  );

  always @ ( posedge byteStripingCLK ) begin //Durante cada flanco positivo del
    stripedLane0[6] <= byteStripingIN[0];    //reloj del byte striping se carga
    stripedLane1[6] <= byteStripingIN[1];    //el que debe ser el primer bit al
    stripedLane2[6] <= byteStripingIN[2];    //final de cada lane y con cada
    stripedLane3[6] <= byteStripingIN[3];    //flanco del reloj del mux se va
    stripedLane0[7] <= byteStripingIN[4];
    stripedLane1[7] <= byteStripingIN[5];
    stripedLane2[7] <= byteStripingIN[6];
    stripedLane3[7] <= byteStripingIN[7];

    stripedLane0[5] <= stripedLane0[7];
    stripedLane0[4] <= stripedLane0[6];
    stripedLane0[3] <= stripedLane0[5];
    stripedLane0[2] <= stripedLane0[4];
    stripedLane0[1] <= stripedLane0[3];
    stripedLane0[0] <= stripedLane0[2];

    stripedLane1[5] <= stripedLane1[7];
    stripedLane1[4] <= stripedLane1[6];
    stripedLane1[3] <= stripedLane1[5];
    stripedLane1[2] <= stripedLane1[4];
    stripedLane1[1] <= stripedLane1[3];
    stripedLane1[0] <= stripedLane1[2];

    stripedLane2[5] <= stripedLane2[7];
    stripedLane2[4] <= stripedLane2[6];
    stripedLane2[3] <= stripedLane2[5];
    stripedLane2[2] <= stripedLane2[4];
    stripedLane2[1] <= stripedLane2[3];
    stripedLane2[0] <= stripedLane2[2];

    stripedLane3[5] <= stripedLane3[7];
    stripedLane3[4] <= stripedLane3[6];
    stripedLane3[3] <= stripedLane3[5];
    stripedLane3[2] <= stripedLane3[4];
    stripedLane3[1] <= stripedLane3[3];
    stripedLane3[0] <= stripedLane3[2];

  end                                        //moviendo al inicio del lane

  always @ ( posedge byteStripingCLK ) begin

  end



endmodule
