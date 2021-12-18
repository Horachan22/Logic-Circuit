/*
===================================================================
Project Name    : 組み合わせ回路
File Name       : 1_1_2_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module circuittest;
parameter STEP = 10;

reg [1:0]in;
reg A, B;
wire out;
integer i;

circuit ex(in[1], in[0], out);
initial begin
	$dumpfile("1_1_2.vcd");
	$dumpvars(0, circuittest);
	$monitor("%t: A=%b, B=%b f2=%b", $time,in[1], in[0], out);

	in <= 4'b0000;
	for(i = 0; i < 4; i = i + 1) begin
	#STEP
		in <= in + 1'b1;
		A <= in[1];
		B <= in[0];
	end
	$finish;
end

endmodule

