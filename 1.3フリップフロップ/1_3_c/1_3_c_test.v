/*
===================================================================
Project Name    : 6NAND JK-FF
File Name       : 1_3_c_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module ctest;
parameter STEP = 10;

reg [3:0]in;
reg J, K, R, Cp;
wire Q;
integer i, j;

JK_FF ex(in[3], in[2], in[1], in[0], Q);
initial begin
	$dumpfile("1_3_c.vcd");
	$dumpvars(0, ctest);
	$monitor("%t: J=%b, K=%b, R=%b, Cp=%b Q=%b", $time, in[3], in[2], in[1], in[0], Q);

	in <= 3'b000;
	for(i = 0; i < 16; i = i + 1) begin
		if (i != 0) begin
			#STEP
				in <= in + 1'b1;
				J <= in[3];
				K <= in[2];
				R <= in[1];
				Cp <= in[0];
		end
	end
	$finish;
end

endmodule
