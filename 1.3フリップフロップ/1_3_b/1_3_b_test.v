/*
===================================================================
Project Name    : RS-FF(同期式)
File Name       : 1_3_b_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module btest;
parameter STEP = 10;

reg [3:0]in;
reg Cp, R, S;
wire Q, _Q;
integer i, j;

RS_FF ex(in[2], in[1], in[0], Q, _Q);
initial begin
	$dumpfile("1_3_b.vcd");
	$dumpvars(0, btest);
	$monitor("%t: S=%b, R=%b, Cp=%b Q=%b", $time,in[2], in[1], in[0], Q);

	in <= 3'b000;
	for(i = 0; i < 16; i = i + 1) begin
		if (i != 0) begin
			#STEP
				in <= in + 1'b1;
		end
		R <= in[2];
		S <= in[1];
		Cp <= in[0];
	end
	$finish;
end

endmodule
