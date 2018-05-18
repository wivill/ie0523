module multiplexer_conduct (
  output reg [7:0] muxOUT,
  output reg muxVLD,

  input wire [7:0] COM,
  input wire [7:0] PAD,
  input wire [7:0] SKP,
  input wire [7:0] STP,
  input wire [7:0] SDP,
  input wire [7:0] END,
  input wire [7:0] EDB,
  input wire [7:0] FTS,
  input wire [7:0] IDL,

  input wire [7:0] muxCTRL,
  input wire muxCLK          // 1 Mhz
  );

  always @ ( posedge muxCLK ) begin
    case(muxCTRL)
      'hBC: muxOUT <= COM;
      'hF7: muxOUT <= PAD;
      'h1C: muxOUT <= SKP;
      'hFB: muxOUT <= STP;
      'h5C: muxOUT <= SDP;
      'hFD: muxOUT <= END;
      'hFE: muxOUT <= EDB;
      'h3C: muxOUT <= FTS;
      'h7C: muxOUT <= IDL;
    endcase
  end

endmodule // control_multiplexer
