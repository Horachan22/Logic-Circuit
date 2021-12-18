/*
===================================================================
Project Name    : エンコーダ
File Name       : 2_2_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/22
===================================================================
*/

module encodertest;
parameter STEP = 10;

reg [7:0]a;
wire [3:0]x;
integer i;

encoder ex(a, x);
initial begin
	$dumpfile("2_2.vcd");
	$dumpvars(0, encodertest);
	$monitor("%t: a7=%b, a6=%b, a5=%b, a4=%b, a3=%b, a2=%b, a1=%b, a0=%b | x3=%b, x2=%b, x1=%b, x0=%b", $time, a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0], x[3], x[2], x[1], x[0]);

	a <= 8'b00000000;
	for(i = 0; i < 256; i = i + 1) begin
	#STEP
		a <= a + 1'b1;
	end
	$finish;
end

endmodule

