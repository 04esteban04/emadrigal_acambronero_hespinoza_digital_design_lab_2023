module Game2048 #(parameter N=4)(clk,rst,izq,der,arriba,abajo, win,lose);
	
//Simulacion
input logic clk;   // entrada del reloj
input logic rst;   // entrada de reset
//Movimiento
input logic izq;   // entrada para el botón de izquierda
input logic der;   // entrada para el botón de derecha
input logic arriba; // entrada para el botón de arriba
input logic abajo;   // entrada para el botón de abajo
//Estados
output logic win;
output logic lose;
	
// declarando una matriz de enteros vacía de 4x4
int matrixGame [0:3][0:3];

// Declaración de variables
int seed = 12345;      // Semilla inicial 
int random_number=0;
int counter=0;
int puntos=0;
	
always @(negedge rst or negedge izq or negedge der or negedge arriba or negedge abajo) begin
	if(~rst) begin
		casoInicial();
		seed = 12345;      // Semilla inicial 
		random_number=0;
		counter=0;
		puntos=0;
	end
	if(~izq) begin
		//etodo de mover a la izq
		if (matriz_full() == 0) begin
			moveLeft();
			place_random();
			puntos++;
		end
		else if (winGame()==1) begin
			win=1;
		end 
    else if (endGame()==0) begin
			lose=1;
		end
	end
	if(~der) begin
		//
		if (matriz_full() == 0) begin
			moveRight();
			place_random();
			puntos++;
		end
		else if (winGame()==1) begin
			win=1;
		end 
		else if (endGame()==0) begin
			lose=1;
		end	end
	if(~arriba) begin
		//metodo de mover a la arriba
		if (matriz_full() == 0) begin
			moveUp();
			place_random();
			puntos++;
		end
		else if (winGame()==1) begin
			win=1;
		end 
		else if (endGame()==0) begin
			lose=1;
		end
	end
	if(~abajo) begin
		if (matriz_full() == 0) begin
			moveDown();
			place_random();
			puntos++;
		end
		else if (winGame()==1) begin
			win=1;
		end 
		else if (endGame()==0) begin
			lose=1;
		end
	end
end
//Caso inicial donde se ponen dos dos, en la matriz 
function void casoInicial();
    int row, col;
	 repeat(2) begin
		random_number = (counter + seed) % 4;
		counter = counter + 1;
		row = random_number;
		random_number = (counter + seed) % 4;
		counter = counter + 1;
		col = random_number;
		matrixGame[row][col] = 2;
	 end
endfunction
//Movimiento de la matriz a la derecha
function void moveRight();
  int row, col, i, j, k;
  for (row = 0; row < 4; row++) begin
    // Mover los valores hacia la derecha en la fila actual
    i = 3;
    j = 3;
    while (i >= 0) begin
      if (matrixGame[row][i] != 0) begin
        matrixGame[row][j] = matrixGame[row][i];
        if (i != j) // Si no se copió el valor a sí mismo
          matrixGame[row][i] = 0;
        j--;
      end
      i--;
    end
    
    // Fusionar los valores adyacentes si son iguales
    k = 3;
    while (k > 0) begin
      if (matrixGame[row][k] == matrixGame[row][k-1]) begin
        matrixGame[row][k] *= 2;
        matrixGame[row][k-1] = 0;
      end
      k--;
    end
    
    // Mover los valores hacia la derecha después de la fusión
    i = 3;
    j = 3;
    while (i >= 0) begin
      if (matrixGame[row][i] != 0) begin
        matrixGame[row][j] = matrixGame[row][i];
        if (i != j) // Si no se copió el valor a sí mismo
          matrixGame[row][i] = 0;
        j--;
      end
      i--;
    end
  end
