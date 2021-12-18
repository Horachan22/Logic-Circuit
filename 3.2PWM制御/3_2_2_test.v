/*
===================================================================
Project Name    : PWM制御
File Name       : 3_2_2_test.v
Encoding        : UTF-8
Creation Date   : 2021/7/15
===================================================================
*/

`timescale 1ns/1ns
module PWM_test;
parameter STEP = 10;

reg clk_in;
wire clk_main, duty_30, duty_50, duty_70, duty_100;
integer i;

PWM ex(clk_in, clk_main, duty_30, duty_50, duty_70, duty_100);
initial begin
	$dumpfile("3_2_2.vcd");
	$dumpvars(0, PWM_test);
	$monitor("%t: clk_in = %b, clk_main = %b, duty_30 = %b, duty_50 = %b, duty_70 = %b, duty_100 = %b", $time, clk_in, clk_main, duty_30, duty_50, duty_70, duty_100);

	clk_in <= 1'b0;
	for(i = 0; i < 5e+6; i = i + 1) begin
		#STEP
		clk_in = ~clk_in;
	end
	$finish;
end

endmodule
