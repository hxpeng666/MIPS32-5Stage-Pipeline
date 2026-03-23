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

module EXE_R(busA,B,ALUctr,Zero,Overflow,Result,EXE_RegWr,EXE_RegWr2);
     input [31:0] busA,B;
     input [2:0] ALUctr;
     input EXE_RegWr;
     output Zero,Overflow;
     output [31:0] Result;
     output EXE_RegWr2;
     assign EXE_RegWr2=EXE_RegWr*(~Overflow);
     ALU u1(busA,B,ALUctr,Zero,Overflow,Result);
endmodule
