`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:02:20 11/20/2024
// Design Name:   EXT
// Module Name:   F:/experiment/ex1/EXT_t.v
// Project Name:  ex1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: EXT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module EXT_t;

	// Inputs
	reg [15:0] a;
	reg ExtOp;

	// Outputs
	wire [31:0] b;

	// Instantiate the Unit Under Test (UUT)
	EXT uut (
		.a(a), 
		.ExtOp(ExtOp), 
		.b(b)
	);

	initial begin
        // Test case 1: Zero extension
        a = 16'h1234;
        ExtOp = 0;
        #10;
        
        // Test case 2: Sign extension (positive number)
        a = 16'h1234;
        ExtOp = 1;
        #10;
        
        // Test case 3: Sign extension (negative number)
        a = 16'hF234;
        ExtOp = 1;
        #10;
        
        // Test case 4: Zero extension (negative number)
        a = 16'hF234;
        ExtOp = 0;
        #10;
        
        // Finish simulation
        $stop;
    end

endmodule


