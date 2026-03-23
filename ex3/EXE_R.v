`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:37:13 12/22/2024 
// Design Name: 
// Module Name:    EXE_R 
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

module EXE_R(
    busA,B,ALUctr,Zero,Result, Overflow
    );
    input [31:0] busA, B;
    input [2:0] ALUctr;
    output Zero, Overflow;
    output [31:0] Result;
    
    ALU u1(busA, B, ALUctr, Zero, Overflow, Result);
    
endmodule
