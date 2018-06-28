
module fsm_tester(
  output reg CLK,
  output reg sReset,
  output reg sInit,
  output reg [3:0] sEmpty,
  output reg [3:0] sFull,
  output reg [3:0] sPause,
  output reg [3:0] sContinue);

initial
	begin
	CLK <= 0;
	end

initial
	begin
	$dumpfile("fsm_wave.vcd");
	$dumpvars;


	sReset <= 0;
	sInit <= 1;
	sEmpty <= 4'd0;
	sFull <= 4'd0;
	sPause <= 4'd0;
	sContinue <= 4'd0;
	#14
	//@(posedge CLK)
	sReset <= 1;
	#10
	//@(posedge CLK)
	sInit <= 0;
	#10
	//@(posedge CLK)
	sEmpty <= 4'd15;
	#20
	//@(posedge CLK)
	sEmpty <= 4'd0;
	#20
	//@(posedge CLK)
	sPause <= 4'b0110;
	#20
	//@(posedge CLK)
	sPause <= 4'd0;
	#20
	//@(posedge CLK)
	sPause <= 4'b0110;
	sContinue <= 4'b0100;
	#20
	//@(posedge CLK)
	sPause <= 4'd0;
	sContinue <= 4'b1010;
	#20
	//@(posedge CLK)
	sContinue <= 4'd0;
	#20
	//@(posedge CLK)
	sFull <= 4'd4;
	#20
	//@(posedge CLK)
	sReset <= 1;
	#40
	$finish;
	end

	always
		begin
      #5 CLK <= ~CLK;
    end

endmodule
