`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:49:57 11/21/2024 
// Design Name: 
// Module Name:    Fetch 
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
module Fetch(
    input clk,           // Clock signal
    input reset,         // Reset signal
    input branch,        // Branch control signal
    input zero,          // Zero flag from ALU
    input jump,          // Jump control signal
    input [25:0] target, // Target address for jump
    input [15:0] imm16,  // Immediate value for branch offset
    input ExtOp,         // Extension operation signal (0 for zero extend, 1 for sign extend)
    output [31:0] Inst   // Instruction output
);

    // Internal signals
    wire [31:0] PC, Npc, PC4, bpc, imm32, imm32_bpc, Other_PC, jpc;
    wire B_Select;

    // Program Counter (PC) register
    PCR program_counter (
        .d_in(Npc),
        .clk(clk),
        .reset(reset),
        .d_out(PC)
    );

    // PC + 4 calculation
    Adder pc_adder (
        .a(PC),
        .b(32'd4),
        .c(PC4)
    );

    // Immediate value extension to 32-bit
    EXT ext_unit (
        .a(imm16),
        .ExtOp(ExtOp),
        .b(imm32)
    );

    // Shift left by 2 for branch offset calculation
    assign imm32_bpc = imm32 << 2;

    // PC + Branch Offset calculation
    Adder branch_adder (
        .a(PC4),
        .b(imm32_bpc),
        .c(bpc)
    );

    // Determine if branch should be taken
    assign B_Select = branch & zero;

    // Select between PC + 4 and Branch address
    MUX32_2_1 branch_mux (
        .a0(PC4),
        .a1(bpc),
        .s(B_Select),
        .y(Other_PC)
    );

    // Jump address calculation (concatenate upper bits of PC with target shifted left by 2)
    assign jpc = {PC[31:28], target, 2'b00};

    // Select between branch or jump
    MUX32_2_1 jump_mux (
        .a0(Other_PC),
        .a1(jpc),
        .s(jump),
        .y(Npc)
    );

    // Instruction Memory
    Inst_Rom instruction_memory (
        .pc(PC[4:0]),
        .inst(Inst)
    );

endmodule

