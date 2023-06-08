module FSM_Control(	input logic clk,
							input logic rst,
							input logic start,
							input logic izq,
							input logic der,
							input logic arriba,
							input logic abajo,
							input logic [3:0] setMaxScore,
							output reg [11:0] matrixGame [0:3][0:3],
							output logic winflag,
							output logic loseflag,
							output reg [5:0] puntos=0);



//	input logic clk;   // entrada del reloj
//	input logic rst;   // entrada de reset
//
//	input logic izq;   // entrada para el botón de izquierda
//	input logic der;   // entrada para el botón de derecha
//	input logic arriba; // entrada para el botón de arriba
//	input logic abajo;   // entrada para el botón de abajo
//	input logic start;   //entrada para el boton de inicio
//
//	output logic winflag;
//	output logic loseflag;
//
//	output reg [11:0] matrixGame [0:3][0:3];
//	output int puntos=0;
	

	reg [2:0] state, next_state;

	reg fullflag = 0;

//	reg seed = 12345;      // Semilla inicial 
//	reg random_number=0;
//	reg counter=0;

	//reg [0:11] maxScore = 128;
	reg [0:11] maxScore = 2048;
	
	reg [11:0] matrixCopy [0:3][0:3]; 
	
	logic put;
	
	logic [0:4] row, col, i, j, k;
	logic signed [0:4] row2, col2, i2, j2, k2;
	//int row2, col2, i2, j2, k2;
	
	logic izqflag, derflag, arribaflag, abajoflag, randomflag;


	//Instacias de las flags de juego


	winGame checkWin( .matrixGame(matrixGame),
							.clk(clk),
							.maxScore(maxScore),
							.winflag(winflag));
							
	loseGame checkLose(	.matrixGame(matrixGame),
								.clk(clk),
								.loseflag(loseflag));
								
	//matriz_full checkFull(.matrixGame(matrixGame),
	//								.clk(clk), 
	//								.fullflag(fullflag));


	localparam
	Inicio 	= 3'b001,
	Game 		= 3'b010,
	gameover = 3'b011,
	win		= 3'b100,
	randomput= 3'b101,
	Done		= 3'b110;
	//int row, col;

	//actual state logic
	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			state = Inicio;
		end
		else begin
			state = next_state;
		end
	end

	//next state logic
	always @(posedge clk) begin
		case (state)
			Inicio: begin		
							izqflag = 0;
							derflag = 0;
							arribaflag = 0;
							abajoflag = 0;
							randomflag = 0;
							puntos = 0;
							
							if(start) begin
								matrixCopy = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
								matrixGame = '{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 0, 0}};
								matrixGame[1][2] = 2;
								matrixGame[2][2] = 2;
								
								case (setMaxScore)
									4'b0000: maxScore = 4;
									4'b0001: maxScore = 8;
									4'b0010: maxScore = 16;
									4'b0011: maxScore = 32;
									4'b0100: maxScore = 64;
									4'b0101: maxScore = 128;
									4'b0110: maxScore = 256;
									4'b0111: maxScore = 512;
									4'b1000: maxScore = 1024;
									4'b1001: maxScore = 2048;
									default: maxScore = 2048;
								endcase
								
								next_state = Game;			
								
							end 
							else begin
								matrixGame = matrixCopy; //'{'{0, 0, 0, 0}, '{0, 0, 0, 0}, '{0, 0, 64, 0}, '{0, 0, 0, 0}};
							end

////							 repeat(2) begin
////								counter = counter + 1;
////								random_number = (counter + seed) % 4;
////								row = random_number;
////								random_number = (counter + seed) % 4;
////								counter = counter + 1;
////								col = random_number;
////								matrixGame[row][col] = 2;
////							 end
//							
						end
					
			
			Game: begin
						randomflag = 0;
						matrixCopy = matrixGame;
					
						if(winflag) next_state = gameover;
				
						if(loseflag) next_state = gameover;
						
						if(~izq) begin
							matrixCopy = matrixGame;
