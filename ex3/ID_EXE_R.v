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


module ID_EXE_R(CLK,Reset,ID_MemtoReg,ID_MemWr,ID_ALUctr,ID_Rw,ID_A2,ID_B,EXE_MemtoReg,EXE_MemWr,EXE_ALUctr,EXE_Rw,EXE_A2,EXE_B,ID_RegWr,EXE_RegWr,ID_Inst,EXE_Inst,ID_ALUSrc,EXE_ALUSrc,ID_immshift,EXE_immshift,ID_RegDst,EXE_RegDst,stall,ID_PC4,EXE_PC4);
     input ID_MemtoReg,ID_MemWr,Reset,CLK,ID_RegWr,ID_ALUSrc,ID_RegDst,stall;
     input [2:0] ID_ALUctr;
     input [31:0] ID_A2,ID_B,ID_Inst,ID_immshift,ID_PC4;
     input [4:0] ID_Rw;
     output [2:0] EXE_ALUctr;
     output [31:0] EXE_A2,EXE_B,EXE_Inst,EXE_immshift,EXE_PC4;
     output [4:0] EXE_Rw;
     output EXE_MemtoReg,EXE_MemWr,EXE_RegWr,EXE_ALUSrc,EXE_RegDst;
     reg [31:0] EXE_Rw,EXE_A2,EXE_B,EXE_B2,EXE_Inst,EXE_immshift,EXE_PC4;
     reg EXE_MemtoReg,EXE_MemWr,EXE_RegWr,EXE_ALUSrc,EXE_RegDst;
     reg [2:0] EXE_ALUctr;
     always @(negedge Reset or posedge CLK)
            if(Reset==0)
              begin
                   EXE_Rw<=0;
                   EXE_A2<=0;
                   EXE_B<=0;
                   EXE_MemtoReg<=0;
                   EXE_MemWr<=0;
                   EXE_ALUctr<=0;
                   EXE_RegWr<=0;
                   EXE_Inst<=0;
                   EXE_ALUSrc<=0;
                   EXE_immshift<=0;
                   EXE_RegDst<=0;
                   EXE_PC4<=0;
              end
            else if(~stall)
              begin
                                 EXE_Rw<=ID_Rw;
                                 EXE_A2<=ID_A2;
                                 EXE_B<=ID_B;
                                 EXE_MemtoReg<=ID_MemtoReg;
                                 EXE_MemWr<=ID_MemWr;
                                 EXE_ALUctr<=ID_ALUctr;
                                 EXE_RegWr<=ID_RegWr;
                                 EXE_Inst<=ID_Inst;
                                 EXE_ALUSrc<=ID_ALUSrc;
                                 EXE_immshift<=ID_immshift;
                                 EXE_RegDst<=ID_RegDst;
                                 EXE_PC4<=ID_PC4;
              end      
endmodule