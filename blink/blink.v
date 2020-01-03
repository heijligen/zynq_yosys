module blink (
	input	clk,
	output	[3:0]led
);

	reg status;

	always @(posedge clk) begin
		if (status == 0)
			status <= 1;
		else
			status <= 0;
	end

	assign led[0] = status;
	assign led[1] = status;
	assign led[2] = status;
	assign led[3] = status;
endmodule


