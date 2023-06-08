module controlador_vga(	input  clock_25,
								input  reset,
								input reg [11:0] matrixGame [0:3][0:3],
								input logic loseflag,
								input logic winflag,
								output [7:0] red,
								output [7:0] green,
								output [7:0] blue,
								output hsync,
								output vsync,
								output n_blank);
							  
	logic [0:9] pixel_num;
	logic [0:9] linea_num;
	logic cambio_linea;

   //generate
	
	
	contador_horizontal contador_horizontal (	.reloj(clock_25), 
															.reset(reset), 
															.numero_pixel(pixel_num), 
															.cambio_linea(cambio_linea));
														
										
	contador_vertical contador_vertical (	.reloj(cambio_linea),
														.reset(reset),
														.numero_linea(linea_num));
								
			
	sincronizador sincronizador(.pixel_num(pixel_num),
										.linea_num(linea_num),
										.hsync(hsync), 
										.vsync(vsync), 
										.n_blank(n_blank));
										
										
	generadorMatriz generadorCuadricula(.x(pixel_num), 
													.y(linea_num), 
													.matrixGame(matrixGame),
													.loseflag(loseflag),	
													.winflag(winflag),
													.red(red), 
													.green(green), 
													.blue(blue));

	//endgenerate
	
endmodule 