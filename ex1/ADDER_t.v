`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:35:23 11/20/2024
// Design Name:   Adder
// Module Name:   F:/experiment/ex1/ADDER_t.v
// Project Name:  ex1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ADDER_t;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [31:0] c;

	// Instantiate the Unit Under Test (UUT)
	Adder uut (
		.a(a), 
		.b(b), 
		.c(c)
	);

    initial begin
        // Initialize Inputs
        a = 32'h00000000;
        b = 32'h00000000;
        
        // Wait for global reset
        #10;
        
        // Test case 1
        a = 32'h00000001;
        b = 32'h00000001;
        #10;
        
        // Test case 2
        a = 32'hFFFFFFFF;
        b = 32'h00000001;
        #10;
        
        // Test case 3
        a = 32'h12345678;
        b = 32'h87654321;
        #10;
        
        // Test case 4
        a = 32'h0F0F0F0F;
        b = 32'hF0F0F0F0;
        #10;
        
        // Finish simulation
        $stop;
    end

endmodule


