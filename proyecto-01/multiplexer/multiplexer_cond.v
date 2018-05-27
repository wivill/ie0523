module multiplexer_cond (
  input wire [7:0] TLP,
  input wire [7:0] COM,
  input wire [7:0] PAD,
  input wire [7:0] SKP,
  input wire [7:0] STP,
  input wire [7:0] SDP,
  input wire [7:0] END,
  input wire [7:0] EDB,
  input wire [7:0] FTS,
  input wire [7:0] IDL,

  input wire [3:0] muxCTRL,
  input wire muxCLK,          // 1 Mhz

  output reg [7:0] muxOUT,
  output reg muxVLD
  );


  always @ ( posedge muxCLK ) begin
    case(muxCTRL)
      4'b0000:  begin
                  muxOUT <= TLP;
                  muxVLD <= 1'b1;
                end

      4'b0001: begin
                 muxOUT <= COM;
                 muxVLD <= 1'b1;
               end

      4'b0010: begin
                 muxOUT <= PAD;
                 muxVLD <= 1'b1;
               end

      4'b0011: begin
                 muxOUT <= SKP;
                 muxVLD <= 1'b1;
              end

      4'b0100: begin
                 muxOUT <= STP;
                muxVLD <= 1'b1;
               end

      4'b0101: begin
                 muxOUT <= SDP;
                 muxVLD <= 1'b1;
               end

      4'b0110: begin
                 muxOUT <= END;
                 muxVLD <= 1'b1;
               end

      4'b0111: begin
                 muxOUT <= EDB;
                 muxVLD <= 1'b1;
               end

      4'b1000: begin
                 muxOUT <= FTS;
                 muxVLD <= 1'b1;
               end

      4'b1001: begin
                 muxOUT <= IDL;
                 muxVLD <= 1'b1;
               end

      default: muxVLD <= 0;

    endcase
  end

endmodule // control_multiplexer
