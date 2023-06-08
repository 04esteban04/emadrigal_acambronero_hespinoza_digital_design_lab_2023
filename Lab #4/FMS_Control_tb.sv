module FMS_Control_tb();

	
	logic clk=0;
	logic resetBtn;
	logic startBtn;
	logic derBtn;
	logic izqBtn;
	logic upBtn;
	logic downBtn;
	reg [11:0] matriz [0:3][0:3];
	logic winflag;
	logic loseflag;
	int puntos;
	

	FSM_Control FMStest(clk,resetBtn,startBtn,izqBtn,derBtn,upBtn,downBtn,matriz,winflag,loseflag,puntos);
	
	always begin	

		#5 clk = ~clk;
		
	end
		
		
	initial begin
	
		resetBtn = 0;
		
		#10 resetBtn = 1;
		
		#10 resetBtn = 0;
		
		#10 startBtn = 1;
		
		#10 startBtn = 1;
		
		#10 startBtn = 0;
		
		#10 startBtn = 0;
			 upBtn = 0;
		
		#10 upBtn = 1;
		
		#10 upBtn = 0;
		#10 upBtn = 0;
		#10 derBtn = 0;
		#10 derBtn = 1;
		
		#10 derBtn = 0;
		#10 derBtn = 0;
	
	end
	



endmodule