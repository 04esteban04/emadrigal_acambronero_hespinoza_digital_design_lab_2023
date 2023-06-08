module loseGame_tb;

	logic clk=0;
	reg [11:0] matriz [0:3][0:3];
	logic loseflag;
	
	
	loseGame losePB(matriz, clk, loseflag);
	
	always begin
	
		#5	
		clk = ~clk;
	
	end
	
	
	initial begin
		
		#10
		matriz = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
		
		#5
		matriz = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
		
		#5
		matriz = '{'{1, 2, 3, 4}, '{5, 6, 7, 8}, '{1, 2, 3, 4}, '{5, 6, 7, 8}};
		
		#5
		matriz = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
		#5
		matriz = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
		
		
	end

endmodule