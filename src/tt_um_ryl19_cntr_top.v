

module tt_um_ryl19_cntr_top(
	input wire [7:0] ui_in,
	output wire [7:0] uo_out,
	input wire [7:0] uio_in,
	output wire [7:0] uio_out,
	output wire [7:0] uio_oe,
	input wire ena,
	input wire clk,
	input wire rst_n

);
wire _unused = &{uio_in};

reg [7:0] q;
reg done;
reg ena_1, ena_2;
reg rst_n_1, rst_n_2;
reg [7:0] limit_1, limit_2;
assign uo_out = q;
assign uio_out[7:1] = 7'b0000000;
assign uio_oe[7:1] = 7'b0000000;

assign uio_out[0:0] = done;
assign uio_oe[0:0] = 1'b1;

always @(posedge clk)begin
	rst_n_1 <= rst_n;
	rst_n_2 <= rst_n;

	ena_1 <= ena;
	ena_2 <= ena_1;

	limit_1 <= ui_in;
	limit_2 <= limit_1;
end

always @(posedge clk or negedge rst_n_2)begin
	if(!rst_n_2) begin
		q <= 8'h00;
		done <= 1'b0;
	end
	else begin
		if(ena_2) begin
			if(q < ui_in) begin
				q <= q + 1;
				done <= 1'b0;
			end
			else begin
				q <= 8'h00;
				done <= 1'b1;
			end
		end
		else begin
			q <= 8'h00;
			done <= 1'b0;
		end
	end

end
endmodule
