module winGame(input reg[11:0] matrixGame[0:3][0:3],input logic clk,input logic[0:11] maxScore, output logic winflag);
	
	
	logic [0:4] row, col;
	logic win;
	always @(clk)begin
		win =0;
	
	// Verifica si hay celdas vacías
		for (row = 0; row < 4; row++) 
			begin
				for (col = 0; col < 4; col++) 
					begin
					if (matrixGame[row][col] == maxScore) begin
						win = 1;
					end
				end
			end
		if (win ==1) winflag = 1;
		else winflag = 0;
	end

endmodule