/*
===================================================================
Project Name    : パリティ発生器
File Name       : 2_3_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/22
===================================================================
*/

module paritytest;
parameter STEP = 10;

reg [3:0]x;
wire odd, even;
integer i;

parity ex(x, odd, even);
initial begin
	$dumpfile("2_3.vcd");
	$dumpvars(0, paritytest);
	$monitor("%t: x3=%b, x2=%b, x1=%b, x0=%b | 奇数 %b", $time, x[3], x[2], x[1], x[0], odd);
	x <= 4'b0000;
	for(i = 0; i < 15; i = i + 1) begin
		#STEP
		x <= x + 1'b1;
	end
	$finish;
end

endmodule

