module decoder_tb();

  // Inputs
  reg [1:0] Op;
  reg [5:0] Funct;
  reg [3:0] Rd;
  
  // Outputs
  wire [1:0] FlagW;
  wire PCS;
  wire RegW;
  wire MemW;
  wire MemtoReg;
  wire ALUSrc;
  wire [1:0] ImmSrc;
  wire [1:0] RegSrc;
  wire [2:0] ALUControl;

  decoder dut (
    .Op(Op),
    .Funct(Funct),
    .Rd(Rd),
    .FlagW(FlagW),
    .PCS(PCS),
    .RegW(RegW),
    .MemW(MemW),
    .MemtoReg(MemtoReg),
    .ALUSrc(ALUSrc),
    .ImmSrc(ImmSrc),
    .RegSrc(RegSrc),
    .ALUControl(ALUControl)
  );

  initial begin
	//decoder truth table
    Op = 2'b00; 
    Funct = 6'b000000; 
    Rd = 4'b0101; 
    #10;
	 Op = 2'b00; 
    Funct = 6'b100001; 
    Rd = 4'b0101; 
    #10;
	 Op = 2'b01; 
    Funct = 6'b000000; 
    Rd = 4'b0000; 
    #10;
	 Op = 2'b01; 
    Funct = 6'b000001; 
    Rd = 4'b0001; 
    #10;
	 Op = 2'b10; 
    Funct = 6'b000000; 
    Rd = 4'b0000; 
    #30;
	 
	// ALu decoder 
    Op = 2'b10; //AluOp = 0
    Funct = 6'b000000; 
    Rd = 4'b0000; 
    #10;
	 
	 Op = 2'b00; //AluOp =1
    Funct = 6'b101000; 
    Rd = 4'b0101; 
    #10;
	 Op = 2'b00; //AluOp =1
    Funct = 6'b101001; 
    Rd = 4'b0101; 
    #10;
	 
	 Op = 2'b00; //AluOp =1
    Funct = 6'b100100; 
    Rd = 4'b0101; 
    #10;
	 Op = 2'b00; //AluOp =1
    Funct = 6'b100101; 
    Rd = 4'b0101; 
    #10;
	 
	 Op = 2'b00; //AluOp =1
    Funct = 6'b100000; 
    Rd = 4'b0101; 
    #10;
	 Op = 2'b00; //AluOp =1
    Funct = 6'b100001; 
    Rd = 4'b0101; 
    #10;
	 
	 Op = 2'b00; //AluOp =1
    Funct = 6'b111000; 
    Rd = 4'b0101; 
    #10;
	 Op = 2'b00; //AluOp =1
    Funct = 6'b111001; 
    Rd = 4'b0101; 
    #10;
	 
    
  end

endmodule