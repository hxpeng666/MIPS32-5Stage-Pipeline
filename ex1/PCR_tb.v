`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:43:06 11/20/2024
// Design Name:   PCR
// Module Name:   F:/experiment/ex1/PCR_tb.v
// Project Name:  ex1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PCR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PCR_tb;

	// Inputs
	reg [31:0] d_in;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] d_out;

	// Instantiate the Unit Under Test (UUT)
	PCR uut (
		.d_in(d_in), 
		.clk(clk), 
		.reset(reset), 
		.d_out(d_out)
	);

 initial begin
        clk = 0;
        forever #10 clk = ~clk; // Generate a clock with a period of 20ns
    end

    initial begin
        // Initialize Inputs
        d_in = 32'h00000000;
        reset = 1;

        // Apply reset
        #15;
        reset = 0;  // Activate reset
        #20;
        reset = 1;  // Deactivate reset

        // Test normal operation
        #10;
        d_in = 32'hA5A5A5A5;  // Apply test data
        #20;
        d_in = 32'h5A5A5A5A;  // Change input data
        #20;

        // Apply reset again to verify reset functionality
        reset = 0;  
        #20;
        reset = 1;

        // Finish simulation
        #50;
        $stop;
    end
      
endmodule

