module mostrarImagen (input [0:9] x, 
							 input [0:9] y,
							 input reset,
							 input start,
							 input reg [31:0] data_ram,
							 input reg [31:0] data_dmem,
							 output logic [7:0] red,
							 output logic [7:0] green,
							 output logic [7:0] blue);
	

	// Variables requeridas
	logic [7:0] pixel_data;
	
	
	always_comb begin
	
		pixel_data = 0;
		red = 8'b00000000;
		green = 8'b00000000;
		blue = 8'b00000000;
		
		if(reset) begin
			//Color #6296A1
			if ((x >= 200 && x <= 455) && (y >= 120 && y <= 375)) begin
				red = 8'b01100010;
				green = 8'b10010110;
				blue = 8'b10100001;
			end
			else begin
				red = 8'b00000000;
				green = 8'b00000000;
				blue = 8'b00000000;
			end
		end
		
		
		else if (start) begin
			if ((x >= 200 && x <= 455) && (y >= 120 && y <= 375)) begin	
				pixel_data = data_dmem[7:0];
				
				red = pixel_data;
				green = pixel_data;
				blue = pixel_data;
			end
			
			else begin
				red = 8'b00000000;
				green = 8'b00000000;
				blue = 8'b00000000;
			end
		end

		else if ((x >= 200 && x <= 455) && (y >= 120 && y <= 375)) begin	
			pixel_data = data_ram[7:0];
			
			red = pixel_data;
			green = pixel_data;
			blue = pixel_data;
		end
		
		else begin
			red = 8'b00000000;
			green = 8'b00000000;
			blue = 8'b00000000;
		end
		
	end
	
	

endmodule 