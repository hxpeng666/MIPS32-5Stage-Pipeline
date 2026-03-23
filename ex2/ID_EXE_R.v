`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:36:38 12/22/2024 
// Design Name: 
// Module Name:    ID_EXE_R 
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
module ID_EXE_R(CLK,Reset,ID_MemtoReg,ID_MemWr,ID_ALUctr,ID_Rw,ID_A2,ID_B2,ID_B,EXE_MemtoReg,EXE_MemWr,EXE_ALUctr,EXE_Rw,EXE_A2,EXE_B2,EXE_B,ID_RegWr,EXE_RegWr);
     input ID_MemtoReg,ID_MemWr,Reset,CLK,ID_RegWr;
     input [2:0] ID_ALUctr;
     input [31:0] ID_Rw,ID_A2,ID_B,ID_B2;
     output [2:0] EXE_ALUctr;
     output [31:0] EXE_Rw,EXE_A2,EXE_B,EXE_B2;
     output EXE_MemtoReg,EXE_MemWr,EXE_RegWr;
     reg [31:0] EXE_Rw,EXE_A2,EXE_B,EXE_B2;
     reg EXE_MemtoReg,EXE_MemWr,EXE_RegWr;
     reg [2:0] EXE_ALUctr;
     always @(negedge Reset or posedge CLK)
            if(Reset==0)
              begin
                   EXE_Rw<=0;
                   EXE_A2<=0;
                   EXE_B<=0;
                   EXE_B2<=0;
                   EXE_MemtoReg<=0;
                   EXE_MemWr<=0;
                   EXE_ALUctr<=0;
                   EXE_RegWr<=0;
              end
            else
              begin
                                 EXE_Rw<=ID_Rw;
                                 EXE_A2<=ID_A2;
                                 EXE_B<=ID_B;
                                 EXE_B2<=ID_B2;
                                 EXE_MemtoReg<=ID_MemtoReg;
                                 EXE_MemWr<=ID_MemWr;
                                 EXE_ALUctr<=ID_ALUctr;
                                 EXE_RegWr<=ID_RegWr;
              end      
endmodule