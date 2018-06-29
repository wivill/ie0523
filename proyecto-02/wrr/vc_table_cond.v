module vc_table_cond(	input 		clk,
						input		reset,
						input		edit_weight,
						input		[2:0]	weight_assign,
						input		[1:0]	vc_assign,
						output	reg	[2:0]	weight,
						output	reg	[1:0]	vc_id_out
);

	reg	[2:0]	weight_vc0 = 3'b001;
	reg	[2:0]	weight_vc1 = 3'b001;
	reg	[2:0]	weight_vc2 = 3'b001;
	reg	[2:0]	weight_vc3 = 3'b001;
	wire	[1:0]	vc0 = 2'b00;
	wire	[1:0]	vc1 = 2'b01;
	wire	[1:0]	vc2 = 2'b10;
	wire	[1:0]	vc3 = 2'b11;

	always @(~reset) begin
		weight <= 3'b000;
		vc_id_out <= 2'b00;
	end

	always @ (posedge clk) begin
		if (edit_weight) begin
			case (vc_assign)
				2'b00:	begin
					weight_vc0 <= weight_assign;
					vc_id_out <= 2'b00;
				end

				2'b01:	begin
					weight_vc1 <= weight_assign;
					vc_id_out <= 2'b00;
				end

				2'b10:	begin
					weight_vc2 <= weight_assign;
					vc_id_out <= 2'b00;
				end

				2'b11:	begin
					weight_vc3 <= weight_assign;
					vc_id_out <= 2'b00;
				end

				default: begin
					weight_vc0 <= 3'b001;
					weight_vc1 <= 3'b001;
					weight_vc2 <= 3'b001;
					weight_vc3 <= 3'b001;
					vc_id_out <= 2'b00;
				end

			endcase
		end else begin
			case (vc_assign)
				2'b00:	begin
					weight <= weight_vc0;
					vc_id_out <= vc0;
				end

				2'b01:	begin
					weight <= weight_vc1;
					vc_id_out <= vc1;
				end

				2'b10:	begin
					weight <= weight_vc2;
					vc_id_out <= vc2;
				end

				2'b11:	begin
					weight <= weight_vc3;
					vc_id_out <= vc3;
				end

				default: begin
					weight <= 3'b001;
					vc_id_out <= vc0;
				end

			endcase
		end
	end

endmodule
