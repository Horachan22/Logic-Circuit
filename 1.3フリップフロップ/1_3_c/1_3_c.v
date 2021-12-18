/*
===================================================================
Project Name    : 6NAND JK-FF
File Name       : 1_3_c_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module JK_FF(J, K, R, Cp, Q);
	input J, K, R, Cp;
	output Q;
	reg Q;

	always @(posedge Cp or posedge R) begin
		Q <= 1'b0;
		if(R == 1'b0)
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
