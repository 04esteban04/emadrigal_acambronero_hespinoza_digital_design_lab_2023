
///////////////////////////////////////////////////////////
//////////////////////  -- ALU AUX --  ////////////////////
///////////////////////////////////////////////////////////

module alu #(parameter N=4) ( input logic [N-1:0] a,
										input logic [N-1:0] b, 
										input [3:0] operation, 
										//output reg [N-1:0] result,
										output reg outFlagC,
										output reg outFlagN,
										output reg outFlagV,
										output reg outFlagZ,
										output reg [6:0] segA);
	

	wire [N-1:0] r1;  // RESULTADO SUMA DE A+B 
	wire [N-1:0] r2;  // RESULTADO RESTA DE A+B
	wire [N-1:0] r3;  // RESULTADO AND
	wire [N-1:0] r4;  // RESULTADO OR
	wire [N-1:0] r5;  // RESULTADO NOT A
	wire [N-1:0] r6;  // RESULTADO NOT B
	wire [N-1:0] r7;  // RESULTADO XOR
	wire [N-1:0] r8;  // RESULTADO AShifLeft
	wire [N-1:0] r9;  // RESULTADO AShifRight
	wire [N-1:0] r10; // RESULTADO LShifLeft
	wire [N-1:0] r11; // RESULTADO LShifRight
	
	
	wire [1:0] flagC; 	// FLAG DE ACARREO
	wire flagN; 			// FLAG DE NEGATIVO
	wire [1:0] flagV; 	// FLAG DE OVERFLOW
	wire [10:0] flagZ; 	// FLAG DE CERO
	
	reg [N-1:0] result; // RESULTADO FINAL
	
	
	// INSTANCIA OPERACIÓN SUMA DE A+B
	SUMA_op #(.N(N)) g1 (.a(a), 
								.b(b), 
								.result(r1),
								.flagC(flagC[0]),
								.flagV(flagV[0]),
								.flagZ(flagZ[0]));
	
	
	// INSTANCIA OPERACIÓN RESTA DE A+B
	RESTA_op #(.N(N)) g2(.a(a), 
								.b(b),
								.result(r2),
								.flagC(flagC[1]),
								.flagN(flagN),
								.flagV(flagV[1]),
								.flagZ(flagZ[1]));
	
	
	// INSTANCIA OPERACIÓN AND
	AND_op #(.N(N)) g3 ( .a(a),
								.b(b),
								.result(r3),
								.flagZ(flagZ[2]));

								
	// INSTANCIA OPERACIÓN OR
	OR_op #(.N(N)) g4(.a(a),
							.b(b),
							.result(r4),
							.flagZ(flagZ[3]));

							
	// INSTANCIA OPERACIÓN NOT A
	NOT_op #(.N(N)) g5 ( .in(a),
								.result(r5),
								.flagZ(flagZ[4]));
	
	
	// INSTANCIA OPERACIÓN NOT B
	NOT_op #(.N(N)) g6 ( .in(b),
								.result(r6),
								.flagZ(flagZ[5]));
								
	
	// INSTANCIA OPERACIÓN XOR
	XOR_op #(.N(N)) g7 ( .a(a),
								.b(b),
								.result(r7),
								.flagZ(flagZ[6]));
								
	
	// INSTANCIA OPERACIÓN AShiftLeft
	AShiftLeft #(.N(N)) g8 (.a(a),
									.b(b),
									.result(r8),
									.flagZ(flagZ[7]));
	
	
	// INSTANCIA OPERACIÓN AShiftRight
	AShiftRight #(.N(N)) g9 (.a(a),
									.b(b),
									.result(r9),
									.flagZ(flagZ[8]));
	
	
	// INSTANCIA OPERACIÓN LShiftLeft
	LShiftLeft #(.N(N)) g10(.a(a),
									.b(b),
									.result(r10),
									.flagZ(flagZ[9]));
	
	
	// INSTANCIA OPERACIÓN LShiftRight
	LShiftRight #(.N(N)) g11 ( .a(a),
										.b(b),
										.result(r11),
										.flagZ(flagZ[10]));
	
	
	// INSTANCIA MUX
	mux4 #(.N(N)) g12 (.in1(r1), 
							.in2(r2), 
							.in3(r3), 
							.in4(r4),
							.in5(r5),
							.in6(r6),
							.in7(r7),
							.in8(r8),
							.in9(r9),
							.in10(r10),
							.in11(r11),
							.operation(operation),
							.out(result));
							
	
	// INSTANCIA FLAGS
	flags #(.N(N)) g13 ( .inFlagC(flagC),
								.inFlagN(flagN),
								.inFlagV(flagV),
								.inFlagZ(flagZ),
								.operation(operation),
								.outFlagC(outFlagC),
								.outFlagN(outFlagN),
								.outFlagV(outFlagV),
								.outFlagZ(outFlagZ));
	
	
	// INSTANCIA DISPLAY 7 SEGMENTOS
	sieteSeg #(.N(N)) g14 ( .result(result),
									.segA(segA));
									
 
endmodule