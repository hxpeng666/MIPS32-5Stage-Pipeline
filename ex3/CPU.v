`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:27:04 12/22/2024 
// Design Name: 
// Module Name:    CPU 
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
module CPU(clk,reset,PC,Inst,Result);
    input clk,reset;
    output [31:0] PC,Inst,Result;
    wire [31:0] A,B,A2,B2,datain,dataout,wd,imm32,immshift;
    wire [25:0] target;
    wire [15:0] imm16;
    wire [4:0] addr,rna,rnb,wn,wn1;
    wire [2:0] ALUctr;
    wire RegDst,RegWr,ALUSrc,MemWr,MemtoReg,ExtOp,Jump,Branch,Zero,Overflow,write;
    assign write=(~Overflow)*RegWr;
    assign addr=Result[4:0];
    assign A2=A;
    assign imm16=Inst[15:0];
    assign rna=Inst[15:11];
    assign rnb=Inst[20:16];
    assign wn=Inst[25:21];
    assign target=Inst[25:0];
    assign immshift={imm32[29:0],2'b00};
    Fetch_Unit u1(clk,reset,Branch,Zero,Jump,target,imm16,ExtOp,Inst,PC);
    ALU u2(A2,B2,ALUctr,Zero,Overflow,Result);
    Registers u3(rna,rnb,wd,wn1,write,clk,reset,A,B);
    DataMem u4(MemWr,addr,datain,clk,dataout);
    CU u5(Inst,RegDst,RegWr,ALUSrc,ALUctr,MemWr,MemtoReg,ExtOp,Jump,Branch);
    MUX5_2_1 u6(rnb,wn,RegDst,wn1);
    MUX32_2_1 u7(B,immshift,ALUSrc,B2);
    MUX32_2_1 u8(Result,dataout,MemtoReg,wd);
    EXT u9(imm16,ExtOp,imm32);
endmodule