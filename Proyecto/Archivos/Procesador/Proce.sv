module Proce(input logic clk, reset, start,
				output logic [31:0] WriteData, DataAdr, rd,
				output logic MemWrite);
				
	logic [31:0] PC, Instr, ReadData;
	
	// instantiate processor and memories
	arm arm(clk, reset, start, PC, Instr, MemWrite, DataAdr,
				WriteData, ReadData);
				
	imem imem(PC, Instr);
	
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);
	
	always @(posedge clk) begin
		rd = ReadData;
	end
	
endmodule