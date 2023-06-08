module main_tb();

	logic clock_50 = 0;
	logic reset = 0;
	logic botonInicio = 0;
	logic botonIzq = 1;
	logic botonDer = 1;
	logic botonArriba = 1;
	logic botonAbajo = 1;
	logic [7:0] red;
	logic [7:0] green;
	logic [7:0] blue;
	logic hsync;
	logic vsync;
	logic n_blank;
	logic vgaclock;
	logic [3:0] setMax;
	reg [6:0] segA; 
	reg [6:0] segB;

	
	
	main mainTest( .clock_50(clock_50),
						.reset(reset),
						.botonInicio(botonInicio),
						.botonIzq(botonIzq),
						.botonDer(botonDer),
						.botonArriba(botonArriba),
						.botonAbajo(botonAbajo),
						.setMax(setMax),
						.red_out(red),
						.green_out(green),
						.blue_out(blue),
						.hsync(hsync), 
						.vsync(vsync), 
						.n_blank(n_blank),
						.vgaclock(vgaclock),
						.segA(segA),
						.segB(segB));
	
	
	always begin 
		
		#5 clock_50 = ~clock_50;
	
	end

	
	initial begin
		#25 reset = 1;
		#25 reset = 0;
		#25 reset = 1;
		
		#25 botonInicio = 1; #25;
		#25 reset = 0;
		#25 botonInicio = 0;
		
		#25 setMax = 16; 

		#25 botonArriba = 0;
		#25 botonArriba = 1;

		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;

		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;

		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;

		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		#25 botonArriba = 0;
		#25 botonArriba = 1;
		
		

		#25 reset = 1; 
		#25 botonInicio = 1;
		#25 reset = 0;
		#25 botonInicio = 0;
		
	end

			

endmodule