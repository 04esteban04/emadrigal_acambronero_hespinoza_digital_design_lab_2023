//RegistroCargaIn
module RegistroCargaIn
#(parameter N = 4)
(
	clk, rst, a_in, b_in, operation_in, a_m, b_m, operation_m
);
	//Simulación
	input logic clk;
	input logic rst;
	
	//Registros de entrada
	input logic [N-1:0] a_in;
	input logic [N-1:0] b_in;
	input logic [3:0] operation_in;
	
	//Registros de salida intermedios
	output [N-1:0] a_m;
	output [N-1:0] b_m;
	output [3:0] operation_m;
	
	always @ (posedge clk or posedge rst)
		if (rst) begin
			a_m <= 0;
			b_m <= 0;
			operation_m <= 0;
		end
		else begin
			a_m = a_in;
			b_m = b_in;
			operation_m = operation_in;
		end
endmodule