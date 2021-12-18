/*
===================================================================
Project Name    : ALU
File Name       : 2_4_test.v
Encoding        : UTF-8
Creation Date   : 2021/4/22
===================================================================
*/

module ALU(accum, data, alu_out, opecode);
	input  [7:0] accum, data;
	input  [2:0] opecode;
	output [7:0] alu_out;
	reg    [7:0] alu_out;

	always @(*) begin
		case(opecode)
			3'b000: alu_out <= accum & data;
			3'b001: alu_out <= accum | data;
			3'b010: alu_out <= ~accum;
			3'b011: alu_out <= accum ^ data;
			3'b100: alu_out <= accum + data;
			3'b101: alu_out <= accum - data;
			3'b110: alu_out <= accum;
			3'b111: alu_out <= data;
		endcase
	end

endmodule
