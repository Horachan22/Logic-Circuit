/*
===================================================================
Project Name    : ALU
File Name       : 2_4_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/22
===================================================================
*/

module ALUtest;
parameter STEP = 10;

reg  [7:0] accum, data;
reg  [2:0] opecode;
wire [7:0] alu_out;
integer i;

ALU ex(accum, data, alu_out, opecode);
initial begin
	$dumpfile("2_4.vcd");
	$dumpvars(0, ALUtest);
	$monitor("%t: accum = %b, data = %b, opecode = %b, alu_out = %b", $time, accum, data, opecode, alu_out);

	opecode <= 3'b000;
	// 計算値を入力
	accum <= 8'b01110100;
	data  <= 8'b10100011;

	 for(i = 0; i < 7; i = i + 1) begin
	#STEP
		opecode <= opecode + 1'b1;
	end
	$finish;
end

endmodule
