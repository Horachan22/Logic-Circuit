/*
===================================================================
Project Name    : 乱数発生器
File Name       : 2_5.v
Encoding        : UTF-8
Creation Date   : 2021/4/22
===================================================================
*/

module JK_FF(J, K, S, Cp, Q);
	input J, K, S, Cp;
	output Q;
	reg Q;

	always @(Cp) begin
		if(S == 1'b1)
			Q <= 1'b1;

		case({J, K})
			2'b00: Q <= Q;
			2'b01: Q <= 1'b0;
			2'b10: Q <= 1'b1;
			2'b11: Q <= ~Q;
		endcase
	end
endmodule

module random(Cp, S, out, code);
	input  Cp, S;
	input  [2:0]code;
	output out;

	reg    J1, J2, J3, J4, K1, K2, K3, K4, tmp1, tmp2, tmp3;
	reg    line_1, line_2, line_3;
	wire   Q1, Q2, Q3;

	always @(*) begin
		J1 <= tmp1;
		K1 <= ~tmp1;
		J2 <= Q1;
		K2 <= ~Q1;
		J3 <= Q2;
		K3 <= ~Q2;
		J4 <= Q3;
		K4 <= ~Q3;
		line_1 <= Q3;
		line_2 <= Q2;
		line_3 <= Q1;

		case({code})
			3'b000: begin
				tmp3 <=  out;
				tmp2 <= tmp3;
				tmp1 <= tmp2;
			end
			3'b001: begin
				tmp3 <= line_1 ^ out;
				tmp2 <= tmp3;
				tmp1 <= tmp2;
			end
			3'b010: begin
				tmp3 <=  out;
				tmp2 <= line_2 ^ tmp3;
				tmp1 <= tmp2;
			end
			3'b011: begin
				tmp3 <= line_1 ^ out;
				tmp2 <= line_2 ^ tmp3;
				tmp1 <= tmp2;
			end
			3'b100: begin
				tmp3 <=  out;
				tmp2 <= tmp3;
				tmp1 <= line_3 ^ tmp2;
			end
			3'b101: begin
				tmp3 <= line_1 ^ out;
				tmp2 <= tmp3;
				tmp1 <= line_3 ^ tmp2;
			end
			3'b110: begin
				tmp3 <=  out;
				tmp2 <= line_2 ^ tmp3;
				tmp1 <= line_3 ^ tmp2;
			end
			3'b111: begin
				tmp3 <= line_1 ^ out;
				tmp2 <= line_2 ^ tmp3;
				tmp1 <= line_3 ^ tmp2;
			end
		endcase
	end

	JK_FF ex1(J1, K1, 1'b1, Cp,  Q1);
	JK_FF ex2(J2, K2, 1'b1, Cp,  Q2);
	JK_FF ex3(J3, K3, 1'b1, Cp,  Q3);
	JK_FF ex4(J4, K4,    S, Cp, out);

endmodule
