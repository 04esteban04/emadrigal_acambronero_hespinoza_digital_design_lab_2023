
///////////////////////////////////////////////////////////
//////////////////////  -- NOT --  ////////////////////////
///////////////////////////////////////////////////////////

module NOT_op #(parameter N=4) ( input logic [N-1:0] in,  
											output reg [N-1:0]result,
											output reg flagZ);

	always_comb begin
		
		//INICIALIZACIÓN DE VARIABLES
		result = 0;
		flagZ = 0;
		
		result = ~in;
		
		// FLAG CERO
		if (result == 0) begin
			flagZ = 1;
		end
		
		else if (result != 0) begin
			flagZ = 0;
		end
		
	end
	
endmodule 