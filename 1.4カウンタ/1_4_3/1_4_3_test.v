/*
===================================================================
Project Name    : 同期式2純2進化7進カウンタ
File Name       : 1_4_3_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module test;
parameter STEP = 10;

reg Cp, R;
wire y1, y2, y3;
integer i;

D7counter ex(Cp, ~R, y1, y2, y3);
initial begin
	$dumpfile("1_4_3.vcd");
	$dumpvars(0, test);
	$monitor("%t: Cp=%b, _R=%b, y3=%b, y2=%b, y1=%b", $time, Cp, R, y3, y2, y1);

	Cp <= 1'b0;
	R <= 1'b1;

	for(i = 0; i < 13; i = i + 1) begin
		if(i > 1)
			R <= 1'b0;
		#STEP
		Cp <= Cp + 1'b1;
	end

	$finish;
end

endmodule
