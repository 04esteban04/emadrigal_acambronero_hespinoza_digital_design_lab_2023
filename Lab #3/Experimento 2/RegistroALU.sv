module RegistroALU #(parameter N=16)
(
	clk, rst, a_in, b_in, operation_in,
	outFlagC_out, outFlagN_out, outFlagV_out, outFlagZ_out, segA_out
);
	//Simulación
	input logic clk;
	input logic rst;
	
	//Registros de entrada
	input logic [N-1:0] a_in;
	input logic [N-1:0] b_in;
	input logic [3:0] operation_in;
	
	//Registros de entrada intermedios
	logic [N-1:0] a_m;
	logic [N-1:0] b_m;
	logic [3:0] operation_m;	
	
	//Registros de salida
	output reg outFlagC_out;
	output reg outFlagN_out;
	output reg outFlagV_out;
	output reg outFlagZ_out;
	output reg [6:0] segA_out;
	
	//Registros de salida intermedios
	reg outFlagC_m;
	reg outFlagN_m;
	reg outFlagV_m;
	reg outFlagZ_m;
	reg [6:0] segA_m;
	
	//Registro In
	RegistroCargaIn #(.N(N)) registroIn(clk, rst, a_in, b_in, operation_in, a_m, b_m, operation_m);
	//ALU
	alu #(.N(N)) alu_m(.a(a_m),
							.b(b_m),
							.operation(operation_m),
							.outFlagC(outFlagC_m),
							.outFlagN(outFlagN_m),
							.outFlagV(outFlagV_m),
							.outFlagZ(outFlagZ_m),
							.segA(segA_m));
	//Registro out
	RegistroCargaOut #(.N(N)) registroOut(clk, rst, outFlagC_m, outFlagN_m, outFlagV_m, outFlagZ_m, 
														outFlagC_out, outFlagN_out, outFlagV_out, outFlagZ_out,
														segA_out, segA_m);
endmodule