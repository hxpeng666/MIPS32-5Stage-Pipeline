`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:50:12 11/20/2024
// Design Name:   Inst_Rom
// Module Name:   F:/experiment/ex1/Inst_Rom_t.v
// Project Name:  ex1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Inst_Rom
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Inst_Rom_tb;
    // Inputs
    reg [4:0] pc;
    
    // Outputs
    wire [31:0] inst;
    
    // Instantiate the Unit Under Test (UUT)
    Inst_Rom uut (
        .pc(pc), 
        .inst(inst)
    );
    
    initial begin
        // Initialize Inputs
        pc = 5'h00;
        
        // Wait for global reset
        #10;
        
        // Test case 1: Fetch instruction at address 0
        pc = 5'h00;
        #10;
        
        // Test case 2: Fetch instruction at address 1
        pc = 5'h01;
        #10;
        
        // Test case 3: Fetch instruction at address 2
        pc = 5'h02;
        #10;
        
        // Test case 4: Fetch instruction at address 3
        pc = 5'h03;
        #10;
        
        // Test case 5: Fetch instruction at address 4
        pc = 5'h04;
        #10;
        
        // Test case 6: Fetch instruction at address 5
        pc = 5'h05;
        #10;
        
        // Test case 7: Fetch instruction at address 6
        pc = 5'h06;
        #10;
        
        // Test case 8: Fetch instruction at address 7
        pc = 5'h07;
        #10;
        
        // Test case 9: Fetch instruction at address 8
        pc = 5'h08;
        #10;
        
        // Test case 10: Fetch instruction at address 9
        pc = 5'h09;
        #10;
        
        // Test case 11: Fetch instruction at address 10
        pc = 5'h0A;
        #10;
        
        // Test case 12: Fetch instruction at address 11
        pc = 5'h0B;
        #10;
        
        // Test case 13: Fetch instruction at address 12
        pc = 5'h0C;
        #10;
        
        // Finish simulation
        $stop;
    end

endmodule



