module controlador_vga (input  clock_25,
								input  reset,
								input reg [23:0] data,
								output reg [15:0] address,
								output logic we,
								output [7:0] red,
								output [7:0] green,
								output [7:0] blue,
								output hsync,
								output vsync,
								output n_blank);
	
	// Variables requeridas
	logic [0:9] pixel_num;
	logic [0:9] linea_num;
	logic cambio_linea;
	
	
	//Instancias de módulos
	contador_horizontal contador_horizontal (.reloj(clock_25), 
														  .reset(0), 
														  .numero_pixel(pixel_num), 
														  .cambio_linea(cambio_linea));
														
										
	contador_vertical contador_vertical (.reloj(cambio_linea),
													 .reset(0),
													 .numero_linea(linea_num));
								
			
	sincronizador sincronizador(.pixel_num(pixel_num),
										 .linea_num(linea_num),
										 .hsync(hsync), 
										 .vsync(vsync), 
										 .n_blank(n_blank));
										
										
	mostrarImagen generarImagen(.x(pixel_num), 
										 .y(linea_num),
										 .reset(reset),
										 .data(data),
										 .red(red), 
										 .green(green), 
										 .blue(blue));
													
													
  	contador_direccion #(16) contador(.clk(clock_25), 
												 .reset(reset),
												 .x(pixel_num), 
												 .y(linea_num),
												 .we(we),
												 .out(address));

	
endmodule 