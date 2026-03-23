`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:34:55 12/22/2024 
// Design Name: 
// Module Name:    FPCPU 
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


module FPCPU(clk,reset,PC,IF_Inst,EXE_Result);
    input clk,reset;
    output [31:0] PC,IF_Inst,EXE_Result;
    wire [31:0] ID_busA,ID_B,ID_B1,datain,dataout,wd,imm32,immshift,WB_Result,ID_Inst,busW,EXE_A2,EXE_B,EXE_B1,MEM_B,MEM_Result,MEM_MemOut,WB_MemOut;
    wire [25:0] target;
    wire [15:0] imm16;
    wire [4:0] addr,rna,rnb,wn,ID_Rw,EXE_Rw,MEM_Rw,WB_Rw;
    wire [2:0] ID_ALUctr,EXE_ALUctr;
    wire RegDst,RegWr,ALUSrc,ID_MemWr,ID_MemtoReg,ExtOp,Jump,Branch,Zero,Overflow,write,EXE_MemtoReg,EXE_MemWr,MEM_MemtoReg,MEM_MemWr,WB_MemtoReg;
    assign imm16=ID_Inst[15:0];
    assign target=ID_Inst[25:0];
    IF_R u1(clk,reset,imm16,Jump,Branch,Zero,target,ExtOp,IF_Inst,PC);
    IF_ID_R u2(clk,reset,IF_Inst,ID_Inst);
    ID_R u3(clk,reset,ID_Inst,busW,Overflow,ALUSrc,ID_ALUctr,ID_MemWr,ID_MemtoReg,ExtOp,Jump,Branch,ID_busA,ID_B,ID_B1,ID_Rw);
    ID_EXE_R u4(clk,reset,ID_MemtoReg,ID_MemWr,ID_ALUctr,ID_Rw,ID_busA,ID_B,ID_B1,EXE_MemtoReg,EXE_MemWr,EXE_ALUctr,EXE_Rw,EXE_A2,EXE_B,EXE_B1);
    EXE_R u5(EXE_A2,EXE_B,EXE_ALUctr,Zero,Overflow,EXE_Result);
    EXE_MEM u6(clk,reset,EXE_MemtoReg,EXE_MemWr,EXE_Result,EXE_B,EXE_Rw,MEM_MemtoReg,MEM_MemWr,MEM_Rw,MEM_Result,MEM_B);
    MEM_R u7(clk,MEM_MemWr,MEM_Result,MEM_B,MEM_MemOut);
    MEM_WB u8(clk,reset,MEM_MemtoReg,MEM_Rw,MEM_Result,MEM_MemOut,WB_MemtoReg,WB_Rw,WB_Result,WB_MemOut);
    WB_R u9(WB_Result,WB_MemOut,WB_MemtoReg,busW);
endmodule
