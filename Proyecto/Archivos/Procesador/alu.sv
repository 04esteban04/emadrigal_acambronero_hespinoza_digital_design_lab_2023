module alu#(parameter N = 4)
			(
				input [N-1:0] a_i,
				input [N-1:0] b_i,
				input [2:0] opcode_i,
				output logic [N-1:0] result_o,
				output [3:0] ALUFlags
			);
			
	
	logic [N-1:0] arith_result_w;
	logic arith_v;
	logic arith_c;
	
	AluAritmetic #(.N(N)) arithmetics (
		.a_i(a_i),
		.b_i(b_i),
		.opcode_i(opcode_i),
		.result_o(arith_result_w),
		.overflow_o(arith_v),
		.cout_o(arith_c)
	);
	
	always_comb
	begin
		case (opcode_i)
			3'b010: result_o = a_i & b_i; //Caso AND
			3'b011: result_o = a_i | b_i; //Caso OR
			default: result_o = arith_result_w; //resultado de suma o resta
		endcase
	end
	
	assign ALUFlags[3] = ~opcode_i[1] & arith_v;
	assign ALUFlags[2] = ~opcode_i[1] & arith_c;
	assign ALUFlags[1] = (result_o == '0);
	assign ALUFlags[0] = result_o[N-1];
	
endmodule