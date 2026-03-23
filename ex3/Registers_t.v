`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:57:55 12/21/2024
// Design Name:   Registers
// Module Name:   F:/experiment/ex2/Registers_t.v
// Project Name:  ex2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Registers
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Registers_t;

	// Inputs
	reg [4:0] rna;
	reg [4:0] rnb;
	reg [31:0] wd;
	reg [4:0] wn;
	reg write;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] A;
	wire [31:0] B;

	// Instantiate the Unit Under Test (UUT)
	Registers uut (
		.rna(rna), 
		.rnb(rnb), 
		.wd(wd), 
		.wn(wn), 
		.write(write), 
		.clk(clk), 
		.reset(reset), 
		.A(A), 
		.B(B)
	);

	initial begin
	  write=0;
     clk=0;
     reset=0;
     rna=5'd0;
     rnb=5'd1;
     wn=5'd3;
     wd=32'd34;
     //第一次试验：输出A,B
     #10
     //第二次试验：满足条件，将wd写入wn
     clk=1;
     write=1;
     #10
     reset=1;
     #10 $stop;
     end
      
endmodule

