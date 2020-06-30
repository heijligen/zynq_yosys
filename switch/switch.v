module switch (
	output [3:0]led,
	input  [3:0]btn,
	input  [1:0]sw
);

    wire [3:0] clk;
    reg  [10:0] stat;
    reg foo;
    reg [1:0] bar;

    assign led[0] = bar[0];
    assign led[1] = bar[1];
    assign sw[0] = bar[0];
    assign sw[1] = bar[1];

    assign led[2] = foo;
    assign btn[2] = foo;

    PS7 the_PS (
        .FCLKCLK (clk)
    );

    always @(posedge clk[0]) begin
	stat <= stat + 1'b1;
    end

    assign led[3] = stat[10];
endmodule


