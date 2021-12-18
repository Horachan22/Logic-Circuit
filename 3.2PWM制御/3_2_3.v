/*
===================================================================
Project Name    : PWM制御
File Name       : 3_2_3.v
Encoding        : UTF-8
Creation Date   : 2021/7/15
===================================================================
*/

`define N 512

module PWM(clk_main, duty, C_duty);
	input clk_main, C_duty;
	integer counter = 1;
	output reg duty = 1'b1;

	always @(posedge clk_main) begin
		if(counter == `N * C_duty / 100) begin
			duty = ~duty;
		if(counter == `N) begin
			duty = ~duty;
			counter = 0;
		end
		counter = counter + 1;
	end
endmodule

module FIR(duty, out);
	input duty;
	output reg out;

endmodule
