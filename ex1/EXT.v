`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:01:49 11/20/2024 
// Design Name: 
// Module Name:    EXT 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module EXT(
    input [15:0] a,          // 16-bit input
    input ExtOp,             // Extension operation: 0 for zero extension, 1 for sign extension
    output [31:0] b          // 32-bit output
);

    // Extend the input based on ExtOp
    assign b = (ExtOp == 0) ? {16'b0, a} : {{16{a[15]}}, a};
    // If ExtOp is 0, perform zero extension by appending 16 zeros to the MSB.
    // If ExtOp is 1, perform sign extension by replicating the sign bit (a[15]) 16 times.

endmodule