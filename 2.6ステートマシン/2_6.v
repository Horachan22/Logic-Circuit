/*
===================================================================
Project Name    : ステートマシン
File Name       : 2_6.v
Encoding        : UTF-8
Creation Date   : 2021/4/22
===================================================================
*/

`define IDLE    2'b00
`define READ    2'b01
`define ACK_NOW 2'b10

module state_machine(rd, clk, rst, rd_data, ack);
	input   rd, clk, rst;
	output  rd_data, ack;
	reg     rd_data, ack;
	reg     [1:0] state, next_state;

// クロック立ち上がり時、リセット入力時
	always @(posedge clk or negedge rst) begin
		if(rst == 0) begin
			state <= `IDLE;
		end
		else begin
			state <= next_state;
		end
	end

// 状態定義
	always @(state) begin
		case(state)
			`IDLE : begin
				ack     <= 1'b0;
				rd_data <= 1'b0;
			end
			`READ : begin
				ack     <= 1'b0;
				rd_data <= 1'b1;
			end
			`ACK_NOW : begin
				ack     <= 1'b1;
				rd_data <= 1'b0;
			end
		endcase
	end

// 状態遷移
	always @(state, rd) begin
		case(state)
			`IDLE    : begin
				if(rd == 1'b0) begin
					next_state <= `IDLE;
				end
				else if(rd == 1'b1) begin
					next_state <= `READ;
				end
			end
			`READ    : begin
				if(rd == 1'b0) begin
					next_state <= `IDLE;
				end
				else if(rd == 1'b1) begin
					next_state <= `ACK_NOW;
				end
			end
			`ACK_NOW : begin
				if(rd == 1'b0) begin
					next_state <= `IDLE;
				end
				else if(rd == 1'b1) begin
					next_state <= `ACK_NOW;
				end
			end
		endcase
	end

endmodule
