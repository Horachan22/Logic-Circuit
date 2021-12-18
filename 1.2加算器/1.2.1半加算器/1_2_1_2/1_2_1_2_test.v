/*
===================================================================
Project Name    : 半加算器
File Name       : 1_2_1_1_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module half_addertest;
parameter STEP = 10;

reg [1:0]in;
reg X, Y;
wire outS, outC;
integer i;

half_adder ex(in[1], in[0], outS, outC);
initial begin
	$dumpfile("1_2_1.vcd");
	$dumpvars(0, half_addertest);
	$monitor("%t: X=%b, Y=%b, S=%b, C=%b", $time,in[1], in[0], outS, outC);

	in <= 2'b00;
	for(i = 0; i < 4; i = i + 1) begin
	#STEP
		in <= in + 1'b1;
		X <= in[1];
		Y <= in[0];
	end
	$finish;
end

endmodule
