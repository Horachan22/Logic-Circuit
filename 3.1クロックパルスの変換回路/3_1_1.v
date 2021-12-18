/*
===================================================================
Project Name    : クロックパルスの変換回路
File Name       : 3_1_1.v
Encoding        : UTF-8
Creation Date   : 2021/7/15
===================================================================
*/

`define F_IN  50e+6
`define F_10K 10e+3
`define F_50K 50e+3
`define F_38K 38e+3

module generate_clock(clk_in, clk_10k, clk_50k, clk_38k);
	input clk_in;
	output reg clk_10k = 1'b0, clk_50k = 1'b0, clk_38k = 1'b0;
	integer count = 1;

	always @(clk_in) begin
		if(count % (`F_IN / `F_10K) < 1) begin
			clk_10k <= ~clk_10k;
		end
		if(count % (`F_IN / `F_50K) < 1) begin
			clk_50k <= ~clk_50k;
		end
		if(count % (`F_IN / `F_38K) < 1) begin
			clk_38k <= ~clk_38k;
		end
		count = count + 1;
	end

endmodule
