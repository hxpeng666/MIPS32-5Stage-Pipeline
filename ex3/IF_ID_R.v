`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:34:27 12/22/2024 
// Design Name: 
// Module Name:    IF_ID_R 
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

module IF_ID_R(CLK,Reset,IF_Inst,ID_Inst,stall,IF_PC,ID_PC,IF_PC4,ID_PC4);
      input [31:0] IF_Inst,IF_PC,IF_PC4;
      input CLK,Reset,stall;
      output [31:0] ID_Inst,ID_PC,ID_PC4;
      reg [31:0] ID_Inst,ID_PC,ID_PC4;
      always @(negedge Reset or posedge CLK)
       if(Reset==0)
         begin
              ID_Inst<=0;
              ID_PC<=0;
              ID_PC4<=0;
         end
       else if(~stall)
         begin
             ID_Inst<=IF_Inst;
             ID_PC<=IF_PC;
             ID_PC4<=IF_PC4;
         end      
endmodule
