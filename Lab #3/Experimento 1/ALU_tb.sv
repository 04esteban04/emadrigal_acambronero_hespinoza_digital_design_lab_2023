//ALU Testbench

module ALU_tb;

	parameter N = 4;
	
	// INPUTS
	logic [N-1:0] a;
	logic [N-1:0] b;
	logic [3:0] operation;
	
	// OUTPUTS
	reg outFlagC;
	reg outFlagN;
	reg outFlagV;
	reg outFlagZ;
	reg [6:0] segA;

	// INSTANCIA ALU
	ALU #(.N(N)) aluTest(.a(a), 
								.b(b), 
								.operation(operation),
								.outFlagC(outFlagC),
								.outFlagN(outFlagN),
								.outFlagV(outFlagV),
								.outFlagZ(outFlagZ),
								.segA(segA));

	initial begin
	
		// SUMA A+B
		operation = 0;
		
		a = 4'b0000;
		b = 4'b0000;
		#10;
		
		a = 4'b1111;
		b = 4'b0000;
		#10;
		
		a = 4'b0000;
		b = 4'b1111;
		#10;
		
		a = 4'b1111;
		b = 4'b1111;
		#10;
		
		
		// RESTA A+B
		operation = 1;
		#10;
		
		a = 4'b0000;
		b = 4'b0000;
		#10;
		
		a = 4'b1111;
		b = 4'b0000;
		#10;
		
		a = 4'b0000;
		b = 4'b1111;
		#10;
		
		a = 4'b1111;
		b = 4'b1111;
		#10;
		
		
		// AND
		operation = 2;
		#10;
		
		a = 4'b0000;
		b = 4'b0000;
		#10;
		
		a = 4'b1111;
		b = 4'b0000;
		#10;
		
		a = 4'b0000;
		b = 4'b1111;
		#10;
		
		a = 4'b1111;
		b = 4'b1111;
		#10;
		
		
		// OR
		operation = 3;
		#10;
		
		a = 4'b0000;
		b = 4'b0000;
		#10;
		
		a = 4'b0101;
		b = 4'b1000;
		#10;
		
		a = 4'b1000;
		b = 4'b0101;
		#10;
		
		a = 4'b1111;
		b = 4'b1111;
		#10;
		
		
		// NOT A
		operation = 4;
		#10;
		
		a = 4'b0000;
		#10;
		
		a = 4'b1010;
		#10;
		
		a = 4'b0101;
		#10;
		
		a = 4'b1111;
		#10;
		
		
		// NOT B
		operation = 5;
		#10;
		
		b = 4'b0000;
		#10;
		
		b = 4'b1010;
		#10;
		
		b = 4'b0101;
		#10;
		
		b = 4'b1111;
		#10;
		
		
		// XOR
		operation = 6;
		#10;
		
		a = 4'b0000;
		b = 4'b0000;
		#10;
		
		a = 4'b0101;
		b = 4'b1000;
		#10;
		
		a = 4'b1000;
		b = 4'b0101;
		#10;
		
		a = 4'b1111;
		b = 4'b1111;
		#10;
		
		// AShiftLeft
		operation = 7;
		#10;
		
		a = 4'b0000;
		b = 4'b0010;
		#10;
		
		a = 4'b0101;
		b = 4'b0010;
		#10;
		
		a = 4'b1000;
		b = 4'b0010;
		#10;
		
		a = 4'b1111;
		b = 4'b0010;
		#10;
		
		// AShiftRight
		operation = 8;
		#10;
		
		a = 4'b0000;
		b = 4'b0010;
		#10;
		
		a = 4'b0101;
		b = 4'b0010;
		#10;
		
		a = 4'b1000;
		b = 4'b0010;
		#10;
		
		a = 4'b1111;
		b = 4'b0010;;
		#10;
		
		// LShiftLeft
		operation = 9;
		#10;
		
		a = 4'b0000;
		b = 4'b0010;
		#10;
		
		a = 4'b0101;
		b = 4'b0010;
		#10;
		
		a = 4'b1000;
		b = 4'b0010;
		#10;
		
		a = 4'b1111;
		b = 4'b0010;
		#10;
		
		// LShiftRight
		operation = 10;
		#10;
		
		a = 4'b0000;
		b = 4'b0010;
		#10;
		
		a = 4'b0101;
		b = 4'b0010;
		#10;
		
		a = 4'b1000;
		b = 4'b0010;
		#10;
		
		a = 4'b1111;
		b = 4'b0010;
		#10;
		
	end
	
endmodule 