module byte_striping_conduct (
  output reg [7:0] stripedLane0,
  output reg [7:0] stripedLane1,
  output reg [7:0] stripedLane2,
  output reg [7:0] stripedLane3,
  output reg byteStripingVLD,

  input wire [7:0] byteStripingIN,
  input wire lane0VLD,
  input wire lane1VLD,
  input wire lane2VLD,
  input wire lane3VLD,
  input wire clk250k,
  input wire clk1Mhz,
  output reg [1:0]contador
  );

  reg [1:0] counter;

  always @ ( * ) begin
    contador = counter;
  end

  always @ ( posedge clk1Mhz ) begin

    case (counter)
      2'b00: if (lane0VLD) begin
        stripedLane0 <= byteStripingIN;
        byteStripingVLD <=0;
        counter <= 2'b01;
      end
      2'b01: if (lane1VLD) begin
        stripedLane1 <= byteStripingIN;
        counter <= 2'b10;
        byteStripingVLD <=0;
      end
      2'b10: if (lane2VLD) begin
        stripedLane2 <= byteStripingIN;
        counter <= 2'b11;
        byteStripingVLD <=0;
      end
      2'b11: if (lane3VLD) begin
        stripedLane3 <= byteStripingIN;
        counter <= 2'b00;
        byteStripingVLD <=1;
      end
      default: counter <= 2'b00;
    endcase
  end

endmodule //byte_striping_conduct


// module byte_striping_conduct (
//   output reg [7:0] stripedLane0,
//   output reg [7:0] stripedLane1,
//   output reg [7:0] stripedLane2,
//   output reg [7:0] stripedLane3,
//
//   input wire [7:0] byteStripingIN,
//
//   input wire byteStripingVLD,
//   input wire byteStripingCLK,
//   input wire controlMuxCLK
//   );
//
//   always @ ( posedge controlMuxCLK ) begin //Durante cada flanco positivo del
//     stripedLane0[6] <= byteStripingIN[0];    //reloj del byte striping se carga
//     stripedLane1[6] <= byteStripingIN[1];    //el que debe ser el primer bit al
//     stripedLane2[6] <= byteStripingIN[2];    //final de cada lane y con cada
//     stripedLane3[6] <= byteStripingIN[3];    //flanco del reloj del mux se va
//     stripedLane0[7] <= byteStripingIN[4];
//     stripedLane1[7] <= byteStripingIN[5];
//     stripedLane2[7] <= byteStripingIN[6];
//     stripedLane3[7] <= byteStripingIN[7];
//
//     stripedLane0[5] <= stripedLane0[7];
//     stripedLane0[4] <= stripedLane0[6];
//     stripedLane0[3] <= stripedLane0[5];
//     stripedLane0[2] <= stripedLane0[4];
//     stripedLane0[1] <= stripedLane0[3];
//     stripedLane0[0] <= stripedLane0[2];
//
//     stripedLane1[5] <= stripedLane1[7];
//     stripedLane1[4] <= stripedLane1[6];
//     stripedLane1[3] <= stripedLane1[5];
//     stripedLane1[2] <= stripedLane1[4];
//     stripedLane1[1] <= stripedLane1[3];
//     stripedLane1[0] <= stripedLane1[2];
//
//     stripedLane2[5] <= stripedLane2[7];
//     stripedLane2[4] <= stripedLane2[6];
//     stripedLane2[3] <= stripedLane2[5];
//     stripedLane2[2] <= stripedLane2[4];
//     stripedLane2[1] <= stripedLane2[3];
//     stripedLane2[0] <= stripedLane2[2];
//
//     stripedLane3[5] <= stripedLane3[7];
//     stripedLane3[4] <= stripedLane3[6];
//     stripedLane3[3] <= stripedLane3[5];
//     stripedLane3[2] <= stripedLane3[4];
//     stripedLane3[1] <= stripedLane3[3];
//     stripedLane3[0] <= stripedLane3[2];
//
//   end                                        //moviendo al inicio del lane
//
//
//
// endmodule
