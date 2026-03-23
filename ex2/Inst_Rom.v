`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:31:27 12/22/2024 
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
module Inst_Rom(pc,inst);
    input [4:0]pc;
    output [31:0]inst;
    wire [31:0] rom [0:31]; 
assign rom[5'h00]=32'h00000000;   // 空指令，占位
assign rom[5'h01]=32'h00430820;   // add r1, r2, r3  r1 = r2 + r3
assign rom[5'h02]=32'h00641022;   // sub r2, r3, r4  r2 = r3 - r4
assign rom[5'h03]=32'h00a61824;   // and r3, r5, r6  r3 = r5 & r6 （无冒险）
assign rom[5'h04]=32'h00c72025;   // or r4, r6, r7   r4 = r6 | r7 （无冒险）
assign rom[5'h05]=32'h8ce80002;   // lw r8, 0x2(r7)  从地址r7+2加载到r8（数据冒险开始）
assign rom[5'h06]=32'h00e83820;   // add r7, r8, r3  r7 = r8 + r3 （数据冒险使用r8）
assign rom[5'h07]=32'hac090004;   // sw r9, 0x4(r0)  将r9存储到地址0x4
assign rom[5'h08]=32'h00647822;   // sub r15, r3, r4 r15 = r3 - r4 （无冒险）
assign rom[5'h09]=32'h10640001;   // beq r3, r4, 0x1 如果r3 == r4, 跳转到下一条指令
assign rom[5'h0A]=32'h08000008;   // j 0x8           无条件跳转到地址8
assign rom[5'h0B]=32'h00000000;
assign rom[5'h0C]=32'h00000000;      	
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
assign inst=rom[pc];		 
endmodule

