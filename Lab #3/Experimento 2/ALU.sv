
///////////////////////////////////////////////////////////
//////////////////////  -- ALU-TOP --  ////////////////////
///////////////////////////////////////////////////////////

module ALU #(parameter N=4) ( input logic [N-1:0] a,
										input logic [N-1:0] b, 
										input [3:0] operation, 
										output reg outFlagC,
										output reg outFlagN,
										output reg outFlagV,
										output reg outFlagZ,
										output reg [6:0] segA);
 
	// INSTANCIA ALU
	alu #(.N(N)) alu1(.a(a),
							.b(b),
							.operation(operation),
							.outFlagC(outFlagC),
							.outFlagN(outFlagN),
							.outFlagV(outFlagV),
							.outFlagZ(outFlagZ),
							.segA(segA));
 
endmodule
 