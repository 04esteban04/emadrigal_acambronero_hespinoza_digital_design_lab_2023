module controlador_vga (input clock_25,
								input reset,
								input start,
								input reg [31:0] data_ram,
								input reg [31:0] data_dmem,
								output reg [31:0] address,
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
	logic reset_temp = 0;
	
	
	//Instancias de módulos
	contador_horizontal contador_horizontal (.reloj(clock_25), 
														  .reset(reset_temp), 
														  .numero_pixel(pixel_num), 
														  .cambio_linea(cambio_linea));
														
										
	contador_vertical contador_vertical (.reloj(cambio_linea),
													 .reset(reset_temp),
													 .numero_linea(linea_num));
								
			
	sincronizador sincronizador(.pixel_num(pixel_num),
										 .linea_num(linea_num),
										 .hsync(hsync), 
										 .vsync(vsync), 
										 .n_blank(n_blank));
										
										
	mostrarImagen generarImagen(.x(pixel_num), 
										 .y(linea_num),
										 .reset(reset),
										 .start(start),
										 .data_ram(data_ram),
										 .data_dmem(data_dmem),
										 .red(red), 
										 .green(green), 
										 .blue(blue));
													
													
  	contador_direccion #(32) contador(.clk(clock_25), 
												 .reset(reset),
												 .x(pixel_num), 
												 .y(linea_num),
												 .we(we),
												 .out(address));

	
endmodule 