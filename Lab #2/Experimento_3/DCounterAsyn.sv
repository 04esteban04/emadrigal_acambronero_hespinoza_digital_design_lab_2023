module DCounterAsyn #(parameter N=6)(input logic btn_decrement,// Boton para bajar el numero
										   input logic btn_reset,    // Boton de reset
										   output reg [N-1:0] count,
											output reg [6:0] segA,
											output reg [6:0] segB); // El contador
	
	always @(negedge btn_decrement or posedge btn_reset) begin 
		
		if (btn_reset) begin // Si el reset se presiona
			count <= 2**N-1; // Volvemos al valor max
		end
		
		else if (~btn_decrement) begin // Si el boton se presiona se baja en 1 count
			count <= count - 1;
		end
		
//		if (~btn_decrement) begin // Si el boton se presiona se baja en 1 count
//			count <= count - 1;
//		end
//		
//		else if (btn_reset) begin // Si el reset se presiona
//			count <= 2**N-1; // Volvemos al valor max
//		end
		
	end
  
	reg [7:0] bcd;
	integer i;
	
	always @(count) begin
		
		bcd = 0;         
		
		for (i = 0; i < 6; i = i + 1) begin             // Itera por cada bit de entrada
			if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;  // If BCD digit is >= 5, + 3
			if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
			bcd = {bcd[6:0], count[(N-1)-i]};                  // Shift un bit, y shift por cada bit del input 
		end
		
		case (bcd[3:0])
			4'b0000: segA = 7'b0000001; //0
			4'b0001: segA = 7'b1001111; //1
			4'b0010: segA = 7'b0010010; //2
			4'b0011: segA = 7'b0000110; //3
			4'b0100: segA = 7'b1001100; //4 
			4'b0101: segA = 7'b0100100; //5
			4'b0110: segA = 7'b0100000; //6
			4'b0111: segA = 7'b0001111; //7
			4'b1000: segA = 7'b0000000; //8
			4'b1001: segA = 7'b0000100; //9
			default: segA = 7'b1111111; // OFF
		 endcase

		case (bcd[7:4])
			4'b0000: segB = 7'b0000001; //0
			4'b0001: segB = 7'b1001111; //1
			4'b0010: segB = 7'b0010010; //2
			4'b0011: segB = 7'b0000110; //3
			4'b0100: segB = 7'b1001100; //4 
			4'b0101: segB = 7'b0100100; //5
			4'b0110: segB = 7'b0100000; //6
			4'b0111: segB = 7'b0001111; //7
			4'b1000: segB = 7'b0000000; //8
			4'b1001: segB = 7'b0000100; //9
			default: segB = 7'b1111111; // OFF
		endcase
  end
  
endmodule