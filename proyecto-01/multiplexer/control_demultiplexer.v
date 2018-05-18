module control_demultiplexer (
  input wire [7:0] muxIN,
  input wire muxVLD,

  output reg [7:0] COM,
  output reg [7:0] PAD,
  output reg [7:0] SKP,
  output reg [7:0] STP,
  output reg [7:0] SDP,
  output reg [7:0] END,
  output reg [7:0] EDB,
  output reg [7:0] FTS,
  output reg [7:0] IDL,

  input wire [7:0] muxCTRL,
  input wire muxCLK
  );

  always @ ( posedge muxCLK ) begin
    case(muxCTRL)
      'hBC: COM <= muxIN;
      'hF7: PAD <= muxIN;
      'h1C: SKP <= muxIN;
      'hFB: STP <= muxIN;
      'h5C: SDP <= muxIN;
      'hFD: END <= muxIN;
      'hFE: EDB <= muxIN;
      'h3C: FTS <= muxIN;
      'h7C: IDL <= muxIN;
    endcase
  end

endmodule // control_multiplexer
