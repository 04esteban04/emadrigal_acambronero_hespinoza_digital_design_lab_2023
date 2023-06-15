
module main_tb;
	
	// Inputs
	logic clock_50;
	logic reset;
	logic start;

	// Outputs
	logic [7:0] red_out;
	logic [7:0] green_out;
	logic [7:0] blue_out;
	logic hsync;
	logic vsync;
	logic n_blank;
	logic vgaclock;

	// Instancia
	main dut (.clock_50(clock_50),
				 .reset(reset),
				 .start(start),
				 .red_out(red_out),
				 .green_out(green_out),
				 .blue_out(blue_out),
				 .hsync(hsync),
				 .vsync(vsync),
				 .n_blank(n_blank),
				 .vgaclock(vgaclock));

	// Inicialización
	initial begin
		clock_50 = 0;
		reset = 1;
		start = 0;

		#10 
		reset = 0; #10
		reset = 1; #10
		reset = 0;
		

	end
	
	// Generación del reloj
	always #5 clock_50 = ~clock_50;

endmodule
