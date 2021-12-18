/*
===================================================================
Project Name    : 組み合わせ回路
File Name       : 1_1_1.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module circuit(A, B, C, f1);

	input A, B, C;
	output f1;

	// wire tmp1, tmp2;
	// nand(tmp1, A, A);
	// nand(tmp2, B, C);
	// nand(f1, tmp1, tmp2);

	assign f1 = ~(~A & ~(B & C));

endmodule
