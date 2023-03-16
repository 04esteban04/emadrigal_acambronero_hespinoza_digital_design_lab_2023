module bin2bcd(input [3:0] bin,
					output logic [7:0] bcd);
   
	integer i;
		
	always @(bin) begin
		 bcd = 0;
		
		//Se itera una vez por cada bit de entrada	
		 for (i = 0; i < 4; i = i+1) begin	
				
				//Si cada digito BCD es mayor o igual a 5, se suman 3 (double-dabble)
				if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		
				if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
				
				//Se realiza un corrimiento de 1 bit
				bcd = {bcd[6:0],bin[3-i]};				 
		 end
	end
endmodule