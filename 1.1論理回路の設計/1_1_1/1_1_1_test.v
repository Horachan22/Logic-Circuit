/*
===================================================================
Project Name    : 組み合わせ回路
File Name       : 1_1_1_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module circuittest;
parameter STEP = 10;

reg [2:0]in;
reg A, B, C;
wire out;
integer i;

circuit ex(in[2], in[1], in[0], out);
initial begin
	$dumpfile("1_1_1.vcd");
	$dumpvars(0, circuittest);
	$monitor("%t: A=%b, B=%b, C=%b f1=%b", $time, in[2], in[1], in[0], out);

	in <= 3'b000;
	for(i = 0; i < 8; i = i + 1) begin
	#STEP
		in <= in + 1'b1;
		A <=  in[2];
		B <=  in[1];
		C <=  in[0];
	end
	$finish;
end

endmodule

