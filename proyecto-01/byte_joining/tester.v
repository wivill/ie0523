module tester( // Modulo que genera señales y realiza las pruebas
	input [7:0] byte_joining_desc_cond,
	input [7:0] byte_joining_desc_estruc,
	output reg [1:0] ctr_3,
	output reg [7:0] Lane_0,
  output reg [7:0] Lane_1,
  output reg [7:0] Lane_2,
  output reg [7:0] Lane_3,
	output reg clk250k
	);
	//-----------Registros para el el verificador automatico--------------
	//--------------------------------------------------------------------


	//------------------Conexiones de la memoria--------------------------
	// reg [31:0] Contador;
	// reg [2:0] dir;
	// reg LE;
	// wire [31:0] dato;
	// //Conexion a la memoria de contadores de transicion
	// memTrans m1 (dir, LE, dato);
	// //Control de E/S del puerto de dato de la memoria de contadores
	// assign dato = (~LE)? Contador : 32'bz;
	//--------------------------------------------------------------------
  reg clk1Mhz; //señal de reloj con la que se cambian las entradas de seleccion del mux

	initial begin
		$dumpfile("bytejoining.vcd");	// Nombre de archivo del "dump"
		$dumpvars;			// Directiva para "dumpear" variables
		clk1Mhz <= 1;
		clk250k <= 1 ; // se le asigna el valor inicial del reloj
		Lane_0 <= 8'b00000000;
		Lane_1 <= 8'b00000001;
		Lane_2 <= 8'b00000010;
    Lane_3 <= 8'b00000100;
		ctr_3 <=2'b11;



		// #1 LE = 0;
		// Contador = 0;
		// for (dir=0; dir<=5; dir=dir+1) begin
		// 	#1 Contador = 0;
		// end

		@(posedge clk250k);
		@(posedge clk250k);

		repeat (16) begin // se hace una espera de 8 flancos positivos de reloj para comprobar el estado de todas las señales
			@(posedge clk250k);
      Lane_0 <= Lane_0 + 1;
      Lane_1 <= Lane_1 + 1;
      Lane_2 <= Lane_2 + 1;
      Lane_3 <= Lane_3 + 1;
		end
		// #100 LE=1;
		// for (dir=0; dir<= 5; dir=dir+1) begin
		// 	#1 Contador = dato;
		// 	$display("PwrCntr[%d]: %d", dir, Contador);
		// end
		$finish;
	end

	always	#2000 clk250k 	<= ~clk250k;	// señal de reloj de 250kHz
	always 	#500 clk1Mhz <= ~clk1Mhz; //señal de reloj de 1Mhz
  always @ (posedge clk1Mhz) begin
    if (ctr_3 == 2'b11) begin
      ctr_3 <= 2'b00;
    end else begin
      ctr_3 <= ctr_3 + 1;
    end
  end

endmodule
