module main(input clock_50,
				input reset,
				input botonInicio,
				input botonIzq,
				input botonDer,
				input botonArriba,
				input botonAbajo,
				input logic [3:0] setMax,
				output [7:0] red_out,
				output [7:0] green_out,
				output [7:0] blue_out,
				output hsync,
				output vsync,
				output n_blank,
				output vgaclock,
				output reg [6:0] segA, 
				output reg [6:0] segB);
				
	
	logic clock_25;
	
	logic winflag;
	logic loseflag;
	reg [5:0] puntos = 0;
		
	reg [11:0] matrixGame [0:3][0:3]; 
	
//	reg [5:0] puntos;
//	reg [6:0] segA; 
//	reg [6:0] segB;

//	reg [0:11] maxScore;
	
	//generate 
		
	
	clock25mh clock(clock_50, clock_25);

	
//	maxscore set_max(.set_maxscore(setmax),
//							.maxScore(maxScore));
	
	
	FSM_Control FSMGame( .clk(clock_50),
								.rst(reset),
								.start(botonInicio),
								.izq(botonIzq),
								.der(botonDer),
								.arriba(botonArriba),
								.abajo(botonAbajo),
								.setMaxScore(setMax),
								.matrixGame(matrixGame),
								.winflag(winflag),
								.loseflag(loseflag),
								.puntos(puntos));
								
								
	SieteSeg codec(.count(puntos),
						.segA(segA),
						.segB(segB)); 
	
			
	controlador_vga controlador ( .clock_25(clock_25),
											.reset(0),
											.matrixGame(matrixGame),
											.loseflag(loseflag),
											.winflag(winflag),
											.red(red_out),
											.green(green_out),
											.blue(blue_out),
											.hsync(hsync), 
											.vsync(vsync), 
											.n_blank(n_blank));
											
					
	assign vgaclock = clock_25;
		
	//endgenerate
	
		
endmodule 