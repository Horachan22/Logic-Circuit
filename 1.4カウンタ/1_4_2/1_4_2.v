/*
===================================================================
Project Name    : 同期式2純2進化7進カウンタ
File Name       : 1_4_2.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module JK_FF(J, K, R, Cp, Q);
	input J, K, R, Cp;
	output Q;
	reg Q;

	always @(posedge Cp or posedge R) begin
		Q <= 1'b0; //初期値入力
		// if文 => リセット
		if(~R == 1'b0)
			Q <= 1'b0;
		else
			case({J, K})
				2'b00: Q <= Q;
				2'b01: Q <= 1'b0;
				2'b10: Q <= 1'b1;
				2'b11: Q <= ~Q;
			endcase
	end
endmodule

module JK7counter(Cp, R, y1, y2, y3);
	input Cp, R;
	output y1, y2, y3;

	wire tmp1, tmp2, tmp3;

	and(tmp1, y1, y2);
	nand(tmp2, y2, y3);
	nand(tmp3, ~y1, ~y3);

	JK_FF ex1(tmp2, 1'b1, R, Cp, y1);
	JK_FF ex2(y1, tmp3, R, Cp, y2);
	JK_FF ex3(tmp1, y2, R, Cp, y3);

endmodule
