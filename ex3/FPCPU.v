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


module FPCPU(clk,reset,IF_PC,IF_Inst,EXE_Result);
    input clk,reset;
    output [31:0] IF_PC,IF_Inst,EXE_Result;
    wire [31:0] ID_busA,ID_B,ID_busB,datain,dataout,wd,ID_imm32,EXE_imm32,WB_Result,ID_Inst,busW,EXE_busA,EXE_busB,MEM_B,MEM_Result,MEM_MemOut,WB_MemOut,EXE_Inst,ID_immshift,EXE_immshift,B,ID_jpc,EXE_bpc,ID_PC,ID_PC4,EXE_PC4,IF_PC4,immshift,DataA,DataB,ID_Inst_org;
    wire [25:0] target;
    wire [15:0] imm16;
    wire [4:0] addr,EXE_Rs,EXE_Rt,wn,ID_Rw,EXE_Rw,MEM_Rw,WB_Rw;
    wire [2:0] ID_ALUctr,EXE_ALUctr;
    wire ID_RegDst,EXE_RegDst,ID_RegWr,EXE_RegWr,EXE_RegWr2,MEM_RegWr,WB_RegWr,ID_ALUSrc,EXE_ALUSrc,ID_MemWr,ID_MemtoReg,ExtOp,Jump,Branch,Zero,Overflow,write,EXE_MemtoReg,EXE_MemWr,MEM_MemtoReg,MEM_MemWr,WB_MemtoReg,stall;
    wire [1:0]  FwdA,FwdB;
    assign imm16=ID_Inst[15:0];
    assign target=ID_Inst[25:0];
    assign Branch=(EXE_Inst[31:26]==6'b000100)&&Zero;
    assign ID_jpc={ID_PC[31:28],ID_Inst[25:0],2'b0};
    assign immshift={EXE_imm32[29:0],2'b00};
    assign EXE_bpc=EXE_PC4+immshift;
    assign EXE_Rs = EXE_Inst[25:21];
    assign EXE_Rt = EXE_Inst[20:16];
    assign FwdA=((EXE_Rs==MEM_Rw)&&MEM_RegWr&&~MEM_MemtoReg)?2'b01:
                (((EXE_Rs==MEM_Rw)&&MEM_RegWr&&MEM_MemtoReg)||((EXE_Rs==WB_Rw)&&WB_RegWr))?2'b10:
                 2'b00;
    assign FwdB=((EXE_Rt==MEM_Rw)&&MEM_RegWr&&~MEM_MemtoReg&&EXE_RegDst)?2'b01:
                (((EXE_Rt==MEM_Rw)&&MEM_RegWr&&MEM_MemtoReg&&EXE_RegDst)||((EXE_Rt==WB_Rw)&&WB_RegWr&&EXE_RegDst))?2'b10:
                 2'b00;
    assign stall = ((EXE_Rs == MEM_Rw) || ((EXE_Rt == MEM_Rw) && ID_MemWr)) && MEM_RegWr && MEM_MemtoReg && (MEM_Rw != 0); 
    assign EXE_RegWr2= EXE_RegWr& ~Overflow;
    assign ID_Inst=(Branch)?32'h0:ID_Inst_org;
    IF_R u1(clk,reset,Jump,Branch,IF_Inst,IF_PC,stall,ID_jpc,EXE_bpc,IF_PC4);
    IF_ID_R u2(clk,reset,IF_Inst,ID_Inst_org,stall,IF_PC,ID_PC,IF_PC4,ID_PC4);
    ID_R u3(clk,reset,ID_Inst,busW,Overflow,ID_ALUSrc,ID_ALUctr,ID_MemWr,ID_MemtoReg,ExtOp,Jump,ID_busA,ID_busB,ID_Rw,WB_Rw,ID_RegWr,WB_RegWr,ID_imm32,ID_RegDst);
    ID_EXE_R u4(clk,reset,ID_MemtoReg,ID_MemWr,ID_ALUctr,ID_Rw,ID_busA,ID_busB,EXE_MemtoReg,EXE_MemWr,EXE_ALUctr,EXE_Rw,EXE_busA,EXE_busB,ID_RegWr,EXE_RegWr,ID_Inst,EXE_Inst,ID_ALUSrc,EXE_ALUSrc,ID_imm32,EXE_imm32,ID_RegDst,EXE_RegDst,stall,ID_PC4,EXE_PC4);
    MUX32_4_1 u5(EXE_busA,MEM_Result,busW,32'hxxxxxxxx,FwdA,DataA);
    MUX32_4_1 u6(EXE_busB,MEM_Result,busW,32'hxxxxxxxx,FwdB,B);
    MUX32_2_1 u7(B,EXE_imm32,EXE_ALUSrc,DataB);
    EXE_R u8(DataA,DataB,EXE_ALUctr,Zero,EXE_Result,Overflow);
    EXE_MEM u9(clk,reset,EXE_MemtoReg,EXE_MemWr,EXE_Result,B,EXE_Rw,MEM_MemtoReg,MEM_MemWr,MEM_Rw,MEM_Result,MEM_B,EXE_RegWr2,MEM_RegWr,stall);
    MEM_R u10(clk,MEM_MemWr,MEM_Result,MEM_B,MEM_MemOut);
    MEM_WB u11(clk,reset,MEM_MemtoReg,MEM_Rw,MEM_Result,MEM_MemOut,WB_MemtoReg,WB_Rw,WB_Result,WB_MemOut,MEM_RegWr,WB_RegWr);
    WB_R u12(WB_Result,WB_MemOut,WB_MemtoReg,busW);
endmodule
