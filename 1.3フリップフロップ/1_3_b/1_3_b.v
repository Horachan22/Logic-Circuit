/*
===================================================================
Project Name    : RS-FF(同期式)
File Name       : 1_3_b.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module RS_FF(S, R, Cp, Q, _Q);

	input S, R, Cp;
	output Q, _Q;

	wire tmp1, tmp2;

	nand(tmp1, S, Cp);
	nand(tmp2, Cp, R);
	nand(Q, tmp1, _Q);
	nand(_Q, tmp2, Q);

endmodule
