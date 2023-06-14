module contador_direccion #(parameter n = 5) (input logic clk,      
															input logic reset,  
															input [0:9] x, 
															input [0:9] y,			
															output logic we,
															output reg [n-1:0] out);  
	
	// Variables requeridas	
	reg [n-1:0] contador = 0;
	logic flag_contador = 0;
	logic flag_we = 0;
	
	
	always @ (posedge clk) begin
		
		if (reset) begin
			contador = 0;
			flag_contador = 0;
			flag_we = 0;
		end
		
		else begin
			if (x == 199 && y == 120) begin
				contador = 0;
				flag_contador = 1;
				we = 0;
				if (!flag_we) begin
					we = 1;
					flag_we = 1;
				end
			end
			
			else if (flag_contador) begin
				if ((x >= 200 && x <= 455) && (y >= 120 && y <= 375)) begin			
					contador = contador + 1'b1;
				end
				else if (x == 456 && y == 376) begin
					contador = 0;
					flag_contador = 0;
					we = 0;
				end
			end
				
		end
				
	end 
	
	assign out = contador;

endmodule








	