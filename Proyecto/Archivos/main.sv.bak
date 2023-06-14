module main(input clock_50,
				input reset,
				input start,
				output [7:0] red_out,
				output [7:0] green_out,
				output [7:0] blue_out,
				output hsync,
				output vsync,
				output n_blank,
				output vgaclock);
				
	
	
	// Variables requeridas
	
	// Reloj
	logic clock_25;
	
	// ROM
	localparam int ADDR_WIDTH = 16;
	localparam int DATA_WIDTH = 24;
	reg [ADDR_WIDTH-1:0] address;
	logic [DATA_WIDTH-1:0] data_out;
	
	// RAM
	logic we;
	logic [31:0] rd;
	
	// Procesador
	logic [31:0] WriteData;
	logic [31:0] DataAdr;
	logic MemWrite;
	

	
		
	//Instancias de módulos
	clock25mh clock(clock_50, clock_25);
	
			
	controlador_vga controlador (.clock_25(clock_25),
										  .reset(reset),
										  .data(rd),
										  .address(address),
										  .we(we),
										  .red(red_out),
										  .green(green_out),
										  .blue(blue_out),
										  .hsync(hsync), 
										  .vsync(vsync), 
										  .n_blank(n_blank));
											

	rom #(.ADDR_WIDTH(ADDR_WIDTH), 
			.DATA_WIDTH(DATA_WIDTH)) rom_image (.clk(clock_50),
															.address(address),
															.data_out(data_out));
  
  
  	ram ram_image (.clk(clock_50),
						.we(we),
						.address(address),
						.wd(data_out),
						.rd(rd));
						
	
	Procesador procesador (.clk(clock_50),
							.reset(reset), 
							.start(start),
							.WriteData(WriteData), 
							.DataAdr(DataAdr),
							.MemWrite(MemWrite));
						
				
	assign vgaclock = clock_25;
	
		
endmodule 