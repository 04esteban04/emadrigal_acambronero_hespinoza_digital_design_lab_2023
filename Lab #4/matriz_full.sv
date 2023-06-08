module matriz_full(	input reg [11:0] matrixGame[0:3][0:3],
							input logic clk, 
							output logic fullflag);

	//int row,col;
	logic [0:4] row, col;
	
	always @(negedge clk)begin
		for (row = 0; row < 4; row++) begin
		  for (col = 0; col < 4; col++) begin
				if (matrixGame[row][col] == 0) begin
					 // Si encuentra un índice con valor 0, la matriz no está llena
					 fullflag = 0;
				end 
				else begin
					fullflag = 1;
				end
		  end
		end
 // Si ha llegado aquí, todos los índices tienen un valor distinto de cero
	end

endmodule