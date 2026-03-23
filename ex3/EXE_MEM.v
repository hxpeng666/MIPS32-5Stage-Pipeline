`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:37:39 12/22/2024 
// Design Name: 
// Module Name:    EXE_MEM 
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
module EXE_MEM(CLK,Reset,EXE_MemtoReg,EXE_MemWr,EXE_Result,EXE_B,EXE_Rw,MEM_MemtoReg,MEM_MemWr,MEM_Rw,MEM_Result,MEM_B,EXE_RegWr2,MEM_RegWr,stall);
      input CLK,Reset,EXE_MemtoReg,EXE_MemWr,EXE_RegWr2,stall;
      input [31:0] EXE_Result,EXE_B;
      input [4:0] EXE_Rw;
      output MEM_MemtoReg,MEM_MemWr,MEM_RegWr;
      output [31:0] MEM_Result,MEM_B;
      output [4:0] MEM_Rw;
      reg MEM_MemtoReg,MEM_MemWr,MEM_RegWr;
      reg [31:0] MEM_Result,MEM_B;
      reg [4:0] MEM_Rw;      
      always @(negedge Reset or posedge CLK)
             if((Reset==0)||(stall==1))
               begin
                  MEM_MemtoReg<=0;
                  MEM_MemWr<=0;
                  MEM_Result<=0;
                  MEM_B<=0;
                  MEM_Rw<=0;
                  MEM_RegWr<=0;
               end
             else
               begin
                                 MEM_MemtoReg<=EXE_MemtoReg;
                                 MEM_MemWr<=EXE_MemWr;
                                 MEM_Result<=EXE_Result;
                                 MEM_B<=EXE_B;
                                 MEM_Rw<=EXE_Rw;
                                 MEM_RegWr<=EXE_RegWr2;
               end      
endmodule
