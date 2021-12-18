/*
===================================================================
Project Name    : クロックパルスの変換回路
File Name       : 3_1_2.v
Encoding        : UTF-8
Creation Date   : 2021/7/15
===================================================================
*/

`define F_IN  50e+6
`define F_N   10e+3

module generate_clock(clk_in, clk_N);
	input clk_in;
	output reg clk_N = 1'b0;
	integer count = 1;

	always @(clk_in) begin
		if(count % (`F_IN / `F_N) < 1) begin
			clk_N <= ~clk_N;
		end
		count = count + 1;
	end

endmodule
