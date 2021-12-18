/*
===================================================================
Project Name    : 半加算器
File Name       : 1_2_1_1.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module half_adder(X, Y, S, C);

	input X, Y;
	output S, C;

	wire tmp1, tmp2, tmp3;

	nand(tmp1, X, Y);
	nand(tmp2, tmp1, X);
	nand(tmp3, tmp1, Y);
	or(S, ~tmp2, ~tmp3);
	not(C, tmp1);

endmodule
