`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:28:52 12/22/2024 
// Design Name: 
// Module Name:    Fetch_Unit 
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
module Fetch_Unit (
    input clk,                // 时钟信号
    input reset,              // 复位信号
    input branch,             // 分支信号
    input zero,               // 零信号（判断条件是否成立）
    input jump,               // 跳转信号
    input [25:0] target,      // 跳转目标地址
    input [15:0] imm16,       // 分支指令的立即数
    input ExtOp,              // 扩展信号
    output [31:0] Inst,       // 当前取到的指令
    output [31:0] PC          // 当前程序计数器值
);

    // 内部信号声明
    wire [31:0] Npc;          // 下一条指令地址
    wire [31:0] jpc;          // 跳转目标地址
    wire [31:0] PC4;          // 当前 PC + 4
    wire [31:0] bpc;          // 分支目标地址
    wire [31:0] imm32;        // 扩展后的立即数
    wire [31:0] imm32_bpc;    // 分支立即数偏移后的地址
    wire B_Select;            // 分支选择信号
    wire [31:0] Other_PC;     // 综合选择的目标地址

    // PC 寄存器模块
    PCR pc_register (
        .d_in(Npc), 
        .d_out(PC), 
        .clk(clk), 
        .reset(reset)
    );

    // 加法器：计算 PC + 4
    adder pc_plus_4 (
        .a(PC), 
        .b(32'h4), 
        .c(PC4)
    );

    // 扩展器：将 imm16 扩展为 imm32
    EXT imm_extender (
        .a(imm16), 
        .ExtOp(ExtOp), 
        .b(imm32)
    );

    // 加法器：计算分支目标地址
    adder branch_adder (
        .a(PC4), 
        .b(imm32 << 2), 
        .c(bpc)
    );

    // 多路选择器：根据 branch 和 zero 信号选择分支地址
    assign B_Select = branch & zero;  // 分支条件
    MUX32_2_1 branch_mux (
        .a0(PC4),         // 下一条指令地址 PC + 4
        .a1(bpc),         // 分支地址
        .s(B_Select), 
        .y(imm32_bpc)
    );

    // 跳转地址拼接
    assign jpc = {PC4[31:28], target, 2'b00};  // 高 4 位拼接目标地址

    // 多路选择器：根据 jump 信号选择跳转地址
    MUX32_2_1 jump_mux (
        .a0(imm32_bpc),   // 分支或普通地址
        .a1(jpc),         // 跳转地址
        .s(jump), 
        .y(Other_PC)
    );

    // Npc 最终选择
    assign Npc = Other_PC;

    // 指令存储器
    Inst_Rom instruction_memory (
        .pc(PC[6:2]),     // 使用 PC 的低 5 位作为地址
        .inst(Inst)
    );

endmodule
