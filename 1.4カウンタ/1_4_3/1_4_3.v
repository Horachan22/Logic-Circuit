/*
===================================================================
Project Name    : 同期式2純2進化7進カウンタ
File Name       : 1_4_3.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module D_FF(D, Cp, R, Q);
	input D, Cp, R;
	output Q;
	reg Q;

	always @(posedge Cp or posedge R)begin
		Q <= 1'b0;
		if(R == 1'b0)
			Q <= 1'b0;
		else
			Q <= D;
	end

endmodule

module D7counter(Cp, R, y1, y2, y3);
	input Cp, R;
	output y1, y2, y3;
	wire tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, D1, D2, D3;

	and(tmp1, ~y1, ~y2);
	and(tmp2, ~y1, ~y3);
	and(tmp3, y1, ~y2);
	and(tmp4, ~y1, y2, ~y3);
	and(tmp5, y1, y2);
	and(tmp6, ~y2, y3);
	or(D1, tmp1, tmp2);
	or(D2, tmp3, tmp4);
	or(D3, tmp5, tmp6);

	D_FF ex1(D1, Cp, R, y1);
	D_FF ex2(D2, Cp, R, y2);
	D_FF ex3(D3, Cp, R, y3);

endmodule
