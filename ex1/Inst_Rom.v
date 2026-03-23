`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:49:46 11/20/2024 
// Design Name: 
// Module Name:    Inst_Rom 
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
module Inst_Rom(
    input [4:0] pc,    // 5-bit program counter to address up to 32 instructions
    output [31:0] inst // 32-bit instruction output
);

    // ROM with 32 locations of 32-bit instructions
    wire [31:0] rom [0:31];

    // Initialize the ROM with instructions
    assign rom[5'h00] = 32'h00000000; // NOP (No Operation)
    assign rom[5'h01] = 32'h00430820; // add r1, r2, r3 (r1 = r2 + r3, r1 = 5)
    assign rom[5'h02] = 32'h00641022; // sub r2, r3, r4 (r2 = r3 - r4, r2 = 0xffffffff)
    assign rom[5'h03] = 32'h00851823; // subu r3, r4, r5 (r3 = r4 - r5, r3 = 0xffffffff)
    assign rom[5'h04] = 32'h00a6202a; // slt r4, r5, r6 (r4 = (r5 < r6) ? 1 : 0, r4 = 0x1)
    assign rom[5'h05] = 32'h00c7282b; // sltu r5, r6, r7 (r5 = (r6 < r7) ? 1 : 0, r5 = 0x1)
    assign rom[5'h06] = 32'h34a60008; // ori r6, r5, 0x8 (r6 = r5 | 0x8, r6 = 0x9)
    assign rom[5'h07] = 32'h24c7000d; // addiu r7, r6, 4 (r7 = r6 + 4, r7 = 0xd)
    assign rom[5'h08] = 32'h8ce80002; // lw r8, 0x2(r7) (r8 = mem[r7 + 0x2], mem[0xf])
    assign rom[5'h09] = 32'hac220002; // sw r2, 0x2(r1) (mem[r1 + 0x2] = r2, mem[7] = 0xffffffff)
    assign rom[5'h0A] = 32'h10630001; // beq r3, r3, 0x1 (if r3 == r3, jump to PC+1)
    assign rom[5'h0B] = 32'h10640001; // beq r3, r4, 0x1 (if r3 == r4, do not jump)
    assign rom[5'h0C] = 32'h08000008; // j 0x8 (jump to address 0x8)
    // Fill in the rest with NOP instructions
    assign rom[5'h0D] = 32'h00000000;
    assign rom[5'h0E] = 32'h00000000;
    assign rom[5'h0F] = 32'h00000000;
    assign rom[5'h10] = 32'h00000000;
    assign rom[5'h11] = 32'h00000000;
    assign rom[5'h12] = 32'h00000000;
    assign rom[5'h13] = 32'h00000000;
    assign rom[5'h14] = 32'h00000000;
    assign rom[5'h15] = 32'h00000000;
    assign rom[5'h16] = 32'h00000000;
    assign rom[5'h17] = 32'h00000000;
    assign rom[5'h18] = 32'h00000000;
    assign rom[5'h19] = 32'h00000000;
    assign rom[5'h1A] = 32'h00000000;
    assign rom[5'h1B] = 32'h00000000;
    assign rom[5'h1C] = 32'h00000000;
    assign rom[5'h1D] = 32'h00000000;
    assign rom[5'h1E] = 32'h00000000;
    assign rom[5'h1F] = 32'h00000000;

    // Output the instruction based on the program counter
    assign inst = rom[pc];

endmodule
