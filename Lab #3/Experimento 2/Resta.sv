
///////////////////////////////////////////////////////////
//////////////////////  -- RESTA --  //////////////////////
///////////////////////////////////////////////////////////

module RESTA_op #(parameter N=4)(input logic [N-1:0] a, 
											input logic [N-1:0] b,
											output reg [N-1:0] result,
											output reg flagC,
											output reg flagN,
											output reg flagV,
											output reg flagZ);
	
	reg [N-1:0] comp2B; //Complemento a 2 de B
	reg [N-1:0] tempRes;
	
	complement2 comp2(.in(b), .resComp2(comp2B));										
	
	always_comb begin
		
		//INICIALIZACIÓN DE VARIABLES
		tempRes = 0;
		result = 0;
		flagC = 0;
		flagN = 0;
		flagV = 0;
		flagZ = 0;
		
		// RESTA GENERA UN NÚMERO NEGATIVO
		if (a<b) begin
			tempRes = a + comp2B;
			result = (~tempRes) + 1'b1;
			flagC = 1;
			flagN = 1;
			flagZ = 0;
		end
		
		// RESTA GENERA UN NÚMERO POSITIVO
		else if (a>b) begin
			result = a + comp2B;
			flagC = 0;
			flagN = 0;
			flagZ = 0;
		end
		
		// RESTA GENERA UN CERO
		else if (a == b) begin
			result = a + comp2B;
			flagC = 0;
			flagN = 0;
			flagZ = 1;
		end 
		
		// FLAG OVERFLOW
		flagV = ((a[N-1] & b[N-1] & (~result[N-1])) | ((~a[N-1]) & (~b[N-1]) & result[N-1]));
		
	end
	
endmodule