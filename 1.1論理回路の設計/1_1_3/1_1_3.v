/*
===================================================================
Project Name    : 組み合わせ回路
File Name       : 1_1_3.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module circuit(A, B, f3);

	input A, B;
	output f3;

	// wire tmp1, tmp2, tmp3, tmp4;
	// nand(tmp1, A, A);
	// nand(tmp2, B, B);
	// nand(tmp3, A, B);
	// nand(tmp4, tmp1, tmp2);
	// nand(f3, tmp3, tmp4);

	assign f3 = ~(~((A + ~B) & (~A + B)));

endmodule
