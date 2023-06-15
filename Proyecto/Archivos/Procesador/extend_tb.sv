module extend_tb();

		logic [23:0] inst = 24'b101010101110100011111111;
		logic [1:0] ImmSrc;
		logic [31:0] ExtImm;

		extend dut(.Instr(inst), 
					  .ImmSrc(ImmSrc), 
					  .ExtImm(ExtImm));


		initial begin
		#10
		ImmSrc = 2'b00;
		#10
		ImmSrc = 2'b01;
		#10
		ImmSrc = 2'b10;

		end

endmodule