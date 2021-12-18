/*
===================================================================
Project Name    : 組み合わせ回路
File Name       : 1_1_2.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/
module circuit(A, B, f2);

	input A, B;
	output f2;

	// wire tmp1, tmp2, tmp3;
	// nand(tmp1, A, B);
	// nand(tmp2, tmp1, A);
	// nand(tmp3, tmp1, B);
	// nand(f2, tmp2, tmp3)

	assign f2 = ~(~(A & ~(A & B)) & ~(B & ~(A & B)));

endmodule
