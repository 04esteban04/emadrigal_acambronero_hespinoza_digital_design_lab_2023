
///////////////////////////////////////////////////////////
//////////////////////  -- MUX --  ////////////////////////
///////////////////////////////////////////////////////////

module mux4 #(parameter N=4) (
	
	input logic [N-1:0] in1, in2, 
	input logic [N-1:0] in3, in4, in5, in6, in7,
	input logic [N-1:0] in8, in9, in10, in11,
	input [3:0] operation,
	output reg [N-1:0] out);


	always_comb begin
		
		out = 0;

		case (operation)
			
			// OPERACIÓN SUMA DE A+B
			0: out = in1;
			
			// OPERACIÓN RESTA DE A+B
			1: out = in2;
			
			// OPERACIÓN AND
			2: out = in3;
			
			// OPERACIÓN OR
			3: out = in4;
			
			// OPERACIÓN NOT A
			4: out = in5;
			
			// OPERACIÓN NOT B
			5: out = in6;
			
			// OPERACIÓN XOR
			6: out = in7;
			
			// OPERACIÓN AShiftLeft
			7: out = in8;
				
			// OPERACIÓN AShiftRight
			8: out = in9;
				
			// OPERACIÓN LShiftLeft
			9: out = in10;
				
			// OPERACIÓN LShiftRight
			10: out = in11;
			
			default: out = 0;

		endcase
	
	end
	
endmodule