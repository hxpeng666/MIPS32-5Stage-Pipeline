`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:05:38 11/21/2024
// Design Name:   Fetch
// Module Name:   F:/experiment/ex1/Fetch_t.v
// Project Name:  ex1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Fetch_t;

	// Inputs
	reg clk;
	reg reset;
	reg branch;
	reg zero;
	reg jump;
	reg [25:0] target;
	reg [15:0] imm16;
	reg ExtOp;

	// Outputs
	wire [31:0] Inst;

	// Instantiate the Unit Under Test (UUT)
	Fetch uut (
		.clk(clk), 
		.reset(reset), 
		.branch(branch), 
		.zero(zero), 
		.jump(jump), 
		.target(target), 
		.imm16(imm16), 
		.ExtOp(ExtOp), 
		.Inst(Inst)
	);

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period of 10 time units
    end
    
    // Test sequence
    initial begin
        // Start with an assertion of reset to initialize the system correctly
        reset = 1;
        branch = 0;
        zero = 0;
        jump = 0;
        target = 26'h0000000;
        imm16 = 16'h0000;
        ExtOp = 0;

        // Hold reset for a longer time to ensure proper initialization
        #20;
        reset = 0;
        #20;
        
        // Test case 1: Normal PC increment (PC + 4)
        branch = 0;
        jump = 0;

        // Let the system run for some time to capture the clock cycles in waveform
        #40;

        // Test case 2: Branch taken
        branch = 1;
        zero = 1;
        imm16 = 16'h0004;
        ExtOp = 1;
        #40;

        // Test case 3: Jump to target
        branch = 0;
        zero = 0;
        jump = 1;
        target = 26'h3FFFFFF;
        #40;

        // Test case 4: Branch not taken
        branch = 1;
        zero = 0;
        #40;

        // Test case 5: Force PC update to non-zero value
        reset = 1;
        #10;
        reset = 0;
        branch = 0;
        zero = 0;
        jump = 0;
        imm16 = 16'h0001;
        ExtOp = 0;
        target = 26'h0000010;
        #40;

        // Finish simulation
        #50;
        $stop;
    end
endmodule

