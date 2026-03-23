`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:35:50 12/22/2024 
// Design Name: 
// Module Name:    ID_R 
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

module ID_R(clk,reset,Inst,busW,Overflow,ALUSrc,ALUctr,MemWr,MemtoReg,ExtOp,Jump,busA,busB,ID_Rw,WB_Rw,ID_RegWr,WB_RegWr,imm32,ID_RegDst);
    input [31:0] Inst,busW;
    input clk,reset,Overflow,WB_RegWr;
    input [4:0] WB_Rw;
    output ALUSrc,MemWr,MemtoReg,ExtOp,Jump,ID_RegWr;
    output [2:0] ALUctr;
    output [31:0] busA,busB,imm32;
    output [4:0] ID_Rw;
    output ID_RegDst;
    wire Branch;
    wire [4:0] addr,rs,rt,rd; 
    wire [31:0] imm16;
    assign rs=Inst[25:21];
    assign rt=Inst[20:16];
    assign rd=Inst[15:11];
    assign imm16=Inst[15:0];

    CU u1(Inst,ID_RegDst,ID_RegWr,ALUSrc,ALUctr,MemWr,MemtoReg,ExtOp,Jump,Branch);
    Registers u2(rs,rt,busW,WB_Rw,WB_RegWr,~clk,reset,busA,busB);
    MUX5_2_1 u3(rt,rd,ID_RegDst,ID_Rw);
    EXT u5(imm16,ExtOp,imm32);
endmodule