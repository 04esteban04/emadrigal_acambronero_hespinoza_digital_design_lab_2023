module RegistroCargaOut
#(parameter N = 4)
(
clk, rst, outFlagC_m, outFlagN_m, outFlagV_m, outFlagZ_m, outFlagC_out, outFlagN_out, outFlagV_out, outFlagZ_out, segA_out, segA_m
);
	//Simulación
	input logic clk;
	input logic rst;
	
	//Registros de salida
	output reg outFlagC_out;
	output reg outFlagN_out;
	output reg outFlagV_out;
	output reg outFlagZ_out;
	output reg [6:0] segA_out;
	
	//Registros de entrada intermedios
	input outFlagC_m;
	input outFlagN_m;
	input outFlagV_m;
	input outFlagZ_m;
	input [6:0] segA_m;
	
	always @ (posedge clk or posedge rst)
		if (rst) begin
			outFlagC_out <= 0;
			outFlagN_out <= 0;
			outFlagV_out <= 0;
			outFlagZ_out <= 0;
			segA_out <= 0;
		end
		else begin
			outFlagC_out = outFlagC_m;
			outFlagN_out = outFlagN_m;
			outFlagV_out = outFlagV_m;
			outFlagZ_out = outFlagZ_m;
			segA_out = segA_m;
		end
	
endmodule
