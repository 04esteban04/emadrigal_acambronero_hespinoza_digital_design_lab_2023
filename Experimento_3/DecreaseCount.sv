module DecreaseCount
#(parameter N=6)
(
  input wire clk,          //Clk para testeo
  input wire btn_decrement,//Boton para bajar el numero
  input wire btn_reset,    //Boton de reset
  output reg [2**N:0] count//El contador
);

always @(posedge clk or negedge btn_decrement or negedge btn_reset) begin
  if (~btn_decrement) begin // Si el boton se presiona se baja en 1 count
    if (count > 0) begin // Si el valor es mayor que cero
      count <= count - 1;
    end
  end

  if (~btn_reset) begin // Si el reset se presiona
    count <= 2**N; // Volvemos al valor max
  end
end

endmodule


module DecreaseCount_tb;

  // Parametro
  parameter N = 4; // Bits

  // Inputs
  logic clk;
  logic btn_decrement;
  logic btn_reset;

  // Outputs
  logic [2**N:0] count;

  // Instanciamos el modulo
  decrease_counter dut (
    .clk(clk),
    .btn_decrement(btn_decrement),
    .btn_reset(btn_reset),
    .count(count)
  );

  // Clock
  always #5 clk = ~clk;

  // Inputs
  initial begin
    clk = 0;
    btn_decrement = 1;
    btn_reset = 1;
    count = 0;
    #10;
  end

  // Test boton presionado
  task test_boton;
    #5 btn_decrement = 0; // Press decrement button
    #10 btn_decrement = 1; // Release decrement button
  endtask

  // Test bajar el nuemero
  task test_decrement;
    #5 btn_decrement = 0; // Presionamos el boton
    #5 btn_decrement = 1; // Dejamos el boton
    #5 $display("Count: %0d", count); // Count=15 (N=4)
    #5 btn_decrement = 0; // Presionamos el boton
    #5 btn_decrement = 1; // Dejamos el boton
    #5 $display("Count: %0d", count); // Count=15 (N=4)
  endtask

  // Test reset
  task test_reset;
    #5 btn_reset = 0; // Presionamos el reset
    #10 btn_reset = 1; // Dejamos el reset
    #5 $display("Count: %0d", count); // count=15 (N=4)
  endtask

  // Run tests
  initial begin
    test_boton();
    test_decrement();
    test_reset();
    #10 $finish;
  end

endmodule
