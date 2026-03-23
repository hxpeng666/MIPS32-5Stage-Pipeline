`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:38:52 12/22/2024 
// Design Name: 
// Module Name:    IF_R 
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
module IF_R(clk,reset,Jump,Branch,IF_Inst,PC,stall,ID_jpc,EXE_bpc,IF_PC4);
    input clk,reset,Jump,Branch,stall;
    input [31:0] EXE_bpc,ID_jpc;
    output [31:0] PC,IF_Inst,IF_PC4;
    wire [31:0] PC;           // 当前程序计数器值
    wire [31:0] Npc;          // 下一条指令地址
    wire [1:0] Pcsrc;
    wire [31:0] IF_Inst1;
    
   assign Pcsrc=(Branch)?2'b10:(Jump)?2'b01:0;  //Pcsrc的逻辑语句
   assign IF_Inst=(Jump||Branch)?32'h0:IF_Inst1;
        // PC 寄存器模块
        PCR pc_register (
            .d_in(Npc), 
            .d_out(PC), 
            .clk(clk), 
            .reset(reset),
            .stall(stall)
        );
    
        // 加法器：计算 PC + 4
        adder pc_plus_4 (
            .a(PC), 
            .b(32'h4), 
            .c(IF_PC4)
        );
        //四选一多路选择器
        MUX32_4_1 u(
        .A(IF_PC4),
        .B(ID_jpc),
        .C(EXE_bpc),
        .D(32'hxxxxxxxx),
        .S(Pcsrc),
        .Result(Npc)
        );
        // 指令存储器
        Inst_Rom instruction_memory (
            .pc(PC[6:2]),     // 使用 PC 的低 5 位作为地址
            .inst(IF_Inst1)
        );
endmodule
