
module ram_tb;

	reg clk;
	reg we;
	reg [31:0] address;
	reg [31:0] wd;
	wire [31:0] rd;

	// Instancia del módulo bajo prueba
	ram dut (.clk(clk),
				.we(we),
				.address(address),
				.wd(wd),
				.rd(rd));

	// Generación de señales de prueba
	initial begin
		clk = 0;
		we = 0;
		address = 0;
		wd = 0;
		
		#5; // Esperar un tiempo antes de empezar las pruebas
		 
		// Escribir datos en la memoria
		we = 1;
		address = 0;
		wd = 32'h12345678;
		#10;
		we = 0;

		// Leer datos de la memoria
		address = 0;
		#5;
		$display("Data at address %0d: %h", address, rd);
		 
		// Otro ejemplo de escritura y lectura
		we = 1;
		address = 1;
		wd = 32'habcdef01;
		#10;
		we = 0;

		address = 1;
		#5;
		$display("Data at address %0d: %h", address, rd);
		 
		 #10;
		 
	end

	// Generación del reloj
	always #5 clk = ~clk;

endmodule
