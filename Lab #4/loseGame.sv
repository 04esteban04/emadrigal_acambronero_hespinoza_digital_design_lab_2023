module loseGame(input reg [11:0] matrixGame[0:3][0:3],clk, output logic loseflag);

	logic[0:4] row,col;
	logic empty, rowfull, colfull;	
	
  // Verifica si hay celdas vacías
  always @(clk)begin
	  empty =0;
	  rowfull=0;
	  colfull=0;
	  for (row = 0; row < 4; row++) begin
		 for (col = 0; col < 4; col++) begin
			if (matrixGame[row][col] == 0 ) begin
			  empty = 1; // Todavía hay celdas vacías
			end 
		 end
	  end
	  
	  
	  // Verifica si hay valores adyacentes iguales
	  for (row = 0; row < 4; row++) begin
		 for (col = 0; col < 3; col++) begin
			if (matrixGame[row][col] == matrixGame[row][col+1]) begin
			  rowfull = 1; // Todavía hay valores adyacentes iguales
			end
		 end
	  end

	  // Verifica en las columnas
	  for (col = 0; col < 4; col++) begin
		 for (row = 0; row < 3; row++) begin
			if (matrixGame[row][col] == matrixGame[row+1][col]) begin
			  colfull = 1; // Todavía hay valores adyacentes iguales
			end
		 end
	  end
	  
	  if (empty || rowfull || colfull) begin
		 loseflag = 0;
	  end else begin
		 loseflag = 1; 
	  end
	  
	  
	end
	  // No se encontraron celdas vacías ni valores adyacentes iguales 
endmodule