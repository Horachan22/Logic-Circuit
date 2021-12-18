/*
===================================================================
Project Name    : クロックパルスの変換回路
File Name       : 3_1_2_test.v
Encoding        : UTF-8
Creation Date   : 2021/7/15
===================================================================
*/

`timescale 1ns/1ps
module generate_clock_test;
parameter STEP = 10;

reg clk_in;
wire clk_N;
integer i;

generate_clock ex(clk_in, clk_N);
initial begin
	$dumpfile("3_1_2.vcd");
	$dumpvars(0, generate_clock_test);
	$monitor("%t: clk_in = %b, clk_N = %b", $time, clk_in, clk_N);

	clk_in <= 1'b0;
	for(i = 0; i < 4e+4; i = i + 1) begin
		#STEP
		clk_in = ~clk_in;
	end
	$finish;
end

endmodule
