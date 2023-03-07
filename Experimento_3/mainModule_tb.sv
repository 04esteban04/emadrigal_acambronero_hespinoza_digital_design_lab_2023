module mainModule_tb;

  parameter N = 6;
  reg [N-1:0] count;
  
  logic btn_increment;
  logic btn_decrement;
  logic btn_reset;
  reg [6:0] segA;
  reg [6:0] segB; 
  
  DCounter #(.N(N)) counter (
	 .btn_increment(btn_increment),
    .btn_decrement(btn_decrement),
    .btn_reset(btn_reset),
    .count(count)
  );

  SieteSeg #(.N(N)) displays (
    .count(count),
    .segA(segA),
    .segB(segB)
  );
  
  // Inicializar entradas
  initial begin
    #10 btn_increment = 1;
    #10 btn_decrement = 1;
    #10 btn_reset = 1;
	 #10 btn_reset = 0;
	 #10 btn_reset = 1;
	 
	 
    #10 btn_decrement = 0;
    #10 btn_decrement = 1;
	 
    #10 btn_increment = 0;
    #10 btn_increment = 1;
	 
	 #10 btn_decrement = 0;
    #10 btn_decrement = 1;
	 
	 #10 btn_decrement = 0;
    #10 btn_decrement = 1;
	 
	 #10 btn_decrement = 0;
    #10 btn_decrement = 1;
	 
	 #10 btn_decrement = 0;
    #10 btn_decrement = 1;
	 
	 #10 btn_decrement = 0;
    #10 btn_decrement = 1;
	 
	 #10 btn_decrement = 0;
    #10 btn_decrement = 1;
	 
	 #10 btn_decrement = 0;
    #10 btn_decrement = 1;
	 
	 #10 btn_decrement = 0;
    #10 btn_decrement = 1;
	 
	 #10 btn_decrement = 0;
    #10 btn_decrement = 1;
  end

endmodule