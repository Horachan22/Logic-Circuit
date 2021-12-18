/*
===================================================================
Project Name    : ステートマシン
File Name       : 2_6_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/22
===================================================================
*/

module state_machinetest;
parameter STEP = 10;

reg  rd, clk, rst;
wire rd_data, ack;
integer i, j;

state_machine ex(rd, clk, rst, rd_data, ack);
initial begin
	$dumpfile("2_6.vcd");
	$dumpvars(0, state_machinetest);
	$monitor("%t: clk = %b, rd = %b, rst = %b, ack = %b, rd_data = %b", $time, clk, rd, rst, ack, rd_data);

// 初期状態の定義(state = IDLE)
	$display("初期状態をIDLEにセット");
	rd  <= 1'b0;
	clk <= 1'b0;
	rst <= 1'b0;
	#STEP
// 遷移可能状態へ変更
	$display("リセットを無効化");
	rst <= 1'b1;
	#STEP
// IDLEからIDLE
	clk <= 1'b0;
	rd <= 1'b0;
	#STEP
	clk <= 1'b1;
	rd <= 1'b0;
	$display("状態はIDLEから遷移なし");
// IDLEからREAD
	#STEP
	clk <= 1'b0;
	rd <= 1'b1;
	#STEP
	clk <= 1'b1;
	rd <= 1'b1;
	$display("状態はIDLEからREADへ遷移");
// READからIDLE
	#STEP
	clk <= 1'b0;
	rd <= 1'b0;
	#STEP
	clk <= 1'b1;
	rd <= 1'b0;
	$display("状態はREADからIDLEへ遷移");
// IDLEからREAD
	#STEP
	clk <= 1'b0;
	rd <= 1'b1;
	#STEP
	clk <= 1'b1;
	rd <= 1'b1;
	$display("状態はIDLEからREADへ遷移");
// READからACK_NOW
	#STEP
	clk <= 1'b0;
	rd <= 1'b1;
	#STEP
	clk <= 1'b1;
	rd <= 1'b1;
	$display("状態はREADからACK_NOWへ遷移");
// ACL_NOWからACK_NOW
	#STEP
	clk <= 1'b0;
	rd <= 1'b1;
	#STEP
	clk <= 1'b1;
	rd <= 1'b1;
	$display("状態はACK_NOWから遷移なし");
// ACL_NOWからREAD
	#STEP
	clk <= 1'b0;
	rd <= 1'b0;
	#STEP
	clk <= 1'b1;
	rd <= 1'b0;
	$display("状態はACK_NOWからIDLEへ遷移");
// IDLEからREAD
	#STEP
	clk <= 1'b0;
	rd <= 1'b1;
	#STEP
	clk <= 1'b1;
	rd <= 1'b1;
	$display("状態はIDLEからREADへ遷移");
// リセット入力
	#STEP
	$display("リセットを有効化");
	rst <= 1'b0;


	$finish;
end

endmodule
