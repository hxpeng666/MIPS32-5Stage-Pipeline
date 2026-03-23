`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:45:36 11/20/2024
// Design Name:   MUX32_2_1
// Module Name:   F:/experiment/ex1/MUX_t.v
// Project Name:  ex1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX32_2_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX_t;

	// Inputs
	reg [31:0] a0;
	reg [31:0] a1;
	reg s;

	// Outputs
	wire [31:0] y;

	// Instantiate the Unit Under Test (UUT)
	MUX32_2_1 uut (
		.a0(a0), 
		.a1(a1), 
		.s(s), 
		.y(y)
	);

    initial begin
        // Initialize Inputs
        a0 = 32'hAAAAAAAA;
        a1 = 32'h55555555;
        s = 0;
        
        // Wait for global reset
        #10;
        
        // Test case 1: Select a0
        s = 0;
        #10;
        
        // Test case 2: Select a1
        s = 1;
        #10;
        
        // Test case 3: Change a0 and observe
        a0 = 32'hFFFFFFFF;
        s = 0;
        #10;
        
        // Test case 4: Change a1 and observe
        a1 = 32'h00000000;
        s = 1;
        #10;
        
        // Finish simulation
        $stop;
    end

endmodule
