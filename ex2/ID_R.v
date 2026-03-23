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

module ID_R(clk,reset,Inst,busW,Overflow,ALUSrc,ALUctr,MemWr,MemtoReg,ExtOp,Jump,Branch,busA,B,B1,wn1,ID_RegWr,WB_RegWr);
    input [31:0] Inst,busW;
    input clk,reset,Overflow,WB_RegWr;
    output ALUSrc,MemWr,MemtoReg,ExtOp,Jump,Branch,ID_RegWr;
    output [2:0] ALUctr;
    output [31:0] busA,B,B1;
    output [4:0] wn1;
    wire RegDst;
    wire [4:0] addr,rna,rnb,wn; 
    wire [31:0] immshift,imm32,imm16;
    assign rna=Inst[15:11];
    assign rnb=Inst[20:16];
    assign wn=Inst[25:21];
    assign imm16=Inst[15:0];
    assign immshift={imm32[29:0],2'b00};
    CU u1(Inst,RegDst,ID_RegWr,ALUSrc,ALUctr,MemWr,MemtoReg,ExtOp,Jump,Branch);
    Registers u2(rna,rnb,busW,wn1,WB_RegWr,clk,reset,busA,B1);
    MUX5_2_1 u3(rnb,wn,RegDst,wn1);
    MUX32_2_1 u4(B1,immshift,ALUSrc,B);
    EXT u5(imm16,ExtOp,imm32);
endmodule
