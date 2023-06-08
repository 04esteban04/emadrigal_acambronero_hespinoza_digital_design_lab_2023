module maxscore(input [3:0] set_maxscore,
					input logic maxScoreflag,
					output reg [0:11] maxScore,
					output reg [0:11] maxScoreCopy);
					
	always @(set_maxscore) begin
		if (maxScoreflag == 0) begin
			case (set_maxscore)
				4'b0000: maxScore = 4;
				4'b0001: maxScore = 8;
				4'b0010: maxScore = 16;
				4'b0011: maxScore = 32;
				4'b0100: maxScore = 64;
				4'b0101: maxScore = 128;
				4'b0110: maxScore = 256;
				4'b0111: maxScore = 512;
				4'b1000: maxScore = 1024;
				4'b1001: maxScore = 2048;
				default: maxScore = 2048;
			endcase
			maxScoreCopy = maxScore;
		end
		else begin
			maxScore = 2048;
		end
	end

endmodule