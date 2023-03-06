module DCounterAsyn_tb;
  // Parametros para el contador
  localparam N2 = 2;
  localparam N4 = 4;
  localparam N6 = 6;
  
  // Entradas al contador
  logic btn_increment;
  logic btn_decrement;
  logic btn_reset;

  // Salidas del contador
  reg [N2-1:0] count2;
  reg [N4-1:0] count4;
  reg [N6-1:0] count6;

  // Instanciar contadores para diferentes valores de N
  DCounterAsyn #(N2) counter2(.btn_increment(btn_increment), .btn_decrement(btn_decrement), .btn_reset(btn_reset), .count(count2));
  DCounterAsyn #(N4) counter4(.btn_increment(btn_increment), .btn_decrement(btn_decrement), .btn_reset(btn_reset), .count(count4));
  DCounterAsyn #(N6) counter6(.btn_increment(btn_increment), .btn_decrement(btn_decrement), .btn_reset(btn_reset), .count(count6));

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
  end
endmodule
