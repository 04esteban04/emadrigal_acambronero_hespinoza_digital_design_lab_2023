module DecreaseCount
#(parameter N=6)
(
  input wire clk,          // Clk para testeo
  input wire btn_decrement,// Boton para bajar el numero
  input wire btn_reset,    // Boton de reset
  output reg [2**N-1:0] count // El contador
);

  always @(posedge clk or negedge btn_decrement or negedge btn_reset) begin
    if (~btn_decrement) begin // Si el boton se presiona se baja en 1 count
      if (count > 0) begin // Si el valor es mayor que cero
        count <= count - 1;
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
  reg clk, btn_decrement, btn_reset;
  
  // Outputs
  wire [2**N-1:0] count;
  
  // Instanciamos el modulo
  DecreaseCount #(N) dut (
    .clk(clk),
    .btn_decrement(btn_decrement),
    .btn_reset(btn_reset),
    .count(count)
  );

  always #5 clk = ~clk; // Generate clock signal with period of 10 time units

  initial begin
    clk = 0;
    btn_decrement = 0;
    btn_reset = 0;
    #10;

    // Test boton presionado
    btn_decrement = 1;
    #5;
    btn_decrement = 0;
    #5;
    btn_decrement = 1;
    #5;
    btn_decrement = 0;
    #5;
    btn_decrement = 1;
    #5;
    btn_decrement = 0;
    #5;
	 #5 $display("Count: %0d", count);
	 
    // Test reset
    btn_reset = 1;
    #5;
    btn_reset = 0;
    #5;
	 #5 $display("Count: %0d", count);

    // Test boton presionado
    btn_decrement = 1;
    #5;
    btn_decrement = 0;
    #5;
    btn_decrement = 1;
    #5;
    btn_decrement = 0;
    #5;
    btn_decrement = 1;
    #5;
    btn_decrement = 0;
    #5;
	 #5 $display("Count: %0d", count);

    $finish; // Fin 
  end
endmodule
