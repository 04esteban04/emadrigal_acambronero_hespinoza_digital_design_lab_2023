module generadorMatriz #(parameter ancho=4'd5) (input [0:9] x, 
																input [0:9] y,
																input reg [11:0] matrixGame [0:3][0:3],
																input logic loseflag,
																input logic winflag,
																output logic [7:0] red,
																output logic [7:0] green,
																output logic [7:0] blue);

						
	logic color_blanco; // Blanco
	logic color_morado; // Morado
	logic color_rojo;   // Rojo

	logic [0:9] stepx;
	logic [0:9] stepy;

	logic [0:9] x0;
	logic [0:9] y0;
	
	logic [0:4] i;
	logic [0:4] j;
	

	always_comb begin
		color_blanco = 0;
		color_morado = 0;
		color_rojo = 0;
		i = 0;
		j = 0;
		
		stepx = (10'd640 - ancho)/4'd4; 	// stepx = 158,75
		stepy = (10'd480 - ancho)/4'd4; 	// stepy = 118,75
		x0 = stepx/4'd2+ancho/4'd2; 			// x0 = 79,375 + 2,5 = 81,875
		y0 = stepy/4'd2+ancho/4'd2; 			// y0 = 59,375 + 2,5 = 61,875
		
		
		if ( (loseflag == 1) && (x > 0 && x < 645) && (y > 0 && y < 485) ) begin
			casolose();
		end
		
		else if ( (winflag == 1) && (x > 0 && x < 645) && (y > 0 && y < 485) ) begin
			casowin();
		end
		
		else begin
			for(i = 0; i < 4; i++) begin
				x0 = stepx/4'd2+ancho/4'd2;
				for(j = 0; j < 4; j++) begin
					
					// Se dibuja el tablero
					if(   (x + stepx/2 + ancho/2 > x0  && x < x0 + stepx/2 + ancho/2 && y + stepy/2 + ancho/2 > y0 && y + stepy/2 < y0 + ancho/2)
						|| (x + stepx/2 + ancho/2 > x0  && x < x0 + stepx/2 + ancho/2 && y + ancho/2 > y0 + stepy/2 && y < y0 + stepy/2 + ancho/2)
						|| (y + stepy/2 + ancho/2 > y0  && y < y0 + stepy/2 + ancho/2 && x + stepx/2 + ancho/2 > x0 && x + stepx/2   < x0 + ancho/2)
						|| (y + stepy/2 + ancho/2 > y0  && y < y0 + stepy/2 + ancho/2 && x > x0 - ancho/2 + stepx/2 && x < x0 + stepx/2 + ancho/2)) begin
							
						color_blanco = 1;
					end
					
					// Se dibuja el fondo
					else if ( matrixGame[i][j] == 12'd0) begin
						red = 8'b00000000;
						green = 8'b11111111;
						blue = 8'b00000000;
						// caso2048();
					end
					
					// Se dibuja un 2
					else if ( matrixGame[i][j] == 12'd2) begin
						caso2();
					end
					
					// Se dibuja un 4
					else if ( matrixGame[i][j] == 12'd4) begin
						caso4();
					end
					
					// Se dibuja un 8
					else if ( matrixGame[i][j] == 12'd8) begin
						caso8();
					end
					
					// Se dibuja un 16
					else if ( matrixGame[i][j] == 12'd16) begin
						caso16();
					end
					
					// Se dibuja un 32
					else if ( matrixGame[i][j] == 12'd32) begin
						caso32();
					end
					
					// Se dibuja un 64
					else if ( matrixGame[i][j] == 12'd64) begin
						caso64();
					end
					
					// Se dibuja un 128
					else if ( matrixGame[i][j] == 12'd128) begin
						caso128();
					end
					
					// Se dibuja un 256
					else if ( matrixGame[i][j] == 12'd256) begin
						caso256();
					end
					
					// Se dibuja un 512
					else if ( matrixGame[i][j] == 12'd512) begin
						caso512();
					end
					
					// Se dibuja un 1024
					else if ( matrixGame[i][j] == 12'd1024) begin
						caso1024();
					end
					
					// Se dibuja un 2048
					else if ( matrixGame[i][j] == 12'd2048) begin
						caso2048();
					end
					
					else begin 
						casoNoNum();
					end
					
					
					x0 = x0 + stepx;
				end
				y0 = y0 + stepy;
			end
			
			
			
			// Se escoge el color a pintar
			if(color_rojo) begin
				red =   8'b11111111;
				green = 8'b00000000;
				blue =  8'b00000000;
			end
			else if(color_blanco) begin
				red = 8'b11111111;
				green = 8'b11111111;
				blue = 8'b11111111;
			end
			else if(color_morado) begin
				red =   8'b11111111;
				green = 8'b00000000;
				blue =  8'b11111111;
			end
			else begin
				red = 8'b00000000;
				green = 8'b00000000;
				blue = 8'b11111111;
			end
		end
		
	end
	
	
	function void casoNoNum();
		if (  ((x > 0 + stepx*j)  && (x < 160 + stepx*j) && (y > 0 + stepy*i) && (y < 120 + stepy*i)) ) begin
				color_rojo = 1;
		end 

	endfunction
	
	
	function void casolose();
		
		// Se dibuja una P
		if (  ((x == 200 || x == 230)  && (y > 210)  && (y < 240)) 
			|| ((x == 200)  && (y > 240)  && (y < 270))
			|| ((x > 200 && x < 230)    && (y == 210 || y == 240)) ) begin
					
				red =   8'b11111111;
				green = 8'b11111111;
				blue =  8'b11111111;
		end 
		
		// Se dibuja una E
		else if (   ((x == 250)  && (y > 210)  && (y < 270)) 
					|| ((x > 250 && x < 280) && (y == 210 || y == 240 || y == 270 )) ) begin
							
				red =   8'b11111111;
				green = 8'b11111111;
				blue =  8'b11111111;
		end 
		
		// Se dibuja un R
		else if (   ((x == 300 || x == 330) && (y > 210)  && (y < 240)) 
					|| ((x == 300 || x == 325) && (y > 240)  && (y < 270))
					|| ((x > 300 && x < 330)   && (y == 210 || y == 240)) ) begin
					
				red =   8'b11111111;
				green = 8'b11111111;
				blue =  8'b11111111;
		end 

		// Se dibuja una D
		else if (   ((x == 350)  && (y > 210) && (y < 270)) 
					|| ((x == 380)  && (y > 219) && (y < 261))
					|| ((x > 350 && x < 370)     && (y == 210 || y == 270 ))
					
					|| ((x > 370 && x < 372) && (y == 212 || y == 268 ))
					|| ((x > 371 && x < 374) && (y == 214 || y == 266 ))
					|| ((x > 373 && x < 376) && (y == 216 || y == 264 ))
					|| ((x > 375 && x < 378) && (y == 218 || y == 262 ))
					|| ((x > 377 && x < 380) && (y == 220 || y == 260 )) ) begin
					
				red =   8'b11111111;
				green = 8'b11111111;
				blue =  8'b11111111;
		end 
		
		// Se dibuja una I
		else if (   ((x == 415)  && (y > 210) && (y < 270)) 
					|| ((x > 400 && x < 430)     && (y == 210 || y == 270)) ) begin
					
				red =   8'b11111111;
				green = 8'b11111111;
				blue =  8'b11111111;
		end 
		
		// Se dibuja una O
		else if (   ((x == 450 || x == 480)  && (y > 210)  && (y < 270)) 
					|| ((x > 450 && x < 480)    && (y == 210 || y == 270 )) ) begin
							
				red =   8'b11111111;
				green = 8'b11111111;
				blue =  8'b11111111;
		end 
		
		
		else begin
			red =   8'b11111111;
			green = 8'b00000000;
			blue =  8'b00000000;
		end
		
		
	endfunction
	
	
	function void casowin();
	

	
	
		
		// Se dibuja una G
		if (  ((x == 200)  && (y > 210)  && (y < 270))
			|| ((x == 230)  && (y > 240)  && (y < 270)) 
			|| ((x > 200 && x < 230)    && (y == 210 || y == 240 || y == 270)) ) begin
					
				red =   8'b00000000;
				green = 8'b00000000;
				blue =  8'b00000000;
		end 
		
		// Se dibuja una A
		else if (   ((x == 250 || x == 280)  && (y > 210)  && (y < 270)) 
					|| ((x > 250 && x < 280) && (y == 210 || y == 240 )) ) begin
							
				red =   8'b00000000;
				green = 8'b00000000;
				blue =  8'b00000000;
		end 
		

		// Se dibuja una N
		else if (   ((x == 300 || x == 330)  && (y > 210) && (y < 270)) 
					
					|| ((x > 300 && x < 302) && (y == 212))
					|| ((x > 301 && x < 304) && (y == 214))
					|| ((x > 303 && x < 306) && (y == 216))
					|| ((x > 305 && x < 308) && (y == 218))
					|| ((x > 307 && x < 310) && (y == 220))
					|| ((x > 309 && x < 312) && (y == 222))
					|| ((x > 311 && x < 314) && (y == 224))
					|| ((x > 313 && x < 316) && (y == 226))
					|| ((x > 315 && x < 318) && (y == 228))
					|| ((x > 317 && x < 320) && (y == 230))
					|| ((x > 319 && x < 322) && (y == 232))
					|| ((x > 321 && x < 324) && (y == 234)) 
					|| ((x > 323 && x < 326) && (y == 236))
					|| ((x > 325 && x < 328) && (y == 238))
					|| ((x > 327 && x < 330) && (y == 240))) begin
					
				red =   8'b00000000;
				green = 8'b00000000;
				blue =  8'b00000000;
		end 

		
		// Se dibuja una O
		else if (   ((x == 350 || x == 380)  && (y > 210)  && (y < 270)) 
					|| ((x > 350 && x < 380)    && (y == 210 || y == 270 )) ) begin
							
				red =   8'b00000000;
				green = 8'b00000000;
				blue =  8'b00000000;
		end 
		
		
		else begin
			red =   8'b00000000;
			green = 8'b11111111;
			blue =  8'b00000000;
		end
		
		
	endfunction
	
	
	
	function void caso2();
		// Se dibuja un 2	
		if (  ((x > 50 + stepx*j)   && (x < 100 + stepx*j) && (y == 30 + stepy*i))
			|| ((x == 100 + stepx*j) && (y > 30 + stepy*i)  && (y < 60 + stepy*i))
			|| ((x > 50 + stepx*j)   && (x < 100 + stepx*j) && (y == 60 + stepy*i))
			|| ((x == 50 + stepx*j)  && (y > 60 + stepy*i)  && (y < 90 + stepy*i))
			|| ((x > 50 + stepx*j)   && (x < 100 + stepx*j) && (y == 90 + stepy*i)) ) begin
					
				color_rojo = 1;
		end 

	endfunction
	
	
	function void caso4();
		// Se dibuja un 4	
		if (  ((x == 50 + stepx*j)  && (y > 30 + stepy*i)  && (y < 60 + stepy*i))  
			|| ((x == 100 + stepx*j) && (y > 30 + stepy*i)  && (y < 60 + stepy*i)) 
			|| ((x > 50 + stepx*j)   && (x < 100 + stepx*j) && (y == 60 + stepy*i))
			|| ((x == 100 + stepx*j) && (y > 60 + stepy*i)  && (y < 90 + stepy*i)) ) begin
					
				color_rojo = 1;
		end 

	endfunction
	
	
	function void caso8();
		// Se dibuja un 8
		if (  ((x == 50 + stepx*j || x == 100 + stepx*j)  && (y > 30 + stepy*i)  && (y < 60 + stepy*i)) 
			|| ((x == 50 + stepx*j || x == 100 + stepx*j)  && (y > 60 + stepy*i)  && (y < 90 + stepy*i))
			|| ((x > 50 + stepx*j && x < 100 + stepx*j)    && (y == 30 + stepy*i || y == 60 + stepy*i || y == 90 + stepy*i)) ) begin
					
				color_rojo = 1;
		end 

	endfunction
	
	
	function void caso16();
		// Se dibuja un 16
		if (  ((x == 30 + stepx*j)  && (y > 30 + stepy*i)  && (y < 90 + stepy*i))
			|| ((x == 50 + stepx*j)  && (y > 30 + stepy*i)  && (y < 60 + stepy*i))  
			|| ((x == 50 + stepx*j || x == 100 + stepx*j)  && (y > 60 + stepy*i)  && (y < 90 + stepy*i))
			|| ((x > 50 + stepx*j) && (x < 100 + stepx*j) && (y == 30 + stepy*i || y == 60 + stepy*i || y == 90 + stepy*i)) ) begin
					
				color_rojo = 1;
		end 

	endfunction
	
	
	function void caso32();
		// Se dibuja un 32
		if (  (x == 60 + stepx*j)  && (y > 30 + stepy*i)  && (y < 60 + stepy*i)  
			|| (x == 60 + stepx*j)  && (y > 60 + stepy*i)  && (y < 90 + stepy*i)
			|| (x > 30 + stepx*j) && (x < 60 + stepx*j) && (y == 30 + stepy*i || y == 60 + stepy*i || y == 90 + stepy*i)
			|| (x > 100 + stepx*j)   && (x < 140 + stepx*j) && (y == 30 + stepy*i)
			|| (x == 140 + stepx*j) && (y > 30 + stepy*i)  && (y < 60 + stepy*i)
			|| (x > 100 + stepx*j)   && (x < 140 + stepx*j) && (y == 60 + stepy*i)
			|| (x == 100 + stepx*j)  && (y > 60 + stepy*i)  && (y < 90 + stepy*i)
			|| (x > 100 + stepx*j)   && (x < 140 + stepx*j) && (y == 90 + stepy*i)) begin
					
				color_rojo = 1;
		end 

	endfunction
	
	
	function void caso64();
		// Se dibuja un 64
		if (  (x == 30 + stepx*j)  && (y > 30 + stepy*i)  && (y < 60 + stepy*i)  
			|| (x == 30 + stepx*j || x == 60 + stepx*j)  && (y > 60 + stepy*i)  && (y < 90 + stepy*i)
			|| (x > 30 + stepx*j) && (x < 60 + stepx*j) && (y == 30 + stepy*i || y == 60 + stepy*i || y == 90 + stepy*i)
			
			|| (x == 100 + stepx*j)  && (y > 30 + stepy*i)  && (y < 60 + stepy*i)  
			|| (x == 140 + stepx*j)  && (y > 30 + stepy*i)  && (y < 60 + stepy*i) 
			|| (x > 100 + stepx*j)   && (x < 140 + stepx*j) && (y == 60 + stepy*i)
			|| (x == 140 + stepx*j)  && (y > 60 + stepy*i)  && (y < 90 + stepy*i) ) begin
					
				color_rojo = 1;
		end 

	endfunction	
	
	
	function void caso128();
		// Se dibuja un 128
		if (  (x == 20 + stepx*j)  && (y > 30 + stepy*i)  && (y < 90 + stepy*i)) begin
				color_rojo = 1;
		end 

		else if (   (x > 50 + stepx*j)   && (x < 80 + stepx*j) && (y == 30 + stepy*i)
					|| (x == 80 + stepx*j)  && (y > 30 + stepy*i) && (y < 60 + stepy*i)
					|| (x > 50 + stepx*j)   && (x < 80 + stepx*j) && (y == 60 + stepy*i)
					|| (x == 50 + stepx*j)  && (y > 60 + stepy*i) && (y < 90 + stepy*i)
					|| (x > 50 + stepx*j)   && (x < 80 + stepx*j) && (y == 90 + stepy*i)) begin
					
				color_rojo = 1;
		end 
		
		else if (   (x == 100 + stepx*j || x == 120 + stepx*j)  && (y > 30 + stepy*i)  && (y < 60 + stepy*i)  
					|| (x == 100 + stepx*j || x == 120 + stepx*j)  && (y > 60 + stepy*i)  && (y < 90 + stepy*i)
					|| (x > 100 + stepx*j) && (x < 120 + stepx*j)  && (y == 30 + stepy*i || y == 60 + stepy*i || y == 90 + stepy*i)) begin
					
				color_rojo = 1;
		end 
	
	endfunction
	
	
	function void caso256();
		// Crear un 256		
		if (  ((x > 10 + stepx*j)   && (x < 30 + stepx*j) && (y == 30 + stepy*i))
			|| ((x == 30 + stepx*j)  && (y > 30 + stepy*i) && (y < 60 + stepy*i))
			|| ((x > 10 + stepx*j)   && (x < 30 + stepx*j) && (y == 60 + stepy*i))
			|| ((x == 10 + stepx*j)  && (y > 60 + stepy*i) && (y < 90 + stepy*i))
			|| ((x > 10 + stepx*j)   && (x < 30 + stepx*j) && (y == 90 + stepy*i)) ) begin
					
				color_rojo = 1;
		end 

	
		else if (  ((x > 50 + stepx*j)   && (x < 80 + stepx*j) && (y == 30 + stepy*i))
					|| ((x == 50 + stepx*j)  && (y > 30 + stepy*i) && (y < 60 + stepy*i))
					|| ((x > 50 + stepx*j)   && (x < 80 + stepx*j) && (y == 60 + stepy*i))
					|| ((x == 80 + stepx*j)  && (y > 60 + stepy*i) && (y < 90 + stepy*i))
					|| ((x > 50 + stepx*j)   && (x < 80 + stepx*j) && (y == 90 + stepy*i)) ) begin
					
				color_rojo = 1;
		end 
		
	
		else if (  ((x == 100 + stepx*j)  && (y > 30 + stepy*i) && (y < 60 + stepy*i))  
					|| ((x == 100 + stepx*j || x == 120 + stepx*j)  && (y > 60 + stepy*i)  && (y < 90 + stepy*i))
					|| ((x > 100 + stepx*j) && (x < 120 + stepx*j)  && (y == 30 + stepy*i || y == 60 + stepy*i || y == 90 + stepy*i)) ) begin
					
				color_rojo = 1;
		end 
	
	endfunction
	
	
	function void caso512();
		// Crear un 512	
		if (  ((x > 20 + stepx*j)   && (x < 40 + stepx*j) && (y == 30 + stepy*i))
			|| ((x == 20 + stepx*j)  && (y > 30 + stepy*i) && (y < 60 + stepy*i))
			|| ((x > 20 + stepx*j)   && (x < 40 + stepx*j) && (y == 60 + stepy*i))
			|| ((x == 40 + stepx*j)  && (y > 60 + stepy*i) && (y < 90 + stepy*i))
			|| ((x > 20 + stepx*j)   && (x < 40 + stepx*j) && (y == 90 + stepy*i)) ) begin
					
				color_rojo = 1;
		end 

		
		else if (  (x == 80 + stepx*j)  && (y > 30 + stepy*i)  && (y < 90 + stepy*i)) begin
				color_rojo = 1;
		end 
		
		
		else if (   ((x > 120 + stepx*j)   && (x < 140 + stepx*j) && (y == 30 + stepy*i))
					|| ((x == 140 + stepx*j)  && (y > 30 + stepy*i)  && (y < 60 + stepy*i))
					|| ((x > 120 + stepx*j)   && (x < 140 + stepx*j) && (y == 60 + stepy*i))
					|| ((x == 120 + stepx*j)  && (y > 60 + stepy*i)  && (y < 90 + stepy*i))
					|| ((x > 120 + stepx*j)   && (x < 140 + stepx*j) && (y == 90 + stepy*i)) ) begin
					
				color_rojo = 1;
		end 
		
	endfunction
	
	
	function void caso1024();
		// Crear un 1024	
		if (  (x == 10 + stepx*j)  && (y > 30 + stepy*i)  && (y < 90 + stepy*i)) begin
				color_rojo = 1;
		end 
		
		
		else if (   (x == 30 + stepx*j || x == 50 + stepx*j)  && (y > 30 + stepy*i)  && (y <= 60 + stepy*i)  
					|| (x == 30 + stepx*j || x == 50 + stepx*j)  && (y >= 60 + stepy*i) && (y < 90 + stepy*i)
					|| (x > 30 + stepx*j) && (x < 50 + stepx*j)  && (y == 30 + stepy*i || y == 90 + stepy*i)) begin
					
				color_rojo = 1;
		end 
		
		
		else if (   ((x > 70 + stepx*j)   && (x < 100 + stepx*j) && (y == 30 + stepy*i))
					|| ((x == 100 + stepx*j) && (y > 30 + stepy*i)  && (y < 60 + stepy*i))
					|| ((x > 70 + stepx*j)   && (x < 100 + stepx*j) && (y == 60 + stepy*i))
					|| ((x == 69 + stepx*j)  && (y > 60 + stepy*i)  && (y < 90 + stepy*i))
					|| ((x > 70 + stepx*j)   && (x < 100 + stepx*j) && (y == 90 + stepy*i)) ) begin
					
				color_rojo = 1;
		end 
		
	
		else if (   (x == 110 + stepx*j)  && (y > 30 + stepy*i)  && (y < 60 + stepy*i)  
					|| (x == 140 + stepx*j)  && (y > 30 + stepy*i)  && (y < 60 + stepy*i) 
					|| (x > 110 + stepx*j)   && (x < 140 + stepx*j) && (y == 60 + stepy*i)
					|| (x == 140 + stepx*j)  && (y > 60 + stepy*i)  && (y < 90 + stepy*i)) begin
					
				color_rojo = 1;
		end 

	endfunction

		
	function void caso2048();
		// Crear un 2048		
		if (  ((x > 10 + stepx*j)   && (x < 30 + stepx*j)  && (y == 30 + stepy*i))
			|| ((x == 30 + stepx*j)  && (y > 30 + stepy*i)  && (y < 60 + stepy*i))
			|| ((x > 10 + stepx*j)   && (x < 30 + stepx*j)  && (y == 60 + stepy*i))
			|| ((x == 10 + stepx*j)  && (y > 60 + stepy*i)  && (y < 90 + stepy*i))
			|| ((x > 10 + stepx*j)   && (x < 30 + stepx*j)  && (y == 90 + stepy*i)) ) begin
					
				color_rojo = 1;
		end 
		
		
		else if (   (x == 50 + stepx*j || x == 70 + stepx*j)  && (y > 30 + stepy*i)  && (y <= 60 + stepy*i)  
					|| (x == 50 + stepx*j || x == 70 + stepx*j)  && (y >= 60 + stepy*i)  && (y < 90 + stepy*i)
					|| (x > 50 + stepx*j) && (x < 70 + stepx*j)  && (y == 30 + stepy*i || y == 90 + stepy*i)) begin
					
				color_rojo = 1;
		end 
		
		
	
		else if (   (x == 90 + stepx*j)  && (y > 30 + stepy*i)  && (y < 60 + stepy*i)  
					|| (x == 120 + stepx*j) && (y > 30 + stepy*i)  && (y < 60 + stepy*i) 
					|| (x > 90 + stepx*j)   && (x < 120 + stepx*j) && (y == 60 + stepy*i)
					|| (x == 120 + stepx*j)  && (y > 60 + stepy*i) && (y < 90 + stepy*i)) begin
					
				color_rojo = 1;
		end 
		
		
		else if (   (x == 130 + stepx*j || x == 150 + stepx*j)  && (y > 30 + stepy*i)  && (y <= 60 + stepy*i)  
					|| (x == 130 + stepx*j || x == 150 + stepx*j)  && (y >= 60 + stepy*i)  && (y < 90 + stepy*i)
					|| (x > 130 + stepx*j) && (x < 150 + stepx*j)  && (y == 30 + stepy*i || y == 60 + stepy*i || y == 90 + stepy*i)) begin
					
				color_rojo = 1;
		end 
	
	endfunction
	
	

endmodule 