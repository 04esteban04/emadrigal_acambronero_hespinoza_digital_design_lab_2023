module clock25mh(input logic clock_50, 
						output logic clock_25);

	logic [0:1] cuenta_clock;
	logic reset = 0;
	
	//generate
	contador_parametrizable #(2) divisor_clock( 	.reloj(clock_50), 
																.reset(reset), 
																.out(cuenta_clock));
	//endgenerate
	
	always_comb begin
		clock_25 = cuenta_clock[1];
	end

endmodule 