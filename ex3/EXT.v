`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:33:23 12/22/2024 
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
module EXT(a,ExtOp,b);
    input [15:0]a;
    input ExtOp;
    output [31:0]b;
    assign b = (ExtOp==0)?{16'b0, a}:{{16{a[15]}}, a};
endmodule
