/*
===================================================================
Project Name    : 半加算器
File Name       : 1_2_1_1.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module circuit(X, Y, S, C);

	input X, Y;
	output S, C;

	assign S = X ^ Y;
	assign C = X & Y;

endmodule
