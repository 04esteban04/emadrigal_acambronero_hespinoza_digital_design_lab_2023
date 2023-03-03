module bin2bcd_tb();

   logic [3:0] bin;
   logic [7:0] bcd;
	logic [6:0] segments;
	
	bin2bcd bcdconverter(.bin(bin), .bcd(bcd), .segments(segments));
	
	initial begin
		bin = 4'b0000; #20; //0
		bin = 4'b0001; #20; //1
		bin = 4'b0010; #20; //2
		bin = 4'b0011; #20; //3
		bin = 4'b0100; #20; //4
		bin = 4'b0101; #20; //5
		bin = 4'b0110; #20; //6 
		bin = 4'b0111; #20; //7
		bin = 4'b1000; #20; //8
		bin = 4'b1001; #20; //9
		bin = 4'b1010; #20; //10
		bin = 4'b1011; #20; //11
		bin = 4'b1100; #20; //12
		bin = 4'b1101; #20; //13
		bin = 4'b1110; #20; //14
		bin = 4'b1111; #20; //15
	end	
	
endmodule