//								matrixGame = '{'{8, 0, 0, 0}, '{8, 0, 2, 0}, '{8, 0, 2, 0}, '{8, 0, 0, 0}};
							
							if (loseflag == 0 && izqflag == 0) begin
							  //logic [0:4] row, i, j, k;
							  for (row = 0; row < 4; row++) begin
								 // Mover los valores hacia la izquierda en la fila actual
								 i = 0;
								 j = 0;
								 while (i < 4) begin
									if (matrixGame[row][i] != 0) begin
									  matrixGame[row][j] = matrixGame[row][i];
									  if (i != j) // Si no se copió el valor a sí mismo
										 matrixGame[row][i] = 0;
									  j++;
									end
									i++;
								 end
								 
								 // Fusionar los valores adyacentes si son iguales
								 k = 0;
								 while (k < 3) begin
									if (matrixGame[row][k] == matrixGame[row][k+1]) begin
									  matrixGame[row][k] = matrixGame[row][k] + matrixGame[row][k]; //2;
									  matrixGame[row][k+1] = 0;
									end
									k++;
								 end
								 
								 // Mover los valores hacia la izquierda después de la fusión
								 i = 0;
								 j = 0;
								 while (i < 4) begin
									if (matrixGame[row][i] != 0) begin
									  matrixGame[row][j] = matrixGame[row][i];
									  if (i != j) // Si no se copió el valor a sí mismo
										 matrixGame[row][i] = 0;
									  j++;
									end
									i++;
								 end
							  end
								puntos++;
								izqflag = 1;
								next_state = randomput;
								//next_state = win;
							end
							
						end
						
			
						
						if(~der) begin
							matrixCopy = matrixGame;
							//matrixGame = '{'{0, 0, 0, 8}, '{0, 0, 2, 8}, '{0, 0, 2, 8}, '{0, 0, 0, 8}};
//							matrixGame = '{'{2, 2, 16, 32}, 
//												'{16, 32, 2, 64}, 
//												'{128, 64, 16, 32}, 
//												'{2, 16, 4, 2}};
												
//							matrixGame = '{'{0, 4, 4, 0}, 
//												'{0, 0, 0, 0}, 
//												'{0, 0, 0, 0}, 
//												'{0, 0, 0, 0}};
						
								if (loseflag == 0 && derflag == 0) begin
									//int row2, col2, i2, j2, k2;
									//logic [0:4] row, i, j, k;
									  for (row2 = 0; row2 < 4; row2++) begin
										 // Mover los valores hacia la derecha en la fila actual
										 i2 = 3;
										 j2 = 3;
										 
										 
										 while (i2 >= 0) begin
											if (matrixGame[row2][i2] != 0) begin
											  matrixGame[row2][j2] = matrixGame[row2][i2];
											  if (i2 != j2) // Si no se copió el valor a sí mismo
												 matrixGame[row2][i2] = 0;
											  j2--;
											end
											i2--;
										 end
										 
										 
										 // Fusionar los valores adyacentes si son iguales
										 k2 = 3;
										 while (k2 > 0) begin
											if (matrixGame[row2][k2] == matrixGame[row2][k2-1]) begin
											  matrixGame[row2][k2] = matrixGame[row2][k2] + matrixGame[row2][k2]; //2;
											  matrixGame[row2][k2-1] = 0;
											end
											k2--;
										 end
										 
										 // Mover los valores hacia la derecha después de la fusión
										 i2 = 3;
										 j2 = 3;
										 while (i2 >= 0) begin
											if (matrixGame[row2][i2] != 0) begin
											  matrixGame[row2][j2] = matrixGame[row2][i2];
											  if (i2 != j2) // Si no se copió el valor a sí mismo
												 matrixGame[row2][i2] = 0;
											  j2--;
											end
											i2--;
										 end
									  end
									puntos++;
									derflag = 1;
									next_state = randomput;
								end
						end
						
						if(~arriba) begin
							matrixCopy = matrixGame;
							//matrixGame = '{'{8, 8, 8, 8}, '{0, 0, 2, 0}, '{0, 0, 2, 0}, '{0, 0, 0, 0}};
				
