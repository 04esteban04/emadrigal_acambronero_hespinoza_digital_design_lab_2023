
///////////////////////////////////////////////////////////
//////////////////////  -- 7SEGMENTOS --  /////////////////
///////////////////////////////////////////////////////////

module sieteSeg #(parameter N=4) ( input reg [N-1:0] result,
											  output reg [6:0] segA);  // 7-segm A
											

	always_comb begin
	
		segA = 0;

		case (result)
		
			0:  segA = 7'b0000001; //0
			1:  segA = 7'b1001111; //1
			2:  segA = 7'b0010010; //2
			3:  segA = 7'b0000110; //3
			4:  segA = 7'b1001100; //4 
			5:  segA = 7'b0100100; //5
			6:  segA = 7'b0100000; //6
			7:  segA = 7'b0001111; //7
			8:  segA = 7'b0000000; //8
			9:  segA = 7'b0000100; //9
			10: segA = 7'b0001000; //10 - A
			11: segA = 7'b1100000; //11 - B
			12: segA = 7'b0110001; //12 - C
			13: segA = 7'b1000010; //13 - D
			14: segA = 7'b0110000; //14 - E
			15: segA = 7'b0111000; //15 - F
			
			default: segA = 7'b1111111; // OFF
			
		endcase
	 
  end
  
endmodule