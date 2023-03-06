module DCounterAsyn
#(parameter N=6)
(
  input logic btn_increment,// Boton para aumentar el numero
  input logic btn_decrement,// Boton para bajar el numero
  input logic btn_reset,    // Boton de reset
  output reg [N-1:0] count // El contador
);
	always @(negedge btn_decrement or negedge btn_reset or negedge btn_increment) begin //negedge transicion de 1 a 0 
    if (~btn_decrement) begin // Si el boton se presiona se baja en 1 count
      if (count > 0) begin // Si el valor es mayor que cero
        count <= count - 1;
      end
		else begin
			count <= 0; // Negativos se pone en cero
		end
    end
	 if (~btn_increment) begin // Si el boton se presiona se sube en 1 count
		 if (count < 2**N-1) begin // Si el valor es mayor que el valor max
			 count <= count + 1;
		 end
	 end
    if (~btn_reset) begin // Si el reset se presiona
      count <= 2**N-1; // Volvemos al valor max
    end
  end
endmodule