//							matrixGame = '{'{0, 2, 2, 0}, 
//												'{0, 0, 0, 0}, 
//												'{0, 0, 0, 0}, 
//												'{0, 0, 0, 0}};
												
								//metodo de mover a la arriba
								if (loseflag == 0 && arribaflag == 0) begin
								  //int row, col, i, j, k;
		  
								  for (col = 0; col < 4; col++) begin
									 // Mover los valores hacia arriba en la columna actual
									 i = 0;
									 j = 0;
									 while (i < 4) begin
										if (matrixGame[i][col] != 0) begin
										  matrixGame[j][col] = matrixGame[i][col];
										  if (i != j) // Si no se copió el valor a sí mismo
											 matrixGame[i][col] = 0;
										  j++;
										end
										i++;
									 end
									 
									 // Fusionar los valores adyacentes si son iguales
									 k = 0;
									 while (k < 3) begin
										if (matrixGame[k][col] == matrixGame[k+1][col]) begin
										  matrixGame[k][col] = matrixGame[k][col] + matrixGame[k][col]; //2; //12'b000000000010; //2;
										  matrixGame[k+1][col] = 0;
										end
										k++;
									 end
									 
									 // Mover los valores hacia arriba después de la fusión
									 i = 0;
									 j = 0;
									 while (i < 4) begin
										if (matrixGame[i][col] != 0) begin
										  matrixGame[j][col] = matrixGame[i][col];
										  if (i != j) // Si no se copió el valor a sí mismo
											 matrixGame[i][col] = 0;
										  j++;
										end
										i++;
									 end
								  end
									puntos++;
									arribaflag = 1;
									next_state = randomput;
								end
						end					
						
						
						if(~abajo) begin
							matrixCopy = matrixGame;
							//matrixGame = '{'{0, 0, 0, 0}, '{0, 0, 2, 0}, '{0, 0, 2, 0}, '{0, 0, 4, 0}};
						
								if (loseflag == 0 && abajoflag == 0) begin
									  //int row2, col2, i2, j2, k2;
										
									  for (col2 = 0; col2 < 4; col2++) begin
										 // Mover los valores hacia abajo en la columna actual
										 i2 = 3;
										 j2 = 3;
										 while (i2 >= 0) begin
											if (matrixGame[i2][col2] != 0) begin
											  matrixGame[j2][col2] = matrixGame[i2][col2];
											  if (i2 != j2) // Si no se copió el valor a sí mismo
												 matrixGame[i2][col2] = 0;
											  j2--;
											end
											i2--;
										 end
										 
										 // Fusionar los valores adyacentes si son iguales
										 k2 = 3;
										 while (k2 > 0) begin
											if (matrixGame[k2][col2] == matrixGame[k2-1][col2]) begin
											  matrixGame[k2][col2] = matrixGame[k2][col2] + matrixGame[k2][col2]; //2; //12'b000000000010; //2;
											  matrixGame[k2-1][col2] = 0;
											end
											k2--;
										 end
										 
										 // Mover los valores hacia abajo después de la fusión
										 i2 = 3;
										 j2 = 3;
										 while (i2 >= 0) begin
											if (matrixGame[i2][col2] != 0) begin
											  matrixGame[j2][col2] = matrixGame[i2][col2];
											  if (i2 != j2) // Si no se copió el valor a sí mismo
												 matrixGame[i2][col2] = 0;
											  j2--;
											end
											i2--;
										 end
									  end
									puntos++;
									abajoflag = 1;
									next_state = randomput;
								end
						end
			end
			
			randomput: begin
			
								if (randomflag == 0) begin
									//int row, col;
									put = 0;
									// Verifica si hay celdas vacías
									for (row = 0; row < 4; row++) begin
									  for (col = 0; col < 4; col++) begin
										 if (matrixGame[row][col] == 0 && put == 0) begin
											 matrixGame[row][col] = 12'd2;
											 put = 1;
										 end
									  end
									end
									randomflag = 1;
								end
								
								//next_state = Game;
								next_state = Done;
								
			end
			
			gameover:	begin
								if (rst) begin
									next_state = Inicio;
								end
								//next_state = Inicio;
			end
		
			Done:	begin
						if (izq && der && arriba && abajo) begin 
							izqflag = 0;
							derflag = 0;
							arribaflag = 0;
							abajoflag = 0;
							
							next_state = Game;
						end
						//next_state = Inicio;
			end
		
			default: next_state = Inicio;
		
		endcase
		
	end

endmodule