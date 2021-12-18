/*
===================================================================
Project Name    : デコーダ
File Name       : 2_1_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/22
===================================================================
*/

module decodertest;
parameter STEP = 10;

reg [2:0]a;
wire [7:0]x;
integer i;

decoder ex(a, x);
initial begin
	$dumpfile("2_1.vcd");
	$dumpvars(0, decodertest);
	$monitor("%t: a2=%b, a1=%b, a1=%b, x7=%b, x6=%b, x5=%b, x4=%b, x3=%b, x2=%b, x1=%b, x0=%b", $time, a[2], a[1], a[0], x[7], x[6], x[5], x[4], x[3], x[2], x[1], x[0]);

	a <= 3'b000;
	for(i = 0; i < 8; i = i + 1) begin
	#STEP
		a <= a + 1'b1;
	end
	$finish;
end

endmodule

