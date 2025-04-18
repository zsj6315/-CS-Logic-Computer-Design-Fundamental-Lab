`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:08:10 11/20/2024
// Design Name:   LampCtrl
// Module Name:   D:/LampCtrl_HDL/LampCtrl_sim.v
// Project Name:  LampCtrl_HDL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LampCtrl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LampCtrl_sim;

	// Inputs
	reg clk;
	reg S1;
	reg S2;
	reg S3;

	// Outputs
	wire F;

	// Instantiate the Unit Under Test (UUT)
	LampCtrl uut (
		.clk(clk), 
		.S1(S1), 
		.S2(S2), 
		.S3(S3), 
		.F(F)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		S1 = 0;
		S2 = 0;
		S3 = 0;
		
		#600 S1 = 1;
		#20 S1 = 0;
		#6000 S2 = 1;
		#20 S2 = 0;
		#6000 S3 = 1;
		#20 S3 = 0;
	end
      
	always begin
		#10 clk = 0;
		#10 clk = 1;
	end

	initial
	begin            
		$dumpfile("./build/wave.vcd");        //生成的vcd文件名称
		$dumpvars(0, LampCtrl_sim);    //tb模块名称
		#20000 $finish;
	end
endmodule

