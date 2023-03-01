module DecreaseCount
#(parameter N=2)
(
  input wire btn_decrement,// Boton para bajar el numero
  input wire btn_reset,    // Boton de reset
  output reg [2**N-1:0] count // El contador
);

  always @(negedge btn_decrement or negedge btn_reset) begin //negedge transicion de 1 a 0 
    if (~btn_decrement) begin // Si el boton se presiona se baja en 1 count
      if (count > 0) begin // Si el valor es mayor que cero
        count <= count - 1;
      end
	else begin
		count <= 2**N - 1; // Volvemos al valor max
	end
    end

    if (~btn_reset) begin // Si el reset se presiona
      count <= 2**N - 1; // Volvemos al valor max
    end
  end

endmodule

module DecreaseCount_tb;

  // Parametro
  parameter N = 4;
  
  // Inputs
  reg btn_decrement, btn_reset;
  
  // Outputs
  wire [2**N-1:0] count;
  
  // Instanciamos el modulo
  DecreaseCount #(N) dut (
    .btn_decrement(btn_decrement),
    .btn_reset(btn_reset),
    .count(count)
  );

  initial begin

    btn_decrement = 0;
    btn_reset = 0;
    #10;

    // Test boton presionado
    btn_decrement = 1;
    #15 $display("Count 1: %0d", count);
    btn_decrement = 0;
    #15;
    btn_decrement = 1;
    #15;
    btn_decrement = 0;
    #15;
    btn_decrement = 1;
    #15;
    btn_decrement = 0;
    #15;
    #15 $display("Count 2: %0d", count);
	 
    // Test reset
    btn_reset = 1;
    #15;
    btn_reset = 0;
    #15;
    #5 $display("Count 3: %0d", count);

    // Test boton presionado
    btn_decrement = 1;
    #15;
    btn_decrement = 0;
    #15;
    btn_decrement = 1;
    #15;
    btn_decrement = 0;
    #15;
    btn_decrement = 1;
    #15;
    btn_decrement = 0;
    #15;
    #15 $display("Count 4: %0d", count);

    // Fin 
  end
endmodule
