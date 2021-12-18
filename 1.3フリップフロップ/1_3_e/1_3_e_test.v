/*
===================================================================
Project Name    : 6NAND D-FF
File Name       : 1_3_e_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module etest;
parameter STEP = 10;

reg D;
reg Cp;
wire outQ, out_Q;
integer i, j;


D_FF ex(D, Cp, outQ);
initial begin
	$dumpfile("1_3_e.vcd");
	$dumpvars(0, etest);
	$monitor("%t: D=%b, Cp=%b, Q=%b", $time, D, Cp, outQ);

	D <= 1'b0;
	Cp <= 1'b0;
	for(i = 0; i < 4; i = i + 1) begin
		if (i != 0) begin
			#STEP
				D <= D + 1'b1;
		end
		for(j = 0; j < 2; j = j + 1) begin
			#STEP
			Cp <= Cp + 1'b1;
		end
	end
	$finish;
end

endmodule
