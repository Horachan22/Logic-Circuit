/*
===================================================================
Project Name    : PWM制御
File Name       : 3_2_2.v
Encoding        : UTF-8
Creation Date   : 2021/7/15
===================================================================
*/

`define N          512
`define C_duty_30  30
`define C_duty_50  50
`define C_duty_70  70
`define C_duty_100 100
`define F_IN       50e+6
`define F_50K      50e+3

module PWM(clk_in, clk_main, duty_30, duty_50, duty_70, duty_100);
	input clk_in;
	integer counter = 1;
	output clk_main;
	output reg duty_30  = 1'b1, duty_50  = 1'b1, duty_70  = 1'b1, duty_100  = 1'b1;

	generate_clock ex(clk_in, clk_main);
	always @(posedge clk_main) begin
		if(counter == `N * `C_duty_30 / 100) begin
			duty_30 = ~duty_30;
		end
		if(counter == `N * `C_duty_50 / 100) begin
			duty_50 = ~duty_50;
		end
		if(counter == `N * `C_duty_70 / 100) begin
			duty_70 = ~duty_70;
		end
		if(counter == `N * `C_duty_100 / 100) begin
			duty_100 = ~duty_100;
		end
		if(counter == `N) begin
			duty_30 = ~duty_30;
			duty_50 = ~duty_50;
			duty_70 = ~duty_70;
			duty_100 = ~duty_100;
			counter = 0;
		end
		counter = counter + 1;
	end

endmodule

module generate_clock(clk_in, clk_main);
	input clk_in;
	output reg clk_main = 1'b0;
	integer count = 1;

	always @(clk_in) begin
		if(count % (`F_IN / `F_50K) < 1) begin
			clk_main <= ~clk_main;
		end
		count = count + 1;
	end

endmodule
