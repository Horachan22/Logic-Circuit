/*
===================================================================
Project Name    : 同期式2純2進化7進カウンタ
File Name       : 1_4_2_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/15
===================================================================
*/

module test;
parameter STEP = 10;

reg R, Cp;
wire y1, y2, y3;
integer i;

JK7counter ex(Cp, ~R, y1, y2, y3);
initial begin
	$dumpfile("1_4_2.vcd");
	$dumpvars(0, test);
	$monitor("%t: Cp=%b, _R=%b, y3=%b, y2=%b, y1=%b", $time, Cp, R, y3, y2, y1);

	R <= 1'b1;
	Cp <= 1'b0;
	for(i = 0; i < 13; i = i + 1) begin
		// if文 => リセットを機能させる場合 if(i == n)は、n回目のループのときにリセットされる
		// if(i == 8)
		// 	R <= 1'b0;
		// 	#STEP
		// 	R <= 1'b1; //リセット解除

		#STEP
		Cp <= Cp + 1'b1;
	end

	$finish;
end

endmodule
