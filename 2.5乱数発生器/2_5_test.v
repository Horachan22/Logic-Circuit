/*
===================================================================
Project Name    : 乱数発生器
File Name       : 2_5_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/22
===================================================================
*/

module randomtest;
parameter STEP = 10;

reg  Cp, S;
reg  [2:0]code;
wire out;
integer i, j;

random ex(Cp, S, out, code);
initial begin
	$dumpfile("2_5.vcd");
	$dumpvars(0, randomtest);
	$monitor("%t: Cp = %b, S = %b, code = %b, out = %b", $time, Cp, S, code, out);

	code <= 3'b000;
	Cp <= 1'b1;
	S <= 1'b1;

	for(i = 0; i < 7; i = i + 1) begin
		if (Cp == 1'b0)
			Cp <= 1'b1;
		else
			Cp <= 1'b0;
		#STEP
		if (Cp == 1'b0) begin
			Cp <= 1'b1;
			S <= 1'b1;
			code <= code + 1'b1;
		end
		else begin
			Cp <= 1'b0;
			S <= 1'b1;
			code <= code + 1'b1;
		end
		for (j = 0; j < 19; j = j + 1)begin
			#STEP
			S <= 1'b0;
			if (Cp == 1'b0)
				Cp <= 1'b1;
			else
				Cp <= 1'b0;
		end
	end
	$finish;
end

endmodule
