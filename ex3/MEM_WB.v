`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:39:18 12/22/2024 
// Design Name: 
// Module Name:    MEM_WB 
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


module MEM_WB(CLK,Reset,MEM_MemtoReg,MEM_Rw,MEM_Result,MEM_MemOut,WB_MemtoReg,WB_Rw,WB_Result,WB_MemOut,MEM_RegWr,WB_RegWr);
      input CLK,Reset,MEM_MemtoReg,MEM_RegWr;
      input [4:0] MEM_Rw;
      input [31:0] MEM_Result,MEM_MemOut;
      output WB_MemtoReg,WB_RegWr;
      output [4:0] WB_Rw;
      output [31:0] WB_Result,WB_MemOut;
      reg WB_MemtoReg,WB_MemWr,WB_RegWr;
      reg [4:0] WB_Rw;
      reg [31:0] WB_Result,WB_MemOut;
       always @(negedge Reset or posedge CLK)
            if(Reset==0)
              begin
                   WB_MemtoReg<=0;
                   WB_Rw<=0;
                   WB_Result<=0;
                   WB_MemOut<=0;
                   WB_RegWr<=0;
              end
            else
              begin
                                 WB_MemtoReg<=MEM_MemtoReg;
                                 WB_Rw<=MEM_Rw;
                                 WB_Result<=MEM_Result;
                                 WB_MemOut<=MEM_MemOut;
                                 WB_RegWr<=MEM_RegWr;
              end      
endmodule
