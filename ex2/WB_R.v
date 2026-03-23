`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:36:17 12/22/2024 
// Design Name: 
// Module Name:    WB_R 
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

module WB_R(Result,MemOut,MemtoReg,busW);
   input [31:0] Result,MemOut;
   input MemtoReg;
   output [31:0] busW;
   MUX32_2_1 u1(Result,MemOut,MemtoReg,busW);
endmodule