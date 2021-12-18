/*
===================================================================
Project Name    : 全加算器
File Name       : 1_2_2_1_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module full_addertest;
parameter STEP = 10;

reg [2:0]in;
reg Xi, Yi, Ci;
wire outS, outC;
integer i;

full_adder ex(in[2], in[1], in[0], outS, outC);
initial begin
	$dumpfile("1_2_2_1.vcd");
	$dumpvars(0, full_addertest);
	$monitor("%t: Xi=%b, Yi=%b, Ci=%b Si=%b, Ci+1=%b", $time,in[2], in[1], in[0], outS, outC);

	in <= 4'b0000;
	for(i = 0; i < 8; i = i + 1) begin
	#STEP
		in <= in + 1'b1;
		Xi <= in[2];
		Yi <= in[1];
		Ci <= in[0];
	end
	$finish;
end

endmodule
