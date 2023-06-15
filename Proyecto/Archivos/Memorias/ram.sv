
module ram (input logic clk, we,
				input logic [31:0] address, wd,
				output logic [31:0] rd);
				
	// Variables requeridas
	logic [31:0] RAM[65535:0];
	
	always_ff @(posedge clk)
	
		if (we) begin
			RAM[address] <= wd;
		end
		
		else begin
			rd = RAM[address];
		end
		
endmodule