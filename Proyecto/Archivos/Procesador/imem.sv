module imem(input logic [31:0] a,
				output logic [31:0] rd);
				
	logic [31:0] RAM[15:0];
	
	initial
		//$readmemh("memfile.dat",RAM);
		$readmemh("C:/Users/Esteban/Desktop/Proyecto temp - pruebas/Archivos/Procesador/memfile.dat",RAM); 
		
	assign rd = RAM[a[31:2]]; // word aligned
endmodule