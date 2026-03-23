`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:38:18 12/22/2024 
// Design Name: 
// Module Name:    MEM_R 
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

module MEM_R(clk,MemWr,Result,busB,MemOut);
      input clk,MemWr;
      input [31:0] Result,busB;
      output [31:0] MemOut;
      wire [4:0] addr;
      assign addr=Result[4:0];
      DataMem u1(MemWr,addr,busB,clk,MemOut);
endmodule
