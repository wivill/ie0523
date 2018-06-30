
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

  // Estado Reset
	sReset <= 0;
	sInit <= 1;
	sEmpty <= 4'd0;
	sFull <= 4'd0;
	sPause <= 4'd0;
	sContinue <= 4'd0;
	#14
  // Estado Init
	sReset <= 1;
	#10

	sInit <= 0;
  sEmpty <= 4'd15;
	// Estado Idle, todos los fifos vacíos

	#10
	// Estado Active
	sEmpty <= 4'd0;
	#10
	// Estado Pause
	sPause <= 4'b0110;
	#10
	// Vuelvo a Active
	sContinue <= 4'b0000;
	#10
	// Vuelve a Active
	sContinue <= 4'b0110;
	#10
  sContinue <= 4'd0;
	// Estado Error
	sFull <= 4'd4;
	#10
	//@(posedge CLK)
	sReset <= 1;
	#20
	$finish;
	end

	always
		begin
      #5 CLK <= ~CLK;
    end

endmodule
