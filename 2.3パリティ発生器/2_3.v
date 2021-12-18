/*
===================================================================
Project Name    : パリティ発生器
File Name       : 2_3.v
Encoding        : UTF-8
Creation Date   : 2021/4/22
===================================================================
*/

module parity(x, odd, even);
	input [3:0]x;
	output odd, even;

	wire tmp1, tmp2;

	xor(tmp1, x[0], x[1]);
	xor(tmp2, x[2], x[3]);
	xor(odd, tmp1, tmp2);
	not(even, odd);

endmodule
