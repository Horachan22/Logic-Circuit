/*
===================================================================
Project Name    : 6NAND D-FF
File Name       : 1_3_e_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module D_FF(D, Cp, Q);

	input D, Cp;
	output Q;
	reg Q;

	always @(posedge Cp)begin
	if(Cp == 1'b0)
		Q <= 1'b0;
	else
		Q <= D;
	end

endmodule
