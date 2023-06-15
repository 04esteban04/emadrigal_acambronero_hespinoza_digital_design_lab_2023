module regfile_tb();
  
	logic [3:0] A1, A2, A3;
	logic [31:0] WD3, RD1, RD2;
	logic WE3;

	logic clk = 0;
	always #5 clk = ~clk;

	regfile rg (
	 .ra1(A1),
	 .ra2(A2),
	 .wa3(A3),
	 .wd3(WD3),
	 .we3(WE3),
	 .clk(clk),
	 .rd1(RD1),
	 .rd2(RD2)
	);

initial begin
	#22; 

	// Escritura

	A3 = 1;
	WD3 = 32'h12345678;
	WE3 = 1;
	#10;
	WE3 = 0;

	A3 = 2;
	WD3 = 32'h11111111;
	WE3 = 1;
	#10;
	WE3 = 0;
	#10;
	A1 = 1;
	A2 = 15;

	#10;

	$display("RD1: %h", RD1);
	$display("RD2: %h", RD2);

  end

endmodule