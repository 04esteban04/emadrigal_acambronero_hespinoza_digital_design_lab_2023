

module DCounter
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

//////////////////////////////////////////////////////////

module SieteSeg
#(parameter N=6)
(
  input reg [N-1:0] count,
  output reg [6:0] segA, // 7-seg A
  output reg [6:0] segB  // 7-segm B
);

  reg [3:0] digito1; // Dígito menos significativo
  reg [3:0] digito2; // Dígito más significativo
  
  reg [5:0] bin;
  wire [7:0] bcd;
  
  bin2bcd dut(
    .bin(count),
    .bcd(bcd)
  );
  
  always @(*) begin
    digito1 = bcd[3:0];
    digito2 = bcd[7:4];

    case (digito1)
      4'b0000: segA = 7'b0000001;
      4'b0001: segA = 7'b1001111;
      4'b0010: segA = 7'b0010010;
      4'b0011: segA = 7'b0000110;
      4'b0100: segA = 7'b1001100;
      4'b0101: segA = 7'b0100100;
      4'b0110: segA = 7'b0100000;
      4'b0111: segA = 7'b0001111;
      4'b1000: segA = 7'b0000000;
      4'b1001: segA = 7'b0000100;
      default: segA = 7'b0000001;
    endcase

    case (digito2)
      4'b0000: segB = 7'b0000001;
      4'b0001: segB = 7'b1001111;
      4'b0010: segB = 7'b0010010;
      4'b0011: segB = 7'b0000110;
      4'b0100: segB = 7'b1001100;
      4'b0101: segB = 7'b0100100;
      4'b0110: segB = 7'b0100000;
      4'b0111: segB = 7'b0001111;
      4'b1000: segB = 7'b0000000;
      4'b1001: segB = 7'b0000100;
      default: segB = 7'b0000001;
    endcase
  end
endmodule

//////////////////////////////
module bin2bcd(
   input [5:0] bin,
   output reg [7:0] bcd
);

integer i;

always @(bin) begin
   bcd = 0;         
   for (i = 0; i < 6; i = i + 1) begin             // Itera por cada bit de entrada
      if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;  // If BCD digit is >= 5, + 3
      if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
      bcd = {bcd[6:0], bin[5-i]};                  // Shift un bit, y shift por cada bit del input 
   end
end

endmodule

///////////////////////////////////////////////////////////////////////////

module mainModule (
  input logic btn_increment,// Boton para aumentar el numero
  input logic btn_decrement,// Boton para bajar el numero
  input logic btn_reset,    // Boton para reset
  output reg [6:0] segA, // 7-seg A
  output reg [6:0] segB  // 7-seg B
);

  parameter N = 6;

  reg [N-1:0] count;
  
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

endmodule
