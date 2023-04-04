
///////////////////////////////////////////////////////////
/////////////////////  -- FLAGS --  ///////////////////////
///////////////////////////////////////////////////////////

module flags #(parameter N=4) (

	input logic [1:0] inFlagC,
	input logic inFlagN,
	input logic [1:0] inFlagV,
	input logic [10:0] inFlagZ,
	input [3:0] operation,
	output reg outFlagC,
	output reg outFlagN,
	output reg outFlagV,
	output reg outFlagZ);


	always_comb begin
		
		outFlagC = 0;
		outFlagN = 0;
		outFlagV = 0;
		outFlagZ = 0;

		case (operation)
			
			// OPERACIÓN SUMA DE A+B
			0: begin 
					outFlagC = inFlagC[0];
					outFlagN = 0;
					outFlagV = inFlagV[0];
					outFlagZ = inFlagZ[0];
				end
			
			// OPERACIÓN RESTA DE A+B
			1: begin 
					outFlagC = inFlagC[1];
					outFlagN = inFlagN;
					outFlagV = inFlagV[1];
					outFlagZ = inFlagZ[1];
				end
			
			// OPERACIÓN AND
			2: outFlagZ = inFlagZ[2];
			
			// OPERACIÓN OR
			3: outFlagZ = inFlagZ[3];

			// OPERACIÓN NOT A
			4: outFlagZ = inFlagZ[4];
			
			// OPERACIÓN NOT B
			5: outFlagZ = inFlagZ[5];

			// OPERACIÓN XOR
			6: outFlagZ = inFlagZ[6];
			
			// OPERACIÓN AShiftLeft
			7: outFlagZ = inFlagZ[7];

			// OPERACIÓN AShiftRight
			8: outFlagZ = inFlagZ[8];
				
			// OPERACIÓN LShiftLeft
			9: outFlagZ = inFlagZ[9];
				
			// OPERACIÓN LShiftRight
			10: outFlagZ = inFlagZ[10];
			
			default: begin 
							outFlagC = 0;
							outFlagN = 0;
							outFlagV = 0;
							outFlagZ = 0;
						end

		endcase
	
	end
	
endmodule