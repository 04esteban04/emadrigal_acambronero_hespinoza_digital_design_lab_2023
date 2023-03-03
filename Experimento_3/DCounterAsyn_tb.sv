module DCounterAsyn_tb;

  // Parametros para el contador
  localparam N2 = 2;
  localparam N4 = 4;
  localparam N6 = 6;
  
  // Entradas al contador
  reg btn_increment;
  reg btn_decrement;
  reg btn_reset;

  // Salidas del contador
  wire [2**N2-1:0] count2;
  wire [2**N4-1:0] count4;
  wire [2**N6-1:0] count6;

  // Instanciar contadores para diferentes valores de N
  DCounterAsyn #(N2) counter2(.btn_increment(btn_increment), .btn_decrement(btn_decrement), .btn_reset(btn_reset), .count(count2));
  DCounterAsyn #(N4) counter4(.btn_increment(btn_increment), .btn_decrement(btn_decrement), .btn_reset(btn_reset), .count(count4));
  DCounterAsyn #(N6) counter6(.btn_increment(btn_increment), .btn_decrement(btn_decrement), .btn_reset(btn_reset), .count(count6));

  // Inicializar entradas
  initial begin
    btn_increment = 1;
    btn_decrement = 1;
    btn_reset = 1;
	 // Simular contador con N=2 
	 $monitor("N=%0d count=%b", N2, count2);
    #10 btn_decrement = 0;
    #10 btn_decrement = 1;
    #10 btn_decrement = 0;
    #10 btn_decrement = 1;
	 #10 btn_decrement = 0;
    #10 btn_decrement = 1;
	 $monitor("N=%0d count=%b", N2, count2);
    #10 btn_reset = 1;
    #10 btn_reset = 0;
	 // Simular contador con N=4
	 $monitor("N=%0d count=%b", N4, count4);
    #10 btn_decrement = 0;
    #10 btn_decrement = 1;
    #10 btn_decrement = 0;
    #10 btn_decrement = 1;
    #10 btn_decrement = 0;
    #10 btn_decrement = 1;
    #10 btn_increment = 0;
    #10 btn_increment = 1;
    #10 btn_decrement = 0;
    #10 btn_decrement = 1;
	 $monitor("N=%0d count=%b", N4, count4);
    #10 btn_reset = 1;
    #10 btn_reset = 0;
	 // Simular contador con N=6
	 $monitor("N=%0d count=%b", N6, count6);
    #10 btn_decrement = 0;
    #10 btn_decrement = 1;
    #10 btn_decrement = 0;
    #10 btn_decrement = 1;
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
	 $monitor("N=%0d count=%b", N6, count6);
    #10 btn_reset = 1;
    #10 btn_reset = 0; 
  end
endmodule
