module DCounter
#(parameter N=6)
(
  input wire btn_increment,// Boton para aumentar el numero
  input wire btn_decrement,// Boton para bajar el numero
  input wire btn_reset,    // Boton de reset
  output wire [2**N-1:0] count // El contador
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
	 if (~btn_increment) begin // Si el boton se presiona se baja en 1 count
		 if (count < 2**N-1) begin // Si el valor es mayor que cero
			 count <= count + 1;
		 end
	 end

    if (~btn_reset) begin // Si el reset se presiona
      count <= 2**N-1; // Volvemos al valor max
    end
  end
endmodule

/////////////////////////////////////////////

module SieteSeg
#(parameter N=6)
(
  input wire [2**N-1:0] count,
  output reg [6:0] segA, // 7-seg A
  output reg [6:0] segB  // 7-segm B
);

  reg [1:0] digito1; // Dígito menos significativo
  reg [1:0] digito2; // Dígito más significativo

  always @(*) begin
    digito1 = count[1:0];
    digito2 = count[N-1:N-2];

    case (digito1)
      0: segA = 7'b111_1110;
      1: segA = 7'b011_0000;
      2: segA = 7'b110_1101;
      3: segA = 7'b111_1001;
      4: segA = 7'b011_0011;
      5: segA = 7'b101_1011;
      6: segA = 7'b001_1111;
      7: segA = 7'b111_0000;
      8: segA = 7'b111_1111;
      9: segA = 7'b111_0011;
      default: segA = 7'b111_1111;
    endcase

    case (digito2)
      0: segB = 7'b111_1110;
      1: segB = 7'b011_0000;
      2: segB = 7'b110_1101;
      3: segB = 7'b111_1001;
      4: segB = 7'b011_0011;
      5: segB = 7'b101_1011;
      6: segB = 7'b001_1111;
      7: segB = 7'b111_0000;
      8: segB = 7'b111_1111;
      9: segB = 7'b111_0011;
      default: segB = 7'b111_1111;
    endcase
  end
endmodule

//////////////////////////////////////////

module mainModule (
  input wire btn_increment,// Boton para aumentar el numero
  input wire btn_decrement,// Boton para bajar el numero
  input wire btn_reset,    // Boton para reset
  output wire [6:0] segA, // 7-seg A
  output wire [6:0] segB  // 7-seg B
);

  parameter N = 6;

  wire [0:0] count;

  DCounter #(.N(N)) counter (
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