endfunction
//Movimiento de la matriz a la izquierda
function void moveLeft();
  int row, col, i, j, k;
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
        matrixGame[row][k] *= 2;
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
endfunction
//Movimiento de la matriz hacia arriba
function void moveUp();
  int row, col, i, j, k;
  
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
        matrixGame[k][col] *= 2;
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
endfunction
//Movimiento de la matriz hacia abajo
function void moveDown();
  int row, col, i, j, k;
  
  for (col = 0; col < 4; col++) begin
    // Mover los valores hacia abajo en la columna actual
    i = 3;
    j = 3;
    while (i >= 0) begin
      if (matrixGame[i][col] != 0) begin
        matrixGame[j][col] = matrixGame[i][col];
        if (i != j) // Si no se copió el valor a sí mismo
          matrixGame[i][col] = 0;
        j--;
      end
      i--;
    end
    
    // Fusionar los valores adyacentes si son iguales
    k = 3;
    while (k > 0) begin
      if (matrixGame[k][col] == matrixGame[k-1][col]) begin
        matrixGame[k][col] *= 2;
        matrixGame[k-1][col] = 0;
      end
      k--;
    end
    
    // Mover los valores hacia abajo después de la fusión
    i = 3;
    j = 3;
    while (i >= 0) begin
      if (matrixGame[i][col] != 0) begin
        matrixGame[j][col] = matrixGame[i][col];
        if (i != j) // Si no se copió el valor a sí mismo
          matrixGame[i][col] = 0;
        j--;
      end
      i--;
    end
  end
endfunction
//Validar que la matriz este llena
function int matriz_full();
    int row, col;
    for (row = 0; row < 4; row++) begin
        for (col = 0; col < 4; col++) begin
            if (matrixGame[row][col] == 0) begin
                // Si encuentra un índice con valor 0, la matriz no está llena
                return 0;
            end
        end
    end
    // Si ha llegado aquí, todos los índices tienen un valor distinto de cero
    return 1;
endfunction
//Poner un valor en la matriz
function void place_random();
  int row, col;
  // Verifica si hay celdas vacías
  for (row = 0; row < 4; row++) begin
    for (col = 0; col < 4; col++) begin
      if (matrixGame[row][col] == 0) begin
			matrixGame[row][col] = 4;
      end
    end
  end
endfunction
//Poner un valor en la matriz
function int winGame();
  int row, col;
  // Verifica si hay celdas vacías
  for (row = 0; row < 4; row++) begin
    for (col = 0; col < 4; col++) begin
      if (matrixGame[row][col] == N) begin
			return 1;
      end
    end
  end
  return 0;
endfunction
//Funcion para validar si el juego ya tiene que terminar o no
function int endGame();
  int row, col;
  // Verifica si hay celdas vacías
  for (row = 0; row < 4; row++) begin
    for (col = 0; col < 4; col++) begin
      if (matrixGame[row][col] == 0) begin
        return 1; // Todavía hay celdas vacías
      end
    end
  end

  // Verifica si hay valores adyacentes iguales
  for (row = 0; row < 4; row++) begin
    for (col = 0; col < 3; col++) begin
      if (matrixGame[row][col] == matrixGame[row][col+1]) begin
        return 1; // Todavía hay valores adyacentes iguales
      end
    end
  end

  // Verifica en las columnas
  for (col = 0; col < 4; col++) begin
    for (row = 0; row < 3; row++) begin
      if (matrixGame[row][col] == matrixGame[row+1][col]) begin
        return 1; // Todavía hay valores adyacentes iguales
      end
    end
  end
  // No se encontraron celdas vacías ni valores adyacentes iguales
  return 0; // No se puede hacer ningún movimiento
endfunction
//Test de la matriz
initial begin
	#10;
	//casoInicial();
	matrixGame = '{'{2, 0, 0, 2}, '{4, 0, 2, 0}, '{2, 2, 2, 2}, '{0, 0, 0, 2}};
	$display("Matriz original:\n%0p", matrixGame);
	moveLeft();
	$display("Matriz movida left:\n%0p", matrixGame);
	moveUp();
	$display("Matriz movida up:\n%0p", matrixGame);
	moveDown();
	$display("Matriz movida down:\n%0p", matrixGame);
	//$display("End:\n%0d", endGame());
	//matrixGame = '{'{4, 2, 4, 2}, '{16, 8, 2, 4}, '{64, 16, 32, 64}, '{2, 32, 16, 4}};
	//$display("Matriz original:\n%0p", matrixGame);
	//$display("End:\n%0d", endGame());
	//move_right();
	//$display("Matriz movida der:\n%0p", matrixGame);
	//place_random();
	//$display("Matriz:\n%0p", matrixGame);
	
	//move_up();
	//$display("Matriz movida up:\n%0p", matrixGame);
	//place_random();
	//$display("Matriz:\n%0p", matrixGame);
	
end
endmodule
