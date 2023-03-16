module DCounterAsyn_tb;

	parameter N = 6;
	reg [N-1:0] count;

	logic btn_decrement;
	logic btn_reset;
	reg [6:0] segA;
	reg [6:0] segB;
	integer i;	
  
	DCounter #(.N(N)) counter (.btn_decrement(btn_decrement),
										.btn_reset(btn_reset),
										.count(count),
										.segA(segA),
										.segB(segB));

	// Inicializar entradas
	initial begin
		i = 0;
		btn_decrement = 1;
		btn_reset = 1;
		#10 btn_reset = 0;
		#10 btn_reset = 1;
	 
		for (i = 0; i < 9; i = i + 1) begin 
			#10 btn_decrement = 0;
			#10 btn_decrement = 1;
		end

	end

endmodule