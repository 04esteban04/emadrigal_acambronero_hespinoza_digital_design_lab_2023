
module rom #(  parameter int ADDR_WIDTH = 16, 
					parameter int DATA_WIDTH = 24) (	input wire clk,
																input wire [ADDR_WIDTH-1:0] address,
																output logic [DATA_WIDTH-1:0] data_out);
																
	
	// Variables requeridas
  	reg [DATA_WIDTH-1:0] memory [(2**ADDR_WIDTH)-1:0];

	// Función para cargar los datos de la memoria
	function void load_memory;
		$readmemh("C:/Users/Esteban/Desktop/Proyecto temp - pruebas/Archivos/Obtener imagen/datos_imagen_hex.txt", memory);
		
	endfunction
	
	initial begin
		load_memory();
	end

	
	always @(posedge clk) begin
		data_out <= memory[address];
	end
	
endmodule