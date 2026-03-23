`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:34:25 12/22/2024 
// Design Name: 
// Module Name:    MUX1_2_1 
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
module MUX1_2_1(a,b,s,c);
	input a,b,s;
	output c;
	assign c=(s==0)?a:b;
endmodule

