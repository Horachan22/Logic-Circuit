/*
===================================================================
Project Name    : PWM制御
File Name       : 3_2_3_test.v
Encoding        : UTF-8
Creation Date   : 2021/7/15
===================================================================
*/

`timescale 1ns/1ps
module PWM_test;
parameter STEP = 10;

reg clk_main;
wire duty;
integer i;

FIR ex(clk_main, duty, C_duty);
initial begin
	$dumpfile("3_2_3.vcd");
	$dumpvars(0, PWM_test);
	$monitor("%t: clk_main = %b, duty = %b", $time, clk_main, duty);

	clk_main <= 1'b0;
	for(i = 0; i < 1e+4; i = i + 1) begin
		#STEP
		clk_main = ~clk_main;
	end
	$finish;
end

endmodule
