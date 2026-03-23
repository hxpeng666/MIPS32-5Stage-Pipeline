`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:30:47 11/20/2024 
// Design Name: 
// Module Name:    ADDER 
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
module Adder(
    input [31:0] a,  // 32-bit input a
    input [31:0] b,  // 32-bit input b
    output [31:0] c  // 32-bit output c
);

    assign c = a + b;  // Perform addition of a and b

endmodule
